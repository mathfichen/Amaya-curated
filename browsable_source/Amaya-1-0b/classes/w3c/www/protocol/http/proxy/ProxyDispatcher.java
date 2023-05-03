// ProxyDispatcher.java
// $Id: ProxyDispatcher.java,v 1.2 1997/03/27 13:57:53 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// please first read the full copyright statement in file COPYRIGHT.HTML

package w3c.www.protocol.http.proxy ;

import java.io.*;
import java.net.*;
import java.util.*;

import w3c.util.*;
import w3c.www.protocol.http.*;
import w3c.www.http.*;
import w3c.tools.codec.*;

/**
 * Exception thrown when parsing the rule file fails.
 */

class RuleParserException extends Exception {

    RuleParserException(String msg) {
	super(msg);
    }

}

/**
 * The Rule class (and subclasses) represents the rhs part of a rule.
 * When a matching rule is found, it's <code>apply</code> method is
 * invoked to perform any functionality.
 */

class Rule {

    /**
     * Initialize the rule with given set of tokens.
     * @param tokens The token array.
     * @param offset Offset within above array, of tokens to initialize from.
     * @param length Total number of tokens in above array.
     * @exception RuleParserExctpion If the rule couldn't be initialized
     * from given tokens.
     */

    protected void initialize(String tokens[], int offset, int length) 
	throws RuleParserException
    {
	if ( offset != length )
	    throw new RuleParserException("Unexpected token: "+tokens[offset]);
    }

    /**
     * Create a rule, given an array of String.
     * @param tokens Parsed tokens, as a String array.
     * @param offset Offset of the rule tokens within above array.
     * @param length Total number of available tokens.
     * @exception RuleParserException If no rule could be created out of given
     * tokens.
     */

    static Rule createRule(String tokens[], int offset, int length)
	throws RuleParserException
    {
	Rule rule = null;
	// Make sure there is something to build:
	if ((tokens == null) || (length-offset == 0))
	    return null;
	// Check the rule name:
	String name = tokens[offset];
	if ( name.equalsIgnoreCase("direct") ) {
	    rule = new DirectRule();
	} else if ( name.equalsIgnoreCase("proxy") ) {
	    rule = new ProxyRule();
	} else if ( name.equalsIgnoreCase("forbid") ) {
	    rule = new ForbidRule();
	} else if ( name.equalsIgnoreCase("redirect") ) {
	    rule = new RedirectRule();
	} else if ( name.equalsIgnoreCase("authorization") ) {
	    rule = new AuthorizationRule();
	} else {
	    throw new RuleParserException("Unknown rule name \""+name+"\"");
	}
	rule.initialize(tokens, offset+1, length);
	return rule;
    }

    /**
     * Apply given rule to the given request.
     * @param request The request to apply the rule to.
     */

    public Reply apply(Request request) {
	return null;
    }

    /**
     * Empty constructor for dynamic instantiation.
     */

    public Rule() {
    }

}

/**
 * The ForbidRule implements the <code>forbid</code> directive.
 * Forbid prevents all accesses, by the client (be it a proxy or hotjava)
 * to a given set of hosts.
 */

class ForbidRule extends Rule {
    
    /**
     * Convert a forbid rule, back to String.
     * @return A String instance.
     */

    public String toString() {
	return "<rule>forbid";
    }

    /**
     * Forbid access to the given request.
     * @param request The request to apply the rule too.
     */

    public Reply apply(Request request) {
	Reply reply = request.makeReply(HTTP.OK);
	reply.setContent("<h1>Access forbidden</h1>"
			 + "<p>Access to "+request.getURL()
			 + " is forbidden by proxy dispatcher rules.");
	reply.setContentType(w3c.www.mime.MimeType.TEXT_HTML);
	return reply;
    }

    /**
     * Initialize a forbid rule.
     * @param tokens The token array.
     * @param offset Offset within above array, of tokens to initialize from.
     * @param length Total number of tokens in above array.
     * @exception RuleParserExctpion If the rule couldn't be initialized
     * from given tokens.
     */

    public void initialize(String tokens[], int offset, int length) 
	throws RuleParserException
    {
	super.initialize(tokens, offset, length);
    }

    
    public ForbidRule() {
    }

}



