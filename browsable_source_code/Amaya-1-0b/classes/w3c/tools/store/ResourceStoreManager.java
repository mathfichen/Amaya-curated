// ResourceStoreManager.java
// $Id: ResourceStoreManager.java,v 1.2 1997/03/27 13:57:30 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.tools.store ;

import java.io.* ;
import java.util.* ;

import w3c.util.*;

/**
 * The list of loaded store.
 */

class StoreEntry implements LRUAble {
    // LRU management infos:
    LRUAble next = null ;
    LRUAble prev = null ;
    // ResourceStore infos:
    ResourceStore       store      = null ;
    ResourceStoreHolder holders[]  = null ;
    File                repository = null ;

    public LRUAble getNext() {
	return next;
    }

    public LRUAble getPrev() {
	return prev;
    }

    public void setNext(LRUAble next) {
	this.next = next;
    }

    public void setPrev(LRUAble prev) {
	this.prev = prev;
    }
    /**
     * Add a holder for this store.
     */

    synchronized void addHolder(ResourceStoreHolder holder) {
	int slot = -1;
	// Was this holder already registered ?
	for (int i = 0 ; i < holders.length ; i++) {
	    if ( holders[i] == null ) {
		slot = i;
	    } else if ( holders[i] == holder ) {
		return ;
	    }
	}
	// Add it:
	if ( slot >= 0 ) {
	    holders[slot] = holder;
	} else {
	    // Resize the holders array:
	    ResourceStoreHolder nholders[] = null ;
	    nholders = new ResourceStoreHolder[holders.length+1] ;
	    System.arraycopy(holders, 0, nholders, 0, holders.length);
	    nholders[holders.length] = holder ;
	    holders = nholders ;
	}
    }
	
    /**
     * Remove a holder for this store.
     * Don't panic: if no more holders hold the given store, it will quickly
     * be brought to the end of the LRU queue, and disappear by itself.
     */

    synchronized void removeHolder(ResourceStoreHolder holder) {
	for (int i = 0 ; i < holders.length ; i++) {
	    if ( holders[i] == holder ) {
		holders[i] = null ;
		return ;
	    } 
	}
    }

    /**
     * Load the store of this entry.
     */

    synchronized ResourceStore getStore(ResourceStoreManager manager) {
	if ( store == null ) {
	    store = new SimpleResourceStore() ;
	    store.initialize(manager, this, repository) ;
	}
	return store ;
    }

    /**
     * Try unloading the space for this entry.
     * Try make all holders unload the store, if some of them don't want to, 
     * too bad.
     */
    
    synchronized boolean unloadStore() {
	if ( store != null ) {
	    // Will the store unload itself ?
	    if ( ! store.acceptUnload() )
		return false;
	    // Will any store holder veto that ?
	    for (int i = 0 ; i < holders.length ; i++) {
		ResourceStoreHolder holder = holders[i] ;
		if ( holder == null )
		    continue ;
		if ( ! holder.acceptStoreUnload(store) )
		    return false;
	    }
	    // Great, proceed:
	    shutdownStore();
	}
	return true;
    }

    /**
     * Shutdown the store.
     */

    synchronized void shutdownStore() {
	if ( store != null ) {
	    for (int i = 0 ; i < holders.length ; i++) {
		ResourceStoreHolder holder = holders[i] ;
		if ( holder == null )
		    continue ;
		holder.notifyStoreShutdown(store) ;
		holders[i] = null;
	    }
	    store.shutdown() ;
	    store = null ;
	}
    }

    /**
     * Try stabilizing the store.
     */

    synchronized void saveStore() {
	if ( store != null ) {
	    // Save the resource store:
	    store.save();
	    // Notify store holders:
	    for (int i = 0 ; i < holders.length ; i++) {
		ResourceStoreHolder holder = holders[i] ;
		if ( holder == null ) 
		    continue ;
		holder.notifyStoreStabilize(store);
	    }
	}
    }

    StoreEntry(File repository, ResourceStoreHolder holder) {
	this.store      = null ;
	this.repository = repository ;
	this.holders    = new ResourceStoreHolder[3] ;
	holders[0]      = holder ;
    }
    
}

