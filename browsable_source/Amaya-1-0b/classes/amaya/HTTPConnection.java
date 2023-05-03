package amaya;

import java.net.*;
import java.io.*;
import java.util.*;

import w3c.www.protocol.http.*;
import w3c.www.mime.*;

/*
 * Front en to the Java 1.1 API for Network accesses
 */

public class HTTPConnection {
    public static final int CONN_NONE = 0;
    public static final int CONN_STARTED = 1;
    public static final int CONN_NEGOCIATED = 2;
    public static final int CONN_CONNECTED = 3;
    public static final int CONN_STOPPED = 4;
    public static final int CONN_FINISHED = 5;
    public static final int CONN_CLOSED = 6;
    public static final int CONN_KILLED = 7;

    public int state;
    protected HTTPRequest req;
    protected URL url;
    protected InputStream in;
    protected OutputStream out;
    private URLConnection conn;
    private HttpURLConnection http_conn;
    private Thread thread;
    

    /*
     * constructor.
     */
    public HTTPConnection() {
	state = CONN_NONE;
        req = null;
	url = null;
	in = null;
	out = null;
	conn = null;
	http_conn = null;
    }

    /*
     * Public methods.
     */

    /*
     * StartRequest : Create a new connection associated to a request,
     *       it can fail if the URL sting is invalid of if the local host
     *       cannot connect to the server.
     */

    public static HTTPConnection StartRequest (HTTPRequest request)
    //    throws java.io.IOException
    {
        if (request.conn != null) {
	    System.out.println("StartRequest : Request already connected");
	    return(request.conn);
	}

//System.out.println("Starting Request");

	HTTPConnection cur = new HTTPConnection();
	request.conn = cur;
	cur.req = request;
	cur.state = CONN_NONE;
	cur.thread = Thread.currentThread();

	try {
	    cur.url = new URL(request.urlName);
	} catch (MalformedURLException ex) {
	    int code = APIAmayaMsg.AM_INVALID_TARGET;
	    thotlib.APIInterface.TtaSetStatus(request.doc, 1,
		    APIJavaAmaya.AmayaGetMessage(code) + " \"" +
		    request.urlName + "\" : " + ex.getMessage(), "");
            request.Terminate();
            return(null);
	}

//System.out.println("Got URL");

        switch (request.type) {
	    case HTTPRequest.STOPPED_REQUEST:
	        cur.state = CONN_KILLED;
		return(null);
	    case HTTPRequest.GET_REQUEST:
	    case HTTPRequest.PUT_REQUEST:
	    case HTTPRequest.POST_REQUEST:
		thotlib.APIInterface.TtaSetStatus(request.doc, 1,
			APIJavaAmaya.AmayaGetMessage(
			       APIAmayaMsg.AM_CONTACTING_HOST),
			cur.url.getHost());
		break;
	}

	try {
	    cur.conn = cur.url.openConnection();
	} catch (Exception ex) {
	    int code = APIAmayaMsg.AM_CANNOT_LOAD;
	    thotlib.APIInterface.TtaSetStatus(request.doc, 1,
		    APIJavaAmaya.AmayaGetMessage(code) + " \"" +
		    request.urlName + "\" : " + ex.getMessage(), "");
            request.Terminate();
            return(null);
	}

//System.out.println("Got Url");

	/*
	 * Check that the connection is Ok.
	 */
	if (cur.conn == null) {
	    request.Terminate();
	    return(null);
	}
        if (request.type == HTTPRequest.STOPPED_REQUEST) {
	    cur.state = CONN_KILLED;
	    request.Terminate();
	    return(null);
	}
	cur.state = CONN_STARTED;
	
	/*
	 * Jigsaw specific !
	 */
	if (((request.flags & HTTPRequest.NO_CACHE) != 0) &&
	    (HTTPAccess.cache != null))
	    HTTPAccess.cache.removeResource(request.urlName);

	try {
	    cur.http_conn = (HttpURLConnection) cur.conn;
	} catch (Exception ex) {
	    System.out.println("HTTPConnection to " + request.urlName + " : " +
	                       ex.getMessage());
	    request.Terminate();
            return(null);
	}
	// HttpURLConnection.setFollowRedirects(true); // API 1.1

//System.out.println("Got HTTP Url");

        if (request.type == HTTPRequest.STOPPED_REQUEST) {
	    cur.state = CONN_KILLED;
	    request.Terminate();
	    return(null);
	}

	return(cur);
    }

    /*
     * Negociate : start up the connection stuff for real, this imply
     *      sending the request, and negociate with the server.
     */