class ProxyRule extends Rule {
    URL proxy = null;

    /**
     * Convert a proxy rule to a String.
     * @return A String instance.
     */

    public String toString() {
	return "<rule>proxy "+proxy;
    }

    /**
     * Set the appropriate proxy for the given requested URL.
     * @param request The request to apply the rule to.
     * @return Always <strong>null</strong>, will only hack the given request
     * if needed.
     */

    public Reply apply(Request request) {
	if ( proxy != null )
	    request.setProxy(proxy);
	return null;
    }

    /**
     * Initialize that proxy rule.
     * @param tokens The token array.
     * @param offset Offset within above array, of tokens to initialize from.
     * @param length Total number of tokens in above array.
     * @exception RuleParserExctpion If the rule couldn't be initialized
     * from given tokens.
     */

    public void initialize(String tokens[], int offset, int length) 
	throws RuleParserException
    {
	// We have to get the proxy here
	if ( offset+1 != length )
	    throw new RuleParserException("No target proxy.");
	try {
	    proxy = new URL(tokens[offset]);
	} catch (MalformedURLException ex) {
	    throw new RuleParserException("Invalid target proxy \""
					   + tokens[offset]
					   + "\".");
	}
    }

    public ProxyRule() {
    }

}

class RedirectRule extends Rule {
    URL redirect = null;

    /**
     * Convert a redirect rule to a String.
     * @return A String instance.
     */

    public String toString() {
	return "<rule>redirect "+redirect;
    }

    /**
     * Set the appropriate redirect URL for the given requested URL.
     * @param request The request to apply the rule to.
     * @return Always <strong>null</strong>, will only hack the given request
     * if needed.
     */

    public Reply apply(Request request) {
	if ( redirect != null )
	    request.setURL(redirect);
	return null;
    }

    /**
     * Initialize that redirect rule.
     * @param tokens The token array.
     * @param offset Offset within above array, of tokens to initialize from.
     * @param length Total number of tokens in above array.
     * @exception RuleParserExctpion If the rule couldn't be initialized
     * from given tokens.
     */

    public void initialize(String tokens[], int offset, int length) 
	throws RuleParserException
    {
	// We have to get the redirect URL here
	if ( offset+1 != length )
	    throw new RuleParserException("No target redirect URL.");
	try {
	    redirect = new URL(tokens[offset]);
	} catch (MalformedURLException ex) {
	    throw new RuleParserException("Invalid target redirect URL \""
					   + tokens[offset]
					   + "\".");
	}
    }

    public RedirectRule() {
    }

}

/**
 * The DirectRule implements the <code>DIRECT</code> directive.
 * Applying that rule is basically a <em>noop</em>.
 */

class DirectRule extends Rule {

    /**
     * Convert this direct rule to a String.
     * @return A String instance.
     */

    public String toString() {
	return "<rule>direct";
    }

    public DirectRule() {
    }

}

/**
 * The authorization rule adds Basic credentials to all requests.
 */

class AuthorizationRule extends Rule {
    /**
     * The credentials to add to the request.
     */
    HttpCredential credential = null;

    /**
     * Appky this rule to the given request.
     * @param request The request to apply the rule to.
     * @return Always <strong>null</strong>.
     */

    public Reply apply(Request request) {
	if ( ! request.hasHeader(HttpRequestMessage.H_AUTHORIZATION) )
	    request.setHeaderValue(HttpRequestMessage.H_AUTHORIZATION
				   , credential);
	return null;
    }

    /**
     * Initialize this Authorization rule.
     * @param tokens The token array.
     * @param offset Offset within above array, of tokens to initialize from.
     * @param length Total number of tokens in above array.
     * @exception RuleParserExctpion If the rule couldn't be initialized
     * from given tokens.
     */

    public void initialize(String tokens[], int offset, int length) 
	throws RuleParserException 
    {
	if ( offset + 2 != length ) 
	    throw new RuleParserException("Invalid authorization rule: "
					  + " should be authorization "
					  + " <user> <password>.");
	credential = HttpFactory.makeCredential("Basic");
	Base64Encoder base64 = new Base64Encoder(tokens[offset]
						 + ":"
                                                 + tokens[offset+1]);
	credential.setAuthParameter("cookie", base64.processString());
    }

}

