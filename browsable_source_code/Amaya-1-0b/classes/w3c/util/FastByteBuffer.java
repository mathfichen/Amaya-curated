package w3c.util;

public class FastByteBuffer {
    private static final int DEFSIZE     = 128;
    private static final int CHARBUFSIZE = 32;

    protected byte buf[];
    protected int  len = 0;
    protected char charbuf[] = null;

    protected final void ensureCapacity(int sz) {
	if ( len + sz >= buf.length ) {
	    byte newbuf[] = new byte[buf.length<<1];
	    System.arraycopy(buf, 0, newbuf, 0, len);
	    buf = newbuf;
	}
    }

    public final void appendByte(int b) {
    	ensureCapacity(1);
    	buf[len++] = (byte) (b & 0xff);
    }
    
    public final void appendInt(int i, int padlen, int padchar) {
	ensureCapacity(Math.max(padlen, 12));
	boolean neg = (i < 0);
	int hackpos = len;
	// Emit number in reverse order:
	if ( ! neg )
	    i = -i;
	while (i <= -10) {
	    appendByte('0'-(i%10)); padlen--;
	    i = i / 10;
	}
	appendByte('0'-i); padlen--;
	if ( neg ) {
	    appendByte('-'); padlen--;
	}
	while ( --padlen >= 0 ) 
	    appendByte(padchar);
	// Reverse byte order
	int cnt = (len-hackpos) / 2 ;
	int j   = len-1;
	while ( --cnt >= 0 ) {
	    int pos = hackpos+len-j-1;
	    byte tmp = buf[j];
	    buf[j]   = buf[pos] ;
	    buf[pos] = tmp;
	    j--;
	}
    }

    public final void appendBytes(byte b[], int off, int len) {
	
    }

    public final void appendString(String s) {
	// Get the chars:
	int  sz  = s.length();
	char c[] = null;
	if ( sz < charbuf.length ) {
	    s.getChars(0, sz, charbuf, 0);
	    c = charbuf;
	} else {
	    c = new char[sz];
	    s.getChars(0, sz, c, 0);
	}
	// Get the bytes:
	for (int i = 0 ; i < c.length ; i++) 
	    buf[len++] = (byte) (c[i] & 0xff);
    }

    public final int length() {
	return len;
    }

    public final void reset() {
	len = 0;
    }

    public final byte[] getBytes() {
	return buf;
    }

    public final byte[] getCopy() {
	byte cp[] = new byte[len];
	System.arraycopy(buf, 0, cp, 0, len);
	return cp;
    }

    public FastByteBuffer(ByteBufferHandler handler, int sz) {
	this.buf     = new byte[sz];
	this.charbuf = new char[CHARBUFSIZE];
    }

    public FastByteBuffer(ByteBufferHandler handler, byte buf[]) {
	this.buf     = buf;
	this.charbuf = new char[CHARBUFSIZE];
    }

    public FastByteBuffer(ByteBufferHandler handler) {
	this.buf     = new byte[DEFSIZE];
	this.charbuf = new char[CHARBUFSIZE];
    }

}
