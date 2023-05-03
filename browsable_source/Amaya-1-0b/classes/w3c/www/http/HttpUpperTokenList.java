// HttpUpperTokenList.java
// $Id: HttpUpperTokenList.java,v 1.2 1997/03/27 13:57:42 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.www.http;

import java.util.*;

/**
 * Parse a comma separated list of tokens.
 */

public class HttpUpperTokenList extends HttpTokenList {
    /**
     * Create a parsed token list, for emitting.
     */

    protected HttpUpperTokenList(String tokens[]) {
	super(tokens);
	this.casemode = CASE_UPPER;
    }

    /**
     * Create a token list from a comma separated list of tokens.
     */

    protected HttpUpperTokenList(String tokens) {
	super(tokens);
	this.casemode = CASE_UPPER;
    }

    /**
     * Create an empty token list for parsing.
     */

    protected HttpUpperTokenList() {
	super();
	this.casemode = CASE_UPPER;
    }

}
