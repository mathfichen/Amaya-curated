package w3c.www.protocol.http;

import java.io.*;
import java.net.*;

import w3c.www.mux.*;

class HttpMuxConnection extends HttpConnection {
    Socket        socket = null;
    MuxStream     stream = null;
    HttpMuxServer server = null;
    int refcount = 0;

    protected synchronized boolean incrUseCount() {
	boolean ret = (refcount == 0);
	refcount++;
	return ret;
    }

    protected synchronized boolean decrUseCount() {
	return (--refcount == 0);
    }

    public void close() {
	try {
	    stream.shutdown(true);
	} catch (IOException ex) {
	    ex.printStackTrace();
	}
    }

    public final MuxSession connect(int protid) 
	throws IOException
    {
	return stream.connect(protid);
    }

    HttpMuxConnection(HttpMuxServer server, String host, int port) 
	throws IOException
    {
	this.server = server;
	this.socket = new Socket(host, port);
	this.stream = new MuxStream(false, null, socket);
    }

}
