
package w3c.tools.store;

import java.io.*;
import java.util.*;

/**
 * A raw container class, taht is itself a resource.
 * This class implements the ContainerInterface by relying solely on the
 * ResourceStore interface.
 */

public abstract class SampleContainer extends Resource
    implements ContainerInterface, ResourceStoreHolder
{
    private   File                 repository = null;
    protected ResourceStore        children   = null;
    protected ResourceStoreManager manager    = null;

    protected abstract Hashtable getDefaultAttributes();

    /**
     * Acquire the resource store.
     * Should only be called from a synchronized method.
     */

    protected final synchronized void acquireChildren() {
	if ( children == null ) {
	    children = manager.loadResourceStore(this, repository);
	}
	return ;
    }

    /**
     * ResourceStoreHolder implementation - Get rid of our store.
     * The resource store manager has decided that our store hasn't been
     * used enough in the past to be worth keeping around. 
     * <p>We can still defer this operation by returning <strong>false</strong>
     * in case a user is editing the store for example.
     * @param store The store that to be freed.
     * @return A boolean <strong>true</strong> if the resource store has been
     * shutdown properly, <strong>false</strong> otherwise.
     */

    public synchronized boolean acceptStoreUnload(ResourceStore store) {
	if ( store != children )
	    throw new RuntimeException("Inconsistency in storage manager.");
	return true ;
    }

    /**
     * ResourceStoreHolder implementation - Shutdown our associated store.
     * @param store The store to shutdown.
     */

    public synchronized void notifyStoreShutdown(ResourceStore store) {
	if ( store != children ) 
	    throw new RuntimeException("Inconsistency in storage manager:");
	children = null ;
    }

    /**
     * ResourceStoreHolder implementation - Save our store.
     * Our store has probably been modified recently, save it.
     * @param store The store to save.
     * @return A boolean <strong>true</strong> if success.
     */

    public void notifyStoreStabilize(ResourceStore store) {
	return;
    }

    /**
     * ContainerInterface implementation - Do we manage a store ?
     * @return Always <strong>true</strong>.
     */
   
    public boolean hasResourceStore() {
	return true;
    }

    /**
     * ContainerInterface implementation - Hold underlying resource store.
     * @param h The resource store holder.
     * @return A pointer to our underlying store.
     */

    public synchronized ResourceStore getResourceStore(ResourceStoreHolder h) {
	acquireChildren();
	children.addHolder(h);
	return children;
    }

    /**
     * Enumerate the name (ie identifiers) of our children.
     * @param all Should all resources be listed.
     * @return An enumeration, providing one element per child, which is
     * the name of the child, as a String.
     */

    public synchronized Enumeration enumerateResourceIdentifiers(boolean all) {
	// Check that our children repository is still valid:
	acquireChildren() ;
	return children.enumerateResourceIdentifiers() ;
    }

    public Enumeration enumerateResourceIdentifiers() {
	return enumerateResourceIdentifiers(false);
    }

    public synchronized Resource lookup(String name) 
	throws InvalidResourceException
    {
	// Check that our children repository is still valid:
	acquireChildren() ;
	// Is this child already loaded ?
	Resource child = children.lookupResource(name) ;
	if ( child != null )
	    return child ;
	// Restore the child:
	return children.loadResource(name, getDefaultAttributes()) ;
    }

    public synchronized void delete() {
	// Delete our resource store:
	acquireChildren();
	manager.unholdResourceStore(this, repository);
	repository.delete();
	children = null;
	// Continue deletion:
	super.delete();
    }

    public synchronized void delete(String name) {
	acquireChildren();
	try {
	    Resource resource = lookup(name);
	    resource.delete();
	} catch (InvalidResourceException ex) {
	    // Still, remove the resource:
	    children.removeResource(name);
	}
    }

    public synchronized void registerResource(String id
					      , Resource resource
					      , Hashtable defs) {
        acquireChildren();
	if ( defs == null ) 
	    defs = (Hashtable) getDefaultAttributes().clone();
	defs.put("identifier", id);
	resource.initialize(defs);
	children.addResource(resource);
    }

    public SampleContainer(String id
			   , ResourceStoreManager manager
			   , File repository) {
	// Instance vars:
	this.manager    = manager;
	this.repository = repository;
	// Initialize:
	Hashtable h = new Hashtable(3);
	h.put("identifier", id);
	initialize(h);
    }


}