class StoreManagerSweeper extends Thread {
    ResourceStoreManager manager = null ;
    boolean              killed  = false ;

    protected synchronized void waitEvent() {
	boolean done = false ;

	// Wait for an event to come by:
	while ( ! done ) {
	    try {
		wait() ;
		done = true ;
	    } catch (InterruptedException ex) {
	    }
	}
    }

    protected synchronized void sweep() {
	notify() ;
    }

    protected synchronized void shutdown() {
	killed = true ;
	notify() ;
    }

    public void run() {
	while ( true ) {
	    waitEvent() ;
	    // The whole trick is to run the collect method of the store 
	    // manager, without having the lock on the sweeper itself, so
	    // that clients can still trigger it later
	    if ( killed ) {
		break ;
	    } else {
		try {
		    manager.collect() ;
		} catch (Exception ex) {
		    // We really don't want this thread to die
		    ex.printStackTrace() ;
		}
	    }
	}
    }

    StoreManagerSweeper(ResourceStoreManager manager) {
	this.manager = manager ;
	this.setName("StoreSweeper") ;
	this.start() ;
    }

}

public class ResourceStoreManager {
    /**
     * The identifier for resource store files.
     * All files that are used as resource store, and whose resource store 
     * implementation make use of <code>pickleProlog</code> will start
     * with a dump of that integer.
     * @see #pickleProlog
     * @see #unpickleProlog
     */
    public static final int STOREFILE_IDENTIFIER = 0x7afeefac;

    /**
     * The loaded resource stores.
     */
    protected Hashtable entries = new Hashtable() ;
    /**
     * Is this store shutdown ?
     */
    protected boolean closed = false ;
    /**
     * Our store directory.
     */
    protected File storedir = null;
    /**
     * The store entries least recetenly used list.
     */
    protected LRUList lru = null;
    // FIXME doc
    protected ResourceStoreState state = null;

    /**
     * Our sweeper thread:
     */
    protected StoreManagerSweeper sweeper = null ;

    protected final int getMaxEntries() {
	return 16 ;
    }

    /**
     * Check that this resource store manager isn't closed.
     * @exception RuntimeException If the store manager was closed.
     */

    protected final synchronized void checkClosed() {
	if ( closed )
	    throw new RuntimeException("Invalid store manager access.") ;
    }

    /**
     * Lookup an entry in the store.
     * @param repository The repository of the store to lookup.
     * @param create Create a new entry if it doesn't exist.
     */

    protected synchronized StoreEntry lookupEntry(File repository
						  , ResourceStoreHolder holder
						  , boolean create) {
	StoreEntry entry = (StoreEntry) entries.get(repository) ;
	if (create && (entry == null)) {
	    // Check to see if we have exceeded our quota:
	    if ( entries.size() > getMaxEntries() ) 
		sweeper.sweep() ;
	    entry = new StoreEntry(repository, holder) ;
	    lru.toHead(entry);
	    entries.put(repository, entry) ;
	} else {
	    entry.addHolder(holder);
	}
	return entry ;
    }

    /**
     * Pick the least recently used entry, and remove all links to it.
     * After this method as run, the least recently used entry for some store
     * will be returned. The store manager will have discarded all its link to 
     * it, and the entry shutdown will have to be performed by the caller.
     * @return An StoreEntry instance, to be cleaned up.
     */

    protected synchronized StoreEntry pickLRUEntry() {
	return (StoreEntry) lru.removeTail();
    }

    /**
     * Collect enough entries to go back into fixed limits.
     */

    public void collect() {
	while ( entries.size() > getMaxEntries() ) {
	    StoreEntry entry = pickLRUEntry() ;
	    if ( entry != null ) {
		synchronized(entry) {
		    if ( entry.unloadStore() )
			entries.remove(entry.repository);
		    else
			lru.toHead(entry);
		}
	    } else {
		break;
	    }
	}
    }

    /**
     * Add the given object as a holder to that store.
     * @param token Token to the store about to be held.
     * @param holder The store holder.
     * @return A boolean <strong>true</strong> if the holder was installed.
     */

