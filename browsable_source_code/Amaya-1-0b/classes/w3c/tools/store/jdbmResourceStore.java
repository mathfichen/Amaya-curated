// jdbmResourceStore.java
// $Id: jdbmResourceStore.java,v 1.2 1997/03/27 13:57:32 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.tools.store;

import java.net.*;
import java.io.* ;
import java.util.*;

import w3c.tools.dbm.* ;
import w3c.util.*;

class jdbmResourceStoreEnum implements Enumeration {
    Enumeration dbm     = null;
    Enumeration cache   = null;
    boolean     inCache = true;

    jdbmResourceStoreEnum(Enumeration cache, Enumeration dbm) {
	this.cache = cache;
	this.dbm   = dbm;
    }

    public Object nextElement() {
	if ( inCache )
	    return cache.nextElement();
	byte val[] = (byte[]) dbm.nextElement();
	return new String(val, 0, 0, val.length);
    }

    public boolean hasMoreElements() {
	if ( inCache ) {
	    if ( cache.hasMoreElements() )
		return true;
	    inCache = false;
	}
	return dbm.hasMoreElements();
    }

}

/**
 * The jdbm resource store sweeper.
 * As the dbm database allows us to manage a <em>really</em> big set of
 * resources, we have to keep the number of loaded resources below
 * a certain limit.
 * <p>This class implements some sort of garbage collection for the resource
 * store itself: it will pick an appropriate resource and get rid of it.
 */

class jdbmStoreSweeper extends Thread {
    boolean signal = false;
    boolean reorg  = false;

    jdbmResourceStore store = null;

    public synchronized void emitSignal() {
	signal = true;
	notify();
    }

    public synchronized void waitForSignal() {
	while ( ! signal ) {
	    try {
		wait() ;
	    } catch (InterruptedException ex) {
	    }
	}
	signal = false;
	return;
    }

    public synchronized void runReorganization() {
	signal = true;
	reorg  = true;
	notify();
    }

    public void sweep() {
	int reach = store.LOADED_LIMIT - store.LOADED_THRESOLD;
	while ( store.getLoadedCount() >= reach ) {
	    store.unloadResource();
	}
    }

    public void run() {
	while ( true ) {
	    try {
		waitForSignal();
		if ( reorg ) {
		    store.reorganize();
		    reorg = false;
		} else {
		    sweep();
		}
	    } catch (Exception ex) {
		// FIXME errcode
		ex.printStackTrace();
	    }
	}
    }

    jdbmStoreSweeper(jdbmResourceStore store) {
	this.store = store;
	this.setName("jdbmStoreSweeper");
	this.setDaemon(true);
	this.start();
    }
}

class jdbmResource implements LRUAble {
    boolean        persist   = false;
    boolean        modified  = false ;
    ResourceLocker lockers[] = null ;
    Resource       resource  = null ;

    protected LRUAble prev = null;
    protected LRUAble next = null;

    public final LRUAble getNext() {
	return next;
    }

    public final LRUAble getPrev() {
	return prev;
    }

    public final void setPrev(LRUAble prev) {
	this.prev = prev;
    } 

    public final void setNext(LRUAble next) {
	this.next = next;
    }

    synchronized void markModified() {
	modified = true ;
    }
    
    synchronized void registerLocker(ResourceLocker locker) {
	if ( lockers == null ) {
	    lockers    = new ResourceLocker[3] ;
	    lockers[0] = locker ;
	    return ;
	} else {
	    int length = lockers.length ;
	    for (int i = 0 ; i < length ; i++) {
		if ( lockers[i] == null ) {
		    lockers[i] = locker ;
		    return ;
		}
	    }
	    ResourceLocker nlockers[] = new ResourceLocker[length+1] ;
	    System.arraycopy(lockers, 0, nlockers, 0, length) ;
	    nlockers[length] = locker ;
	    lockers = nlockers ;
	    return ;
	}
    }

    synchronized void unregisterLocker(ResourceLocker locker) {
 	if ( lockers != null ) {
	    for (int i = 0 ; i < lockers.length ; i++) {
		if ( lockers[i] == locker ) {
		    lockers[i] = null ;
		    return ;
		}
	    }
	}
    }

    synchronized void unloadResource(jdbmResourceStore store) {
	// If already done, return:
	if ( resource == null )
	    return;
	// If any lockers, notify them:
	if ( lockers != null ) {
	    for (int i = 0 ; i < lockers.length ; i++) {
		if ( lockers[i] != null )
		    lockers[i].notifyResourceLockBreak(resource);
	    }
	}
	// Finally save the resource now that no one points to it:
	if ( modified )
	    store.saveResource(this);
	// Notify the resource that it is unloaded:
	resource.notifyUnload();
	resource = null;
	return;
    }

