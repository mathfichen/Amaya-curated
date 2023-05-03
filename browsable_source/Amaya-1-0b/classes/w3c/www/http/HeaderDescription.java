// HeaderDescription.java
// $Id: HeaderDescription.java,v 1.2 1997/03/27 13:57:36 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.www.http;

public class HeaderDescription {
    Class  cls     = null ;	// Class of parser to use.
    String name    = null ; 	// lower case name.
    byte   title[] = null;	// title for header emitting.
    int    offset  = -1;	// Offset of header in its message holder.

    /**
     * Get this header name, lower case (can be used as header id).
     * @return A String giving the header identifier.
     */

    public String getName() {
	return name;
    }

    /**
     * Get this header title, ready for emission.
     * @return The actual bytes to be emited for this header title.
     */

    public byte[] getTitle() {
	return title;
    }

    /**
     * Get this header parser, as an HeaderValue compatible instance.
     * @return An instance of HeaderValue, suitable for holding and parsing
     * the header value.
     */

    public HeaderValue getHolder() {
	try {
 	    return (HeaderValue) cls.newInstance();
	} catch (NoSuchMethodError er) {
	    throw new RuntimeException("Invalid class (method) for "+name);
	} catch (InstantiationError ex) {
	    throw new RuntimeException("Invalid class (method) for "+name);
	} catch (Exception ex) {
	    throw new RuntimeException("Invalid class for "+name);
	}
    }

    /**
     * Is this header description the one of that header.
     * @param h The header access token.
     */

    public boolean isHeader(int h) {
	return h == offset;
    }

    HeaderDescription(String title, String clsname, int offset) {
	try {
	    this.title  = new byte[title.length()];
	    title.getBytes(0, this.title.length, this.title, 0);
	    this.name   = title.toLowerCase();
	    this.cls    = Class.forName(clsname);
	    this.offset = offset;
	} catch (Exception ex) {
	    ex.printStackTrace();
	    throw new RuntimeException("Invalid header description "+name);
	}

    }

    HeaderDescription(String title, String clsname) {
	this(title, clsname, -1);
    }

}
