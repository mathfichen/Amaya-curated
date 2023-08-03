// HolderInitException.java
// $Id: HolderInitException.java,v 1.2 1997/03/27 13:57:28 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.tools.store ;

/**
 * Exception throw when unable to restore an attribute holder.
 */

public class HolderInitException extends RuntimeException {

    public HolderInitException(String msg) {
	super(msg) ;
    }

}
