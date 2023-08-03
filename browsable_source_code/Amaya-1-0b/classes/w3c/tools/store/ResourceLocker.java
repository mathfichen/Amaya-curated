// ResourceLocker.java
// $Id: ResourceLocker.java,v 1.2 1997/03/27 13:57:30 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.tools.store;

/**
 * The interface that you should implement if you keep a pointer to a resource.
 * As resources may be flushed from memory by the ResourceStoreManager, you
 * should implement this interface if you want to keep a pointer to some
 * resource.
 * <p>This interface will notify you if ever the resource gets unload
 * so that you can get rid of your pointer to the resource, or reload it.
 */

public interface ResourceLocker {

    /**
     * Notify that the lock is going down.
     * @param resource The resource whose lock is going down.
     */

    public void notifyResourceLockBreak(Resource resource) ;

}
