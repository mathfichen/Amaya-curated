// AttributeHolder.java
// $Id: AttributeHolder.java,v 1.2 1997/03/27 13:57:27 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.tools.store ;

import java.util.* ;
import java.io.* ;

/**
 * An attribute holder is an object that holds a list of attributes.
 * Each of the attributes maintained by a holder are described by an 
 * Attribute object, wich is able to pickle/unpickle its value, provides
 * the status of the attribute (eg mandatory, editable, etc), etc.
 * <p>Given this, an attribute holder is able to pickle its state (made of
 * its attribute values), and unpickle it to any DataOutputStream (resp.
 * DataInputStream).
 * @see Attribute
 * @see Resource
 */

public class AttributeHolder implements Cloneable {
    /**
     * Turns on/off fast pickling.
     * <p>Fast pickling is a mode of pickling attribute holders in which 
     * evolutivity is lost in favor of speed. With slow pickling obtained by
     * setting that flag to <strong>false</strong>, resources are dumped
     * in a <em>alist</em> like format, so you can preserve informations
     * if the attribute list changes.
     */
    protected boolean slowpickle = true;
    /**
     * Pointer to this class registered list of attributes.
     */
    protected Attribute attributes[] = null ;
    /**
     * Attribute values.
     */
    protected Object values[] = null ;

    /**
     * Clone this attribute holder, and init it with the given attributes.
     * @param values Attribute values to overide in the clone.
     * @return A clone of this resource.
     */

    public Object getClone(Object values[]) {
	try {
	    // Continue with normal cloning:
	    AttributeHolder cl   = (AttributeHolder) getClass().newInstance();
	    cl.initialize(values);
	    return cl;
	} catch (Exception ex) {
	    ex.printStackTrace();
	    String msg = ("Unable to create an instance of "+getClass());
	    throw new HolderInitException(msg);
	}
    }

    /**
     * Clone this attribute holder.
     * The resulting clone will <em>share</em> the attribute values of 
     * the cloned attribute holder. 
     * @return An attribute holder sharing its ancestor attribute values.
     */

    public Object getClone() {
	Object vs[] = new Object[attributes.length];
	System.arraycopy(values, 0, vs, 0, vs.length);
	return getClone(vs);
    }

    /**
     * Clone this AttributeHolder instance, and initialize it with defaults.
     * This method first clones the receiving attribute holder, and then
     * uses the defaults provided to finish the initialization.
     * @param defs The attribute values, in a Hashtable.
     * @return The clone.
     * @exception CloneNotSupportedException In case of Java implementation
     * bug !
     */

    public Object getClone(Hashtable defs) {
	try {
	    Object          vs[] = new Object[attributes.length];
	    System.arraycopy(values, 0, vs, 0, vs.length);
	    // Merge the provided attribute values:
	    for (int i = 0 ; i < attributes.length ; i++) {
		Object value = defs.get(attributes[i].getName());
		if ( value != null )
		    vs[i] = value;
	    }
	    return getClone(vs);
	} catch (Exception ex) {
	    String msg = ("Unable to create an instance of "+getClass());
	    throw new HolderInitException(msg);
	}
    }

    /**
     * Get this attribute holders attributes description.
     * The attribute list is guaranteed to be returned always in the same
     * order, wich is fixed at compilation time. This allows for fast access
     * to resource by their position rather than by name.
     * @return An array of Attribute objects, each one containing the
     *    description of one single attribute of the resource.
     * @see w3c.jigsaw.resources.Attribute
     */

    public Attribute[] getAttributes() {
	return attributes ;
    }

    /**
     * Lookup up the index of an attribute in our attribute description.
     * @param name The name of the attribute to look for.
     * @return An integer, positive if found, negative otherwise.
     */

    public int lookupAttribute(String name) {
	for (int i = 0 ; i < attributes.length ; i++) {
	    if ( name.equals(attributes[i].getName()) )
		return i;
	}
	return -1 ;
    }

