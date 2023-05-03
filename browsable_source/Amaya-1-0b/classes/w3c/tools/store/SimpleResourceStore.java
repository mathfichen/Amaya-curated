// SimpleResourceStore.java
// $Id: SimpleResourceStore.java,v 1.2 1997/03/27 13:57:31 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html


package w3c.tools.store ;

import java.util.* ;
import java.io.* ;

class ResourceIndex {
    SimpleResourceStore store     = null ;
    ResourceLocker      lockers[] = null ;
    String identifier = null ;
    int    fileptr    = -1 ;
    int    bytesize   = -1 ;
    Resource resource = null ;
    boolean modified = false ;

    int getIdentifierUTFLength() {
	int strlen = identifier.length() ;
	int utflen = 0 ;

	for (int i = 0 ; i < strlen ; i++) {
	    int c = identifier.charAt(i);
	    if ((c >= 0x0001) && (c <= 0x007F)) {
		utflen++;
	    } else if (c > 0x07FF) {
		utflen += 3;
	    } else {
		utflen += 2;
	    }
	}
	return utflen + 2 ;
    }

    synchronized void addLocker(ResourceLocker locker) {
	if ( lockers == null ) {
	    lockers = new ResourceLocker[3] ;
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

    synchronized void removeLocker(ResourceLocker locker) {
	if ( lockers != null ) {
	    for (int i = 0 ; i < lockers.length ; i++) {
		if ( lockers[i] == locker ) {
		    lockers[i] = null ;
		    return ;
		}
	    }
	}
    }
		
    synchronized void unloadResource() {
	if ( resource == null )
	    return ;
	// Notify the resource lockers, if any:
	if ( lockers != null ) {
	    for (int i = 0 ; i < lockers.length ; i++) {
		if ( lockers[i] == null )
		    continue ;
		lockers[i].notifyResourceLockBreak(resource) ;
		lockers[i] = null ;
	    }
	}
	// notify the resource of unload:
	resource.notifyUnload() ;
	resource = null;
    }

    synchronized Resource isLoaded() {
	return resource;
    }

    synchronized Resource loadResource(Hashtable defs)
	throws IOException
    {
	// Fast case:
	if ( resource != null ) 
	    return resource ;
	// Slow case:
	DataInputStream in = (new DataInputStream
			      (new ByteArrayInputStream
			       (store.getResourceBytes(this, null)))) ;
	resource = (Resource) AttributeHolder.unpickle(in, defs) ;
	return resource ;
    }

    ResourceIndex(SimpleResourceStore store, ResourceIndex old) {
	this.store      = store ;
	this.resource   = resource ;
	this.identifier = old.identifier ;
	this.fileptr    = -1 ;
	this.bytesize   = -1 ;
	this.modified   = false ;
    }

    ResourceIndex(SimpleResourceStore store) {
	this.store      = store ;
	this.resource   = resource ;
	this.identifier = null ;
	this.fileptr    = -1 ;
	this.bytesize   = -1 ;
	this.modified   = false ;
    }

}

/**
 * A very naive resource store.
 * This resource store keeps all the resources in a file. It loads all 
 * resources (on a per-demand basis), and never unloads them.
 */

public class SimpleResourceStore implements ResourceStore {
    /**
     * Dump exceptions when unloading a resource fails.
     */
    private static final boolean debugunload = false;
    /**
     * The store format version number.
     */
    private static final int VERSION = 1;

    /**
     * The resources we know about: maps identifier to resource objects.
     */
    Hashtable resources = null ;
    /**
     * Our underlying associated file.
     */
    File repository = null ;
    /**
     * Has this repository been modified.
     */
    boolean modified = false ;
    /**
     * Do we have a pending save operation ?
     */
    boolean save_pending = false ;
    /**
     * Our resource store manager.
     */
    protected ResourceStoreManager manager = null ;
    /**
     * Our token within the resource store manager.
     */
    Object token = null;

    /**
     * Mark the store as having been used recently.
     */

    protected final void markUsed() {
	if ( manager != null )
	    manager.markUsed(token) ;
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

    /**
     * Emit the given string as a warning, to whoever it is appropriate.
     * @param msg The warning message.
     */

    protected void warning(String msg) {
	System.out.println("[" + getClass().getName() 
			   + "@" + repository
			   + "]: " + msg) ;
    }
     
    /**
     * Get our file, positionned at the given position.
     * We won't keep our repository file always open (too much of these
     * resource stroe would burn our available file descriptors).
     * @param at The position at wich you want the stream.
     */

    protected RandomAccessFile getFileAt(int pos)
	throws IOException
    {
	RandomAccessFile fd = new RandomAccessFile(repository, "rw") ;
	fd.seek(pos) ;
	return fd ;
    }

    /**
     * Restore our whole index from our repository.
     */

    protected synchronized void loadIndex(Hashtable target) 
	throws IOException
    {
	// If no index file exists, we are creating it:
	InputStream fin = null ;
	try {
	    fin = new FileInputStream(repository) ;
	} catch (FileNotFoundException ex) {
	    // This resource store is being created, mark modified
	    modified = true;
	    return ;
	}
	// Otherwise load it:
	DataInputStream in  = (new DataInputStream
			       (new BufferedInputStream(fin)));
	try {
	    ResourceStoreManager.unpickleProlog(in, this);
	} catch (NotAStoreException ex) {
	    // That's really bad, let's just restart the stream, and see:
	    System.err.println("*** Prolog doesn't match !!");
	    in = (new DataInputStream(new BufferedInputStream(fin)));
	} catch (InvalidStoreClassException ex) {
	    // That's due to some changes between 1.0alpha4 and alpha5:
	    String compname = "w3c.jigsaw.resources.SimpleResourceStore";
	    if ( ! ex.getSaverClassName().equals(compname) ) {
		System.err.println("*** Prolog doesn't match (class name)");
		in = (new DataInputStream(new BufferedInputStream(fin)));
	    }
	} catch (StoreClassVersionException ex) {
	    // We really don't know how to handle this, again restart:
	    System.err.println("*** Prolog doesn't match (versions)");
	    in = (new DataInputStream(new BufferedInputStream(fin)));
	}
	// Read in the store:
	int count = in.readInt() ;
	for (int i = 0 ; i < count ; i++) {
	    ResourceIndex index = new ResourceIndex(this) ;
	    index.fileptr    = in.readInt();
	    index.bytesize   = in.readInt() ;
	    index.identifier = in.readUTF() ;
	    index.modified   = false ;
	    index.resource   = null ;
	    target.put(index.identifier, index) ;
	}
	fin.close() ;
    }

    /**
     * Debug - print this resource store index.
     */

    protected void printIndex() {
	Enumeration enum = resources.elements() ;
	while (enum.hasMoreElements() ) {
	    ResourceIndex entry = (ResourceIndex) enum.nextElement() ;
	    System.out.println(entry.identifier
			       + " " + entry.bytesize 
			       + "@" +entry.fileptr);
	}
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

    protected synchronized
    byte[] getResourceBytes(ResourceIndex index, byte into[]) 
	throws IOException
    {
	if ((into == null) || (index.bytesize > into.length))
	    into = new byte[index.bytesize] ;
	RandomAccessFile fd = getFileAt(index.fileptr) ;
	fd.read(into, 0, index.bytesize) ;
	fd.close() ;
	return into ;
    }

    /**
     * Pickle the given resource into the given output stream.
     * @param resource The resource to pickle.
     * @param out The data output stream to pickle to.
     * @return The size of the pickled version of the resource.
     */

    protected int pickleResource(Resource resource, DataOutputStream out) 
	throws IOException
    {
	int start = out.size() ;
	resource.pickle(out) ;
	return out.size() - start ;
    }

    /**
     * Get the store format version number.
     * @return An ineteger version number, guaranteed to change whenever the
     * format used by the store changes.
     */

    public int getVersion() {
	return VERSION;
    }

    /**
     * Load a resource, or get one from the cache.
     * @param identifier The resource identifier.
     * @return A Resource instance, or <strong>null</strong> if the resource
     * doesn't exist in that store.
     * @exception InvalidResourceException If the resource couldn't be 
     * restored from its pickled format.
     */

    public Resource loadResource(String identifier, Hashtable defs)
	throws InvalidResourceException
    {
	ResourceIndex index = (ResourceIndex) resources.get(identifier) ;
	if ( index == null )
	    return null ;
	// Load it, but don't bother locking the store
	if ( defs == null )
	    defs = new Hashtable(3);
	defs.put("resource-store", this);
	defs.put("store-entry", index);
	try {
	    return index.loadResource(defs) ;
	} catch (HolderInitException ex) {
	    if ( debugunload ) {
		System.err.println("* "+getClass().getName()+".debugunload:");
		ex.printStackTrace();
	    }
	    // Throw an invalid resource exception:
	    throw new InvalidResourceException(identifier
					       , this
					       , ex.getMessage());
 	} catch (IOException ex) {
	    if ( debugunload ) {
		System.err.println("* "+getClass().getName()+".debugunload:");
		ex.printStackTrace();
	    }
	    throw new InvalidResourceException(identifier
					       , this
					       , ex.getMessage());
	}
    }

    /**
     * Internal save: save the repository back to disk.
     * @param unload Should we unload any existing resources ?
     */

    protected synchronized void internalSave(boolean unload) 
	throws IOException
    {
	Enumeration           enum       = resources.elements() ;
	Hashtable             nresources = new Hashtable(resources.size()+1) ;
	ByteArrayOutputStream out        = new ByteArrayOutputStream() ;
	DataOutputStream      dout       = new DataOutputStream(out) ;
	byte                  bits[]     = null ;

	// Stage 0: pickle the store prolog:
	ResourceStoreManager.pickleProlog(dout, this);
	dout.close();
	byte prolog[] = out.toByteArray();
	// Stage 1: pickle all resources to the byte stream:
	out  = new ByteArrayOutputStream();
	dout = new DataOutputStream(out);
	while ( enum.hasMoreElements() ) {
	    // Even if might already have an index entry, we recreate a new
	    // one since we are not sure the save operation will succeed
	    ResourceIndex index = (ResourceIndex) enum.nextElement() ;
	    ResourceIndex entry = new ResourceIndex(this, index) ;
	    if ((index.resource == null) || ( ! index.modified)) {
		bits = getResourceBytes(index, bits) ;
		entry.resource   = index.resource ;
		entry.fileptr    = dout.size() + prolog.length;
		entry.bytesize   = index.bytesize ;
		dout.write(bits, 0, entry.bytesize) ;
	    } else {
		entry.resource   = index.resource ;
		entry.fileptr    = dout.size() + prolog.length;
		entry.bytesize   = pickleResource(index.resource, dout) ;
	    }
	    if ( unload && (index.resource != null)) {
		index.unloadResource() ;
		index.resource = null ;
		entry.resource = null ;
	    }
	    nresources.put(entry.identifier, entry) ;
	}    
	// Stage 2: compute the index size:
	int         nwritten = nresources.size() ;
	int         isize    = 4 ;
	Enumeration nindex   = nresources.elements() ;
	while (nindex.hasMoreElements()) {
	    ResourceIndex entry = (ResourceIndex) nindex.nextElement() ;
	    isize += (8 + entry.getIdentifierUTFLength());
	}
	// Stage 3: create a suitable temporary file, and associated streams
	File             tmp  = new File(repository.getParent()
					 , repository.getName()+".tmp") ;
	DataOutputStream fout = (new DataOutputStream
				 (new BufferedOutputStream
				  (new FileOutputStream (tmp)))) ;
	// Stage 4: emit the index part of the archive
	fout.write(prolog, 0, prolog.length);
	nindex = nresources.elements() ;
	fout.writeInt(nwritten) ;
	while (nindex.hasMoreElements()) {
	    ResourceIndex entry = (ResourceIndex) nindex.nextElement() ;
	    entry.fileptr += isize ;
	    fout.writeInt(entry.fileptr) ;
	    fout.writeInt(entry.bytesize) ;
	    fout.writeUTF(entry.identifier) ;
	}
	// Stage 5: emit the bits that make the pickled version of resources
 	bits = out.toByteArray() ;
	fout.write(bits, 0, bits.length) ;
	fout.close() ;
	// Stage 6: Success ! 
	// - Rename the temp file to the repository file.
	// - Exchange our index hashtable for the new one.
	String name = repository.getName() ;
	String dir  = repository.getParent() ;
	File   bak  = new File(dir, name+".bak");
	File   tild = new File(dir, name+".bak~") ;
	
	// 1st move: delete the ~ file if any:
	if ( tild.exists() )
	    tild.delete() ;
	// 2nd move rename bak to ~ (bak no longer exists)
	if ( bak.exists() ) {
            bak.renameTo(tild);
	    bak.delete() ;
	}
	// 3nd move: rename the current repository to bak
	if ( repository.exists() ) { 
	    if ( ! repository.renameTo(bak) ) {
	        warning("unable to rename "+repository+" to "+bak) ;
	        tild.renameTo(bak) ;
	    }
	    repository.delete();
	}
	// 4th move: rename the tmp file to the repository
	if ( ! tmp.renameTo(repository) ) {
	    bak.renameTo(repository) ;
	    tild.renameTo(bak);
	    warning("unable to rename "+tmp+" to "+repository) ;
	}
	// cleanup (erase the ~ file)
	tild.delete() ;
	save_pending = false ;
	modified     = false ;
	resources    = nresources ;
    }

    /**
     * Lookup this resource.
     * @param identifier The resource identifier.
     * @return A Resource instance, or <strong>null</strong> if either the
     *    resource doesn't exist, or it isn't loaded yet.
     */

    public Resource lookupResource (String identifier) {
	ResourceIndex index = (ResourceIndex) resources.get(identifier) ;
	markUsed() ;
	return ((index == null) ? null : index.resource ) ;
    }

    /**
     * Save a given resource.
     * If the resource has been modified, we save <em>all</em> our resources.
     * @param resource The resource to be save right now.
     */

    public void saveResource(Resource resource) {
	ResourceIndex index = (ResourceIndex) resource.getStoreEntry();
	if ( index == null )
	    throw new UnknownResourceException(resource);
	if (index.modified)
	    save() ;
	markUsed() ;
    }

    /**
     * Lock this resource in memory.
     * @param locker The object willing to acuiqre the lock.
     * @param identifier The resource to lock.
     * @return A boolean <strong>true</strong> if the locking succeeds.
     */

    public synchronized boolean lockResource(ResourceLocker locker
					     , Resource resource) {
	ResourceIndex index = (ResourceIndex) resource.getStoreEntry();
	if ( index != null ) {
	    index.addLocker(locker) ;
	    return true ;
	}
	markUsed() ;
	return false ;
    }

    /**
     * Unlock this resource from memory.
     * @param lcoker The object willing to relinquish the lock.
     * @param identifier The resource to unlock.
     */

    public synchronized void unlockResource(ResourceLocker locker
					    , Resource resource) {
	ResourceIndex index = (ResourceIndex) resource.getStoreEntry();
	if ( index != null )
	    index.removeLocker(locker) ;
    }

    /**
     * Add a new resource to the resource store.
     * @param resource The resource to add.
     */

    public synchronized void addResource(Resource resource) {
	ResourceIndex index = new ResourceIndex(this) ;
	index.fileptr = -1 ;
	index.bytesize = -1 ;
	index.identifier = resource.getIdentifier() ;
	index.modified = true ;
	index.resource = resource ;
	resource.setValue("resource-store", this) ;
	resource.setValue("store-entry", index);
	resources.put(resource.getIdentifier(), index) ;
	modified = true ;
	markUsed() ;
    }

    /**
     * Remove a resource from this resource store.
     * @param identifier The identifier of the resource to be removed.
     */

    public synchronized void removeResource(String identifier) {
	ResourceIndex index = (ResourceIndex) resources.get(identifier) ;
	if ( index != null ) {
	    index.unloadResource() ;
	    resources.remove(identifier) ;
	    modified = true ;
	    markUsed() ;
	}
	return ;
    }

    /**
     * Rename a resource in the store.
     * @param oldid The old resource identifier.
     * @param newid The new resource identifier.
     */

    public synchronized void renameResource(String oldid, String newid) {
	ResourceIndex index = (ResourceIndex) resources.get(oldid);
	if (index != null) {
	    resources.remove(oldid);
	    index.identifier = newid;
	    resources.put(newid, index);
	    index.modified = true;
	    modified       = true;
	}
    }

    /**
     * Mark the given resource as being modified.
     * @param identifier The identifier of the modified resource.
     */

    public synchronized void markModified(Resource resource) {
	ResourceIndex index = (ResourceIndex) resource.getStoreEntry();
	if ( index != null ) {
	    index.modified = true ;
	    modified       = true ;
	    markUsed();
	} 
    }

    /**
     * Can the resource store manager unload that store from memory.
     * We check all the loaded resource, to see if they are willing to be
     * unloaded; we do unload straight all the resources that accept (to
     * reduce memory usage), and return <strong>false</strong> only if one
     * of our resource refuse to be unloaded.
     */

    public synchronized boolean acceptUnload() {
	Enumeration e      = resources.elements();
	boolean     accept = true;
	while ( e.hasMoreElements() ) {
	    ResourceIndex entry    = (ResourceIndex) e.nextElement();
	    Resource      resource = entry.isLoaded();
	    if (resource != null) {
		synchronized(entry) {
		    if ( resource.acceptUnload() ) {
			if ( ! entry.modified )
			    entry.unloadResource();
		    } else {
			accept = false;
		    }
		}
	    }
	}
	if ( ! accept ) {
	    // Let's at least do an internal save, so next time, we'll unload
	    // some resources:
	    try {
		if ( modified ) 
		    internalSave(false);
	    } catch (IOException ex) {
		ex.printStackTrace();
		warning("internalSave failed at acceptUnload");
	    }
	}
	return accept;
    }

    /**
     * Shutdown this store.
     */

    public synchronized void shutdown() {
	if ( modified ) {
	    try {
		internalSave(true) ;
	    } catch (IOException ex) {
		ex.printStackTrace();
		warning("internalSave failed at shutdown.") ;
	    }
	} else {
	    // Just notify the unload of loaded resources:
	    Enumeration entries = resources.elements() ;
	    while ( entries.hasMoreElements() ) {
		ResourceIndex index = (ResourceIndex) entries.nextElement() ;
		index.unloadResource() ;
	    }
	}
	// Clean-up all references we have to external objects:
	resources  = null ;
	manager    = null ;
    }

    /**
     * Save all our modified resources back to our file.
     */

    public synchronized void save() {
	if ( modified ) {
	    try {
		internalSave(false) ;
	    } catch (IOException ex) {
		warning("Save failed ["+ex.getMessage()+"]");
	    }
	}
    }

    /**
     * Enumerate all the resources identifier in this repository.
     */

    public Enumeration enumerateResourceIdentifiers() {
	markUsed() ;
	return resources.keys() ;
    }

    /**
     * Does this store defines this resource.
     * @param identifier The resource we are looking for.
     * @return A boolean <strong>true</strong> if found.
     */

    public boolean hasResource(String identifier) {
	markUsed() ;
	return resources.get(identifier) != null ;
    }

    /**
     * Print a simple resource store.
     */

    public String toString() {
	return repository.getAbsolutePath() ;
    }

    /**
     * Initialize this simple store with the given file.
     * @param manager The resource store manager that loaded use.
     * @param token Our identification token from the above resource store
     * manager (this is an opaque object).
     * @param file The repository file.
     */

    public void initialize(ResourceStoreManager manager
			   , Object token
			   , File repository) {
	try {
	    this.manager    = manager ;
	    this.token      = token;
	    this.repository = repository ;
	    this.resources  = new Hashtable(11) ;
	    loadIndex(resources) ;
	} catch (IOException ex) {
	    warning("unable to load index.");
	}
    }

    public static void main(String args[])
	throws Exception
    {
	File                 repository = new File(args[0]) ;
	SimpleResourceStore store      = new SimpleResourceStore() ;
	store.initialize(null, null, repository) ;
	// List all available resources:
	Enumeration enum = store.enumerateResourceIdentifiers() ;
	while (enum.hasMoreElements()) {
	    String   id       = (String) enum.nextElement() ;
	    try {
		Resource resource = store.loadResource(id, null) ;
		System.out.println(id+":") ;
		resource.print(System.out) ;
	    } catch (Exception ex) {
		System.out.println("*** unable to load \""+id+"\"");
		ex.printStackTrace();
	    }
	}
	// Shutdown the store:
	store.shutdown() ;
    }
}
