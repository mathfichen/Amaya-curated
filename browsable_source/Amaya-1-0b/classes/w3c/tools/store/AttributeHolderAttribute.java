// AttributeHolderAttribute.java
// $Id: AttributeHolderAttribute.java,v 1.2 1997/03/27 13:57:27 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.tools.store ;

import java.io.* ;

import w3c.util.*;

/**
 * The generic description of an attribute whose value is an attribute holder.
 */

public class AttributeHolderAttribute extends Attribute {

    /**
     * Is the given object a valid AttributeHolder value ?
     * @param obj The object to test.
     * @return A boolean <strong>true</strong> if okay.
     */

    public boolean checkValue(Object obj) {
	return (obj instanceof AttributeHolder) || (obj == null) ;
    }
     
    /**
     * Get the number of bytes required to save that attribute value.
     * @param The value about to be pickled.
     * @return The number of bytes needed to pickle that value.
     */

    public int getPickleLength(Object value) {
	CountOutputStream out  = new CountOutputStream();
	DataOutputStream  dout = new DataOutputStream(out);
	AttributeHolder   ah   = (AttributeHolder) value;
	try {
	    ah.pickle(dout);
	    dout.close();
	} catch (IOException ex) {
	    throw new RuntimeException("CountOutputStream IO error");
	}
	return out.getCount();
    }

    /**
     * Pickle an attribute holder to the given output stream.
     * @param out The output stream to pickle to.
     * @param obj The object to pickle.
     * @exception IOException If some IO error occured.
     */

    public void pickle(DataOutputStream out, Object ah) 
	throws IOException
    {
	((AttributeHolder) ah).pickle(out);
    }

    /**
     * Unpickle an attribute holder from the given input stream.
     * The unpickled attribute holder is to be initialized by the caller.
     * @param in The input stream to unpickle from.
     * @return An AttributeHolder instance.
     * @exception IOException If some IO error occured.
     */

    public Object unpickle (DataInputStream in) 
	throws IOException
    {
	return AttributeHolder.unpickle(in, null, false);
    }
     
    public AttributeHolderAttribute(String name
				    , AttributeHolder def
				    , int flags) {
	super(name, def, flags) ;
    }

}
