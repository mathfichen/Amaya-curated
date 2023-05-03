// HttpConnection.java
// $Id: HttpConnection.java,v 1.2 1997/03/27 13:57:47 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.www.protocol.http;

import java.io.*;
import java.net.*;

import w3c.util.*;
import w3c.www.mime.*;
import w3c.www.http.*;

abstract class HttpConnection implements LRUAble {
    // LRUAble interface implementation.
    protected LRUAble lru_next = null;
    protected LRUAble lru_prev = null;
    /**
     * The server this connection is attached to.
     */
    protected HttpServer  server  = null;

    /**
     * LRUAble interface - Get previous item in the LRU list.
     * @return The previous item, or <strong>null</strong>.
     */

    public LRUAble getNext() {
	return lru_next;
    }

    /**
     * LRUAble interface - Get next item in the LRU list.
     * @return The next item, or <strong>null</strong>.
     */

    public LRUAble getPrev() {
	return lru_prev;
    }

    /**
     * LRUAble interface - Set the next item for this server.
     */

    public void setNext(LRUAble next) {
	lru_next = next;
    }

    /**
     * LRUAble interface - Set the previous item for this server.
     */

    public void setPrev(LRUAble prev) {
	lru_prev = prev;
    }
    
    protected final HttpServer getServer() {
	return server;
    }

    abstract public void close();

}