    byte[] getResourceBytes() {
	ByteArrayOutputStream bo  = new ByteArrayOutputStream(512);
	try {
	    DataOutputStream out = new DataOutputStream(bo);
	    resource.pickle(out);
	    out.close();
	} catch (IOException ex) {
	    // FIXME
	    ex.printStackTrace();
	    return null;
	}
	return bo.toByteArray();
    }

    Resource getResource() {
	return resource ;
    }

    jdbmResource(Resource resource, boolean modified) {
	this.resource = resource ;
	this.modified = modified ;
    }

    jdbmResource(Resource resource) {
	this(resource, false) ;
    }

}

public class jdbmResourceStore implements ResourceStore {
    private final static int VERSION = 1;

    public static final int LOADED_LIMIT    = 200;
    public static final int LOADED_THRESOLD = 50;

    private static final int DBOPCOUNT_REORG = 200;

    jdbm                 dbm        = null ;
    ResourceStoreManager manager    = null ;
    Hashtable            loaded     = null ;
    AsyncLRUList         lru        = null;
    jdbmStoreSweeper     sweeper    = null;
    File                 repository = null;
    Object               token      = null;
    int                  dbopcount  = 0;

    protected void reorganize() {
	synchronized(loaded) {
	    if ( dbopcount < DBOPCOUNT_REORG )
		return;
	    // We are really safe here:
	    save();
	    jdbm clean = dbm.reorganize(false);
	    if ( clean != null )
		dbm = clean;
	    dbopcount = 0;
	}
    }

    protected final void startReorganize() {
	sweeper.runReorganization();
    }

    private final void markUsed() {
	if ( manager != null )
	    manager.markUsed(token);
    }

    /**
     * Add a holder to that store.
     * @param holder The holder to add.
     */

    public synchronized void addHolder(ResourceStoreHolder holder) {
	if ( manager != null )
	    manager.addHolder(token, holder);
    }

    /**
     * Remove a store holder.
     * @param holder The holder to remove.
     */

    public synchronized void removeHolder(ResourceStoreHolder holder) {
	if ( manager != null )
	    manager.removeHolder(token, holder);
    }

    /**
     * Get the identifier for that store.
     * We use the repository as an identifier, which is safe here.
     * @return The absolute path of the repository.
     */

    public String getIdentifier() {
	return repository.getAbsolutePath();
    }


    public int getVersion() {
	return VERSION;
    }

    // FIMXE this is a hack
    public void setPersist(Resource resource) {
	jdbmResource e = (jdbmResource)loaded.get(resource.getIdentifier());
	if ( e != null )
	    e.persist = true;
    }

    public void listLRU(PrintStream out, String msg) {
	out.println(msg);
	LRUAble it = lru.getHead();
	while (it != null) {
	    jdbmResource r = (jdbmResource) it;
	    out.println(r.resource.getIdentifier());
	    it = lru.getNext(it);
	}
    }

    public void runStoreSweeper() {
	markUsed();
	sweeper.emitSignal();
    }

    public final int getLoadedCount() {
	return loaded.size();
    }
    
    /**
     * Unload one selected resource from the store.
     */

    public void unloadResource() {
	markUsed();
	jdbmResource entry = (jdbmResource) lru.removeTail();
	if ( ! entry.persist ) {
	    // Unloaded from the loaded hashtable
	    loaded.remove(entry.resource.getIdentifier());
	    // Unload the resource
	    entry.unloadResource(this);
	} else {
	    lru.toHead(entry);
	}
    }

    /**
     * A jdbm error has occured, this is potentially serious.
     * @param ex The dbm exception.
     * @param msg An informative description of the error.
     */

    protected void dbmError(Exception ex, String msg) {
	System.out.println(msg) ;
	ex.printStackTrace() ;
	throw new RuntimeException("*** DBM Error !");
    }
	
    /**
     * Get the bytes that are the pickled version of the given resource.
     * This opens the file for each resource, it could of course
     * be optimized for the cases were all the resources are to be loaded
     * at once.
     * @param identifier The resource identifier.
     * @return The length, in the instance buffer, of the bytes that makes
     *    this resource.
     */

    protected synchronized byte[] getResourceBytes(String identifier) {
	try {
	    return dbm.lookup(identifier) ;
	} catch (IOException ex) {
	    dbmError(ex, "Unable to lookup "+identifier) ;
	}
	return null ;
    }