/**
 * A RuleNode instance keeps track of one token within the lfh of a rule.
 * This data structure is usually known as a <em>hash-trie</em>, check
 * one of the Knuth books for more infos.
 */

class RuleNode {
    /**
     * The token this node applies to.
     */
    String    token    = null;
    /**
     * It's optionally associated rule.
     */
    Rule      rule     = null;
    /**
     * A hashtable to keep track of children rules.
     */
    Hashtable children = null;

    void setRule(Rule rule) {
	this.rule = rule;
    }

    /**
     * Add a children rule node to this rule node.
     * @param token The child token.
     * @param rule The rule to map to this token.
     * @return The newly created RuleNode instance.
     */

    synchronized RuleNode addChild(String tok, Rule rule) {
	RuleNode node = new RuleNode(tok, rule);
	if ( children == null ) 
	    children = new Hashtable(5);
	children.put(tok, node);
	return node;
    }

    /**
     * Add a children rule node to this node.
     * This method does the same as above, except that it doesn't map
     * the created node to a rule.
     * @param tok The token this node applies to.
     * @return The newly createed RuleNode instance.
     */

    synchronized RuleNode addChild(String tok) {
	RuleNode node = new RuleNode(tok);
	if ( children == null ) 
	    children = new Hashtable(5);
	children.put(tok, node);
	return node;
    }

    /**
     * Lookup a rule.
     * Given a fully qualified host name, parse it into its components, and
     * starting from this rule node, lookup for a matching rule.
     * <p>The most precise rule is always returned.
     * @return The best matching rule, as a Rule instance, or <strong>
     * null</strong> if no matching rule was found.
     */

    Rule lookupRule(String host) {
	// Parse the host into it's components:
	String  parts[] = new String[32];
	int     hostlen = host.length();
	int     phost   = 0;
	int     npart   = 0;   
	boolean isip    = true;
	for (int i = 0 ; i < hostlen; i++) {
	    if ( host.charAt(i) == '.' ) {
		if ( npart+1 >= parts.length ) {
		    // This is unlikely to happen, but anyway:
		    String newparts[] = new String[parts.length << 1];
		    System.arraycopy(parts, 0, newparts, 0, parts.length);
		    parts = newparts;
		}
		parts[npart++] = host.substring(phost, i);
		phost = ++i;
	    } else {
		if(isip)
		    isip = (host.charAt(i)>='0') && (host.charAt(i)<='9');
	    }
	}
	parts[npart++] = host.substring(phost);

	RuleNode node = this;
	Rule     ret  = rule;
	if(isip)
	    for (int i = 0; i <= npart ; i++ ) {
		node = node.lookup(parts[i]);
		if (node != null) {
		    ret = (node.rule != null) ? node.rule : rule;
		} else {
		    return ret;
		}
	    }
	else
	    for (int i = npart; --i >= 0 ; ) {
		node = node.lookup(parts[i]);
		if (node != null) {
		    ret = (node.rule != null) ? node.rule : ret;
		} else {
		    return ret;
		}
	    }
	return ret;
    }

    /**
     * Lookup a children rule node.
     * @param tok The token for the child that is to be looked up.
     * @return A RuleNode instance, if found, <strong>null</strong>
     * otherwise.
     */

    RuleNode lookup(String tok) {
	return ((children != null) ? (RuleNode) children.get(tok) : null);
    }

    RuleNode(String token, Rule rule) {
	this.token = token.toLowerCase();
	this.rule  = rule;
    }
    
    RuleNode(String token) {
	this(token, null);
    }

    RuleNode() {
	this("**ROOT**", null);
    }
}

/**
 * A simple Rule parser.
 */

class RuleParser {
    InputStream in = null;
    RuleNode    root = null;

    /**
     * Add a mapping for the given rule in our rule node.
     * @param lhs The rule left hand side, as a parsed String array.
     * @param rule The mapped rule instance.
     */

