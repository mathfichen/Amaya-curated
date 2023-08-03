// FrameArrayAttribute.java
// $Id: FrameArrayAttribute.java,v 1.1 1997/03/27 14:00:00 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.tools.store ;

import java.io.* ;

import w3c.util.*;

public class FrameArrayAttribute extends Attribute {

    public boolean checkValue(Object value) {
	return value instanceof ResourceFrame[];
    }

    public int getPickleLength(Object value) {
	int len = 4;
	if ( value == null )
	    return len;
	// Compute the pickled length of all frames:
	ResourceFrame frames[] = (ResourceFrame[]) value;
	try {
	    for (int i = 0 ; i < frames.length ; i++) {
		CountOutputStream out  = new CountOutputStream();
		DataOutputStream  dout = new DataOutputStream(out);
		frames[i].pickle(dout);
		dout.close();
		len += out.getCount();
	    }
	} catch (IOException ex) {
	    throw new RuntimeException("CountOutputStream IO error");
	}
	return len;
    }

    public void pickle(DataOutputStream out, Object obj)
	throws IOException
    {
	if ( obj == null ) {
	    out.writeInt(0);
	} else {
	    ResourceFrame frames[] = (ResourceFrame[]) obj;
	    out.writeInt(frames.length);
	    for (int i = 0 ; i < frames.length ; i++) 
		frames[i].pickle(out);
	}
    }

    public Object unpickle(DataInputStream in) 
	throws IOException
    {
	int cnt = in.readInt();
	if ( cnt == 0 )
	    return null;
	ResourceFrame frames[] = new ResourceFrame[cnt];
	for (int i = 0 ; i < cnt ; i++)
	    frames[i] = (ResourceFrame) AttributeHolder.unpickle(in
								 , null
								 , false);
	return frames;
    }

    public FrameArrayAttribute(String name, ResourceFrame def[], int flags) {
	super(name, def, flags);
    }

}
