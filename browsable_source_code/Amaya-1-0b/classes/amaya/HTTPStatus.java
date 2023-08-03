/*
 * Implementation of the status watching and reporting of each connection.
 * The current version is completely tied to Jigsaw HTTP implementation,
 * we hope to get more conformant to the HTTP Java API in the future.
 */
package amaya;

import java.io.*;

import w3c.www.http.*;
import w3c.www.protocol.http.*;

import amaya.*;

public class HTTPStatus implements RequestObserver {

    /**
     * Call back, invoked by the HttpManager callback thread.
     * Each time a request status changes (due to progress in its processing)
     * this callback gets called, with the new status as an argument.
     * @param preq The pending request that has made some progress.
     * @param event The event to broadcast.
     */

    public void notifyProgress(RequestEvent event) {
//        if (event.code == RequestEvent.EVT_QUEUED)
//	        System.out.println("Request Queued");
//	else if (event.code == RequestEvent.EVT_CONNECTED)
//	        System.out.println("Request Connected");
//	else if (event.code == RequestEvent.EVT_EMITED)
//	        System.out.println("Request Sent");
//	else if (event.code == RequestEvent.EVT_REPLIED)
//	        System.out.println("Reply Received");
//	else if (event.code == RequestEvent.EVT_CLOSED)
//	        System.out.println("Request Closed");
//	else if (event.code == RequestEvent.EVT_CONTINUE)
//	        System.out.println("Request Continue");
//	else if (event.code == RequestEvent.EVT_UNREACHABLE)
//	        System.out.println("Request Unreachable");
    }

}

