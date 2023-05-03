// CacheFilter.java
// $Id: CacheFilter.java,v 1.3 1997/03/27 18:33:28 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html


package w3c.www.protocol.http.cache;

import java.net.*;
import java.util.*;
import java.io.*;

import w3c.util.*;
import w3c.tools.store.*;
import w3c.www.protocol.http.*;
import w3c.www.http.*;

public class CacheFilter implements PropRequestFilter, PropertyMonitoring {
    /**
     * Number of sub-levels file system directories in the cache directory.
     */
    protected final static int CACHEDIR_SPLITS = 128;
    /**
     * STATE_HOW value - Indicates request fulfilled through a hot.
     */
    public static final Integer HOW_HIT = new Integer(1);
    /**
     * STATE_HOW value - Indicates request fulfilled through a miss.
     */
    public static final Integer HOW_MISS = new Integer(2);
    /**
     * STATE_HOW value - indicates request fulfilled through sucessfull
     * revalidation.
     */
    public static final Integer HOW_REVALIDATION_SUCCESS = new Integer(3);
    /**
     * STATE_HOW value - indicates request fulfilled through unsucessfull
     * revalidation.
     */
    public static final Integer HOW_REVALIDATION_FAILURE = new Integer(4);

    /**
     * Logging state - for some logger to keep track of what's happening.
     */
    public static final String
    STATE_HOW = "w3c.www.protocol.http.cache.how";
    /**
     * The state used to disable that filter per request. Also set by the cache
     * if the request cannot be fullfilled by caches, as detected by this 
     * filter.
     */
    public final static String
    STATE_NOCACHE = "w3c.www.protocol.http.cache.dont";
    /**
     * Name of the request state used to collect warnings.
     */
    public final static 
    String STATE_WARNINGS = "w3c.www.protocol.http.cache.CacheFilter.warns";
    /**
     * Name of the request state used tokeep track of original request
     */
    public final static
    String STATE_ORIGREQ = "w3c.www.protocol.http.cache.CacheFilter.origreq";
    /**
     * Name of the request state that marks a request as being a revalidation.
     */
    public final static 
    String STATE_REVALIDATION = "w3c.www.protocol.http.cache.revalidation";
    /**
     * Name of the property that indicates that the cache cab be used.
     */
    public static final 
    String STATE_CACHABLE = "w3c.www.protocol.http.cache";

    public static final
    String STATE_RESOURCE = "w3c.www.protocol.http.cache.resource";

    /**
     * The HTTP warning used to notify of a disconnected cache.
     */
    protected static HttpWarning WARN_DISCONNECTED = null;
    /**
     * The HTTP warning used to mark invalid entries
     */
    protected static HttpWarning WARN_STALE = null;
    /**
     * The HTTP warning used to indicate a heuristic expiration time.
     */
    protected static HttpWarning WARN_HEURISTIC = null;

    static {
	// Build the std "disconnected" warning
	HttpWarning w = null;
	w = HttpFactory.makeWarning(HttpWarning.DISCONNECTED_OPERATION);
	w.setAgent("fake");
	w.setText("The required cached resource is stalled.");
	WARN_DISCONNECTED = w;
	// Build the stale std warning
	w = HttpFactory.makeWarning(HttpWarning.STALE);
	w.setAgent("fake");
	w.setText("The returned entry is stale.");
	WARN_STALE = w;
	// Build the heuristic expiration warning:
	w = HttpFactory.makeWarning(HttpWarning.HEURISTIC_EXPIRATION);
	w.setAgent("fake");
	w.setText("Heuristic expiration time used on this entry.");
	WARN_HEURISTIC = w;
    }

