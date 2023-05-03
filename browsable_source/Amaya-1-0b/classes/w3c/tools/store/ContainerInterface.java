// ContainerInterface.java
// $Id: ContainerInterface.java,v 1.2 1997/03/27 13:57:27 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.tools.store;

import java.util.*;

/**
 * The duties assigned to a resource container.
 * A resource container may or may not be a resource itself, in all cases,
 * it must provide the following methods.
 */

public interface ContainerInterface {

    /**
     * Does this container manages its children through a ResourceStore ?
     * If the container uses a resource store to hold its children, it <strong>
     * must</strong> implement properly the <code>getResourceStore</code> 
     * method.
     * <p>The only reason for a container not to use a resource store to hold 
     * its children, is if these children are created dynamically, or on 
     * demand.
     * @return A boolean, <strong>true</strong> if the container uses a
     * resource store to hold its children.
     */

    public boolean hasResourceStore();

    /**
     * Get the store of that resource container.
     * Provides access to the underlying store of the container, when possible.
     * The holder is attached to the underlying resource store of the resource
     * container.
     * @param holder The holder to attach to the container's store.
     * @return A pointer to the underlying store, on success, <strong>null
     * </strong> on failure.
     */

    public ResourceStore getResourceStore(ResourceStoreHolder holder);

    /**
     * Enumerate children resource identifiers.
     * @param all Should all resources be enumerated ? Resources are often
     * created on demand only, this flag allows the caller to tell the 
     * container about wether it is interested only in already created
     * resources, or in all resources (even the one that have not yet been
     * created).
     * @return An String enumeration, one element per child.
     */

    public Enumeration enumerateResourceIdentifiers(boolean all);

    /**
     * Lookup a children in the container.
     * @param name The name of the children to lookup.
     * @exception InvalidResourceException If the container could not restore 
     * the resource from its store.
     */

    public Resource lookup(String name)
	throws InvalidResourceException;

    /**
     * Remove a child resource from that container.
     * @param name The name of the child to remove.
     */

    public void delete(String name);

    /**
     * Initialize and register the given resource within that container.
     * @param name The identifier for the resource.
     * @param resource An unitialized resource instance.
     * @param defs A default set of init attribute values (may be
     * <strong>null</strong>).
     */

    public void registerResource(String name
				 , Resource resource
				 , Hashtable defs);

}