    /**
     * Set an attribute value.
     * This method sets the value of some attribute of the resource. It marks
     * the resource as being modified, and alert its resource store (so
     * that it knows it will have to save the object at some time in the
     * future).
     * @param idx The attribute index, in the list of attributes advertized by 
     *    the resource.
     * @param value The new value for this attribute.
     * @exception IllegalAttributeValue if the provided value doesn't match
     *    the attribute expected type.
     * @exception UnknownAttribute If the provided index doesn't match
     *    an attribute of this object.
     */

    synchronized public void setValue(int idx, Object value) {
	// Check the index value:
	if ((idx < 0) || (idx >= attributes.length))
	    throw new IllegalAttributeAccess(this, idx) ;
	// Check the requested attribute's type
	Attribute attr = attributes[idx] ;
	if ( attr.checkValue(value) ) {
	    values[idx] = value ;
	} else {
	    throw new IllegalAttributeAccess(this, attr, value) ;
	}
    }

    /**
     * Set an attribute value.
     * This method sets the value of an attribute, referenced by its name.
     * @param name The attribute name.
     * @param value The new value for the attribute.
     * @exception IllegalAttributeValue if the provided value doesn't match
     *    the attribute expected type.
     * @exception UnknownAttribute if the given name doesn't match any of 
     *    the attribute's name.
     */

    synchronized public void setValue(String name, Object value) {
	setValue(lookupAttribute(name), value) ;
    }

    synchronized public void setBoolean(int idx, boolean b) {
	setValue(idx, (b ? Boolean.TRUE : Boolean.FALSE)) ;
    }

    synchronized public void setChar(int idx, char ch) 
	throws IllegalAttributeAccess
    {
	setValue(idx, new Character(ch)) ;
    }

    synchronized public void setDouble(int idx, double d) 
	throws IllegalAttributeAccess
    {
	setValue(idx, new Double(d)) ;
    }

    synchronized public void setFloat(int idx, float f) 
	throws IllegalAttributeAccess
    {
	setValue(idx, new Float(f)) ;
    }

    synchronized public void setInt(int idx, int i) 
	throws IllegalAttributeAccess
    {
	setValue(idx, new Integer(i)) ;
    }

    synchronized public void setLong(int idx, long l) 
	throws IllegalAttributeAccess
    {
	setValue(idx, new Long(l)) ;
    }

    synchronized public void setString(int idx, String s) 
	throws IllegalAttributeAccess
    {
	setValue(idx, (Object) s) ;
    }
    
    /**
     * Generic get of an attribute value.
     * Retreive an attribute value from its index in the resource's attribute
     * list.
     * @param idx The index of the attribute whose value is queried.
     * @param def The default value (if the attribute isn't defined).
     * @return An object, giving the attribute value, or the provided
     *    default if this attribute isn't currently define for the resource.
     * @exception IllegalAttributeAccess if the given index doesn't match any
     *    of the resource's attributes.
     */

    synchronized public Object getValue (int idx, Object def) 
	throws IllegalAttributeAccess
    {
	// Check the provided index:
	if ((idx < 0) || (idx >= attributes.length))
	    throw new IllegalAttributeAccess(this, idx) ;
	Object value = values[idx] ;
	if ( value == null ) 
	    return (def == null) ? attributes[idx].getDefault() : def ;
	else
	    return value ;
    }

    /**
     * Generic get of an attribute value.
     * Get the method of an attribute, by name.
     * @param name The name of the queried attribute.
     * @param def The default value.
     * @exception IllegalAttributeAccess if the given name doesn't match any
     *    of the attribute's name.
     */

    synchronized public Object getValue(String name, Object def)
	throws IllegalAttributeAccess
    {
	return getValue(lookupAttribute(name), def) ;
    }
    
