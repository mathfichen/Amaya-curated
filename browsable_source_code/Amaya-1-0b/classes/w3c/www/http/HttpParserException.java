// HttpParserException.java
// $Id: HttpParserException.java,v 1.2 1997/03/27 13:57:40 cvs Exp $$
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html


package w3c.www.http;

import w3c.www.mime.*;

public class HttpParserException extends MimeParserException {
    
    public HttpParserException(String msg) {
	super(msg);
    }

}