    public synchronized boolean addHolder(Object token
					  , ResourceStoreHolder holder) {
	StoreEntry entry = (StoreEntry) token;
	if ( entry != null ) {
	    entry.addHolder(holder);
	    return true;
	} else {
	    return false;
	}
    }

    /**
     * Remove the given holder from that store.
     * @param token Token to the store that was hold.
     * @param holder The resource store holder to remove.
     */

    public synchronized void removeHolder(Object token
					  , ResourceStoreHolder holder) {
	
	StoreEntry entry = (StoreEntry) token;
	if ( entry != null ) 
	    entry.removeHolder(holder);
    }

    /**
     * Load a resource store.
     * @param holder The holder for the resource store.
     * @param repository Its associated repository.
     */

    public ResourceStore loadResourceStore(ResourceStoreHolder holder
					   , File repository) {
	checkClosed() ;
	StoreEntry entry = lookupEntry(repository, holder, true) ;
	return entry.getStore(this) ;
    }

    /**
     * Create a resource store repository name.
     * This method will return a new resource store repository key. When
     * used in conjunction with the <code>loadResourceStore</code> method
     * that takes a key as a parameter, this allows to caller to abstract
     * itself from the physical location of the repository.
     * @return A fresh resource store key, guaranteed to be uniq.
     */

    public String createResourceStoreRepository() {
	return "st-" + state.getNextKey();
    }

    public int getCurrentStoreIdentifier() {
	return state.getCurrentKey();
    }

    /**
     * Unhold the given store.
     * For some reason, the holder for this store has decided to close it.
     * Remove from ths list of this store holder. When this call is made, the
     * caller is expected to have cleaned-up the store (stabilize it, etc).
     * @param holder The holder of the store.
     * @param store The store this holder doesn't want to hold anymore.
     */

    public void unholdResourceStore(ResourceStoreHolder holder
				    , File repository) {
	StoreEntry entry = lookupEntry(repository, null, false) ;
	if ( entry != null )
	    entry.removeHolder(holder) ;
    }

				    
    /**
     * Shutdown this resource store manager.
     * Go through all entries, and shut them down.
     */

    public synchronized void shutdown() {
	// Kill the sweeper thread:
	sweeper.shutdown() ;
	// Clenup all pending resource stores:
	Enumeration enum = entries.elements() ;
	while ( enum.hasMoreElements() ) {
	    StoreEntry entry = (StoreEntry) enum.nextElement() ;
	    entry.shutdownStore() ;
	    entries.remove(entry.repository) ;
	}
	closed = true ;
	// Now save our state:
	File rmstate = new File(storedir, "state");
	try {
	    DataOutputStream out = (new DataOutputStream
				    (new BufferedOutputStream
				     (new FileOutputStream (rmstate))));
	    state.pickle(out);
	    out.close();
	} catch (Exception ex) {
	    // FIXME !!
	    System.out.println("ResourceStoreManager: unable to save state !");
	    ex.printStackTrace();
	}
    }

    /**
     * Checkpoint all modified resource stores, by saving them to disk.
     */

    public void checkpoint() {
	// Checkpoint all loaded resource stores:
	Enumeration e = entries.elements();
	while ( e.hasMoreElements() ) {
	    StoreEntry entry = (StoreEntry) e.nextElement();
	    entry.saveStore();
	}
	// Then save our state:
	File rmstate = new File(storedir, "state");
	try {
	    DataOutputStream out = (new DataOutputStream
				    (new BufferedOutputStream
				     (new FileOutputStream (rmstate))));
	    state.pickle(out);
	    out.close();
	} catch (Exception ex) {
	    // FIXME !!
	    System.out.println("ResourceStoreManager: unable to save state !");
	    ex.printStackTrace();
	}
    }

    /**
     * Mark the given store as having been used recently.
     * @param token The token the resource store manager provided you when
     * it initialized the store.
     */

    public void markUsed(Object token) {
	StoreEntry entry = (StoreEntry) token;
	if ( entry != null )
	    lru.toHead(entry);
    }

