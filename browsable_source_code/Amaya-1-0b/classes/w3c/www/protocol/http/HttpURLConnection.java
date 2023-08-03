// HttpURLConnection.java
// $Id: HttpURLConnection.java,v 1.7 1997/04/03 02:37:49 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.www.protocol.http ;

import java.net.* ;
import java.io.* ;

import w3c.www.mime.*;

public class HttpURLConnection extends URLConnection
{
    protected Request               request = null;
    protected Reply                 reply   = null;
    protected ByteArrayOutputStream output  = null;
    protected String                method  = "GET";
    protected boolean               cache   = true;
    protected static boolean        redirect= true;
    protected static RequestObserver observer= null;

    protected final synchronized void checkRequest() {
	if ( request == null ) {
	    request = HttpManager.getManager().createRequest();
	    request.setMethod(method);
	    if ( ifModifiedSince > 0 )
		request.setIfModifiedSince(ifModifiedSince*1000);
	    // if ( ! useCaches ) {
	    if ( ! cache ) {
		request.addPragma("no-cache");
		// request.setNoCache();
		// cache = false;
	    }
	    request.setURL(url);
	}
	if (observer != null)
	    request.setObserver(observer);
    }

    protected final void checkReply() {
	if ((reply == null) && connected) {
	    error("Was connected but didn't get any reply !");
	} else if ( ! connected ) {
	    try {
		connect();
	    } catch (IOException ex) {
		// ex.printStackTrace();
		// error("Error while silently connecting.");
	    }
	}
    }
    
    protected void error(String msg) {
	debug("ERROR \""+msg+"\"");
	throw new RuntimeException(msg);
    }

    protected void debug(String m) {
	//	System.out.println("[http]: "
	//		   + ((request != null)
	//		      ? ":"+request.getURL().toExternalForm()+"]: "
	//		      : "]: ")
	//		   + m);
    }

    public boolean usingProxy() {
	// return HttpManager.getManager().usingProxy();
	return false;
    }

    public synchronized void disconnect()
    {
	// if ( request != null )
	//     request.interruptRequest();
	// System.out.print("disconnect : ");
	// if (request != null) {
	//     if (output != null) {
	// 	System.out.print("disconnect : close");
	// 	try {
	// 	    output.close();
	// 	} catch (IOException ex) {
	// 	}
	//     } else {
	// 	// System.out.print("disconnect : output == null");
	//     }
	// } else {
	//     // System.out.print("disconnect : request == null");
	// }
    }

    public void connect() 
	throws IOException
    {
	// Check if we have already connected ourself:
	debug("connect");
	if ( connected )
	    return;
	// Check for a valid request, and update stream if needed:
	checkRequest();
	if ( doOutput ) {
	    byte                 data[] = output.toByteArray();
	    ByteArrayInputStream in     = new ByteArrayInputStream(data);
	    request.setOutputStream(in);
	    if ( ! request.hasHeader(Request.H_CONTENT_LENGTH) )
		request.setContentLength(data.length);
	    if ( ! request.hasHeader(Request.H_CONTENT_TYPE) ) {
		MimeType t = (request.getMethod().equals("POST")
			      ? MimeType.APPLICATION_X_WWW_FORM_URLENCODED
			      : MimeType.TEXT_PLAIN);
		request.setContentType(t);
	    }
	}
	try {
	    // Run the reply, handling redirection:
	    int redirects = 0;
	  redir:
	    while ( redirects < 5 ) {
		if ( redirects == 1 ) {
		    // Reinit the request, cope with URLConnnection brokeness
		    request.setOutputStream(null);
		    request.setContentLength(-1);
		    request.setMethod("GET");
		}
		reply = request.getManager().runRequest(request);
		// Take care of redirects:
		if ((reply.getStatus() / 100) == 3) {
		    if ( ! reply.hasHeader("location") )
			break redir;
		    reply.getInputStream().close();
		    URL orig = request.getURL();
		    try {
			url = new URL(orig, reply.getLocation());
			request.setURL(url);
		    } catch (MalformedURLException ex) {
			break redir;
		    }
		} else {
		    break redir;
		}
		// if ( ! getFollowRedirects() )
		if ( ! redirect)
		    break redir;
		redirects++;
	    }
	} catch (HttpException ex) {
	    // ex.printStackTrace();
	    throw new IOException(ex.getMessage());
	}
	connected = true;
    }