    void addRule(String lhs[], Rule rule) {
	RuleNode node = root;
	int lhslen    = lhs.length;
	if(!lhs[0].equals("default")) {
	    for (int i = lhslen ; --i >= 0 ; ) {
		RuleNode child = node.lookup(lhs[i]);
		if ( child == null ) 
		    child = node.addChild(lhs[i]);
		node = child;
	    }
	}
	node.setRule(rule);
    }

    /**
     * Create a suitable rule mapping for the tokenized rule.
     * @param tokens The rule tokens, as a String array.
     * @param toklen Number of tokens in above array.
     */
     
    void parseRule(String tokens[], int toklen)
	throws RuleParserException
    {
	// Get and parse the rule left hand side first:
	StringTokenizer st = new StringTokenizer((String) tokens[0], ".");
	Vector vlhs = new Vector();
	String vls;
	boolean isnum = false;
	
	while (st.hasMoreTokens()) {
	    isnum = true;
	    vls = st.nextToken();
	    for(int i=0; isnum && (i<vls.length()); i++)
		isnum = (vls.charAt(i)>='0') && (vls.charAt(i)<='9');
	    vlhs.addElement(vls);
	}
	// if numeric, reverse the order of tokens
	if(isnum) {
	    int vs = vlhs.size();
	    for(int i=0; i<vs;i++) {
		vlhs.addElement(vlhs.elementAt(vs-i-1));
		vlhs.removeElementAt(vs-i-1);
	    }
	}
	String slhs[] = new String[vlhs.size()];
	vlhs.copyInto(slhs);
	// Build a rule instance:
	Rule rule = Rule.createRule(tokens, 1, toklen);
	// Install the rule in our root node:
	addRule(slhs, rule);
    }

    /**
     * Parse the our input stream into a RuleNode instance.
     * @exception IOException If reading the rule input stream failed.
     * @exception RuleParserException If some invalid rule syntax was
     * detected.
     */

    RuleNode parse() 
	throws RuleParserException, IOException
    {
	// Initialize the stream tokenizer:
	boolean         eof = false;
	StreamTokenizer st  = new StreamTokenizer(in);
	// do syntax by hand
	st.resetSyntax();
        st.wordChars('a', 'z');
        st.wordChars('A', 'Z');
	st.wordChars('0', '9');
        st.wordChars(128 + 32, 255);
        st.whitespaceChars(0, ' ');
	st.wordChars(33, 128);
	st.commentChar('#');
	st.eolIsSignificant(true);
	st.lowerCaseMode(true);
	// Create the root node, to be returned:
	root = new RuleNode();
	String tokens[] = new String[32];
	int    toklen   = 0;
	// Parse input:
	while ( ! eof ) {
	    // Read one line of input, parse it:
	    while (! eof) {
		int tt =-1;
		switch(tt = st.nextToken()) {
		  case st.TT_EOF:
		      eof = true;
		      if ( toklen > 0 ) {
			  try {
			      parseRule(tokens, toklen);
			  } catch (RuleParserException ex) {
			      String msg = ("Error while parsing rule file, "
					    + "line "+st.lineno()+": "
					    + ex.getMessage());
			      throw new RuleParserException(msg);
			  }
			  toklen = 0;
		      }
		      break;
		  case st.TT_EOL:
		      if ( toklen > 0 ) {
			  try {
			      parseRule(tokens, toklen);
			  } catch (RuleParserException ex) {
			      String msg = ("Error while parsing rule file, "
					    + "line "+st.lineno()+": "
					    + ex.getMessage());
			      throw new RuleParserException(msg);
			  }
			  toklen = 0;
		      }
		      break;
		  case st.TT_WORD:
		      // Add that token:
		      if ( toklen + 1 >= tokens.length ) {
			  String newtok[] = new String[tokens.length+8];
			  System.arraycopy(tokens, 0, newtok, 0, toklen);
			  tokens = newtok;
		      }
		      tokens[toklen++] = st.sval;
		      break;
		  default:
		      throw new RuleParserException("Invalid syntax, line "
                                                    + st.lineno()
						    + ".");
		}
	    }
	}
	return root;
    }

    /**
     * Create a rule parser to parse the given input stream.
     */

    RuleParser(InputStream in) {
	this.in = in ;
    }

}	