    /**
     * The name of the properties indicating the size of the cache (in bytes).
     * This property will give the value of the disk-based cache size. This
     * value only takes into account the size of the entities saved, not
     * the size of the associated headers.
     * <p>This property defaults to <strong>5000000</strong> bytes.
     */
    public static final 
    String CACHE_SIZE_P = "w3c.www.protocol.http.cache.size";
    /**
     * Name of the property indicating if the cache is in debug mode.
     * <p>This property defaults to <strong>false</strong>.
     */
    public static final 
    String DEBUG_P = "w3c.www.protocol.http.cache.debug";
    /**
     * Name of the property indicating if this cache is shared.
     * <p>This property defaults to <strong>true</strong>.
     */
    public static final
    String SHARED_P = "w3c.www.protocol.http.cache.shared";
    /**
     * Name of the property giving the cache's directory.
     * This property defaults to the current directory.
     */
    public static final
    String CACHE_DIRECTORY_P = "w3c.www.protocol.http.cache.directory";
    /**
     * Name of the property indicating wether the cache is connected or not.
     * This property defaults to <strong>true</strong>.
     */
    public static final 
    String CACHE_CONNECTED_P = "w3c.www.protocol.http.cache.connected";
    /**
     * Name of the property enabling garbage collection of the cache.
     * This property defaults to <strong>true</strong>.
     */
    public static final String GARBAGE_COLLECTION_ENABLED_P
        = "w3c.www.protocol.http.cache.garbageCollectionEnabled";
    /**
     * Name of the property indicating the max size for files to be cached.
     * This property gives the ratio (relative to the cache size) of
     * the number of bytes a single entry is able to occupy.
     * <p>The ratio should be given as a floating point value between 
     * <strong>0</strong> and <strong>1</strong>. If set to <strong>0.1
     * </strong> and the cache size is <strong>5000000</strong>, files larger
     * then <strong>500000</strong> will not be cached (except if garbage
     * collection is disbabled).
     * <p>This property defaults to <strong>0.1</strong>.
     */
    public static final 
    String FILE_SIZE_RATIO_P = "w3c.www.protocol.http.cache.fileSizeRatio";
     
    /**
     * The properties we initialized ourself from.
     */
    protected ObservableProperties props = null;
    /**
     * The directory where the cache is stored.
     */
    protected File directory = null;
    /**
     * The current cache size.
     */
    protected int size = 5000000;
    /**
     * The debug flag.
     */
    protected boolean debug = false;
    /**
     * Is this cached shared ?
     */
    protected boolean shared = false;
    /**
     * Is this cache connected ?
     */
    protected boolean connected = true;
    /**
     * Should we enable garbage collection of the cache ?
     */
    protected boolean garbageCollectionEnabled = true;
    /**
     * The file size quota.
     * <p>Indicates the percentage of cache size allowed to be occupied by a 
     * single file. This is not taken into account when garbage collection is
     * disabled.
     */
    protected double fileSizeRatio = (double) 0.1;

    /**
     * The expires drift. 
     * <p>Control if we will cache already expires documents, in the hope
     * that revalidation will be enough to refresh them, or also because
     * the cache will be used in disconnected mode.
     */
    protected long expires_drift = (3600*48*1000);
    /**
     * Our real time statistics.
     */
    protected cacheStatistics stats = null;

    jdbmResourceStore    store   = null;
    CacheState           state   = null;
    Hashtable            defdefs = null;
    CacheSweeper         sweeper = null;

    /**
     * Add a warning, to be emitted at reply time.
     * The cache filter keeps track, through a specific piece of request state
     * of the warnings to be emitted at reply time (if any).
     * <p>During request processing, cached resources can add any kind
     * of warnings, which will be collected and forwarded back to the reply.
     * @param request The request being process, and whose reply requires
     * some warnings.
     * @param warning The warning to be emitted if ever we use the cache
     * filter to answer the above request.
     */

    protected void addWarning(Request request, HttpWarning warning) {
	Vector vw = (Vector) request.getState(STATE_WARNINGS);
	if ( vw == null ) {
	    vw = new Vector(4);
	    request.setState(STATE_WARNINGS, vw);
	}
	vw.addElement(warning);
    }

