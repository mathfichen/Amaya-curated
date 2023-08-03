// FastByteArrayOutputStream.java
// $Id: FastByteArrayOutputStream.java,v 1.1 1997/03/27 13:59:01 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.tools.dbm ;

import java.io.* ;

class FastByteArrayOutputStream extends ByteArrayOutputStream {
    FastByteArrayOutputStream(byte buf[]) {
	this.buf = buf ;
    }
}
