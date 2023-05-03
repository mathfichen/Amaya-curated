// DateAttribute.java
// $Id: DateAttribute.java,v 1.2 1997/03/27 13:57:28 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.tools.store ;

public class DateAttribute extends LongAttribute {

    public DateAttribute(String name, Object def, int flags) {
	super(name, (Long) def, flags) ;
	this.type = "java.util.Date";
    }
}
