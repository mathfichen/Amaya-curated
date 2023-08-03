// InvalidResourceException.java
// $Id: InvalidResourceException.java,v 1.2 1997/03/27 13:57:29 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html


package w3c.tools.store;

/**
 * The resource store is unable to restore a resource.
 */

public class InvalidResourceException extends Exception {

    public InvalidResourceException(String id
				    , ResourceStore store
				    , String msg) {
	super(store+"["+id+"] loadResource failed: "+msg);
    }
}