    public int getContentLength() {
	debug("getContentLength");
	checkReply();
	return reply.getContentLength();
    }

    public String getContentType() {
	debug("getContentType");
	checkReply();
	return reply.getContentType().toString();
    }

    public void setContentType(String spec) {
	debug("setContentType : " + spec);
	checkRequest();
	try {
	    MimeType type= new MimeType(spec);
	    request.setContentType(type);
	} catch(MimeTypeFormatException ex) {
	    // FIXME what should I do?
	}
    }

    public long getExpiration() {
	debug("getExpiration");
	checkReply();
	return reply.getExpires();
    }

    public long getDate() {
	debug("getDate");
	checkReply();
	return reply.getDate();
    }

    public long getLastModified() {
	debug("getLastModified");
	checkReply();
	return reply.getLastModified();
    }

    public String getHeaderField(String name) {
	debug("getHeaderField");
	checkReply();
	return reply.getValue(name);
    }

    public String getHeaderFieldKey(int n) {
	error("getHeaderFieldKey(int n): not supported !");
	return null; // not reached
    }

    public String getHeaderField(int n) {
	error("getHeaderField(int n): not supported !");
	return null; // not reached
    }

    public InputStream getInputStream() 
	throws IOException
    {
	debug("getInputStream");
	checkReply();
	return reply.getInputStream();
    }

    public OutputStream getOutputStream() 
	throws IOException
    {
	debug("getOutputStream");
	// We can still catch some of the deficiencies here:
	if ((! connected) && (! doOutput)) {
	    setDoOutput(true);
	} else if ( connected ) {
	    error("Already connected, too late for getOutputStream.");
	}
	// Now return a fake output stream:
	// I am really ashame of this (having to buffer the data before 
	// emiting it), but I cannot see any better way of using this
	// broken API (?)
	output = new ByteArrayOutputStream();
	return output;
    }

    public void setRequestProperty(String key, String value) {
	checkRequest();
	request.setValue(key, value);
    }

    public String getRequestProperty(String key) {
	checkRequest();
	return request.getValue(key);
    }
	
    public static void setGlobalRequestProperty(String key, String value) {
	HttpManager.getManager().setGlobalHeader(key, value);
    }
    
    public static String getDefaultRequestProperty(String key) {
	return HttpManager.getManager().getGlobalHeader(key);
    }

    public void setDoOutput(boolean doinput) {
	debug("DoOutput !!");
	super.setDoOutput(doinput);
	checkRequest();
	// request.setContentType(MimeType.APPLICATION_X_WWW_FORM_URLENCODED);
    }

    HttpURLConnection(URL u) {
	super(u) ;
    }
    
    public static RequestObserver getObserver() {
	return(observer);
    }
    public static void setObserver(RequestObserver obs) {
	observer = obs;
    }
    public boolean getUseCaches() {
	return(this.cache);
    }
    public void setUseCaches(boolean docache) {
	debug("setUseCaches : " + docache);
        // super.setUseCaches(docache);
	this.cache = docache;
    }
    public static boolean getFollowRedirects() {
	return(redirect);
    }
    public static void setFollowRedirects(boolean redir) {
	redirect = redir;
    }

    public String getRequestMethod() {
	return(this.method);
    }
    public void setRequestMethod(String method) {
	debug("setRequestMethod : " + method);
	// System.out.println("setRequestMethod : " + method);
	this.method = method;
    }

    public int getResponseCode()
	throws IOException
    {
	// debug("setRequestMethod : " + method);
	checkReply();
	return reply.getStatus();
    }

}
