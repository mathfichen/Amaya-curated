// Resource.java
// $Id: Resource.java,v 1.2 1997/03/27 13:57:29 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.tools.store ;

import java.util.*;

/**
 * The resource class describes an object, accessible through the server.
 * Resource objects are required to have the following properties: 
 * <ul>
 * <li>They must be persistent (their life-time can span multiple httpd 
 * life-time).
 * <li>They must be editable, so that one can change some of their aspects
 * (such as any associated attribute).
 * <li>They must be self-described: each resource must now what kind
 * of attribute it <em>understands</em>.
 * <li>They must be able to update themselves: some of the meta-information
 * associated with a resource may require lot of CPU to compute. 
 * <li>They must implement some name-service policy.
 * </ul>
 * <p>These resource objects do not define how they are accessed. See the
 * sub-classes for specific accesses. It might be the case that HTTP-NG allows
 * <em>any</em> sub-class of resource to be accessible, although, right now
 * HTTP-1.x only allows you to access HTTPResource instances.
 */

public class Resource extends AttributeHolder {
    private static final boolean debugunload = false;

    /**
     * Attribute index - The index of the resource store entry attribute.
     */
    protected static int ATTR_STORE_ENTRY = -1;
    /**
     * Attribute index - The index for the identifier attribute.
     */
    protected static int ATTR_IDENTIFIER = -1 ;
    /**
     * Attribute index - The resource store associated with this resource.
     */
    protected static int ATTR_RESOURCE_STORE = -1 ;
    /**
     * Attribute index - Associated resource frames
     */
    protected static int ATTR_RESOURCE_FRAMES = -1;

    static {
	Attribute a   = null ;
	Class     cls = null ;
	// Get a pointer to our own class:
	try {
	    cls  = Class.forName("w3c.tools.store.Resource") ;
	} catch (Exception ex) {
	    ex.printStackTrace() ;
	    System.exit(1) ;
	}
	// The resource store entry for that resource:
	a = new ObjectAttribute("store-entry"
				, "java.lang.Object"
				, null
				, Attribute.DONTSAVE);
	ATTR_STORE_ENTRY = AttributeRegistry.registerAttribute(cls, a);
	// The identifier attribute:
	a = new StringAttribute("identifier"
				, null
				, Attribute.MANDATORY|Attribute.EDITABLE);
	ATTR_IDENTIFIER = AttributeRegistry.registerAttribute(cls, a);
	// The resource store:
	a = new ObjectAttribute("resource-store"
				, "w3c.tools.store.ResourceStore"
				, null
				, Attribute.DONTSAVE);
	ATTR_RESOURCE_STORE = AttributeRegistry.registerAttribute(cls, a);
	// The frames associated to that resource:
	a = new FrameArrayAttribute("frames"
				    , null
				    , Attribute.EDITABLE);
	ATTR_RESOURCE_FRAMES = AttributeRegistry.registerAttribute(cls, a);
    }

    public Object getClone(Object values[]) {
	// The frame attribute needs one more level of cloning:
	ResourceFrame f[] = (ResourceFrame[]) values[ATTR_RESOURCE_FRAMES];
	if ( f != null ) {
	    ResourceFrame c[] = new ResourceFrame[f.length] ;
	    for (int i = 0 ; i < f.length ; i++) {
		if ( f[i] == null )
		    c[i] = null;
		else
		    c[i] = (ResourceFrame) f[i].getClone();
	    }
	    values[ATTR_RESOURCE_FRAMES] = c;
	}
	return super.getClone(values);
    }

    /**
     * Get the store entry for that resource.
     * Only the resource store in charge of this resource knows about the
     * type of the resulting object. Buy declaring the class of that object
     * private, the resource store can assume some private access to it.
     * @return A java Object instance, or <strong>null</strong> if no 
     * store entry is attached to that resource.
     */

    public Object getStoreEntry() {
	return getValue(ATTR_STORE_ENTRY, null);
    }

    /**
     * Get this resource's help url.
     * @return An URL, encoded as a String, or <strong>null</strong> if not
     * available.
     */

    public String getHelpURL() {
	return null;
    }

