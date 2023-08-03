/*
 * HTTPRequest : This class is the front-end of the Java HTTP stack
 *              called by the Amaya program when remote accesses are
 *              needed.
 */
package amaya;

import amaya.*;
import thotlib.Extra;

public class HTTPRequest {
    static protected HTTPAccess HTTPAccessObject = null;

    public static final int STOPPED_REQUEST = 0;
    public static final int GET_REQUEST = 1;
    public static final int PUT_REQUEST = 2;
    public static final int POST_REQUEST = 3;
    public static final int AGET_REQUEST = 4;
    public static final int FAILED_REQUEST = 400;
    
    protected static final int NO_CACHE = 64;
    protected static final int NO_REDIR = 128;

    /*
     * Note : this class instanciation is called from C, as well
     *	      as most of these fields initialization.
     */
    long callback;    // Needed in case of Asynchronous operation, C only!
    long callback_f;  // Needed in case of Asynchronous operation, C only!
    long callback_arg;// Needed in case of Asynchronous operation, C only!

    public HTTPRequest next;
    int type;         // type of transfert asked
    int doc;          // Document number
    String urlName;   // The URL, this is in/out in case of redirrections
    String mimeType;  // The Mime type, provided for Put returned for Get
    String postCmd;   // The Post string command if any.
    int contentLenght;// The document lenght, provided for Put returned for Get
    int currentLenght;// intermediate info...
    int status;       // the result of the operation.
    String filename;  // Content, provided for Put returned for Get.
    int flags;        // No cache, no redir ...
    Thread thread;    // Who's handling this request.

    HTTPConnection conn; // API 1.1 only !!!
       
    /*
     * Class Wide initialization.
     */
    static public void Initialize() {
        if (HTTPAccessObject == null) HTTPAccessObject = new HTTPAccess();
    }


    /************************************************************
     *								*
     *			Queuing methods.			*
     *								*
     ************************************************************/

    /*
     * EnQueue : private method to add a request to the Waiting
     *           Queue.
     */
    private void EnQueue() {
	HTTPAccessObject.EnQueue(this);
    }

    /*
     * DeQueue : public method called by HTTPThreads to get a request
     *           from the Waiting Queue, it's a blocking one.
     */
    public static HTTPRequest DeQueue() {
	return(HTTPAccessObject.DeQueue());
    }

    public void Terminate() {
	HTTPAccessObject.Terminate(this);
    }

    public static void Stop(int doc) {
//System.out.print("Stop(" + doc + ")");
	HTTPAccessObject.Stop(doc);
    }

    /*
     * Function called from C.
     */
    public int Get(int flags) {
        this.type = GET_REQUEST;
	this.flags = flags;

	HTTPAccessObject.EnQueue(this);
	while ((this.status <= 0) && (this.type != STOPPED_REQUEST)) {
	    Extra.JavaPollLoop();
	}

	if (this.type == HTTPRequest.STOPPED_REQUEST) 
	    thotlib.APIInterface.TtaSetStatus(this.doc, 1, 
	    APIJavaAmaya.AmayaGetMessage(APIAmayaMsg.AM_LOAD_ABORT), "");
	if (this.type == STOPPED_REQUEST) return(-1);

	// this.Terminate();
	return(this.status);
    }
    public int AsyncGet(int flags) {
        this.type = AGET_REQUEST;
	this.flags = flags;
	
	HTTPAccessObject.EnQueue(this);
	if (this.type == HTTPRequest.STOPPED_REQUEST) 
	    thotlib.APIInterface.TtaSetStatus(this.doc, 1, 
	    APIJavaAmaya.AmayaGetMessage(APIAmayaMsg.AM_LOAD_ABORT), "");
	if (this.type == STOPPED_REQUEST) return(-1);
	return(0);
    }
    public int Put(int flags) {
        this.type = PUT_REQUEST;
	this.flags = flags;

//System.out.println("HTTPRequest.Put : " + this.filename);

	HTTPAccessObject.EnQueue(this);
	while ((this.status <= 0) && (this.type != STOPPED_REQUEST)) {
	    Extra.JavaPollLoop();
	}
	if (this.type == HTTPRequest.STOPPED_REQUEST) 
	    thotlib.APIInterface.TtaSetStatus(this.doc, 1, 
	    APIJavaAmaya.AmayaGetMessage(APIAmayaMsg.AM_LOAD_ABORT), "");

//System.out.println("HTTPRequest.Put done : " + this.status);

	if (this.type == STOPPED_REQUEST) return(-1);
	return(0);
    }
    public int Post(int flags) {
        this.type = POST_REQUEST;
	this.flags = flags;

	HTTPAccessObject.EnQueue(this);
	while ((this.status <= 0) && (this.type != STOPPED_REQUEST)) {
	    Extra.JavaPollLoop();
	}

	if (this.type == HTTPRequest.STOPPED_REQUEST) 
	    thotlib.APIInterface.TtaSetStatus(this.doc, 1, 
	    APIJavaAmaya.AmayaGetMessage(APIAmayaMsg.AM_LOAD_ABORT), "");
	if (this.type == STOPPED_REQUEST) return(-1);

	// this.Terminate();
	return(this.status);
    }

    public void Print() {
        System.out.print("Doc " + this.doc + "  :");
	if (this.flags != 0)
	    System.out.print("flags " + this.flags + " : ");
        switch(this.type) {
	    case GET_REQUEST:System.out.print("GET "); break;
	    case PUT_REQUEST:System.out.print("PUT "); break;
	    case POST_REQUEST:System.out.print("POST "); break;
	    case AGET_REQUEST:System.out.print("AGET "); break;
	    case STOPPED_REQUEST:System.out.print("STOPPED "); break;
	    default : 
	       System.out.print("Unknown HTTP Method " + this.type + " ");
	       break;
	}
        System.out.println(this.urlName);
	if (this.mimeType != null)
	   System.out.print("Type : " + this.mimeType + " , ");
	System.out.println("lenght : " + this.contentLenght + " bytes");
        System.out.print("Status : " + this.status);
	if (this.filename != null) {
	    System.out.println(", file " + this.filename);
	} else {
	    System.out.println(", no content available");
	}
    }
}
