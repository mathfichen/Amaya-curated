// MimeTypeAttribute.java
// $Id: MimeTypeAttribute.java,v 1.1 1997/04/03 09:06:50 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.tools.store;

import java.io.* ;

import w3c.www.mime.* ;

/**
 * The generic class of Mime type attributes.
 */

public class MimeTypeAttribute extends Attribute {

    /**
     * Is the given object a valid MimeTypeAttribute value ?
     * @param obj The object to test.
     * @return A boolean <strong>true</strong> if okay.
     */

    public boolean checkValue(Object obj) {
	return (obj instanceof MimeType) || (obj == null) ;
    }
     
    /**
     * Get the number of bytes required to save that attribute value.
     * @param The value about to be pickled.
     * @return The number of bytes needed to pickle that value.
     */

    public final int getPickleLength(Object value) {
	String str    = ((MimeType) value).toString();
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
     * Pickle a MIME type to the given output stream.
     * @param out The output stream to pickle to.
     * @param obj The object to pickle.
     * @exception IOException If some IO error occured.
     */

    public void pickle(DataOutputStream out, Object t) 
	throws IOException
    {
	out.writeUTF(((MimeType) t).toString()) ;
    }

    /**
     * Unpickle a MIME type from the given input stream.
     * @param in The input stream to unpickle from.
     * @return An instance of String.
     * @exception IOException If some IO error occured.
     */

    public Object unpickle (DataInputStream in) 
	throws IOException
    {
	try {
	    return new MimeType(in.readUTF()) ;
	} catch (MimeTypeFormatException ex) {
	    throw new IOException("illegal MIME type.") ;
	}
    }
     

    public MimeTypeAttribute(String name, Object def, int flags) {
	super(name, def, flags) ;
	this.type = "w3c.www.mime.MimeType";
    }
}
