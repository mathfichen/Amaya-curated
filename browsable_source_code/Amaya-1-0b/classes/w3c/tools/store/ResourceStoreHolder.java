// ResourceStoreHolder.java
// $Id: ResourceStoreHolder.java,v 1.2 1997/03/27 13:57:30 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.tools.store ;

/**
 * Interface for resource store holders.
 * As ResourceStore objects may be potentially very large, and as the server
 * may have to load thousands of them, objects that want to keep some pointer
 * to a resource store <em>should</em> implement this interface.
 * <p>If implemented, this interface will allow the resource store manager
 * to control what resource stores are loaded, when to unload them, when
 * they should be stabilized (with regard to their database), etc.
 * <p>An object holding a resource store, will typically include the
 * following piece of code:
 * <pre>
 * class XXX implements ResourceStoreHolder {
 *     ResourceStore store = null ;
 *
 *     public boolean notifyStoreUnload(ResourceStore store) {
 *         store.shutdown() ;
 *         store = null ;
 *         return true ;
 *     }
 *     synchronized Resource lookup(String identifier) {
 *         if ( store == null )
 *             store = ResourceStoreManager.loadResourceStore(...) ;
 *         ...
 *    }
 * }
 * </pre>
 * @see ResourceStoreManager
 */

public interface ResourceStoreHolder {

    /**
     * The resource store manager is willing to unload your store.
     * The clever resource store manager is willing to free your store, 
     * for some reasons (eg memory is getting low, it hasn't been access
     * for a long time, etc).
     * <p>If you return <strong>true</strong>, the resource store manager
     * will no longer assume that you hold the store.
     * @param store The store in question.
     * @return A boolean <strong>true</strong> iff: you have get rid of your
     *     pointer to the store. If you want to defer the store shutdown,
     *     than return <strong>false</strong>, but you should have good
     *     reasons for doing so.
     */

    public boolean acceptStoreUnload(ResourceStore store) ;

    /**
     * The resource store manager is shutting down.
     * When the resource manager is shutdown, it calls all its loaded store
     * holders to notify them that the store is going down. You will no 
     * longer be considered a holder for the store after this notification.
     * <p>The resource store manager will take care of saving the store, 
     * after all holders have been notified of the shutdown.
     * <p>Implementers of that interface should make sure they no longer
     * hold a ref to the store after this method terminates.
     * @param store The store to be shutdown.
     */

    public void notifyStoreShutdown(ResourceStore store) ;

    /**
     * The resource store manager did manager to save your store.
     * This method gets called once the resource store has been stabilized
     * to persistent storage.
     * @param store The store to stabilize.
     */

    public void notifyStoreStabilize(ResourceStore store) ;

}
