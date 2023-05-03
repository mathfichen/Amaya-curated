// HttpServer.java
// $Id: HttpServer.java,v 1.2 1997/03/27 13:57:48 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.www.protocol.http;

import w3c.util.*;

/**
 * The HttpServer interface.
 * This interface is used to control the communication between the HttpManager
 * and the HttpServer on one side, and between the HttpServer and the
 * HttpConnection on the other side.
 * <p>The implementation of the Connection part of the interface is optional
 * and should be provided only if your server instance uses the connection
 * concept.
 */

public abstract class HttpServer {
    protected HttpServerState state = null;

    /**
     * Get this servers' protocol.
     * @return A String encoding the protocol used to dialog with the target
     * server.
     */

    abstract public String getProtocol();

    /**
     * Get the manager's state for that server.
     * @return The manager state.
     */

    protected final HttpServerState getState() {
	return state;
    }
    
    /**
     * Get this server's major version number.
     * @return The server's major number version, or <strong>-1</strong>
     * if still unknown.
     */

    abstract public short getMajorVersion();

    /**
     * Get this server's minor version number.
     * @return The server's minor number version, or <strong>-1</strong>
     * if still unknown.
     */

    abstract public short getMinorVersion();

    /**
     * HTTP manager interface - Handle this request in sync mode.
     * @param request The request this server should run.
     * @return A Reply instance, containing the target server's reply.
     * @exception HttpException If anything failed during request processing.
     */
    
    abstract public Reply runRequest(Request request) 
	throws HttpException;

    /**
     * Interrupt the given request (that was launched by that server).
     * @param request The request to interrupt.
     */

    abstract protected void interruptRequest(Request request);

    /**
     * Initialize this server instance for the given target location.
     * @param manager The central HTTP protocol manager.
     * @param state The manager's state for that server.
     * @param host The target server's FQDN.
     * @param port The target server's port number.
     * @exception HttpException If host coulnd't be resolved.
     */

    abstract public void initialize(HttpManager manager
				    , HttpServerState state
				    , String host
				    , int port) 
	throws HttpException;
    
}
