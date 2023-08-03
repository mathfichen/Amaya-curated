// CachedResourceFactory.java
// $Id: CachedResourceFactory.java,v 1.2 1997/03/27 13:57:51 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html


package w3c.www.protocol.http.cache;

import java.io.*;

import w3c.www.protocol.http.*;
import w3c.www.http.*;

/** 
 * The factory for cache entries.
 * All cache entries have to be sub-classes of CachedResource, that's the
 * only limitation to the fun you can have down here.
 */

public class CachedResourceFactory {

    /**
     * Create a suitable instance of some subclass of CachedResource.
     * @param filter The cache filter that ones to create a new entry.
     * @param request The original request we emitted.
     * @param reply The reply we got from the origin server.
     * @return An instance of CachedResource, or <strong>null</strong>
     * if no resource was created.
     */

    public static CachedResource createResource(CacheFilter filter
                                              , Request request
                                              , Reply reply)
      throws IOException
    {
      CachedResource r = null;
      // Check for a varying resource first:
      if ( reply.hasHeader(reply.H_VARY) ) 
          r = new VaryResource(filter, request, reply);
      else 
	  r = new CachedResource(filter, request, reply);
      return r;
    }

}

