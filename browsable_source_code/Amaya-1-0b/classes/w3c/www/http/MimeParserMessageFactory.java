// For debuging only.

package w3c.www.http;

import w3c.www.mime.*;

/**
 * The MIME parser factory for HTTP requests.
 */

public class MimeParserMessageFactory implements MimeParserFactory {
    
    /**
     * Create a new HTTP request to hold the parser's result.
     * @param parser The parser that has something to parse.
     * @return A MimeParserHandler compliant object.
     */

    public MimeHeaderHolder createHeaderHolder(MimeParser parser) {
	return new HttpEntityMessage(parser) ;
    }
}