    /**
     * Copy all warnings colllected into the given reply.
     * This method collects all HTTP warnings saved during request processing
     * and create (if needed) the approporiate warning header in the given
     * reply.
     * @param request The request that has been processed by the cache filter.
     * @param reply The reply that has been constructed from the cache.
     * @see #addWarning
     */

    protected final void setWarnings(Request request, Reply reply) {
	Vector vw = (Vector) request.getState(STATE_WARNINGS);
	if ( vw == null )
	    return;
	HttpWarning ws[] = new HttpWarning[vw.size()];
	vw.copyInto(ws);
	reply.setWarning(ws);
    }

    protected final void trace(Request request, String msg) {
	System.out.println(request.getURL()+": "+msg);
    }

    protected final void updateCacheSpaceCounter(int delta) {
	// Update the global cache space counter:
	int csize = state.updateCacheSpaceCounter(delta);
	// Start the sweeper, if cache size is reached:
	if ( csize > size ) {
	    if ( isGarbageCollectionEnabled() )
		sweeper.signal();
	}
	return;
    }

    /**
     * Returns a String indicating what the cache did with that request.
     * @param request A request that may have been processed through the cache 
     * filter
     */

    public static String getHow(Request request) {
	Integer how = (Integer) request.getState(STATE_HOW);
	if ( how == null )
	    return "no-cache";
	switch(how.intValue()) {
	  case 1: return "hit";
	  case 2: return "miss";
	  case 3: return "revalidation";
	  case 4: return "retreival";
	  default:
	      return "inv-cache";
	}
    }

    /**
     * Is this cache shared among multiple users ?
     * @return A boolean <strong>true</strong> if shared, 
     * <strong>false</strong> otherwise.
     */

    public final boolean isShared() {
	return shared;
    }

    /**
     * Is this cache connected to the net ?
     * @return A boolean, <strong>true</strong> if the cache is connected,
     * <strong>false</strong> otherwise.
     */

    public final boolean isConnected() {
	return connected;
    }

    /**
     * Are we allow to run garbage collections at all ?
     * @return A boolean <strong>true</strong> if garbage collection is allowed
     * , <strong>false</strong> otherwise.
     */

    public final boolean isGarbageCollectionEnabled() {
	return garbageCollectionEnabled;
    }

    /**
     * Get a file to save that URL in.
     * @param url The URL to be dumped.
     * @return A File instance.
     */

    protected File getFile(URL url) {
	// Make sure the file is killed before returning:
	File file = state.getNextFile();
	file.delete();
	return file;
    }

    /**
     * Mark the given cached resource as having been used recently.
     * @param resource The CachedResource instance that has been used.
     */

    protected void markUsed(CachedResource resource, int osize, int nsize) {
	int curgen = state.getGeneration();
	int resgen = resource.getGeneration();
	int delta  = ((osize < 0) ? nsize : nsize-osize);
	if ( resgen != curgen ) {
	    sweeper.updateGeneration(resource, resgen, curgen);
	    if ( osize > 0 )
		state.updateGenerationSize(resgen, -osize);
	    if ( nsize > 0 )
		state.updateGenerationSize(curgen, nsize);
	} else {
	    if ( delta >  0 )
		state.updateGenerationSize(curgen, delta);
	}
	updateCacheSpaceCounter(delta);
    }
    
    protected void markUsed(CachedResource resource, int nsize) {
	markUsed(resource, -1, nsize);
    }

    protected void markUsed(CachedResource resource) {
	int curgen = state.getGeneration();
	int resgen = resource.getGeneration();
	if ( resgen != curgen ) {
	    int length = resource.getContentLength();
	    sweeper.updateGeneration(resource, resgen, curgen);
	    if ( length > 0 ) {
		state.updateGenerationSize(resgen, -length);
		state.updateGenerationSize(curgen, length);
	    }
	}
    }