    /**
     * Get the help URL for that resource's topic.
     * @param topic The topic you want help for.
     * @return A String encoded URL, or <strong>null</strong> if none
     * was found.
     */

    public String getHelpURL(String topics) {
	return null;
    }

    /**
     * Get this resource identifier.
     * @return The String value for the identifier.
     */

    public String getIdentifier() {
	return getString(ATTR_IDENTIFIER, null) ;
    }

    /**
     * Get the store associated with this resource.
     * @return The associated store or <strong>null</strong>. Not all resources
     *    have a store associated with them (eg the one that whose 
     *    creation is cheap, etc).
     */

    public ResourceStore getResourceStore() {
	return (ResourceStore) getValue(ATTR_RESOURCE_STORE, null) ;
    }

    /**
     * Initialize and attach a new ResourceFrame to that resource.
     * @param frame An uninitialized ResourceFrame instance.
     * @param defs A default set of attribute values.
     * @return The initialized instance of the ResourceFrame itself.
     * @exception HolderInitException If the frame couldn't be initialized.
     */

    public void registerFrame(ResourceFrame frame, Hashtable defs) {
	synchronized (this) {
	    ResourceFrame frames[] = null;
	    frames = (ResourceFrame[]) getValue(ATTR_RESOURCE_FRAMES, null);
	    // Initialize the frame with given default attributes:
	    if ( defs.get("identifier") == null )
		defs.put("identifier"
			 , "frame-"+((frames == null) ? 0 : frames.length));
	    frame.initialize(defs);
	    // Look for a free slot frame:
	    if ( frames == null ) {
		frames    = new ResourceFrame[1];
		frames[0] = frame;
	    } else {
		int slot = -1;
		// Look for a free slot:
		for (int i = 0 ; i < frames.length ; i++) {
		    if ( frames[i] == null ) {
			slot = i;
			break;
		    }
		}
		if ( slot >= 0 ) {
		    // Free slot available:
		    frames[slot] = frame;
		} else {
		    // Resize frames:
		    ResourceFrame nf[] = new ResourceFrame[frames.length+1];
		    System.arraycopy(frames, 0, nf, 0, frames.length);
		    nf[frames.length] = frame;
		    frames = nf;
		}
	    }
	    // Set the frames:
	    setValue(ATTR_RESOURCE_FRAMES, frames);
	}
    }

    /**
     * Unregister a resource frame from the given resource.
     * @param frame The frame to unregister from the resource.
     */
    
    public synchronized void unregisterFrame(ResourceFrame frame) {
	ResourceFrame frames[] = null;
	frames = (ResourceFrame[]) getValue(ATTR_RESOURCE_FRAMES, null);
	if ( frames != null ) {
	    for (int i = 0 ; i < frames.length ; i++) {
		if ( frames[i] == frame ) {
		    frames[i] = null;
		    return;
		}
	    }
	}
    }

    /**
     * Collect any frame that's an instance of the given class.
     * @param cls The class of frames we are looking for.
     * @return An array of ResourceFrame, containing a set of frames instances
     * of the given class, or <strong>null</strong> if no resource frame is
     * available.
     */
    
    public synchronized ResourceFrame[] collectFrames(Class c) {
	return null;
    }
    
    /**
     * Get the first occurence of a frame of the given class.
     * @param cls The class of te frame to look for.
     * @return A ResourceFrame instance, or <strong>null</strong>.
     */
    
    public synchronized ResourceFrame getFrame(Class c) {
	return null;
    }
	

    /**
     * Get an attached frame attribute value.
     * This method really is a short-hand that combines a <code>getFrame</code>
     * and <code>getValue</code> method call.
     * @param cls The class of the frame we want the value of.
     * @param idx The attribute index.
     * @param def The default value (if the attribute value isn't defined).
     * @return The attribute value as an Object instance, or the provided
     * default value if the attribute value isn't defined.
     */

    public synchronized Object getValue(Class c, int idx, Object def) {
	ResourceFrame frame = getFrame(c);
	if ( frame != null )
	    return frame.getValue(idx, def);
	throw new IllegalAttributeAccess(this, idx);
    }

