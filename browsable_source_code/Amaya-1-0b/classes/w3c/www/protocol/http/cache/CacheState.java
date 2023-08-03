// CacheState.java
// $Id: CacheState.java,v 1.2 1997/03/27 13:57:50 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html


package w3c.www.protocol.http.cache;

import java.net.*;
import java.util.*;
import java.io.*;

import w3c.tools.store.*;
import w3c.www.http.*;
import w3c.www.protocol.http.*;

class Subdirectory {
    File dir = null;
    int  id  = 0;

    File nextFile() {
	return new File(dir, Integer.toString(id++));
    }
    
    void registerId(int newid) {
	this.id = Math.max(newid+1, id);
    }

    Subdirectory(File dir, int id) {
	this.dir = dir;
	this.id  = id;
    }

}

public class CacheState {
    protected static final int GENERATIONS_HISTORY_SIZE = 10;

    protected int dirid      = 0;
    protected int byteused   = 0;
    protected int generation = 0;
    protected int gensizes[] = null;
    protected int basegen    = 0;
    protected int curgen     = 0;
    protected CacheFilter filter = null;

    protected Subdirectory subdirs[] = null;

    public final synchronized int getCacheUsed() {
	return byteused;
    }

    public final synchronized int getGeneration() {
	return curgen;
    }

    public final synchronized void setGeneration(int g) {
	this.curgen = g;
    }

    public final synchronized int getBaseGeneration() {
	return basegen;
    }

    public final synchronized void setBaseGeneration(int newbase) {
	this.basegen = newbase;
    }

    public final synchronized int[] getGenerationsSize() {
	return gensizes;
    }

    public final synchronized void setGenerationsSize(int sizes[]) {
	this.gensizes = sizes;
    }

    protected File getNextFile() {
	synchronized (this) {
	    dirid = (dirid+1) % filter.CACHEDIR_SPLITS;
	}
	return subdirs[dirid].nextFile();
    }

    /**
     * Get the next collector generation number, and update state.
     * @return The next (which will be current when the method returns) 
     * collector generation.
     */

    public synchronized int setNextGeneration() {
	// Increment the generation count:
	int g = getGeneration()+1;
	setGeneration(g);
	// Update the base generation and then slide generation sizes:
	int gs[] = getGenerationsSize();
	int genlength = gs.length;
	if ( g >= genlength ) {
	    setBaseGeneration(g-genlength+1);
	    System.arraycopy(gs, 1, gs, 0, genlength-1);
	    gs[genlength-1] = 0;
	    setGenerationsSize(gs);
	}
	return g;
    }

    /**
     * Update generations size
     * @param generation The generation whose size is changing.
     * @param size The delta with previous size.
     */

    protected synchronized void updateGenerationSize(int generation
						     , int size) {
	// Compute offsets in the generations size array:
	int gs[] = getGenerationsSize();
	int bg   = getBaseGeneration();
	int idx  = -1;
	if ((idx = generation-bg) >= 0) 
	    gs[idx] += size;
    }

    /**
     * Get current generation size.
     * @return The size in bytes of the current generation.
     */

    protected synchronized int getCurrentGenerationSize() {
	int gs[] = getGenerationsSize();
	int curgen    = getGeneration();
	int bg   = getBaseGeneration();
	return gs[curgen-bg];
    }

    /**
     * Compute generation number to sweep, given  amount of data to collect.
     * @param size The size of data to be collected.
     */

    protected synchronized int computeCollectGeneration(int size) {
	int gs[]   = getGenerationsSize();
	int collectible = 0;
	int i           = 0;
	while (i < gs.length) {
	    int sz = gs[i];
	    if ( sz > 0 ) {
		if ((collectible += sz) >= size)
		    break;
	    }
	    i++;
	}
	int gen = getBaseGeneration()+i+1;
        return gen;
    }

    /**
     * Update cache space counter.
     * @param size The number of bytes used (if positif), or the number of
     * bytes freed (if negative).
     * @return The total number of bytes used.
     */

    public synchronized int updateCacheSpaceCounter(int size) {
	byteused += size;
	return byteused;
    }


    /**
     * Rebuild the cache state out of the given store of cached entries.
     * @param store The resource store for cached entries.
     */

    public CacheState(CacheFilter filter, jdbmResourceStore store) {
	Hashtable allfiles = new Hashtable(1023);
	// Initialize sub-directory descriptions, list all files:
	subdirs = new Subdirectory[filter.CACHEDIR_SPLITS];
	for (int i = 0 ; i < subdirs.length ; i++) {
	    File subdir = filter.getSubdirectory(i);
	    subdirs[i] = new Subdirectory(subdir, 0);
	    String files[] = subdir.list();
	    if ( files != null ) {
		for (int j = 0 ; j < files.length ; j++)
		    allfiles.put(new File(subdir, files[j]), Boolean.TRUE);
	    }
	}
	// Walk through the cache:
	Enumeration e = store.enumerateResourceIdentifiers();
	int maxgen = 0;
	int base   = 0;
	int size   = 0;
	int gs[]   = new int[GENERATIONS_HISTORY_SIZE];
	while ( e.hasMoreElements() ) {
	    String         id = (String) e.nextElement();
	    CachedResource cr = null;
	    try {
		cr = (CachedResource) store.loadResource(id, filter.defdefs);
	    } catch (InvalidResourceException ex) {
		cr = null;
	    }
	    if ( cr == null ) 
		continue;
	    // Check file, update dir description:
	    File file = cr.getFile();
	    try {
		int fid = Integer.parseInt(file.getName());
		int did = Integer.parseInt(new File(file.getParent())
					   .getName());
		subdirs[did].registerId(fid);
	    } catch (NumberFormatException ex) {
		ex.printStackTrace();
	    }
	    allfiles.remove(cr.getFile());
	    // Update all relevant piece of states
	    int g = cr.getGeneration();
	    int s = cr.getContentLength();
	    if (g < base) {
		// Add that size to the min generation (it will get collected)
		gs[0] += s;
	    } else if (g >= maxgen) {
		if ( g - base < gs.length ) {
		    // We're just discovering a new generation:
		    maxgen = g;
		} else {
		    // Trickier (requires generation shift)
		    int shift = 1 + g - (base+gs.length);
		    int lost  = 0;
		    base += shift;
		    for (int i = 0 ; i < Math.min(shift, gs.length) ; i++) 
			lost += gs[i];
		    if ( shift < gs.length ) {
			System.arraycopy(gs, shift, gs, 0, gs.length-shift);
			for (int i = gs.length-shift; i < gs.length ; i++)
			    gs[i] = 0;
		    }
		    gs[0] += lost;
		}
		gs[g-base] += s;
	    } else {
		gs[g-base] += s;
	    }
	    size += s;
	}
	// Clean pending files:
	e = allfiles.keys();
	while ( e.hasMoreElements() ) 
	    ((File) e.nextElement()).delete();
	// Init:
	this.filter   = filter;
	this.basegen  = base;
	this.curgen   = maxgen;
	this.gensizes = gs;
	this.byteused = size;
	this.dirid    = (int) (Math.random()*((double)filter.CACHEDIR_SPLITS));
    }

    public void print(PrintStream out) {
	int curgen  = getGeneration();
	int bg = getBaseGeneration();
	out.println("# Number of bytes comsumed: "+getCacheUsed());
	out.println("# Current generation: "+curgen);
	out.println("# Generation base: "+bg);
	int gs[] = getGenerationsSize();
	for (int i = 0 ; i < gs.length; i++) {
	    out.println("#\tgeneration["+(bg+i)+"]="
			+ gs[i] + " bytes.");
	}
    }

}