    synchronized public boolean getBoolean(int idx, boolean def) {
	Object value = getValue(idx, null) ;
	if ( value == null ) {
	    return def;
	} else if ( value instanceof Boolean ) {
	    return ((Boolean) value).booleanValue() ;
	} else {
	    throw new IllegalAttributeAccess(this
					     , attributes[idx]
					     , "getBoolean") ;
	}
    }

    synchronized public char getChar(int idx, char def) {
	Object value = getValue(idx, null) ;
	if ( value == null ) {
	    return def ;
	} else if ( value instanceof Character ) {
	    return ((Character) value).charValue() ;
	} else {
	    throw new IllegalAttributeAccess(this
					     , attributes[idx]
					     , "getChar");
	}
    }

    synchronized public double getDouble(int idx, double def) {
	Object value = getValue(idx, null) ;
	if ( value == null ) {
	    return def ;
	} else if ( value instanceof Double ) {
	    return ((Double) value).doubleValue() ;
	} else {
	    throw new IllegalAttributeAccess(this
					     , attributes[idx]
					     , "getDouble") ;
	}
    }

    synchronized public float getFloat(int idx, float def) {
	Object value = getValue(idx, null) ;
	if ( value == null ) {
	    return def ;
	} else if ( value instanceof Float ) {
	    return ((Float) value).floatValue() ;
	} else {
	    throw new IllegalAttributeAccess(this
					     , attributes[idx]
					     , "getFloat") ;
	}
    }

    synchronized public int getInt(int idx, int def) {
	Object value = getValue(idx, null) ;
	if ( value == null ) {
	    return def ;
	} else if ( value instanceof Integer ) {
	    return ((Integer) value).intValue() ;
	} else {
	    throw new IllegalAttributeAccess(this
					     , attributes[idx]
					     , "getInt") ;
	}
    }

    synchronized public long getLong(int idx, long def) {
	Object value = getValue(idx, null) ;
	if ( value == null ) {
	    return def ;
	} else if ( value instanceof Long ) {
	    return ((Long) value).longValue() ;
	} else {
	    throw new IllegalAttributeAccess (this
					      , attributes[idx]
					      , "getLong") ;
	}
    }

    synchronized public String getString(int idx, String def) {
	Object value = getValue(idx, null) ;
	if ( value == null ) {
	    return def ;
	} else if ( value instanceof String ) {
	    return (String) value ;
	} else {
	    throw new IllegalAttributeAccess (this
					      , attributes[idx]
					      , "getString") ;
	}
    }

    /**
     * Does this resource has defined a value for the given attribute.
     * @param idx The index of the attribute to check.
     * @return A boolean <strong>true</strong> if the resource has a value
     *    for this attribute, <strong>false</strong> otherwise.
     */

    public boolean definesAttribute(int idx) 
	throws IllegalAttributeAccess
    {
	return (getValue(idx, null) != null) ;
    }

    /**
     * Does this resource has defined a value for the given attribute.
     * @param name The name of the attribute to check.
     * @return A boolean <strong>true</strong> if the resource has a value
     *    for this attribute, <strong>false</strong> otherwise.
     */

    public boolean definesAttribute(String name) 
	throws IllegalAttributeAccess
    {
	int idx = lookupAttribute(name);
	return (idx >= 0) ? (getValue(idx, null) != null) : false;
    }

    /**
     * Pickle this attribute holder to the given stream.
     * @param out The output stream we should pickle ourselve to.
     * @exception IOException If some IO error occured during pickling.
     */

