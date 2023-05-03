// WalkerEngine.java
// $Id: WalkerEngine.java,v 1.2 1997/03/27 13:57:32 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.tools.store;

import java.util.*;

public class WalkerEngine implements ResourceStoreHolder, Runnable {
    /**
     * The roots of our walk.
     */
    protected Resource roots[] = null;
    /**
     * The root resource currently being walked out.
     */
    protected ContainerInterface root = null;
    /**
     * The store being currently visited, if any.
     */
    protected ResourceStore current = null;
    /**
     * Path of the container whose children are being visited right now.
     */
    String path[] = null;
    /**
     * Stack of the path of container resources to visit.
     */
    Stack stack = null;
    /**
     * Has this walked been interrupted ?
     */
    boolean interrupted = false;
    /**
     * Our walk handler.
     */
    protected ResourceWalker walker = null;
    /**
     * Should <em>all</em> resources be visited ?
     */
    protected boolean all = false;
    /**
     * Cycle detection: list of visited resource store (by identifiers).
     */
    protected Hashtable visited = null;

    protected String pathToString(String p[]) {
	StringBuffer sb = new StringBuffer();
	for (int i = 0 ; i < p.length ; i++) {
	    sb.append('.');
	    sb.append(p[i]);
	}
	return sb.toString();
    }

    /**
     * Interrupt the underlying walker thread.
     */

    public final synchronized void interrupt() {
	interrupted = true;
    }

    /**
     * Has this walker been interrupted ?
     * @return A boolean.
     */

    public final synchronized boolean isInterrupted() {
	return interrupted;
    }

    /**
     * Push that resource to visit it later.
     * @param r The resource to be visited later.
     */

    protected final void push(Resource r) {
	// That's kind of a nasty hack, that of course should not be needed:
	if (r == root) 
	    return;
	String rp[] = null;
	String key  = r.getIdentifier();
	if ( key == null ) {
	    System.out.println("*** walker: skip "+r.getClass().getName());
	    return;
	}
	// Compute the path of that resource:
	if ( path != null ) {
	    rp = new String[path.length+1];
	    System.arraycopy(path, 0, rp, 0, path.length);
	    rp[path.length] = key;
	} else {
	    rp = new String[1];
	    rp[0] = key;
	}
	// Stack it:
	stack.push(rp);
    }

    /**
     * Get the next container resource to visit.
     * If for some reasons, the next resource to visit cannot be unloaded,
     * the walker handler is invoked with appropriate exception.
     * @return A ContainerInterface compliant resource, or <strong>null
     * </strong> if the stack is empty.
     */

    protected final ContainerInterface pop() {
      popping:
	while ( ! stack.empty() ) {
	    // Get the path hof next resource to visit
	    path = (String[]) stack.pop();
	    if ( path == null ) {
		System.out.println("*** pop: skipping null !");		
		return null;
	    }
	    // Unload that resource:
	    ContainerInterface container = root;
	    ContainerInterface parent    = root;
	    for (int i = 0 ; i < path.length ; i++) {
		try {
		    container = (ContainerInterface) parent.lookup(path[i]);
		} catch (Exception ex) {
		    walker.handleException(path, i, ex);
		    continue popping;
		}
		if ((parent = container) == null) 
		    continue popping;
	    }
	    return container;
	}
	return null;
    }

    protected final boolean isContainer(Resource resource) {
	return (resource instanceof ContainerInterface);
    }

    protected boolean visit(Resource resource) {
	boolean walkthrough = walker.handleResource(resource);
	if ( walkthrough && isContainer(resource) ) {
	    push(resource);
	    return true;
	} else {
	    return false;
	}
    }

    protected void walk() {
	ContainerInterface c     = null;
	Resource           child = null;
	while (( ! isInterrupted()) && ((c = pop()) != null)) {
	    boolean holded = false;
	    try {
		if ( c.hasResourceStore() ) {
		    current = c.getResourceStore(this);
		    if (current != null) {
			// That store has been visited
			String storeid = current.getIdentifier();
			String from[]  = (String[]) visited.get(storeid);
			if ( from != null ) {
			    walker.handleCycle(storeid, from, path);
			    current.removeHolder(this);
			    continue;
			} else {
			    visited.put(storeid, path);
			}
		    }
		} else {
		    current = null;
		}
		Enumeration e = c.enumerateResourceIdentifiers(all);
		while ( e.hasMoreElements() ) {
		    String name = (String) e.nextElement();		    
		    try {
			child = c.lookup(name);
		    } catch (Exception ex) {
			// Build up path info, and notify exception:
			String pathinfo[] = new String[path.length+1];
			System.arraycopy(path, 0, pathinfo, 0, path.length);
			pathinfo[path.length] = name;
			walker.handleException(pathinfo, path.length, ex);
			continue;
		    }
		    visit(child);
		}
	    } finally {
		if ( current != null )
		    current.removeHolder(this);
	    }
	}
    }

    public void run() {
	boolean done = false;
	try {
	    while ( true ) {
		if ( isInterrupted() ) {
		    done = true;
		    walker.handleInterruption();
		} else {
		    for (int i = 0 ; i < roots.length ; i++) {
			if ( isContainer(roots[i]) ) {
			    push(roots[i]);
			    root = (ContainerInterface) roots[i];
			    walk();
			} else {
			    visit(roots[i]);
			}
		    }
		    done = true;
		    if ( isInterrupted() )
			walker.handleInterruption();
		    else
			walker.handleDone(visited);
		    return;
		}
	    }
	} finally {
	    if ( ! done )
		walker.handleInterruption();
	}
    }
    
    /**
     * ResourceStoreHolder implementation - Don't unload the store under visit.
     * @param store The store that may be unloaded.
     * @return Always <strong>false</strong> to indicate our wills.
     */

    public boolean acceptStoreUnload(ResourceStore store) {
	return (store == current) ? false : true;
    }

    /**
     * ResourceStoreHolder implementation - Interrupt walk if store goes down.
     * @param store The store going down.
     */

    public void notifyStoreShutdown(ResourceStore store) {
	if ( store == current )
	    interrupt();
	current = null;
    }

    /**
     * ResourceStoreHolder implementation - never touch the store under visit.
     * @param store The store that has to be saved.
     */

    public void notifyStoreStabilize(ResourceStore store) {
	return;
    }

    public WalkerEngine(Resource roots[]
			, ResourceWalker walker
			, boolean all) {
	this.roots   = roots;
	this.walker  = walker;
	this.all     = all;
	this.stack   = new Stack();
	this.visited = new Hashtable();
    }

    public WalkerEngine(Resource resource
			,  ResourceWalker walker
			, boolean all) {
	this.roots   = new Resource[1];
	roots[0 ]    = resource;
	this.walker  = walker ;
	this.all     = all;
	this.stack   = new Stack();
	this.visited = new Hashtable();
    }

}