    public void Negociate ()
    {
        byte  b[];

//System.out.println("Negociate called");

        /*
	 * 1/ Check for validity.
	 */
	if ((req == null) || (state != CONN_STARTED)) {

//System.out.println("Invalid connection");

	    return;
	}

	/*
	 * 2/ Set up extra stuff for the Request.
	 */

//System.out.println("Setting up the request");

        switch (req.type) {
	    case HTTPRequest.STOPPED_REQUEST:
	        state = CONN_KILLED;
	        return;
	    case HTTPRequest.AGET_REQUEST:
	    case HTTPRequest.GET_REQUEST:
	        http_conn.setRequestMethod("GET");
		if ((req.flags & HTTPRequest.NO_CACHE) != 0)
		    http_conn.setUseCaches(false);
		break;
	    case HTTPRequest.PUT_REQUEST:
	        http_conn.setRequestMethod("PUT");
		if (req.mimeType != null)
		    http_conn.setContentType(req.mimeType);
		http_conn.setUseCaches(false);
		http_conn.setDoOutput(true);
	        if (in == null) {
		    try {
			in = new FileInputStream(req.filename);
		    } catch (IOException ex) {
			System.out.println("Cannot open file " +
				   req.filename + " : " + ex.getMessage());

//System.out.println("Failed opening input file");

			state = CONN_CLOSED;
			return;
		    }
		}
	        if (out == null) {
		    try {
			out = http_conn.getOutputStream();
		    } catch (IOException ex) {
			System.out.println("HTTPConnection to " +
				   req.urlName + " : " + ex.getMessage());
			state = CONN_CLOSED;

//System.out.println("Failed opening output stream");

	                if ( in != null ) { try { in.close(); }
			                    catch (Exception e) {}}
	                if ( out != null ) { try { out.close(); }
			                     catch (Exception e) {}}
			return;
		    }
		}
		/*
		 * Read from the input file and write the data to the
		 * output BEFORE CONNECTING (Jigsaw specific) !!!.
		 */
		int   lenght = 0;
		int   n;
		b = new byte[2000];

		do {
		    try {
			n = in.read(b, 0, 2000);
			if (n > 0) out.write(b, 0, n);
		    } catch (IOException ex) {
			System.out.println("Transfer from " +
				   req.urlName + " to " + req.filename +
				   " interrupted : " + ex.getMessage());
			state = CONN_CLOSED;
			return;
		    }
		    lenght += n;
		} while (n > 0);

//System.out.println("PUT : buffered " + lenght + " bytes");

		break;
	    case HTTPRequest.POST_REQUEST:
	        http_conn.setRequestMethod("POST");
		http_conn.setUseCaches(false);
		http_conn.setDoOutput(true);
		http_conn.setDoInput(true);
		try {
		    out = http_conn.getOutputStream();
		} catch (IOException ex) {
		    System.out.println("HTTPConnection to " +
			       req.urlName + " : " + ex.getMessage());
		    state = CONN_CLOSED;

//System.out.println("Failed opening output stream");

		    return;
		}
		if (req.postCmd != null) {
		    try {
			int len = req.postCmd.length();
			b = new byte[len];
			req.postCmd.getBytes(0, len, b, 0);
			out.write(b, 0, len);
		    } catch (IOException ex) {
			System.out.println("HTTPConnection to " +
				   req.urlName + " : " + ex.getMessage());
			state = CONN_CLOSED;

//System.out.println("Failed writing POST command");

	                if ( out != null ) { try { out.close(); }
			                     catch (Exception e) {}}
			return;
		    }
		}
		try {
		    out.close();
		} catch (Exception e) {

//System.out.println("Got Exception when closing POST command");

		}
		break;
	}

	/*
	 * 3/ Attempt to connect.
	 */

//System.out.println("Connecting");

	try {
	    http_conn.connect();
	} catch (Exception ex) {
	    thotlib.APIInterface.TtaSetStatus(req.doc, 1,
		APIJavaAmaya.AmayaGetMessage(APIAmayaMsg.AM_CANNOT_LOAD),
		req.urlName);
	    state = CONN_NONE;

//System.out.println("Connection failed : " + ex.getMessage());

	    req.status = HTTPRequest.FAILED_REQUEST;
	    return;
	} 
	
	/*
	 * 4/ Reading the Reply
	 */

//System.out.println("Reading the reply");

        switch (req.type) {
	    case HTTPRequest.STOPPED_REQUEST:

//System.out.println("Request stopped");

	        state = CONN_KILLED;
	        return;
	    case HTTPRequest.GET_REQUEST:
	    case HTTPRequest.AGET_REQUEST:
		try {
		    req.contentLenght = http_conn.getContentLength();
		    req.mimeType = http_conn.getContentType();
		    req.urlName = http_conn.getURL().toExternalForm();
		} catch (Exception ex) {
		    thotlib.APIInterface.TtaSetStatus(req.doc, 1,
			APIJavaAmaya.AmayaGetMessage(APIAmayaMsg.AM_CANNOT_LOAD),
		        req.urlName + " : " + ex.getMessage());
		    state = CONN_NONE;
		    req.status = HTTPRequest.FAILED_REQUEST;
		    return;
		} 
		break;
	}

	state = CONN_NEGOCIATED;

	switch (req.type) {
	    case HTTPRequest.STOPPED_REQUEST:
	        state = CONN_KILLED;
	        return;
	    case HTTPRequest.GET_REQUEST:
	    case HTTPRequest.AGET_REQUEST:
	        if (out == null) {
		    try {
			out = new FileOutputStream(req.filename);
		    } catch (IOException ex) {
			System.out.println("Cannot open file " +
				   req.filename + " : " + ex.getMessage());

//System.out.println("Failed opening output file");

			state = CONN_CLOSED;
			return;
		    }
		}
	        if (in == null) {
		    try {
			in = conn.getInputStream();
		    } catch (IOException ex) {
			System.out.println("HTTPConnection to " +
				   req.urlName + " : " + ex.getMessage());
			state = CONN_CLOSED;

//System.out.println("Failed opening input stream");

	                if ( in != null ) { try { in.close(); }
			                    catch (Exception e) {}}
	                if ( out != null ) { try { out.close(); }
			                     catch (Exception e) {}}
			return;
		    }
		}
	        state = CONN_CONNECTED;
	        return;
	    case HTTPRequest.PUT_REQUEST:
	        state = CONN_CONNECTED;
	        return;
	    case HTTPRequest.POST_REQUEST:
		try {
		    out = new FileOutputStream(req.filename);
		} catch (IOException ex) {
		    System.out.println("Cannot open file " +
			       req.filename + " : " + ex.getMessage());

//System.out.println("Failed opening output file");

		    state = CONN_CLOSED;
		    return;
		}
		try {
		    in = conn.getInputStream();
		} catch (IOException ex) {
		    System.out.println("HTTPConnection to " +
			       req.urlName + " : " + ex.getMessage());
		    state = CONN_CLOSED;

//System.out.println("Failed opening input stream");

		    if ( in != null ) { try { in.close(); }
					catch (Exception e) {}}
		    if ( out != null ) { try { out.close(); }
					 catch (Exception e) {}}
		    return;
		}
	        state = CONN_CONNECTED;
	        return;
	}
    }