    protected boolean checkCacheDirectory(File dir) {
	// Create the root directory for the cache:
	if ((! dir.exists()) && ! dir.mkdirs() ) 
	    return false;
	// Create as many first level dirs as needed:
	for (int i = 0 ; i < CACHEDIR_SPLITS ; i++) {
	    File sub = getSubdirectory(i);
	    if ((! sub.exists()) && ! sub.mkdirs())
		return false;
	}
	return true;
    }

    protected File getSubdirectory(int i) {
	return new File(directory, Integer.toString(i));
    }

    /**
     * PropertyMonitoring implementation - Commit property changes.
     * @param name The name of the property that has changed.
     * @return A boolean <strong>true</strong> if change was commited, 
     * <strong>false</strong> otherwise.
     */

    public boolean propertyChanged(String name) {
	if ( name.equals(CACHE_SIZE_P) ) {
	    size = props.getInteger(name, size);
	    return true;
	} else if ( name.equals(DEBUG_P) ) {
	    debug = props.getBoolean(name, debug);
	    return true;
	} else if ( name.equals(SHARED_P) ) {
	    shared = props.getBoolean(name, shared);
	    return true;
	} else if ( name.equals(CACHE_CONNECTED_P)) {
	    connected = props.getBoolean(name, true);
	    return true;
	} else if ( name.equals(GARBAGE_COLLECTION_ENABLED_P) ) {
	    garbageCollectionEnabled = props.getBoolean(name, true);
	    return true;
	} else if ( name.equals(FILE_SIZE_RATIO_P) ) {
	    double dval = props.getDouble(name, fileSizeRatio);
	    if ((dval <= (double) 0.00001) || (dval >= (double) 1.0))
		return false;
	    fileSizeRatio = dval;
	    return true;
	} else {
	    return true;
	}
    }

    /**
     * Get the total size allocated to the cache.
     * @return The cache size as an integer.
     */

    public final int getCacheSize() {
	return size;
    }

    /** 
     * Initialize a new reuqest manager.
     * At this time, only one manager is allowed per application. This 
     * restriction will  be removed either by using several managers, or
     * by providing manager contexts.
     * @param manager The manager to initialize.
     * @exception FilterInitException If the cache directory couldn't be 
     * created.
     */

    public void initialize(HttpManager manager)
	throws PropRequestFilterException
    {
	// Initialize from properties:
	props     = manager.getProperties();
	debug     = props.getBoolean(DEBUG_P, false);
	shared    = props.getBoolean(SHARED_P, false);
	connected = props.getBoolean(CACHE_CONNECTED_P, true);
	size      = props.getInteger(CACHE_SIZE_P, 5000000);
	directory = props.getFile(CACHE_DIRECTORY_P, null);
	// Check the cache directory:
	if ( directory == null ) {
	    directory = props.getFile("user.dir", new File("."));
	    directory = new File(directory, ".web-cache");
	}
	// Make sure the appropriate cache dir struct exist:
	if ( ! checkCacheDirectory(directory) ) {
	    String msg = ("Unable to create cache directory \""
			 + directory.getAbsolutePath()
			 + "\". Cache disabled.");
	    throw new PropRequestFilterException(msg);
	} 
	// Initialize the cache store:
	store = new jdbmResourceStore();
	store.initialize((ResourceStoreManager) null
			 , null
			 , new File(directory, "cache.db"));
	// Initialize default attributes for loaded resources
	defdefs = new Hashtable(5);
	defdefs.put("cache-filter", this);
	// Register for property changes:
	props.registerObserver(this);
	// Start the ActiveStream handler:
	ActiveStream.initialize();
	// Try getting back the state of the cache from the store, or create
	long start = System.currentTimeMillis();
	if ( debug )
	    System.out.println("Restoring state...");
        this.state = new CacheState(this, store);
	if ( debug ) {
	    System.out.println("Restored state in "
			       +(System.currentTimeMillis()-start)
			       + " ms.");
	    state.print(System.out);
	}
	// Start the cache sweeper (the cache collector):
	sweeper = new CacheSweeper(this);
	sweeper.start();
	// Now, we are ready, register that filter:
	manager.setFilter(this);
    }

