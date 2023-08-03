/*
 * Implementation of the Exception handling, most of the common
 * HTTP errors are handled here :
 *     - name lookup failure
 *     - HTTP server not available
 *     - document not found
 * The current version is completely tied to Jigsaw HTTP implementation,
 * we hope to get more conformant to the HTTP Java API in the future.
 *
 * NOTE that another filter HTTPAuthorization handle the authentification
 *      process.
 */
package amaya;

import java.io.*;

import w3c.www.http.*;
import w3c.www.protocol.http.*;

import amaya.*;

public class HTTPException implements PropRequestFilter {
    /**
     * the HttpManager that installed us.
     */
    protected HttpManager manager = null;

    /**
     * PropRequestFilter implementation - Initialize the filter.
     * Time to register ourself to the HttpManager.
     * @param manager The HTTP manager that is initializing ourself.
     */

    public void initialize(HttpManager manager) {
	this.manager = manager;
	// We install ourself as a global filter, we are cool !
	manager.setFilter(this);
    }

    /**
     * This filter specifically handle exceptions.
     * @param request The request that triggered the exception.
     * @param ex The triggered exception.
     * @return Always <strong>false</strong>.
     */

    public boolean exceptionFilter(Request request, HttpException ex) {
	System.out.println("Got an Exception ...");
	return false;
    }

    /**
     * On the way out, we let the request fly through.
     * @param request The request about to be emitted.
     */

    public Reply ingoingFilter(Request request) {
	return null;
    }

    /**
     * Catch any authentication requirement, and fullfill it with user's help.
     * This method trap all request for authentication, and pops up a
     * dialog prompting for the user's name and password.
     * <p>It then retries the request with the provided authentication
     * informations.
    /**
     * On the way out, we let the request fly through.
     * @param request The request emitted.
     * @param reply The reply.
     * @throw HttpException If some HTTP error occurs.
     */

    public Reply outgoingFilter(Request request, Reply reply) 
	throws HttpException
    {
	return null;
    }

    /**
     * We don't maintain cached informations.
     */

    public void sync() {
    }
}