    /**
     * Set an attached frame attribute value.
     * This method really is a short-hand that combines a <code>getFrame</code>
     * and a <code>setValue</code> method call.
     * @param cls The class of the frame we want to modify.
     * @param idx The attribute to modify.
     * @param val The new attribute value.
     */

    public synchronized void setValue(Class c, int idx, Object val) {
	ResourceFrame frame = getFrame(c);
	if ( frame != null ) {
	    frame.setValue(idx, val);
	    markModified();
	    return;
	}
	throw new IllegalAttributeAccess(this, idx);
    }

    /**
     * Mark this resource as having been modified.
     */

    public void markModified() {
	ResourceStore store = getResourceStore() ;
	if ( store != null ) {
	    store.markModified(this) ;
	}
    }

    /**
     * We overide setValue, to mark the resource as modified.
     * @param idx The index of the attribute to modify.
     * @param value The new attribute value.
     */

    public void setValue(int idx, Object value) {
	// Changing the identifier of a resource needs some special tricks:
	if ( idx == ATTR_IDENTIFIER ) {
	    ResourceStore store = getResourceStore();
	    if ( store != null ) {
		String oldid = getIdentifier();
		try {
		    super.setValue(idx, value);
		} catch (IllegalAttributeAccess ex) {
		    // We were not able to change the identifier, rethrow
		    throw ex;
		}
		// Change was successfull, update the resource store:
		store.renameResource(oldid, (String) value);
		markModified();
		return;
	    }
	}
	// Normal setValue, but markModified before leaving:
	super.setValue(idx, value) ;
	if ( ! attributes[idx].checkFlag(Attribute.DONTSAVE) ) 
	    markModified() ;
    }

    /**
     * Is that resource willing to be unloaded.
     * This method is a bit tricky to implement. The guideline is that you
     * should not dynamically change the returned value (since you can't 
     * control what happens between a call to that method and a call to
     * the <code>notifyUnload</code> method).
     * <p>Returning <strong>false</strong> should never be needed, except
     * for very strange resources.
     * @return A boolean <strong>true</strong> if the resource can be unloaded
     * <strong>false</strong> otherwise.
     */

    public boolean acceptUnload() {
	if ( debugunload ) {
	    try {
		System.out.println(getValue("url","<??>")+": acceptUnload");
	    } catch (IllegalAttributeAccess ex) {
	    }
	}
	return true;
    }

    /**
     * This resource is being unloaded.
     * The resource is being unloaded from memory, perform any additional
     * cleanup required.
     */

    public void notifyUnload() {
	if ( debugunload ) {
	    try {
		System.out.println(getValue("url","<??>")+": unloaded.");
	    } catch (IllegalAttributeAccess ex) {
	    }
	}
	values = null ;
    }

    /**
     * Lock this resource in its store.
     * Acquire a lock on this resource: if you do acquire the lock, than you 
     * are guaranteed that either the resource will be kept in memory, or
     * you will be notified through a call to
     * <code>notifyResourceLockBreak</code> that the resource is going down.
     * @param locker The object willing to acquire the lock.
     * @return A boolean <strong>true</strong> if locking succeeded, 
     *    <strong>false</strong> otherwise.
     */

    public boolean lock(ResourceLocker locker) {
	ResourceStore store = getResourceStore() ;
	if ( store == null )
	    return false ;
	else
	    return store.lockResource(locker, this) ;
    }

    /**
     * Unlock the given resource.
     * @param locker The object that wishes to relinquish the lock.
     */
    
    public void unlock(ResourceLocker locker) {
	ResourceStore store = getResourceStore() ;
	if ( store != null )
	    store.unlockResource(locker, this) ;
    }

    /**
     * The web admin wants us to update any out of date attribute.
     */

    public void updateAttributes() {
	return ;
    }

    /**
     * Delete this Resource instance, and remove it from its store.
     * This method will erase definitely this resource, for ever, by removing
     * it from its resource store (when doable).
     */

    public synchronized void delete() {
	ResourceStore store = getResourceStore();
	if ( store != null ) 
	    store.removeResource(getIdentifier());
    }

    /**
     * Create an empty resource instance.
     * Initialize the instance attributes description, and its values.
     */

    public Resource() {
	super() ;
    }
}
