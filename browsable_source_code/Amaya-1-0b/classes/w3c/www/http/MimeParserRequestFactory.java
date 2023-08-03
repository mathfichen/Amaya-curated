// MimeParserRequestFactory.java
// $Id: MimeParserRequestFactory.java,v 1.2 1997/03/27 13:57:43 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.www.http;

import w3c.www.mime.*;

/**
 * The MIME parser factory for HTTP requests.
 */

public class MimeParserRequestFactory implements MimeParserFactory {
    
    /**
     * Create a new HTTP request to hold the parser's result.
     * @param parser The parser that has something to parse.
     * @return A MimeParserHandler compliant object.
     */

    public MimeHeaderHolder createHeaderHolder(MimeParser parser) {
	return new HttpRequestMessage(parser) ;
    }
}