    /**
     * Get the statistics repository associated with that filter.
     * @return An instance of cacheStatistics.
     */

    public cacheStatistics getStatistics() {
	return stats;
    }

    /**
     * Try to load from the cache the resource's whose URL is gievn.
     * @param url The String version of the url of the resource to load.
     * @return An instance of <code>CachedResource</code> (or one of its
     * subclasses), or <strong>null</strong> if not found.
     */

    public CachedResource loadResource(String url) 
	throws InvalidResourceException 
    {
	return (CachedResource) store.loadResource(url, defdefs);
    }

    /**
     * Does the cache knows about this resource ?
     * @return A boolean <strong>true</strong> if this resource is known,
     * <strong>false</strong> otherwise.
     */

    public boolean hasResource(String url) {
	boolean ret = store.hasResource(url);
	if ( debug )
	    System.out.println("hasResource "+url+"="+ret);
	return ret;
    }

    /**
     * Remove a resource from the cache.
     * @param urlloc The URL of the resource to remove, encoded as a String.
     */

    public void removeResource(String urlloc) {
	CachedResource res = null;
	try {
	    res = loadResource(urlloc);
	} catch (InvalidResourceException ex) {
	    res = null;
	}
	if ( res == null ) 
	    store.removeResource(urlloc);
	else
	    res.delete();
    }
	
    /**
     * Can the given request be fullfilled by the cache filter ?
     * This method distinguishes two situations. It first check if anything 
     * in the request makes it uncachable, if this is the case, processing
     * continues normally. If the request can be answered by the cache, we
     * mark it as such by setting the <code>w3c.www.protocol.http.cache</code>
     * state of the request to <strong>Boolean.TRUE</strong>, ans we return
     * <strong>true</strong>.
     * @return A boolean, <strong>true</strong> if the request can be 
     * fullfilled by the cache, <strong>false</strong> otherwise.
     */

    public boolean canUseCache(Request request) {
	// Check the request method
	// FIXME this is not defined in HTTP/1.1
	String mth = request.getMethod();
	if ( ( ! mth.equals("GET")) && (! mth.equals("HEAD")) ) {
	    if ( debug )
		trace(request, "not caching, method="+mth);
	    return false;
	}
	// Check for no-cache, or pragma no-cache:
	String nocache[] = request.getNoCache();
	if ((nocache != null) && (nocache.length == 0)) 
	    return false;
	if ( request.hasPragma("no-cache") )
	    return false;
	// Check against the no-store directive:
	if (request.checkNoStore())
	    return false;
	request.setState(STATE_CACHABLE, Boolean.TRUE);
	return true;
    }
     
    /**
     * Can the given reply to the given request be added to the cache.
     * This method performs all checks to detect wether the given
     * request, reply can be cached.
     * <p>We don't check for expires or maxage here, since we expect some sites
     * to use <em>negative</em> expires, or <em>zero</em> max age, just for
     * the sake of revalidation (that's fine).
     * @return A boolean <strong>true</strong> if we can cache, 
     * <strong>false</strong> otherwise.
     */