    protected void saveResource(jdbmResource entry) {
	try {
	    String id = entry.resource.getIdentifier();
	    int    il = id.length();
	    byte key[] = new byte[il];
	    id.getBytes(0, il, key, 0);
	    byte val[] = entry.getResourceBytes();
	    dbm.store(key, val, jdbm.STORE_REPLACE);
	    entry.modified = false;
	} catch (IOException ex) {
	    dbmError(ex, "Saving: "+entry.resource.getIdentifier());
	} 
    }
	

    /**
     * Restore the resource whose name is given.
     * @param identifier The identifier of the resource to restore.
     * @param defs Default attribute values. If the resource needs to be
     *     restored from its pickled version, this Hashtable provides
     *     a set of default values for some of the attributes.
     * @return A Resource instance, or <strong>null</strong>.
     */

    public Resource loadResource(String identifier, Hashtable defs) 
	throws InvalidResourceException
    {
	markUsed();
	// Check the resource store memory cache:
	jdbmResource entry = (jdbmResource) loaded.get(identifier) ;
	if (entry != null) {
	    lru.toHead(entry);
	    return entry.getResource() ;
	}
	// Load it from the dbm:
	byte bits[] = getResourceBytes(identifier) ;
	if (bits == null)
	    return null ;
	Resource r = null ;
	// Update default attributes:
	if ( defs == null ) 
	    defs = new Hashtable(5);
	entry = new jdbmResource(r);
	defs.put("store-entry", entry);
	defs.put("resource-store", this) ;
	try {
	    DataInputStream in = (new DataInputStream 
				  (new ByteArrayInputStream(bits))) ;
	    r = (Resource) AttributeHolder.unpickle(in, defs) ;
	} catch (HolderInitException ex) {
	    throw new InvalidResourceException(identifier
					       , this
					       , ex.getMessage());
	} catch (Exception ex) {
	    // Emit a illegal resource exception
	    throw new InvalidResourceException(identifier
					       , this
					       , ex.getMessage());
	}
	entry.resource = r;
	lru.toHead(entry);
	loaded.put(identifier, entry);
	if ( loaded.size() >= LOADED_LIMIT )
	    runStoreSweeper();
	return r ;
    }

    public Resource loadResource(String identifier) 
	throws InvalidResourceException
    {
	return loadResource(identifier, null);
    }

    public synchronized void renameResource(String oldid, String newid) {
	markUsed();
	jdbmResource entry = (jdbmResource) loaded.get(oldid);
	if ( entry != null ) {
	    loaded.remove(oldid);
	    loaded.put(newid, entry);
	    entry.modified = true;
	}
    }

    /**
     * Get this resource, but only if already loaded.
     * The resource store may (recommended) maintain a cache of the resource
     * it loads from its store. If the resource having this identifier 
     * has already been loaded, return it, otherwise, return
     * <strong>null</strong>.
     * @param identifier The resource identifier.
     * @return A Resource instance, or <strong>null</strong>.
     */

    public Resource lookupResource(String identifier) {
	markUsed();
	jdbmResource entry = (jdbmResource) loaded.get(identifier) ;
	if ( entry != null )
	    return entry.getResource() ;
	return null ;
    }

    /**
     * Stabilize the resource having the given identifier.
     * @param identifier The resource identifier.
     * @exception UnknownResourceException If the resource is unknown.
     */

    public void saveResource(Resource resource) {
	markUsed();
	// Get the resource to save:
	jdbmResource entry = (jdbmResource) resource.getStoreEntry();
	if ( entry == null )
	    throw new UnknownResourceException(resource);
	// Just mark it modified:
	entry.markModified() ;
    }
    
    /**
     * Lock the given resource in the cache.
     * @param identifier The identifier of the resource to be locked in cache.
     * @return A boolean <strong>true</strong> if locking succeeded.
     */

    public boolean lockResource(ResourceLocker locker, Resource resource) {
	markUsed();
	jdbmResource entry = (jdbmResource) resource.getStoreEntry();
	if ( entry == null )
	    return false ;
	// Okay, lock it:
	entry.registerLocker(locker) ;
	return true ;
    }

    /**
     * Unlock the given resource in the cache.
     * @param identifier The identifier of the resource to be unlocked.
     */

    public void unlockResource (ResourceLocker locker, Resource resource) {
	markUsed();
	jdbmResource entry = (jdbmResource) resource.getStoreEntry();
	if ( entry == null )
	    return ;
	entry.unregisterLocker(locker) ;
    }