    public void pickle(DataOutputStream out) 
	throws IOException
    {
	out.writeUTF(this.getClass().getName()) ;
	if ( slowpickle ) {
	    out.writeBoolean(false);
	    // Slow but evolutive pickling
	    for (int i = 0 ; i < attributes.length ; i++) {
		Attribute a = attributes[i];
		if ((values[i] != null) && ! a.checkFlag(Attribute.DONTSAVE)) {
		    out.writeUTF(a.getName());
		    out.writeShort(a.getPickleLength(values[i]));
		    a.pickle(out, values[i]);
		}
	    }
	    out.writeUTF("");
	} else {
	    out.writeBoolean(true);
	    for (int i = 0 ; i < attributes.length ; i++) {
		// Fast but hard-coded pickling
		Attribute a = attributes[i] ;
		if ((values[i] != null) && !a.checkFlag(Attribute.DONTSAVE)) {
		    out.writeBoolean(true) ;
		    a.pickle(out, values[i]) ;
		} else {
		    out.writeBoolean(false) ;
		}
	    }
	}
    }
	
    /**
     * Unpickle an attribute holder from the given input stream.
     * AttributeHolder unpickling is done in two stage: the first stage
     * wich is not redefinable, consists in recreating an instance of the
     * attribute holder (this method).
     * <p>The second stage restore the instance attributes (and whatever
     * information the pickle method as written there). This is the
     * <code>unpickleInstance</code> method.
     * @param defs Set of default values for the holder.
     * @param in The input stream to read from.
     * @param init Should the resource be initialized ?
     * @return An instance of AttributeHolder of one of its subclass.
     * @exception IOException If some IO error occured while reading the 
     *    stream.
     * @exception AttributeHolderInitException If we weren't able to restore
     *    the attribute holder.
     */

    static public AttributeHolder unpickle(DataInputStream in
					   , Hashtable defs
					   , boolean init)
	throws IOException
    {
	// Get an appropriate instance of a AttributeHolder:
	AttributeHolder holder  = null ;
	String          clsname = null ;
	Class           cls     = null ;
	try {
	    clsname = in.readUTF() ;
	    cls     = Class.forName(clsname) ;
	    holder  = (AttributeHolder) cls.newInstance() ;
	} catch (Exception ex) {
	    String msg = ("Unable to create an instance of "
			  + clsname + ": " + ex.getMessage()) ;
	    throw new HolderInitException (msg) ;
	} catch (NoSuchMethodError er) {
	    // We don't know about any logger here:
	    String msg = ("The class "+clsname+" doesn't have a no "
			  + "argument public constructor. It cannot be "
			  + " instantiated.");
	    throw new HolderInitException(msg);
	} catch (NoClassDefFoundError er) {
	    String msg = ("Unable to find class \""+clsname+"\"");
	    throw new HolderInitException(msg);
	}
	return holder.unpickleInstance(in, defs, init) ;
    }

    /**
     * A short hand for unpickling and initializing a resource.
     * @param defs Set of default values for the holder.
     * @param in The input stream to read from.
     * @param init Should the resource be initialized ?
     * @return An instance of AttributeHolder of one of its subclass.
     * @exception IOException If some IO error occured while reading the 
     *    stream.
     * @exception AttributeHolderInitException If we weren't able to restore
     *    the attribute holder.
     */

    static public AttributeHolder unpickle(DataInputStream in
					   , Hashtable defs) 
	throws IOException
    {
	return unpickle(in, defs, true);
    }

    /**
     * Finish the instance part of the unpickling job.
     * The standard way of redefining how your attribute holder should be
     * pickled is as follow:
     * <ul>
     * <li>redefine the <code>pickle</code> method, make sure the first
     * method it calls is it super-method, than pickle whatever additional 
     * infos you want to pickle.
     * <li>Than, redefine the <code>unpickleInstance</code> method, make
     * sure ut first calls its super class <code>unpickleInstance</code>
     * method, and than unpickle the additional informations you have
     * store at pickling time.
     * </ul>
     * @param in The input stream to read from.
     * @param defs The proposed attribute default values.
     * @param init Should we initialize the resource after unpickling.
     */

