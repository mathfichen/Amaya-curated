// NotAStoreException.java
// $Id: NotAStoreException.java,v 1.2 1997/03/27 13:57:29 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996-1997.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.tools.store;

/**
 * This is exception gets thrown if an invalid resource store is detected.
 */

public class NotAStoreException extends Exception {

    public NotAStoreException(String msg) {
	super(msg);
    }

}
