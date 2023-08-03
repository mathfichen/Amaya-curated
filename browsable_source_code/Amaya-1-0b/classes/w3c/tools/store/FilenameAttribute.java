// FilenameAttribute.java
// $Id: FilenameAttribute.java,v 1.2 1997/03/27 13:57:28 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.tools.store ;

import java.io.* ;

/**
 * The generic description of a FilenameAttribute.
 * A file name is a String, augmented with the fact that it should be a valid 
 * file name.
 */

public class FilenameAttribute extends StringAttribute {
     
    public FilenameAttribute(String name, Object def, int flags) {
	super(name, (String) def, flags) ;
	this.type = "java.lang.String";
    }

}
