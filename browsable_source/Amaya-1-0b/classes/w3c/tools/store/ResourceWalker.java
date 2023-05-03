// ResourceWalker.java
// $Id: ResourceWalker.java,v 1.2 1997/03/27 13:57:31 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.tools.store ;

/**
 * An interface for walking through a set of resources.
 * @see WalkerEngine
 */

public interface ResourceWalker {

    /**
     * Time to handle the given resource.
     * The resource walker is now visiting the given resource.
     * @param resource The resource being visited.
     * @return A boolean, <strong>true</strong> if that resource's children 
     * are to be visited, <strong>false<?strong> otherwise.
     */

    public boolean handleResource(Resource resource);

    /**
     * An exception occured while trying to visit a resource.
     * @param path The full path of the resource from root of walk.
     * @param err The index of component within path we couldn't lookup.
     * @param ex The exception the walker got while trying to get the 
     * children resource.
     */

    public void handleException(String path[], int err, Exception ex);

    /**
     * The walker engine has detected a cycle.
     * Cycles are detected when a resource store is about to be revisited.
     * Instead of going into an infinite loop, the walker notifies the walker
     * of the cycle, and does not re-walk the resource store.
     * @param storeid The identifier of the store on which the cycle was 
     * detected.
     * @param from The path of the resource (from the root of the walk) that
     * points to that store.
     * @param target The path of the resource that already triggered a visit
     * of that store.
     */
     
    public void handleCycle(String storeid, String from[], String target[]);

    /**
     * The underlying resource walker has been interrupted.
     */

    public void handleInterruption();

    /**
     * The whole tree of resources has been walked through.
     * @param stores Hashtable mapping the identifiers (a String) of visited 
     * stores to the path (a String array) of the resource (starting from the
     * root of the walk).
     */

    public void handleDone(java.util.Hashtable stores);

}
