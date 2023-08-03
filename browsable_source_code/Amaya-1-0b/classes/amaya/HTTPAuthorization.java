/*
 * Implementation of the support of authorization.
 * The current version is completely tied to Jigsaw HTTP implementation,
 * we hope to get more conformant to the HTTP Java API in the future.
 */
package amaya;

import java.io.*;
import java.util.*;

import w3c.tools.codec.*;
import w3c.www.http.*;
import w3c.www.protocol.http.*;
import w3c.www.protocol.http.auth.*;

import amaya.*;

class CachedRealm {
    public String         realm       = null;
    public HttpCredential credentials = null;

    CachedRealm(String realm, HttpCredential credentials) {
	this.realm       = realm;
	this.credentials = credentials;
    }
}

public class HTTPAuthorization implements PropRequestFilter {
    /**
     * The per-server realms we know about.
     */
    protected static Hashtable realms = new Hashtable(13);
    /**
     * the HttpManager that installed us.
     */
    protected HttpManager manager = null;

    protected static void registerRealm(Request request
					, Reply reply
					, HttpCredential credentials) {
	// Do we already know about that realm ?
	if ( lookupRealm(request, reply) != null )
	    return;
	// Register the realm:
	String      srvkey  = request.getManager().getServerKey(request);
	String      realm   = ((request.hasProxy()
				? reply.getProxyAuthenticate()
				: reply.getWWWAuthenticate())
			       .getAuthParameter("realm"));
	CachedRealm cache[] = (CachedRealm[]) realms.get(srvkey);
	if ( cache == null ) {
	    cache    = new CachedRealm[1];
	    cache[0] = new CachedRealm(realm, credentials);
	} else {
	    CachedRealm nc[] = new CachedRealm[cache.length+1];
	    System.arraycopy(cache, 0, nc, 0, cache.length);
	    nc[cache.length] = new CachedRealm(realm, credentials);
	    cache = nc;
	}
	realms.put(srvkey, cache);
    }

    protected static HttpCredential lookupRealm(Request request
						, Reply reply) {
	// Lookup known realms on target server:
	String      srvkey  = request.getManager().getServerKey(request);
	CachedRealm cache[] = (CachedRealm[]) realms.get(srvkey);
	if ( cache == null )
	    return null;
	// Found something, check:
	HttpChallenge challenge = (request.hasProxy()
				   ? reply.getProxyAuthenticate()
				   : reply.getWWWAuthenticate());
	String realm = challenge.getAuthParameter("realm");
	for (int i = 0 ; i < cache.length ; i++) {
	    if ( cache[i].realm.equalsIgnoreCase(realm) )
		return cache[i].credentials;
	}
	return null;
    }

    /**
     * PropRequestFilter implementation - Initialize the filter.
     * Time to register ourself to the HttpManager.
     * @param manager The HTTP manager that is initializing ourself.
     */

    public void initialize(HttpManager manager) {
	this.manager = manager;
	// We install ourself as a global filter, we are cool !
	manager.setFilter(this);
	manager.setAllowUserInteraction(true);
    }

    /**
     * This filter doesn't handle exceptions.
     * @param request The request that triggered the exception.
     * @param ex The triggered exception.
     * @return Always <strong>false</strong>.
     */

    public boolean exceptionFilter(Request request, HttpException ex) {
	return false;
    }

    /**
     * On the way out, we let the request fly through.
     * @param request The request about to be emitted.
     */

    public Reply ingoingFilter(Request request) {
	return null;
    }

    /**
     * Catch any authentication requirement, and fullfill it with user's help.
     * This method trap all request for authentication, and pops up a
     * dialog prompting for the user's name and password.
     * <p>It then retries the request with the provided authentication
     * informations.
     * @param request The request that requires authentication.
     * @param reply The original reply.
     * @throw HttpException If some HTTP error occurs.
     */

    public Reply outgoingFilter(Request request, Reply reply) 
	throws HttpException
    {
	// Is this really for us to catch ?
	if ((reply.getStatus() != HTTP.UNAUTHORISED)
	    && (reply.getStatus() != HTTP.PROXY_AUTH_REQUIRED))
	    return null;
	// Do we know about this realm ?
	HttpCredential credentials = null;
	if ((credentials = lookupRealm(request, reply)) == null) {
	    /*
	     * Check if there is something to output since it's not handled
	     * well yet.
	     */
	    if (request.hasOutputStream()) return(null);

	    String user     = null;
	    String password = null;
	    if (APIJavaAmaya.PopUpAuthDialog(1) < 0) return(null);
	    user = APIJavaAmaya.GetUserString();
	    password = APIJavaAmaya.GetPasswdString();

	    if ((user.equals("")) && (password.equals(""))) return(null);

	    // Compute credentials:
	    credentials = HttpFactory.makeCredential("Basic");
	    Base64Encoder encoder = new Base64Encoder(user+":"+password);
	    credentials.setAuthParameter("cookie", encoder.processString());
	}
	// Now restart the request we the right auth infos:
	if ( request.hasProxy() )
	    request.setProxyAuthorization(credentials);
	else
	    request.setAuthorization(credentials);
	Reply retry = request.getManager().runRequest(request);
	if ( retry.getStatus() / 100 != 4 ) {
	    // We did succeed, register server/realm infos:
	    registerRealm(request, reply, credentials);
	    // Create the local auth filter:
	    if ( request.hasProxy() ) {
		LocalAuthFilter.installProxyAuth(manager, credentials);
	    } else {
		LocalAuthFilter.installLocalAuth(manager
						 , request.getURL()
						 , credentials);
	    }
	    // Swallow input stream of original reply:
	    try {
		InputStream in = reply.getInputStream();
		if ( in != null )
		    in.close();
	    } catch (IOException ex) {
	    }
	    // Return the right reply:
	    return retry;
	} else {
	    return null;
	}
    }

    /**
     * We don't maintain cached informations.
     */

    public void sync() {
    }

}