    /**
     * Dump a prolog in given stream for that resource store.
     * Using the resource store manager prolog in a resource store 
     * implementation is optional. However, it is recommended that whenever 
     * possible, you use it to get the benefits of the main method of that
     * class.
     * @param out The output stream to dump the prolog to.
     * @param store The resource store which is being dumped.
     * @exception IOException If the prolog couldn't be pickled to the
     * given output stream.
     * @see #unpickleProlog
     */

    public static void pickleProlog(DataOutputStream out, ResourceStore store)
	throws IOException
    {
	out.writeInt(STOREFILE_IDENTIFIER);
	out.writeUTF(store.getClass().getName());
	out.writeInt(store.getVersion());
    }

    /**
     * Read in the prolog from the given input stream.
     * This method checks the consistency between the implementation of the
     * store that wants to read from that stream, and the implementation of
     * the store that has been used to create it.
     * <p>Using that method, as well as using the <code>pickleProlog</code>
     * method is optional; however, using one makes using the other 
     * mandatory.
     * @param in The input stream to read the prolog from.
     * @param store The store that is to be created from the given input 
     * stream.
     * @exception IOException If the stream couldn't be read.
     * @exception NotAStoreException If the given repository wasn't flagged as
     * containing a resource store.
     * @exception InvalidStoreClassException If the loading class is not
     * the saving class.
     * @exception StoreClassVersionException If the saved store version number
     * doesn't match the loader's class version number.
     * @see #pickleProlog
     */

    public static void unpickleProlog(DataInputStream in
				      , ResourceStore store) 
	throws IOException,
	       NotAStoreException, 
	       InvalidStoreClassException,
	       StoreClassVersionException
    {
	int id = in.readInt();
	if ( id != STOREFILE_IDENTIFIER ) 
	    // We are really in a bad situation:
	    throw new NotAStoreException("not a store");
	String clsname = in.readUTF();
	int    version = in.readInt();
	if ( ! store.getClass().getName().equals(clsname) ) 
	    throw new InvalidStoreClassException(store.getClass().getName()
						 , clsname);
	if ( version != store.getVersion() ) 
	    throw new StoreClassVersionException(store.getVersion()
						 , version);
	return;
    }

    /**
     * Try to salvage the resource store manager state.
     * That's pretty easy and robust, it should really work well if no
     * one hacked the store directory.
     * @return A ResourceStoreState instance.
     */
     
    public ResourceStoreState salvageState() {
	System.err.println("*** salvaging resource manager state...");
	File state = new File(storedir, "state");
	int  maxid = -1;
	// List all available stores in the directory:
	String stores[] = storedir.list();
	for (int i = 0 ; i < stores.length; i++) {
	    if ((stores[i].length() <= 3) || ! stores[i].startsWith("st-") )
		continue;
	    if ( stores[i].endsWith(".bak") )
		continue;
	    try {
		int id = Integer.parseInt(stores[i].substring(3));
		maxid  = Math.max(maxid, id);
	    } catch (Exception ex) {
		ex.printStackTrace();
	    }
	}
	if ( ++maxid <= 0 )
	    throw new RuntimeException("unable to salvage manager's state.");
	System.err.println("*** resource store state salvaged, using: "+maxid);
	return new ResourceStoreState(maxid);
    }

    /**
     * Create a new resource store manager for given store directory.
     * The resource store manager will manage the collection of stores 
     * contained in the directory, and keep track of the stores state.
     * @param storedir The store directory to manage.
     */

    public ResourceStoreManager (File storedir) {
	// Initialize the instance variables:
	this.storedir = storedir;
	this.entries  = new Hashtable() ;
	this.sweeper  = new StoreManagerSweeper(this) ;
	this.lru      = new AsyncLRUList();
	// If not already available, create the resource store state object:
	File rsmstate = new File(storedir, "state");
	// Restore it:
        DataInputStream in = null;
	try {
	    in = (new DataInputStream
		  (new BufferedInputStream 
		   (new FileInputStream(rsmstate))));
	    this.state = (ResourceStoreState) AttributeHolder.unpickle(in);
	} catch (Exception ex) {
	    // Let's try to fix this:
	    this.state = salvageState();
	}
	if ( in != null ) {
	    try { in.close(); } catch (IOException ex) {}
	}
    }

}
