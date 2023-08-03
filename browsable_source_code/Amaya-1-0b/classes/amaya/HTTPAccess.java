/*
 * HTTPAccess : This class is used to synchronize the Producer/Consumer
 *              model corresponding to the user thread adding requests
 *              and the pool of HTTPThread taking requests and handling
 *		them.
 */
package amaya;

import java.net.*;
import java.io.*;
import java.util.*;

/*
 * Jigsaw specific ...
 */
import w3c.www.protocol.http.*;
import w3c.www.protocol.http.cache.*;
import w3c.www.mime.*;

import amaya.*;
import thotlib.*;

public class HTTPAccess {
    /*
     * Jigsaw HTTP classes specific stuff !!!
     */
    protected static HttpManager manager = null;
    protected static HTTPStatus observer = null; 
    protected static HTTPException exceptionFilter = null; 
    protected static HTTPAuthorization authFilter = null; 
    protected static DebugFilter debugFilter = null; 
    protected static CacheFilter cache = null;

    /*
     * Waiting and running queues.
     */
    private HTTPRequest WaitingQueue = null;
    private int WaitingQueueLenght = 0;
    private HTTPRequest RunningQueue = null;
    private int RunningQueueLenght = 0;
    private int NbWaitingThreads = 0;
    private int counter = 0;
    protected int NbStartedRequest = 0;
    protected int NbStoppedRequest = 0;
    protected int NbSuccessRequest = 0;

    /* per document informtions */
    protected static int RunningRequests[];
    protected static int WaitingRequests[];
    protected static int LastRequestResult[];
    protected static boolean ShowRunning[];

    /*
     * Constructor.
     */
    public HTTPAccess() {
    }

    /*
     * Public functions.
     */
    static public void Initialize(String JavaPropertiesFile) {
        int i;
	String ressource;

        RunningRequests = new int[30];
        WaitingRequests = new int[30];
        LastRequestResult = new int[30];
        ShowRunning = new boolean[30];
	for (i = 0; i < 30;i++) RunningRequests[i] = 0;
	for (i = 0; i < 30;i++) WaitingRequests[i] = 0;
	for (i = 0; i < 30;i++) LastRequestResult[i] = 0;
	for (i = 0; i < 30;i++) ShowRunning[i] = false;

	HTTPRequest.Initialize();
	HTTPThreadPool.Initialize();
	URLConnection.setDefaultAllowUserInteraction(false);

        // API 1.1 // Jigsaw Specific ...
	Properties p = new Properties(System.getProperties());
	if ( JavaPropertiesFile != null ) {
	    // System.out.println("Reading properties from " + JavaPropertiesFile);
	    try {
	        FileInputStream in = 
		  new FileInputStream(new File(JavaPropertiesFile));
		p.load(new BufferedInputStream(in));
		in.close();
		in = null;
	    } catch (Exception ex) {
		System.out.println("unable to load properties from \"" +
		                   JavaPropertiesFile + "\"");
	    }
	}
	ressource = APIRegistry.TtaGetEnvString("CACHE_DIR");
	if (ressource != null) 
	    p.put("w3c.www.protocol.http.cache.directory", ressource);

	ressource = APIRegistry.TtaGetEnvString("CACHE_SIZE");
        if (ressource != null)
	    p.put("w3c.www.protocol.http.cache.size", ressource);

	System.setProperties(p);

	// Starting the HTTP manager
	// System.out.println("Starting HTTP Manager");
	manager = HttpManager.getManager(p);

	// Set up the User-Agent property
	manager.setGlobalHeader("User-Agent", APIJavaAmaya.GetUserAgentName());
	manager.setGlobalHeader("Accept-Encoding", "gzip");

        // Add the Exception Filter
	exceptionFilter = new HTTPException();
	exceptionFilter.initialize(manager);

        // Add the Authorization Filter
	authFilter = new HTTPAuthorization();
	authFilter.initialize(manager);

        // Add the observer Filter
	observer = new HTTPStatus();
	HttpURLConnection.setObserver(observer);

        // Start the Debug filter if needed
	ressource = APIRegistry.TtaGetEnvString("DEBUG_JAVA_NET");
	if ((ressource != null) &&
	    ((ressource.equalsIgnoreCase("true")) ||
	     (ressource.equalsIgnoreCase("yes")))) {
	    debugFilter = new DebugFilter();
	    debugFilter.initialize(manager);
	}

	// Starting the HTTP cache
	ressource = APIRegistry.TtaGetEnvString("NO_CACHE");
	if ((ressource == null) ||
	    ((! ressource.equalsIgnoreCase("true")) &&
	     (! ressource.equalsIgnoreCase("yes")))) {
	    // System.out.println("Starting HTTP Cache");
	    cache = new CacheFilter();
	    try {
		cache.initialize(manager);
	    } catch (Exception ex) {
		System.out.println("unable to initialize cache : " +
				   ex.getMessage());
	    }
	}
    }

