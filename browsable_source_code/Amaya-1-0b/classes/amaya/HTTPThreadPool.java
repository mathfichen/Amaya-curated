package amaya;
import java.awt.*;
import java.io.*;
import thotlib.*;

public class HTTPThreadPool {
   static protected ThreadGroup threadgroup;
   static protected int NbThreads = 0;
   static protected HTTPThread[] Threads;

   /*
    * Initialize : create a Thread group and allocate a few
    *      server threads within it.
    */
   static public void Initialize() {
       // System.out.println("HTTPThreadPool.Initialize()");

       threadgroup = new ThreadGroup("HTTP Threads");
       NbThreads = 5;
       Threads = new HTTPThread[NbThreads];
       for (int i = 0;i < NbThreads;i++)
           Threads[i] = new HTTPThread(i);
   }

   /*
    * Kill : kill one of the treads and restart a new one
    */
   static public void Kill(int i) {
       // System.out.println("HTTPThreadPool.Kill(" + i + ")");

       if ((i >= 0) && (i < NbThreads)) {
           Threads[i].stop();
	   Threads[i] = new HTTPThread(i);
       }
   }

   static public void Kill(Thread thread) {
       // System.out.println("HTTPThreadPool.Kill(" + thread.getName() + ")");

       for (int i = 0;i < NbThreads;i++)
           if (Threads[i] == thread) {
	       Threads[i].stop();
	       Threads[i] = new HTTPThread(i);
	       return;
	   }
       System.out.println("HTTPThreadPool.Kill : not found");
   }

   /*
    * Stop : kill all the server threads.
    */
   static public void Stop() {
       // System.out.println("HTTPThreadPool.Stop()");

       for (int i = 0;i < NbThreads;i++)
           Threads[i].stop();
   }
}

class HTTPThread extends Thread {
    int no;
    HTTPRequest req;

    static public void Initialize() {
    }

    protected HTTPThread(int no) {
	super(HTTPThreadPool.threadgroup, "HTTPThread-" + no);
	this.no = no;
	this.req = null;

	// this.setPriority(this.getPriority() - 2);
	this.setPriority(this.getPriority() + 2);
	this.start();
    }

    /*
     * An HTTP Thread basically loops, fetching a request
     *    running it, and then terminate it.
     */
    public void run() { 
	HTTPConnection conn;
	int result;

        while (true) {

	    // 1/ get a new Request.
	    req = HTTPRequest.HTTPAccessObject.DeQueue();
	    req.thread = currentThread();

//System.out.println(no + " : Got request");

	    // 2/ Create the associated connection.
	    conn = HTTPConnection.StartRequest(req);
	    if (conn == null) {

//System.out.println(no + " : No Connection");

		req.type = HTTPRequest.STOPPED_REQUEST;
		continue;
	    }

//System.out.println(no + " : Connected");

	    // 3/ Do the negociation stuff.
	    conn.Negociate();
	    if (req.type == HTTPRequest.STOPPED_REQUEST) {
		thotlib.APIInterface.TtaSetStatus(req.doc, 1, 
		APIJavaAmaya.AmayaGetMessage(APIAmayaMsg.AM_LOAD_ABORT), "");

//System.out.println(no + " : Stopped");

		continue;
	    }

//System.out.println(no + " : Reply received");

	    // 4/ Do the transfer.
	    while ((conn.state == HTTPConnection.CONN_CONNECTED) &&
		   (req.type != HTTPRequest.STOPPED_REQUEST)) {
		int byte_transfered;
		byte_transfered = conn.DoTransfer(2048);
	    }
	    if (req.type == HTTPRequest.STOPPED_REQUEST) {
		thotlib.APIInterface.TtaSetStatus(req.doc, 1, 
		APIJavaAmaya.AmayaGetMessage(APIAmayaMsg.AM_LOAD_ABORT), "");
	    }

//System.out.println(no + " : Transfer finished");

	    // 5/ Terminate the connection
	    result = conn.Close();
	    req.status = result;

//System.out.println(no + " : Result : " + result);

            // 5.5 : special case, if there is an authentification asked
	    //       during a PUT or a POST.
	    //if ((req.status == HTTP.UNAUTHORISED) &&
	    //    ((req.type == HTTPRequest.PUT_REQUEST) ||
	    //     (req.type == HTTPRequest.POST_REQUEST))) {
	    //   /*
	    //    * One need to retry the request with the appropriate
	    //    * Authentification scheme.
	    //    */
	    //}

	    // 6/ Give back control to the requesting layer if needed.
	    if ((req.callback != 0) &&
		(req.type != HTTPRequest.STOPPED_REQUEST)) {

//System.out.println(no + " : Callback : " + req.callback);

		Extra.Java2CCallback(req, req.callback);
	    }

	    // 7/ Terminate the request
	    req.Terminate();

//System.out.println(no + " : Request terminated");

         }
     }
}

