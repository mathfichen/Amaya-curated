// HttpInvalidValueException.java
// $Id: HttpInvalidValueException.java,v 1.2 1997/03/27 13:57:39 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.www.http;

public class HttpInvalidValueException extends RuntimeException {

    public HttpInvalidValueException(String msg) {
	super(msg);
    }

}