    static public void Stop() {
//System.out.println("HTTPAccess.Stop");
	if (cache != null) cache.sync();
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
    public synchronized void EnQueue(HTTPRequest req) {
        HTTPRequest prev;

	// req.Print();

	req.next = null;
        if (WaitingQueue == null) WaitingQueue = req;
	else {
	    prev = WaitingQueue;
	    while (prev.next != null) prev = prev.next;
	    prev.next = req;
	}
	WaitingQueueLenght++;
	WaitingRequests[req.doc]++;

	// this.Print();
	ShowStop(req.doc);

	notify();
    }

    /*
     * DeQueue : public method called by HTTPThreads to get a request
     *           from the Waiting Queue, it's a blocking one.
     *           The request is moved from the WaitingQueue to the
     *           RunningQueue.
     */
    public synchronized HTTPRequest DeQueue() {
        HTTPRequest req;

        while (WaitingQueueLenght <= 0) {
	    NbWaitingThreads++;
	    try {
	        wait();
	    } catch (InterruptedException e) {
	    }
	    NbWaitingThreads--;
	}

	req = WaitingQueue;
	WaitingQueue = req.next;
	WaitingQueueLenght--;
	req.next = RunningQueue;
	RunningQueue = req;
	RunningQueueLenght++;
	NbStartedRequest++;
	WaitingRequests[req.doc]--;
	RunningRequests[req.doc]++;
	if (WaitingQueue == null) {
	    WaitingQueueLenght = 0;
	    WaitingRequests[req.doc] = 0;
	}

	this.Display(req.doc);
	return(req);
    }

    /*
     * Terminate : public method called by HTTPThreads at the end of
     *             the handling of an HTTPRequest.
     */
    public synchronized void Terminate(HTTPRequest req) {
        HTTPRequest prev;

//System.out.println("HTTPAccess.Terminate");

        if (RunningQueue == req) {
	    RunningQueue = req.next;
	    RunningQueueLenght--;
	} else {
	    prev = RunningQueue;
	    while ((prev != null) && (prev.next != req)) prev = prev.next;
	    if (prev == null) {
	        System.out.println(
		    "HTTPAccess.Terminate : req not in RunningQueue");
		req.Print();
		this.Print();
	    } else {
	        prev.next = req.next;
	        RunningQueueLenght--;
	    }
	}
	RunningRequests[req.doc]--;
	NbSuccessRequest++;
	if (RunningQueue == null) {
	    RunningQueueLenght = 0;
	    RunningRequests[req.doc] = 0;
	}
	notify();

	LastRequestResult[req.doc] = req.status;
	this.Display(req.doc);
        if (cache != null && ((NbSuccessRequest % 10) == 0)) cache.sync();
    }

    /*
     * Stop : public method called by the client when one should stop
     *        any Request associate to a document.
     */
    public synchronized void Stop(int doc) {
        HTTPRequest prev, req;
	int dequeued = 0;
	int terminated = 0;

//System.out.println("HTTPAccess.Stop(" + doc + ")");

	RunningRequests[doc] = 0;
	WaitingRequests[doc] = 0;

	/*
	 * Clean up the Waiting Queue.
	 */
        while ((WaitingQueue != null) && (WaitingQueue.doc == doc)) {
	    WaitingQueue.type = HTTPRequest.STOPPED_REQUEST;
	    if (WaitingQueue.callback != 0)
		Extra.Java2CCallback(WaitingQueue, WaitingQueue.callback);
	    dequeued++;
	    WaitingQueue = WaitingQueue.next;
	    WaitingQueueLenght--;
	    NbStoppedRequest++;
	}
	prev = WaitingQueue;
        while (prev != null) {
	    req = prev.next;
	    if ((req != null) && (req.doc == doc)) {
	        req.type = HTTPRequest.STOPPED_REQUEST;
		if (req.callback != 0)
		    Extra.Java2CCallback(req, req.callback);
		dequeued++;
	        prev.next = req.next;
		WaitingQueueLenght--;
	        NbStoppedRequest++;
	    }
	    prev = req;
	}

	/*
	 * Clean up the Running Queue.
	 */
        while ((RunningQueue != null) && (RunningQueue.doc == doc)) {
	    // RunningQueue.Print();
	    RunningQueue.type = HTTPRequest.STOPPED_REQUEST;
	    if (RunningQueue.conn != null)
		RunningQueue.conn.state = HTTPConnection.CONN_KILLED;
	    if (RunningQueue.thread != null)
		HTTPThreadPool.Kill(RunningQueue.thread);
	    if (RunningQueue.callback != 0)
		Extra.Java2CCallback(RunningQueue, RunningQueue.callback);
	    terminated++;
	    RunningQueue = RunningQueue.next;
	    RunningQueueLenght--;
	    NbStoppedRequest++;
	}
	prev = RunningQueue;
        while (prev != null) {
	    req = prev.next;
	    if ((req != null) && (req.doc == doc)) {
	        // req.Print();
	        req.type = HTTPRequest.STOPPED_REQUEST;
		if (req.conn != null)
		    req.conn.state = HTTPConnection.CONN_KILLED;
		if (req.thread != null)
		    HTTPThreadPool.Kill(req.thread);
		if (req.callback != 0)
		    Extra.Java2CCallback(req, req.callback);
		terminated++;
	        prev.next = req.next;
		RunningQueueLenght--;
	        NbStoppedRequest++;
	    }
	    prev = req;
	}
	ShowDone(doc);
	Extra.JavaStopPoll();

//System.out.println("HTTPAccess.Stop(" + doc + ") : " +
//                   dequeued + " dequeued, " + terminated + " terminated");

	notify();
    }

    /*
     * Lookup scans the Running queue list, searching for the
     * HTTPRequest who own the w3.www.protocol.http.Request.
     */
    public synchronized HTTPRequest Lookup(Request req) {
        return(null);
    }

    public synchronized void Print() {
        int i;
        HTTPRequest req;
        System.out.println("HTTPAccess " + NbWaitingThreads + " waiting threads");
        System.out.print("Started : " + NbStartedRequest);
        System.out.print(", Success : " + NbSuccessRequest);
        System.out.println(", Stopped : " + NbStoppedRequest);
	if (WaitingQueueLenght > 0) {
            System.out.println("WaitingQueueLenght : " + WaitingQueueLenght);
	    req = WaitingQueue;
	    i = 1;
	    while (req != null) {
	        System.out.print(i + " : ");
	        req.Print();
	        req = req.next;
	    }
	}
	if (RunningQueueLenght > 0) {
            System.out.println("RunningQueueLenght : " + RunningQueueLenght);
	    req = RunningQueue;
	    i = 1;
	    while (req != null) {
	        System.out.print(i + " : ");
	        req.Print();
	        req = req.next;
	    }
	}
    }

    public void ShowStop(int doc) {
	if (ShowRunning[doc]) return;

        long StopPixmap = APIInterface.TtaGetImage("stopR");
	if ((StopPixmap != 0) && 
	    (APIInterface.TtaGetViewFrame(doc,1) != 0)) {
	    APIInterface.TtaChangeButton(doc, 1, 1, StopPixmap);
	    ShowRunning[doc] = true;
	}
    }

    public void ShowDone(int doc) {
	if (!ShowRunning[doc]) return;

        long DonePixmap = APIInterface.TtaGetImage("stopN");

	if ((DonePixmap != 0) &&
	    (APIInterface.TtaGetViewFrame(doc,1) != 0)) {
	    APIInterface.TtaChangeButton(doc, 1, 1, DonePixmap);
	    ShowRunning[doc] = false;

	}

	if (LastRequestResult[doc] < 300) {
	    thotlib.APIInterface.TtaSetStatus(doc, 1, 
	      APIJavaAmaya.AmayaGetMessage(APIAmayaMsg.AM_DOCUMENT_LOADED), "");
	}

    }

    public void Display() {
        int doc;

        HTTPRequest req;

	for (doc = 1;doc < 30; doc++) {
	     if ((WaitingRequests[doc] == 0) &&
	         (RunningRequests[doc] == 0) &&
		 (ShowRunning[doc])) {
		 ShowDone(doc);
             }
	}
    }

    public void Display(int doc) {
	int waiting;
	int fetching;
	int percent;
	String url;
	String msg = "";

	waiting = WaitingRequests[doc];
	fetching = RunningRequests[doc];
	if (waiting < 0) {
	    WaitingRequests[doc] = 0;
	    waiting = 0;
	}
	if (fetching < 0) {
	    RunningRequests[doc] = 0;
	    fetching = 0;
	}

	/*
	 * Display the stats collected, if any.
	 */
	if ((waiting != 0) || (fetching != 0)) {
	    if ((waiting != 0) && (fetching != 0)) {
		msg = fetching + " " +
		      APIJavaAmaya.AmayaGetMessage(APIAmayaMsg.AM_ACTIVE_TRANSFERS) +
		      ", " + waiting + " " +
		      APIJavaAmaya.AmayaGetMessage(APIAmayaMsg.AM_WAITING_TRANSFERS);
	    } else if (waiting != 0) {
		msg = waiting + " " +
		      APIJavaAmaya.AmayaGetMessage(APIAmayaMsg.AM_WAITING_TRANSFERS);
	    } else if (fetching != 0) {
		msg = fetching + " " +
		      APIJavaAmaya.AmayaGetMessage(APIAmayaMsg.AM_ACTIVE_TRANSFERS);
	    }
	    thotlib.APIInterface.TtaSetStatus(doc, 1, msg, "");
	} else {
	    ShowDone(doc);
	}
	/* For some reasons, we need to flush the display ! */
	Extra.JavaXFlush();
    }
}