    /*
     * DoTransfer : do a protocol transfer.
     */
    public int DoTransfer (int length)
    {
        int n;

	if ((req == null) || (state != CONN_CONNECTED) ||
	    (in == null) || (out == null)) return(0);

        byte  b[] = new byte[length];

	/*
	 * Read from the input Stream up to length bytes and write
	 * the data to the output.
	 */
	try {
	    n = in.read(b, 0, length);
	    if (n > 0) out.write(b, 0, n);
	} catch (IOException ex) {
	    System.out.println("Transfer from " +
		       req.urlName + " to " + req.filename +
		       " interrupted : " + ex.getMessage());
	    state = CONN_CLOSED;
	    return(-1);
	}

	if (n <= 0) {
	    state = CONN_FINISHED;
	    if ( in != null ) { try { in.close(); } catch (Exception e) {}}
	    in = null;
	    if ( out != null ) { try { out.close(); } catch (Exception e) {}}
	    out = null;
	    return(n);
	}

//System.out.println("Transfered " + n + " bytes");

        req.currentLenght += n;
	if ((req.type == HTTPRequest.GET_REQUEST) ||
	    (req.type == HTTPRequest.PUT_REQUEST)) {
	    String msg = "";

	    /*
	     * Display the progress on the status bar.
	     */
	    if (req.contentLenght > 0)
		msg = req.urlName + " " +
		      ((req.currentLenght * 100) / req.contentLenght) +
		      " %";
            else
	        msg = req.urlName + " " + req.currentLenght;

	    thotlib.APIInterface.TtaSetStatus(req.doc, 1,
		  APIJavaAmaya.AmayaGetMessage(APIAmayaMsg.AM_PROG_READ), msg);
        }

	return(n);
    }

    /*
     * Stop : stop a transfer. Should interrupt the Thread in charge
     *        of a transfer if needed.
     */
    public void Stop ()
    {

//System.out.println("Stop connection");

	req.status = HTTPRequest.STOPPED_REQUEST;
	if (http_conn != null)
	    http_conn.disconnect();
	state = CONN_KILLED;
    }

    /*
     * Close : clean up an ended transfer. This mean ensuring that
     *         the I/O channels are correcly closed. It also return
     *         the final HTTP status code.
     */
    public int Close ()
    {
        int status = 200;
//System.out.println("Close");

	if (state == HTTPRequest.STOPPED_REQUEST) {
	    thotlib.APIInterface.TtaSetStatus(req.doc, 1, 
	    APIJavaAmaya.AmayaGetMessage(APIAmayaMsg.AM_LOAD_ABORT), "");
	}

	if (state == CONN_FINISHED) {
	    try {
		status = http_conn.getResponseCode();
	    } catch (IOException ex) {
	    }
	    http_conn.disconnect();
	}

	if ( in != null ) { try { in.close(); } catch (Exception e) {}}
	in = null;
	if ( out != null ) { try { out.close(); } catch (Exception e) {}}
	out = null;
	
	state = CONN_NONE;
	return(status);
    }
}

