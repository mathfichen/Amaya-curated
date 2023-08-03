// Handler.java
// $Id: Handler.java,v 1.2 1997/03/27 13:57:47 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.www.protocol.http ;

import java.net.* ;
import java.io.* ;

public class Handler extends URLStreamHandler {

    protected URLConnection openConnection (URL u)
	throws IOException 
    {
	return new HttpURLConnection(u);
    }

}
