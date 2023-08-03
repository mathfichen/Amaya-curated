// ChunkedOutputStream.java
// $Id: ChunkedOutputStream.java,v 1.2 1997/03/27 13:57:34 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html


package w3c.www.http;

import java.io.*;

public class ChunkedOutputStream extends DataOutputStream {
    private static final byte crlf[]      = { (byte) 13, (byte) 10 };
    private static final byte lastchunk[] = {
	(byte) 0, (byte) 13, (byte) 10
    };
    private static final int DEFAULT_CHUNK_SIZE = 512;

    /**
     * The chunking buffer.
     */
    protected byte buffer[] = null;
    /**
     * Where to put next piece of data (current chunk size).
     */
    protected int bufptr = 0;
    /**
     * The chunk size to use (defaults to buffer size).
     */
    protected int chunksize = -1;
    /**
     * Internal buffer to hold chunk size.
     */
    protected byte bheader[] = new byte[32];
    
    /**
     * Send the close chunk.
     * @Exception IOException If writing fails.
     */

    protected void sendClose()
	throws IOException
    {
	sendChunk(lastchunk, 0, lastchunk.length);
    }

    /**
     * Send given buffer as a full chunk.
     * @param b The buffer that contains the data to emit.
     * @param off Offset of chunk in above buffer.
     * @param len Length of chunk.
     * @exception IOException If writing fails.
     */

    protected void sendChunk(byte b[], int off, int len)
	throws IOException
    {
	// Anything to send ?
	if ( len == 0 ) 
	    return;
	// Send one chunk:
	String header = Integer.toString(len, 16).toUpperCase() + "\r\n" ;
	int    blen   = header.length() ;
	header.getBytes(0, blen, bheader, 0) ;
	out.write(bheader, 0, blen) ;
	out.write(b, off, len) ;
	out.write(crlf, 0, 2) ;
	out.flush() ;
    }

    /**
     * Send current chunk of data.
     * @exception IOException If writing fails.
     */

    protected void sendChunk() 
	throws IOException
    {
	if ( bufptr == 0 )
	    return;
	sendChunk(buffer, 0, bufptr);
	bufptr = 0;
    }

    /** 
     * Append one byte to pending chunk.
     * @param v The byte to append.
     * @exception IOException If writing fails.
     */

    protected final void append(int v) 
	throws IOException
    {
	if ( bufptr + 1 >= chunksize )
	    sendChunk();
	buffer[bufptr++] = (byte) (v & 0xff);
    }

    /**
     * Append a bunch of bytes to current pending chunk.
     * @param b The chunk of bytes to add.
     * @param off Offset of chunk within above buffer.
     * @param len Length of chunk.
     * @exception IOException If writing fails.
     */

    protected final void append(byte b[], int off, int len) 
	throws IOException
    {
	if ( bufptr + len >= chunksize )
	    sendChunk();
	if ( len < buffer.length ) {
	    System.arraycopy(b, off, buffer, bufptr, len);
	    bufptr += len;
	} else {
	    sendChunk(b, off, len);
	}
    }

    /**
     * Close that encoding stream.
     * @exception IOException If writing fails.
     */
     
    public void close() 
	throws IOException
    {
	sendChunk();
	super.close();
    }

    /**
     * Flush pending output.
     * @exception IOException If writing fails.
     */

    public void flush()
	throws IOException
    {
	sendChunk();
	super.flush();
    }

    /**
     * Write one byte of output.
     * @param v The byte to write.
     * @exception IOException If writing fails.
     */

    public void write(int b) 
	throws IOException
    {
	append(b);
    }

    /**
     * Write an array of bytes.
     * @param b The data to write.
     * @param off Offfset within above buffer.
     * @param len Length of data to write.
     * @exception IOException If writing fails.
     */

    public void write(byte b[], int off, int len)
	throws IOException
    {
	append(b, off, len);
    }

    /**
     * Create a chunk encoder, using the provided buffer.
     * @param buffer The buffer to use (determines the default chunk size).
     * @param put The DataOutputStream to write encoded data to.
     */

    public ChunkedOutputStream(byte buffer[], DataOutputStream out) {
	super(out);
	this.buffer    = buffer;
	this.chunksize = buffer.length;
    }

    /**
     * Create a chunk encoder.
     * @param out The DataOutputStream to write to.
     */

    public ChunkedOutputStream(DataOutputStream out) {
	this(new byte[DEFAULT_CHUNK_SIZE], out);
    }

}
