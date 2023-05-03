// HttpServerState.java
// $Id: HttpServerState.java,v 1.1 1997/03/27 14:00:50 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.www.protocol.http ;

import java.util.*;

import w3c.www.mime.*;
import w3c.util.*;

class HttpServerState {
    HttpServer server = null;
    Vector     conns  = null;

    final HttpServer getServer() {
	return server;
    }

    synchronized boolean notEnoughConnections() {
	return (conns == null) || (conns.size() == 1);
    }

    void registerConnection(HttpConnection conn) {
	if ( conns == null )
	    conns = new Vector(4);
	conns.addElement(conn);
    }

    void unregisterConnection(HttpConnection conn) {
	if ( conns != null )
	    conns.removeElement(conn);
    }

    void deleteConnection(HttpConnection conn) {
	if ( conns != null ) 
	    conns.removeElement(conn);
    }

    synchronized boolean hasConnection() {
	return (conns != null) && (conns.size() > 0);
    }

    synchronized HttpConnection getConnection() {
	if ((conns != null) && (conns.size() > 0)) {
	    HttpConnection conn = (HttpConnection) conns.elementAt(0);
	    conns.removeElementAt(0);
	    return conn;
	}
	return null;
    }

    HttpServerState(HttpServer server) {
	this.server = server;
    }
}

