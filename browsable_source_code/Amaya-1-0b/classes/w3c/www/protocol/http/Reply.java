// Reply.java
// $Id: Reply.java,v 1.2 1997/03/27 13:57:48 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.www.protocol.http;

import java.io.*;
import java.net.*; // DEBUG

import w3c.www.mime.*;
import w3c.www.http.*;

public class Reply extends HttpReplyMessage {
    protected static HttpMimeType  DEFAULT_TYPE = null;

    static {
	DEFAULT_TYPE = HttpFactory.makeMimeType(MimeType.TEXT_HTML);
    }

    MimeParser parser = null;
    HttpStreamObserver observer = null;

    public boolean keepsAlive() {
	if ( major >= 1 ) {
	    // HTTP/1.1 is quite cool, in some sense
	    if ( minor >= 1 )
		return true;
	    // HTTP/1.0 tries to be as cool, with no success
	    return (hasConnection("keep-alive") 
		    || hasProxyConnection("keep-alive"));
	}
	return false;
    }

    /**
     * Set an stream observer on the repkly entity stream.
     * This method should be called <em>before</em> any caller gets
     * a chance to execute <code>getInputStream</code>. It is needed
     * for HttpServer instances to be notified when the stream becomes
     * available for the next request.
     */

    protected void setStreamObserver(HttpStreamObserver observer) {
	this.observer = observer;
    }

    /**
     * Notify this reply that is has been built to answer given request.
     * Perform has many ugly hack HTTP/1.1 requires. 
     * @param request The request that is answered by this reply.
     */

    protected void matchesRequest(Request request) {
	String mth = request.getMethod();
	if ( mth.equals("HEAD") || mth.equals("OPTIONS") )
	    setStream(null);
    }

    protected InputStream input        = null;
    protected boolean     definesInput = false;

    /**
     * Set this reply's input stream.
     * @param input The stream to read the reply's entity from.
     */

    public void setStream(InputStream input) {
	this.input        = input;
	this.definesInput = true;
    }

    /**
     * Get this reply entity body.
     * The reply entity body is returned as an InputStream, that the caller
     * has to read to actually get the bytes of the content.
     * @return An InputStream instance. If the reply has no body, the 
     * returned input stream will just return <strong>-1</strong> on
     * first read.
     */

    public InputStream getInputStream()
	throws IOException
    {
	if ( definesInput )
	    return input;
	// Check the status code, there are some special cases floating around
	switch(getStatus()) {
	  case HTTP.NOT_MODIFIED:
	  case HTTP.NO_CONTENT:
	      return null;
	}
	// Find out which method is used to the length:
	int len = getContentLength();
	if ( len >= 0 ) {
	    input = new ContentLengthInputStream(observer
						 , parser.getInputStream()
						 , len);
	    definesInput = true;
	    return input;
	}
	// No content length, try out chunked encoding:
	if ( hasTransferEncoding("chunked") ) {
	    definesInput = true;
	    input = new ChunkedInputStream(observer, parser.getInputStream());
	    return input;
	}
	// Everything has failed, we assume the connection will close:
	if ( observer != null )
	    observer.notifyFailure(parser.getInputStream());
	return parser.getInputStream();
    }

    /**
     * Does this reply has an associated entity stream ?
     * @return A boolean, <strong>true</strong> if the reply has an entity
     * stream, <strong>false</strong> otherwise.
     */

    public boolean hasInputStream() 
	throws IOException
    {
	return getInputStream() != null;
    }

    /**
     * Set this reply content.
     * This method allows to set the reply content to a simple String instance.
     * @param msg The reply content.
     */

    public void setContent (String msg) {
	if ( ! hasHeader(H_CONTENT_TYPE) )
	    setHeaderValue(H_CONTENT_TYPE, DEFAULT_TYPE) ;
	setContentLength (msg.length()) ;
	setStream(new StringBufferInputStream(msg));
    }

    Reply(short major, short minor, int status) {
	this.major = major;
	this.minor = minor;
	this.setStatus(status);
    }

    Reply(MimeParser parser) {
	super(parser);
	this.parser = parser;
    }

}