/**
 * The proxy dispatcher applies some <em>rules</em> to a request.
 * The goal of that filter is to allow special pre-processing of requests
 * based, on their target host, before sending them off the net.
 * <p>The filter is configured through a <em>rule file</em> whose format
 * is described by the following BNF:
 * <code>
 * rule-file=(<em>record</em>)*<br>
 * record=<strong>EOL</strong>|<em>comment</em>|<em>rule</em><br>
 * comment=<strong>#</strong>(<strong>^EOL</strong>)*<strong>EOL</strong><br>
 * rule=<em>rule-lhs</em>(<strong>SPACE</strong>)*<em>rule-rhs</em><br>
 * rule-lhs=(<strong>token</strong>)
 *  |(<strong>token</strong> (<strong>.</strong> <strog>token</strong>)*<br>
 * rule-lhr=<em>forbid</em>|<em>direct</em>|<em>redirect</em>
 *          |<em>proxy</em>|<em>authorization</em><br>
 * forbid=<strong>FORBID</strong>|<strong>forbid</strong><br>
 * direct=<strong>DIRECT</strong>|<strong>direct</strong><br>
 * redirect=(<strong>REDIRECT</strong>|<strong>proxy</strong>) <em>url</em><br>
 * proxy=(<strong>PROXY</strong>|<strong>proxy</strong>) <em>url</em><br>
 * url=<strong>any valid URL</strong></br>
 * authorization=(<strong>AUTHORIZATION</strong>|<strong>authorization</strong>
 *  <em>user</em> <em>password</em><br>
 * </code>
 * <p>A sample rule file looks like this:
 * <code>
 * # Some comments
 * 
 * edu proxy http://class.w3.org:8001/
 * org proxy http://class.w3.org:8001/
 * fr  direct
 * www.evilsite.com redirect http://www.goodsite.com/warning.html
 * www.w3.org direct
 * 138.96.24 direct
 * www.playboy.com forbid
 * default proxy http://cache.inria.fr:8080/
 * </code>
 * <p>The algorithm used to lookup rules is the following: 
 * <ul>
 * <li>Split all rules <em>left hand side</em> into its components, eg 
 * H1.H2.H3 is splitted into { H1, H2, H3 }, then reverse the components and 
 * map that to the rule. In our example above, { org, w3, www} would be mapped
 * to <em>direct</em>.
 * <li>Split the fully qualified host name into its components, eg, A.B.C is
 * splitted into { A, B, C } and reverse it.
 * <li>Find the longest match in the mapping table of rules, and get
 * apply the given rule.
 * </ul>
 * <p>In our example, a request to <strong>www.isi.edu</strong> would match
 * the <em>edu</em> rule, and a request for <strong>www.w3.org</strong>
 * would match the <em>direct</em> rule, for example.
 * <p>Three rules are defined:
 * <dl>
 * <dt>direct<dd>Run that request directly against the target host.
 * <dt>forbid<dd>Emit a forbid message, indicating that the user is not
 * allowed to contact this host.
 * <dt>proxy<dd>Run that request through the given <em>proxy</em>.
 * </dl>
 * <p>For numeric IP addresses, the most significant part is the beginning,
 * so {A, B, C} are deducted directly. In the example { 138, 96, 24 } is mapped
 * to direct.
 * <p>If no rules are applied, then the default rule (root rule) is applied.
 * See the example.
 */


