// StringAttribute.java
// $Id: StringAttribute.java,v 1.2 1997/03/27 13:57:31 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.tools.store ;

import java.io.* ;

/**
 * The generic description of an StringAttribute.
 */

public class StringAttribute extends Attribute {

    /**
     * Is the given object a valid StringAttribute value ?
     * @param obj The object to test.
     * @return A boolean <strong>true</strong> if value is valid.
     */

    public boolean checkValue(Object obj) {
	return (obj instanceof String) || (obj == null) ;
    }
     
    /**
     * Get the number of bytes required to save that attribute value.
     * @param The value about to be pickled.
     * @return The number of bytes needed to pickle that value.
     */

    public final int getPickleLength(Object value) {
	String str    = (String) value;
	int    strlen = str.length() ;
	int    utflen = 0 ;

	for (int i = 0 ; i < strlen ; i++) {
	    int c = str.charAt(i);
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

    /**
     * Pickle an string to the given output stream.
     * @param out The output stream to pickle to.
     * @param obj The object to pickle.
     * @exception IOException If some IO error occured.
     */

    public void pickle(DataOutputStream out, Object i) 
	throws IOException
    {
	out.writeUTF((String) i) ;
    }

    /**
     * Unpickle an string from the given input stream.
     * @param in The input stream to unpickle from.
     * @return An instance of String.
     * @exception IOException If some IO error occured.
     */

    public Object unpickle (DataInputStream in) 
	throws IOException
    {
	return in.readUTF() ;
    }
     
    /**
     * Create a description for a generic String attribute.
     * @param name The attribute name.
     * @param def The default value for these attributes.
     * @param flags The associated flags.
     */

    public StringAttribute(String name, String def, int flags) {
	super(name, def, flags) ;
	this.type = "java.lang.String";
    }

}

