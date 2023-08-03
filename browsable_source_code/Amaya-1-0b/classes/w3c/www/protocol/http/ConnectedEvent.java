// ConnectedEvent.java
// $Id: ConnectedEvent.java,v 1.2 1997/03/27 13:57:46 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.www.protocol.http;

import java.io.*;

// FIXME doc

public class ConnectedEvent extends RequestEvent {
    /**
     * The HTTP <code>CONTINUE</code> packet.
     */
    public OutputStream output = null;
    
    public ConnectedEvent(HttpServer s, Request req,  OutputStream output) {
	super(s, req, EVT_CONNECTED);
	this.output = output;
    }
}








