// MuxProtocolHandler.java
// $Id: MuxProtocolHandler.java,v 1.1 1997/03/06 18:08:59 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.www.mux;

import java.io.IOException;

/**
 * A proposed base class for protocol handlers.
 * This base class is to be used in conjunction with the default 
 * Mux stream handler. You are free to redefine another stream handler
 * and use your own protocol handler interface.
 * @see SampleMuxHandler
 */

public interface MuxProtocolHandler {

    /**
     * Start speaking the protocol you handle on that session.
     * Feel free to start a thread, or whatever is needed.
     * @param session The session devoted to speak your protocol.
     */

    abstract public void initialize(MuxSession session) 
	throws IOException;

}