public class ProxyDispatcher
    implements PropRequestFilter, PropertyMonitoring 
{
    /**
     * Name of the property giving the rule file URL.
     */
    public static final 
    String RULE_P = "w3c.www.protocol.http.proxy.rules";
    /**
     * Name of the property turning that filter in debug mode.
     */
    public static final
    String DEBUG_P = "w3c.www.protocol.http.proxy.debug";

    /**
     * The properties we initialized ourself from.
     */
    protected ObservableProperties props = null;  
    /**
     * The current set of rules to apply.
     */
    protected RuleNode rules = null;
    /**
     * Are we in debug mode ?
     */
    protected boolean debug = false;
 
    protected static final String disabled = "disabled";
      

    /**
     * Parse the given input stream as a rule file.
     * @param in The input stream to parse.
     */

    protected void parseRules(InputStream in)
	throws IOException, RuleParserException
    {
	RuleParser parser = new RuleParser(in);
	RuleNode   nroot  = parser.parse();
	rules = nroot;
    }

    /**
     * Parse the default set of rules.
     * <p>IOf the rules cannot be parsed, the filter emits an error
     * message to standard error, and turn itself into transparent mode.
     */

    protected void parseRules() {
	String ruleurl = props.getString(RULE_P, null);
	InputStream in = null;
	// Try opening the rule file as a URL:
	try {
	    URL url = new URL(ruleurl);
	    in = url.openStream();
	} catch (Exception ex) {
	// If this fails, it may be just a file name:
	    try {
		in = (new BufferedInputStream
		      (new FileInputStream
		       (new File(ruleurl))));
	    } catch (Exception nex) {
		System.err.println("* ProxyDispatcher: unable to open rule "
				   + "file \"" + ruleurl + "\"");
		rules = null;
		return;
	    }
	} 
	// Parse that input stream as a rule file:
	try {
	    parseRules(in);
	} catch (Exception ex) {
	    System.err.println("Error parsing rules from: "+ruleurl);
	    ex.printStackTrace();
	    rules = null;	    
	} finally {
	    if ( in != null ) {
		try {
		    in.close();
		} catch (IOException ex) {
		}
	    }
	} 
    }

    /**
     * Filter requests before they are emitted.
     * Look for a matching rule, and if found apply it before continuing
     * the process. If a forbid rule was apply, this method will return
     * with a <em>forbidden</em> message.
     * @param request The request to filter.
     * @return A Reply instance, if processing is not to be continued,
     * <strong>false</strong>otherwise.
     */
     
    public Reply ingoingFilter(Request request) {
	if ( rules != null ) {
	    URL    url  = request.getURL();
	    String host = url.getHost();
	    Rule   rule = rules.lookupRule(host);
	    if ( rule != null ) {
		if ( debug )
		    System.out.println("["+getClass().getName()+"]: applying "
                                       + rule + " to " + request.getURL());
		return rule.apply(request);
	    }
	}
	return null;
    }
    
    /**
     * Filter requests when an error occurs during the process.
     * This filter tries to do a direct connection if it is needed
     * @param reques The request to filter.
     * @param reply It's associated reply.
     * @return Always <strong>null</strong>.
     */

    public boolean exceptionFilter(Request request, HttpException ex) {
	// if it was a proxy connection, try a direct one
	// add test for exception here
	if(request.hasProxy()) {
	    Reply reply       = null;
	    HttpManager hm    = HttpManager.getManager();
	    request.setProxy(null);
	    if ( debug )
		System.out.println("["+getClass().getName()+"]: direct fetch "
				   +"for " + request.getURL());
	    return true;
	}
	return false;
    }

    /**
     * Filter requests after processing.
     * This filter doesn't do any post-processing.
     * @param reques The request to filter.
     * @param reply It's associated reply.
     * @return Always <strong>null</strong>.
     */

    public Reply outgoingFilter(Request request, Reply reply) {
	return null;
    }

   /**
     * PropertyMonitoring implementation - Commit property changes.
     * @param name The name of the property that has changed.
     * @return A boolean <strong>true</strong> if change was commited, 
     * <strong>false</strong> otherwise.
     */

    public boolean propertyChanged(String name) {
	if(name.equals(RULE_P)) {
	    try {
		parseRules();
	    } catch (Exception ex) {
		ex.printStackTrace();
		return false;
	    }
	}
	return true;
    }

    public void initialize(HttpManager manager) {
	// Prepare empty entry list:
	props = manager.getProperties();
	// Initialize from properties:
	parseRules();
	if (debug = props.getBoolean(DEBUG_P, false)) 
	    System.out.println("["+getClass().getName()+": debuging on.");
	// Install ourself
	manager.setFilter(this);
    }

    /**
     * We don't maintain cached infos.
     */

    public void sync() {
    }

    /**
     * Empty constructor, for dynamic instantiation.
     */

    public ProxyDispatcher() {
	super();
    }
}