    /**
     * Add this resource to this resource store.
     * @param resource The resource to be added.
     */

    public void addResource(Resource resource) {
	markUsed();
	jdbmResource entry = new jdbmResource(resource, true);
	resource.setValue("resource-store", this) ;
	resource.setValue("store-entry", entry);
	loaded.put(resource.getIdentifier(), entry);
	lru.toHead(entry);
	if ( loaded.size() >= LOADED_LIMIT )
	    runStoreSweeper();
	if ( ++dbopcount >= DBOPCOUNT_REORG )
	    startReorganize();
    }

    /**
     * Remove this resource from the repository.
     * @param identifier The identifier of the resource to be removed.
     */

    public void removeResource(String identifier) {
	markUsed();
	jdbmResource entry = (jdbmResource) loaded.get(identifier) ;
	if ( entry != null ) {
	    lru.remove(entry);
	    loaded.remove(identifier);
	    try {
		dbm.delete(identifier) ;
	    } catch (IOException ex) {
		dbmError (ex, "Unable to delete "+identifier) ;
	    }
	}
	if ( ++dbopcount >= DBOPCOUNT_REORG )
	    startReorganize();
    }

    /**
     * Mark this resource as modified.
     * @param identifier The identifier of the modified resource.
     */

    public void markModified(Resource resource) {
	markUsed();
	jdbmResource entry = (jdbmResource) resource.getStoreEntry();
	entry.markModified() ;
    }

    // FIXME

    public boolean acceptUnload() {
	return true;
    }

    /**
     * Shutdown this store.
     */

    public void shutdown() {
	save() ;
    }

    /**
     * Save this store.
     */

    public synchronized void save() {
	byte key[] = null;
	// Save the database:
	try {
	    Enumeration e = loaded.elements();
	    while ( e.hasMoreElements() ) {
		jdbmResource entry = (jdbmResource) e.nextElement();
		if ( entry.modified ) 
		    saveResource(entry);
	    }
	    dbm.save() ;
	} catch (IOException ex) {
	    dbmError(ex, "Unable to save database.") ;
	}
    }

    /**
     * Enumerate all the resources saved in this store.
     * @return An enumeration of Strings, giving the identifier for all 
     *     the resources that this store knows about.
     */

    public Enumeration enumerateResourceIdentifiers() {
	markUsed();
	return new jdbmResourceStoreEnum(loaded.keys(), dbm.keys()) ;
    }

    /**
     * Check for the existence of a resource in this store.
     * @param identifier The identifier of the resource to check.
     * @return A boolean <strong>true</strong> if the resource exists
     *    in this store, <strong>false</strong> otherwise.
     */

    public boolean hasResource(String identifier) {
	markUsed();
	try {
	    return ((loaded.get(identifier) != null)
		    || (dbm.lookup(identifier) != null));
	} catch (IOException ex) {
	    dbmError(ex, "Unable to lookup "+identifier) ;
	}
	return false ;
    }

    /**
     * This resource store is being built, initialize it with the given arg.
     * @param repository A file, giving the location of the associated 
     *    repository.
     */

    public void initialize(ResourceStoreManager manager
			   , Object token
			   , File repository) {
	this.manager = manager ;
	try {
	    this.manager    = manager;
	    this.token      = token;
	    this.repository = repository;
	    this.dbm        = new jdbm(repository) ;
	    this.loaded     = new Hashtable();
	    this.lru        = new AsyncLRUList();
	    this.sweeper    = new jdbmStoreSweeper(this);
	} catch (IOException ex) {
	    dbmError(ex, "Unable to load database.") ;
	}
    }


    /**
     * Dump all resources.
     */
    
    public static void main(String args[]) {
	try {
	    int sz = 0;
	    // Open the store:
	    jdbmResourceStore store = new jdbmResourceStore();
	    store.initialize((ResourceStoreManager) null
			     , null
			     , new File(args[0]));
	    // Enumerate cached resources:
	    Enumeration e  = store.enumerateResourceIdentifiers();
	    while ( e.hasMoreElements() ) {
		String   id = (String) e.nextElement();
		Resource r  = (Resource) store.loadResource(id);
		System.out.println("--- "+r.getClass());
		r.print(System.out);
	    }
	    System.out.println("Total size="+sz);
	    System.exit(0);
	} catch (Exception ex) {
	    System.out.println("jdbmResourceStore [store]");
	    ex.printStackTrace();
	}
    }

}
