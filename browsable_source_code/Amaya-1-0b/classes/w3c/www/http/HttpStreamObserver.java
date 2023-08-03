// HttpStreamObserver.java
// $Id: HttpStreamObserver.java,v 1.2 1997/03/27 13:57:42 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.www.http;

import java.io.*;

public interface HttpStreamObserver {

    /**
     * The end of the stream has been reached.
     * @param in The stream that has reached enf od file.
     */

    public void notifyEOF(InputStream in);

    /**
     * The stream has been closed.
     * @param in The stream that has been closed.
     */

    public void notifyClose(InputStream in) ;

    /**
     * The stream doesn't support monitoring.
     * This happens for HTTP connections that don't provide any infos
     * about their length.
     * @param in The stream on which an IO exception occured.
     */

    public void notifyFailure(InputStream in);
}
