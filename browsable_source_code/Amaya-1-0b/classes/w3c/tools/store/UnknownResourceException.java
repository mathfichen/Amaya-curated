// UnknownResourceException.java
// $Id: UnknownResourceException.java,v 1.2 1997/03/27 13:57:31 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.tools.store ;

public class UnknownResourceException extends RuntimeException {

    public UnknownResourceException (Resource resource) {
	super("ResourceStore mismatch for resource "+resource.getIdentifier());
    }

}
