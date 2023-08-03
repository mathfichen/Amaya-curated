// HttpSetCookieList.java
// $Id: HttpSetCookieList.java,v 1.2 1997/03/27 13:57:41 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.www.http;

import java.util.*;

public class HttpSetCookieList extends BasicValue {
    Vector setcookies = null;

    protected void updateByteValue() {
	HttpBuffer buf = new HttpBuffer();
	// Dump all cookies, one after the other:
	int len = setcookies.size();
	for (int i = 0 ; i < len ; i++) {
	    HttpSetCookie sc = (HttpSetCookie) setcookies.elementAt(i);
	    buf.append(sc.getName(), (byte) '=', sc.getValue());
	    String s = sc.getComment();
	    if (s != null ) {
		buf.append((byte) ';');
		buf.append("Comment", (byte) '=', s);
	    }
	    if ((s = sc.getDomain()) != null ) {
		buf.append((byte) ';');
		buf.append("Domain", (byte) '=', s);
	    } 
	    int ii = sc.getMaxAge();
	    if ( ii >= 0 ) {
		// Append both maxage and expires time:
		buf.append("; Max-Age", (byte) '=', ii);
		HttpDate expires = new HttpDate(true
						, (System.currentTimeMillis()
						   + (ii * 1000)));
		buf.append("; Expires=");
		expires.appendValue(buf);
	    }
	    if ((s = sc.getPath()) != null ) {
		buf.append((byte) ';');
		buf.append("Path", (byte) '=', s);
	    }
	    if ( sc.getSecurity() ) {
		buf.append(';');
		buf.append("Secure");
	    }
	    buf.append((byte) ';');
	    buf.append("Version", (byte) '=', sc.getVersion());
	}
	raw  = buf.getByteCopy();
	roff = 0;
	rlen = raw.length;
    }

    protected void parse()
	throws HttpParserException
    {
	ParseState cl = new ParseState(roff, rlen);
	ParseState av = new ParseState(0, 0);
	ParseState it = new ParseState(0, 0);
	// Prepare parser states:
	cl.separator = ',';
	av.separator = ';';
	it.separator = '=';
	// Parse the cookie list with cl
	while (HttpParser.nextItem(raw, cl) >= 0) {
	    // Each cookie is made of attr-value pairs:
	    av.ioff   = cl.start;
	    av.bufend = cl.end;
	    HttpSetCookie sc = new HttpSetCookie();
	    while ( HttpParser.nextItem(raw, av) >= 0 ) {
		// Each av is made of an attr '=' value:
		it.ioff   = av.start;
		it.bufend = av.end;
		if ( HttpParser.nextItem(raw, it) < 0 )
		    error("Invalid cookie item ["+av.toString(raw)+"]");
		String item = it.toString(raw, true);
		// The only item that don't have value is security:
		if ( item.equals("secure") ) {
		    // The only one that doesn't need a value:
		    sc.setSecurity(true);
		} else {
		    it.prepare();
		    if ( HttpParser.nextItem(raw, it) < 0 )
			error("No value for attribute ["+item+"]");
		    if ( item.equals("comment") ) {
			sc.setComment(it.toString(raw));
		    } else if ( item.equals("domain") ) {
			sc.setDomain(it.toString(raw));
		    } else if ( item.equals("max-age") ) {
			sc.setMaxAge(HttpParser.parseInt(raw, it));
		    } else if ( item.equals("path") ) {
			sc.setDomain(it.toString(raw));
		    } else if ( item.equals("version") ) {
			sc.setVersion(HttpParser.parseInt(raw, it));
		    } else {
			// This is probably the name/value for the cookie:
			if ( sc.getName() != null )
			    error("Invalid cookie item ["+item+"]");
			sc.setName(item);
			sc.setValue(it.toString(raw));
		    }
		}
		av.prepare();
	    }
	    // Add the newly created cookie:
	    setcookies.addElement(sc);
	    cl.prepare();
	}
    }

    public Object getValue() {
	return this;
    }

    /**
     * Add a specific cookie to the SetCookie header value.
     * This method creates a new, empty SetCookie holder, attaches it to the
     * SetCookie header, and returns it.
     * @param name The cookie's name.
     * @param value The cookie's value.
     */

    public HttpSetCookie addSetCookie(String name, String value) {
	validate();
	HttpSetCookie setcookie = new HttpSetCookie(true, name, value);
	setcookies.addElement(setcookie);
	return setcookie;
    }

    /**
     * Remove a predefined cookie from this SetCookie header.
     * @param name The name of the cookie to remove.
     * @return A boolean <strong>true</strong> if removed, <strong>false
     * </strong> otherwise.
     */
    
    public boolean removeSetCookie(String name) {
	validate();
	for (int i = 0 ; i < setcookies.size() ; i++) {
	    HttpSetCookie setcookie = (HttpSetCookie) setcookies.elementAt(i);
	    if ( setcookie.getName().equals(name) ) {
		setcookies.removeElementAt(i);
		return true;
	    }
	}
	return false;
    }

    /**
     * Get the cookie infos associated with the given cookie name, if any.
     * @param name The cookie's name.
     * @return A HttpSetCookie instance, if found, or <strong>null</strong> 
     * otherwise.
     */

    public HttpSetCookie getSetCookie(String name) {
	validate();
	for (int i = 0 ; i < setcookies.size() ; i++) {
	    HttpSetCookie setcookie = (HttpSetCookie) setcookies.elementAt(i);
	    if ( setcookie.getName().equals(name) )
		return setcookie;
	}
	return null;
    }

    HttpSetCookieList() {
	this.isValid    = false;
	this.setcookies = new Vector(2);
    }

    HttpSetCookieList(HttpSetCookie sc[]) {
	this.isValid    = true;
	this.setcookies = new Vector(2);
	if ( sc != null ) {
	    // FIXME Eouf corse, it's broken
	    for (int i = 0 ; i < sc.length ; i++)
		setcookies.addElement(sc[i]);
	}
    }

}
