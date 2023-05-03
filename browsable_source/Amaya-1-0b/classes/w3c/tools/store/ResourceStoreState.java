// ResourceStoreState.java
// $Id: ResourceStoreState.java,v 1.3 1997/03/27 14:26:01 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.tools.store ;

import java.io.* ;
import java.util.* ;

// import w3c.jigsaw.http.*;
import w3c.util.*;

class ResourceStoreState extends AttributeHolder {
    protected static int ATTR_RSKEY = -1;

    static {
	Attribute a = null;
	Class     c = null;
	try {
	    c = Class.forName("w3c.tools.store.ResourceStoreState");
	} catch (Error er) {
	    er.printStackTrace();
	} catch (Exception ex) {
	    ex.printStackTrace();
	    System.exit(1);
	}
	// The rskey attribute:
	a = new IntegerAttribute("rskey"
				 , new Integer(0)
				 , Attribute.COMPUTED);
	ATTR_RSKEY = AttributeRegistry.registerAttribute(c, a);
    }

    public synchronized int getNextKey() {
	int rskey = getInt(ATTR_RSKEY, 0);
	setInt(ATTR_RSKEY, rskey+1);
	return rskey;
    }

    public synchronized int getCurrentKey() {
	return getInt(ATTR_RSKEY, 0);
    }
	
    public ResourceStoreState() {
	this(0);
    }

    public ResourceStoreState(int id) {
	super();
	setValue(ATTR_RSKEY, new Integer(id));
    }
}