    public AttributeHolder unpickleInstance(DataInputStream in
					    , Hashtable defs
					    , boolean init)
	throws IOException
    {
	// Get the atribute description for this class :
	Attribute attrs[] = AttributeRegistry.getClassAttributes(getClass()) ;
	Object    vals[]  = null ;
	if ( attrs != null ) {
	    vals = new Object[attrs.length] ;
	    if ( in.readBoolean() ) {
		// Fast unpickle
		slowpickle = false;
		for (int i = 0 ; i < attrs.length ; i++) {
		    if ( in.readBoolean() ) {
			vals[i] = attrs[i].unpickle(in) ;
		    }
		}
	    } else {
		// Slow unpickle
		slowpickle = true;
		String name = null;
		while ( ! (name = in.readUTF()).equals("") ) {
		    int ai = lookupAttribute(name);
		    int as = ((int) in.readShort() & 0xffff);
		    if ( ai >= 0 )
			vals[ai] = attrs[ai].unpickle(in);
		    else 
			in.skip(as);
		}
	    }
	}
	// Merge attribute values with defaults (if any) 
	if ( defs != null ) {
	    for (int i = 0 ; i < attrs.length ; i++) {
		if (vals[i] == null) 
		    vals[i] = defs.get(attrs[i].getName()) ;
	    }
	}
	// Initialize the holder, and return it:
	if ( init )
	    this.initialize(vals) ;
	else
	    // That's a hack for w3c.jigsaw.indexer.Directory !
	    this.values = vals;
	return this ;
    }

    /**
     * A short-hand for unpickling and initializing resources.
     * @param in The input stream to read.
     * @param defs The default attribute values.
     * @return An AttributeHolder instance.
     */

    public AttributeHolder unpickleInstance(DataInputStream in
					    , Hashtable defs) 
	throws IOException
    {
	return unpickleInstance(in, defs, true);
    }

    /**
     * Unpickle an attribute holder from the given input stream.
     * @param in The input stream to read from.
     * @return An instance of AttributeHolder of one of its subclass.
     * @exception IOException If some IO error occured while reading the 
     *    stream.
     * @exception AttributeHolderInitException If we weren't able to restore
     *    the attribute holder.
     */

    static public AttributeHolder unpickle(DataInputStream in) 
	throws IOException
    {
	return unpickle(in, null, true) ;
    }

    /**
     * Initialization method for attribute holders.
     * Each time an attribute holder get restored, its <code>initialize</code>
     * method gets called. The holder should initialize itself with the set
     * of provided values and perform any additional startup code.
     * @param values The attribute values the holder should initialize from.
     * @exception AttributeHolderInitException If tghe holder wasn't able
     *     to initialize itself from the given set of attribute values.
     */

    public void initialize(Object values[]) {
	this.values = values ;
    }

    /**
     * Initialization method for attribute holders.
     * This method allows to initialize an attribute holder by providing
     * its attributes values through a Hashtable mapping attribute names
     * to attribute values.
     * @param defs The Hashtable containing the default values.
     */

    public void initialize(Hashtable defs) {
	Object values[] = ((this.values == null)
			   ? new Object[attributes.length] 
			   : this.values);
	for (int i = 0 ; i < values.length ; i++) {
	    String attrname = attributes[i].getName() ;
	    Object def      = defs.get(attrname) ;
	    if ( values[i] == null )
		values[i] = def ;
	}
	initialize(values) ;
    }

    /**
     * Debugging purposes only, print this attribute holder.
     * @param out The print stream to print to.
     */

    public void print(PrintStream out) {
	for (int i = 0 ; i < attributes.length ; i++) {
	    if ( values[i] != null ) 
		System.out.println(attributes[i].getName()+"="+values[i]);
	}
    }

    /**
     * Create an attribute holder.
     */

    public AttributeHolder() {
	this.attributes = AttributeRegistry.getClassAttributes(getClass()) ;
	if ((attributes != null) && (attributes.length > 0))
	    this.values = new Object[attributes.length] ;
    }

}
