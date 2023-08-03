// CacheSweeper.java
// $Id: CacheSweeper.java,v 1.3 1997/03/27 18:33:28 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html


package w3c.www.protocol.http.cache;

import java.util.*;

import w3c.tools.store.*;

public class CacheSweeper extends Thread {
    /**
     * Debug sweeper's main loop.
     */
    private static final boolean debug = false;

    private static final int WAIT_MIN = 5000;
    private static final int WAIT_MAX = 60000;
    
    CacheFilter filter      = null;
    CacheState  state       = null;
    boolean     signal      = false;
    int         wait_time   = WAIT_MIN;
    int         stdgensize  = -1;		// Std generation size

    public synchronized void signal() {
	signal = true;
	notifyAll();
    }

    public synchronized void waitSignal() {
	// Use to trigger cache sync to disk:
	long sync_time = 0;
	signal    = false;
	wait_time = WAIT_MIN;
	while ( ! signal ) {
	    // Wait for something to happen:
	    try {
		wait(wait_time);
	    } catch (InterruptedException ex) {
		continue;
	    }
	    // What was signaled ?
	    if ( signal )
		// Trigger a garbage collection
		break;
	    // Update generation if needed:
	    int curgensize = state.getCurrentGenerationSize();
	    if ( debug ) {
		System.out.println("# Sweeper waited for "+wait_time);
		System.out.println("# Generation "
				   + curgensize + "/" + stdgensize
				   + " bytes.");
	    }
	    if ( curgensize >= stdgensize ) {
		// Bump generation and stabilize the cache
		int g = state.setNextGeneration();
		sync_time = 0;
		filter.sync();
		if ( debug ) 
		    System.out.println("# Sweeper bumping generation to "+g);
	    }
	    // Recompute our wait_time value in any case
	    if ( curgensize > 0 ) {
		wait_time = WAIT_MIN * (stdgensize/curgensize);
		wait_time = Math.max(WAIT_MIN, Math.min(wait_time, WAIT_MAX));
	    } else {
		wait_time = WAIT_MAX;
	    }
	    if ( debug ) 
		System.out.println("# Sweeper will wait for "+wait_time);
	    // Sync if possible:
	    if ((sync_time += wait_time) >= 60000) {
		sync_time = 0;
		filter.sync();
		if ( filter.debug ) 
		    state.print(System.out);
	    } 
	}
	// Do the work:
	signal = false;
    }

    /**
     * Should the given resource stay in the cache now.
     * This method just checks against generation numbers to decide wether the
     * resource should stay or not. It's likely that this method will improve
     * over time (to handle disconnected caching, etc).
     * @param r The resource to check.
     * @param mingen The recommended generation for that resource to stay in.
     * @return A boolean, <strong>true</strong> if the resource should stay,
     * <strong>false</strong> if it should leave.
     */

    public boolean checkInvalid(CachedResource r, int mingen) {
	return r.getGeneration() < mingen;
    }

    /**
     * Move the given resource from one generation to another.
     * @param resource The cached resource whose generation is about to change.
     * @param from The <em>from</em> generation.
     * @param to The <em>to</em> generation.
     */

    protected void updateGeneration(CachedResource resource
				    , int from
				    , int to) {
	resource.setGeneration(to);
    }

    /**
     * Run the garbage collector.
     */

    public void garbageCollect() {
	ResourceStore store = filter.store;
	// Prepare for the collection:
	int collect = filter.getCacheSize() / 4;
	int mingen  = state.computeCollectGeneration(collect);
	// Now run:
	int total = 0;
	Enumeration e = store.enumerateResourceIdentifiers();
	while ( e.hasMoreElements() ) {
	    String   id = (String) e.nextElement();
	    Resource rr = null;
	    try {
		rr = (Resource) store.loadResource(id, filter.defdefs);
	    } catch (InvalidResourceException ex) {
		store.removeResource(id);
		continue;
	    }
	    // The resource store also keeps track of the state:
	    if ( ! (rr instanceof CachedResource) )
		continue;
	    // This is a cached resource, examine:
	    CachedResource r = (CachedResource) rr ;
	    if ((r != null) && checkInvalid(r, mingen)) {
		total += r.getContentLength();
		r.delete();
	    } 
	}
	// Report collection infos:
	if ( filter.debug ) {
	    System.out.println("# Sweeper garbage collection results:");
	    System.out.println("# Tried to collect "+collect+" bytes.");
	    System.out.println("# Target generation number was "+mingen);
	    System.out.println("# Collected "+total+" bytes.");
	    System.out.println("# Current cache state:");
	    state.print(System.out);
	}
	filter.sync();
    }

    public void run() {
	while ( true ) {
	    try {
		waitSignal();
		garbageCollect();
	    } catch (Exception ex) {
		ex.printStackTrace();
	    }
	}
    }

    public CacheSweeper(CacheFilter filter) {
	this.filter     = filter;
	this.state      = filter.state;
	this.stdgensize = filter.getCacheSize()/state.GENERATIONS_HISTORY_SIZE;
	this.setDaemon(true);
	this.setPriority(3);
	this.setName("CacheSweeper");
    }
}
