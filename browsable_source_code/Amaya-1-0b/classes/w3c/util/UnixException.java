// UnixException.java
// $Id: UnixException.java,v 1.2 1997/03/27 13:57:34 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.util;

/**
 * Exception used to notify of any UNIX calls failure.
 * @see Unix
 */

public class UnixException extends Exception {

    UnixException(String msg) {
	super(msg);
    }

}
