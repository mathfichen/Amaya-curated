// ByteRangeOutputStream.java
// $Id: ByteRangeOutputStream.java,v 1.1 1997/03/27 14:00:33 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.www.http ;

import java.io.*;

public class ByteRangeOutputStream extends InputStream {
    int              firstp = -1;
    int              lastp  = -1;
    RandomAccessFile in     = null;

    public int read()
	throws IOException
    {
	if ( firstp < lastp ) {
	    firstp++;
	    return ((int) in.readByte()) & 0xff;
	}
	return -1;
    }

    public int read(byte b[]) 
	throws IOException
    {
	return read(b, 0, b.length);
    }

    public int read(byte b[], int off, int len) 
	throws IOException
    {
	if (firstp < lastp) {
	    int send = Math.min(lastp-firstp, len);
	    send    = in.read(b, off, send);
	    firstp += send;
	    return send;
	}
	return -1;
    }

    public void close()
	throws IOException
    {
	in.close();
    }

    public int available() {
	return lastp-firstp;
    }

    public ByteRangeOutputStream(File file, int firstp, int lastp)
	throws IOException
    {
	this.firstp = firstp;
	this.lastp  = lastp;
	this.in     = new RandomAccessFile(file, "r");
	in.seek((long) firstp);
    }
}