    public boolean canCache(Request request, Reply reply) {
	// If the request was marked as not cachable, skip right ahead:
	if ( request.hasState(STATE_NOCACHE) )
	    return false;
	// If the reply has a content length, and it's too big, don't cache:
	int len = reply.getContentLength();
	if ( (len >= size*fileSizeRatio) && garbageCollectionEnabled )
	    return false;
	// Check the status code:
	switch(reply.getStatus()) {
	  case HTTP.OK:
	  case HTTP.PROVISIONAL_INFORMATION:
//	  case HTTP.PARTIAL_CONTENT:
	  case HTTP.MULTIPLE_CHOICE:
	  case HTTP.MOVED_PERMANENTLY:
          // FIXME (this should not be here, according to 1.1)
	  case HTTP.MOVED_TEMPORARILY:
	  case HTTP.GONE:
	      break;
	  default:
	      return false;
	}
	// If a HTTP/1.0 reply...
	if ((reply.getMajorVersion() == 1) && (reply.getMinorVersion() == 0)) {
	    // HTTP/1.0 is flaky on CGI scripts:
	    String file = request.getURL().getFile();
	    if ( file.startsWith("/cgi-bin") )
		return false;
	}
	// HTTP/1.1, Section 14.9.1, private
	if ( isShared() ) {
	    String priv[] = reply.getPrivate();
	    if ((priv != null) && (priv.length == 0))
		return false;
	}
	// HTTP/1.1, Section 14.9.1, no-cache and no-store:
	String nocache[] = reply.getNoCache();
	if ((nocache != null) && (nocache.length == 0))
	    return false;
	if ( reply.checkNoStore() )
	    return false;
	// Check Authorixation stuff:
	if ( request.hasAuthorization() ) {
	    // HTTP/1.1, Section 14.9.1, public
	    if (reply.checkPublic())
		return true;
	    // HTTP/1.1, Section 14.8, proxy-revalidate
	    if (reply.checkProxyRevalidate())
		return true;
	    // HTTP/1.1, Section 14.8, must-revalidate
	    if (reply.checkMustRevalidate())
		return true;
	    // This also takes into account 1.0 broken replies
	    if ( isShared() )
		return false;
	}
	// Check expires (at least in some bounds)
	long expires = reply.getExpires();
	if ((expires >= 0) 
	    && (expires < System.currentTimeMillis() - expires_drift ))
	    return false;
	if ( reply.hasPragma("no-cache") )
	    return false;
	// Yeah !
	return true;
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

    // FIXME doc

    public Reply ingoingFilter(Request request) 
	throws HttpException
    {
	// Has the filter been disabled ?
	if ( request.hasState(STATE_NOCACHE) )
	    return null;
	// Proceed:
	if ( ! canUseCache(request) ) {
	    if ( ! isConnected() ) {
		// Don't continue, if cache is disconnected.
		if ( debug )
		    trace(request, "unavailable (disconnected).");
		Reply reply = request.makeReply(HTTP.GATEWAY_TIMEOUT);
		reply.setContent("The cache cannot be use for "
				 + "<p><code>"+request.getMethod()+"</code> "
				 + "<strong>"+request.getURL()+"</strong>"
				 + ". <p>It is disconnected.");
		return reply;
	    } else {
		// If this is a PUT, invalid relevant cache entry:
		if ( debug )
		    trace(request, "can't use cache.");
		if ( request.getMethod().equals("PUT") ) 
		    store.removeResource(request.getURL().toExternalForm());
		request.setState(STATE_NOCACHE, Boolean.TRUE);
		return null;
	    }
	}
	// Ok, we can try to use a cached version...
	String         url = request.getURL().toExternalForm();
	CachedResource res = null;
	try {
	    res = loadResource(url);
	} catch (InvalidResourceException ex) {
	    res = null;
	}
	if ( res == null ) {
	    // This was an only-if-cached, don't continue:
	    if (request.checkOnlyIfCached() || ( ! isConnected()) ) {
		if ( debug )
		    trace(request, "unavailable (disconnected).");
		Reply reply = request.makeReply(HTTP.GATEWAY_TIMEOUT);
		reply.setContent("The cache doesn't have an entry for "
				 + "<p><strong>"+request.getURL()+"</strong>"
				 + ". <p>And it is disconnected.");
		return reply;
	    } 
	    return null;
	} 
	// Before going any further, we clone the original request:
	Request reqorig = (Request) request.getClone();
	request.setState(STATE_ORIGREQ, reqorig);
	// Is this resource valid for answering this request ?
	HttpWarning warning = null;
	if ( ! res.isValid(request) ) {
	    if ( request.checkOnlyIfCached() || ! isConnected()) {
		// We really want to use the cache, whatever
		addWarning(request, WARN_DISCONNECTED);
	    } else {
		// Let's continue through the revalidation process:
		request.setState(STATE_REVALIDATION, Boolean.TRUE);
		return null;
	    }
	}
	// Yeah ! We win:
	if ( debug )
 	    trace(request, "uses cache.");
	Reply reply = res.perform(reqorig);
	// Add any warnings collected during processing to the reply:
	setWarnings(request, reply);
	request.setState(STATE_HOW, HOW_HIT);
	return reply;
    }

    public Reply outgoingFilter(Request request, Reply reply) 
	throws HttpException
    {
	// Is caching disabled for that request ?
	if ( request.hasState(STATE_NOCACHE) ) 
	    return null;
	// If the request was linked to a resource, notify that resource:
	CachedResource c = (CachedResource) request.getState(STATE_RESOURCE);
	if ( c != null ) {
	    try {
		if ( debug )
		    trace(request, "revalidated "+reply.getStatus());
		request.setState(STATE_HOW
				 , ((reply.getStatus() == HTTP.NOT_MODIFIED)
				    ? HOW_REVALIDATION_SUCCESS
				    : HOW_REVALIDATION_FAILURE));
		return c.validate(request, reply);
	    } catch (IOException ex) {
		if ( debug )
		    trace(request, "cache IO error.");
		c.delete();
		throw new HttpException(request,
					"Cache failed (IO error):" 
					+ ex.getMessage());
	    }
	} else {
	    // Can we cache this new reply ?
	    if ( ! canCache(request, reply) ) {
		if ( debug )
		    trace(request, "can't cache.");
		request.setState(STATE_NOCACHE, Boolean.TRUE);
		return null;
	    }
	    // Yeah ! We win:
	    URL url = request.getURL();
	    try {
		CachedResource r = null;
		r = CachedResourceFactory.createResource(this, request, reply);
		store.addResource(r);
		if ( debug )
		    trace(request, "enters cache.");
	    } catch (Exception ex) {
		ex.printStackTrace();
	    }
	    // This was a miss though:
	    request.setState(STATE_HOW, HOW_MISS);
	}
	return null ;
    }

    /**
     * Push a document in the cache.
     * The caller has to forge a a request and a reply before being able
     * to make something
     * enter the cache. 
     * The request should provide at least:
     * <dl>
     * <dt>URL<dl>The URL (key for cache lookups)
     * <dt>Method<dl>The method that was "applied" to URL to get forged
     * reply.
     * </dl>
     * <p>It is recommended that the reply provides at least
     * the following informations:
     * <dl>
     * <dt>Status Code</dl>A valid HTTP/1.1 status code (probably <strong>
     * 200</code>)
     * <dt>InputStream<dl>Containing the entity to be cached,
     * <dt>EntityTag<dl>A valid entity tag for the document,
     * <dt>CacheControl<dl>Appropriate HTTP/1.1 cache controls for that
     *     document,
     * <dt>Mime headers<dl>At least a valid content type, and probably a
     *     content length (to check consistency with the reply body).
     * </dt>
     */
    
    public void pushDocument(Request request, Reply reply) {
	URL url = request.getURL();
	try {
	    CachedResource r = null;
	    r = CachedResourceFactory.createResource(this, request, reply);
	    store.addResource(r);
	    if ( debug )
		trace(request, "enters cache.");
	} catch (Exception ex) {
	    ex.printStackTrace();
	}
    }

    /**
     * Save all cache related infos to stable storage.
     */

    public void sync() {
	try {
	    store.save();
	} catch (Exception ex) {
	    System.err.println(getClass().getName()+": Unable to save cache.");
	}
    }

    
}

