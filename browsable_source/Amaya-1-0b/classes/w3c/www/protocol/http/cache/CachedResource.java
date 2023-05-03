// CachedResource.java
// $Id: CachedResource.java,v 1.3 1997/04/03 09:07:18 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html


package w3c.www.protocol.http.cache;

import java.net.*;
import java.util.*;
import java.io.*;

import w3c.util.*;
import w3c.tools.store.*;
import w3c.www.http.*;
import w3c.www.protocol.http.*;
import w3c.www.mime.*;

public class CachedResource extends Resource implements TeeMonitor {
    private static final int ACTIVE_STREAM_THRESOLD = 512;

    /**
     * Condition check return code - Condition existed but failed.
     */
    public static final int COND_FAILED = 1;
    /**
     * Condition check return code - Condition existed and succeeded.
     */
    public static final int COND_OK = 2;
    /**
     * The default maxage, set to less then 24 hours, as specified in HTTP/1.1
     */
    protected static long DEFAULT_MAXAGE = (24 * 3600 * 1000);
    /**
     * Attribute index - The path of the file that has the resource content.
     */
    protected static int ATTR_FILE = -1;
    /**
     * Attribute index - The resource content type.
     */
    protected static int ATTR_CONTENT_TYPE = -1;
    /**
     * Attribute index - The resource content length.
     */
    protected static int ATTR_CONTENT_LENGTH = -1;
    /**
     * Attribute index - The resource's max age.
     */
    protected static int ATTR_MAXAGE = -1;
    /**
     * Attribute index - The initial age of this resource.
     */
    protected static int ATTR_INITAGE = -1;
    /**
     * Attribute index - The response time of the cached response.
     */
    protected static int ATTR_RESPONSE_TIME = -1;
    /**
     * Attribute index - The last modified date of the cached content
     */
    protected static int ATTR_LAST_MODIFIED = -1;
    /**
     * Attribute index - Does this cached resource should revalidate.
     */
    protected static int ATTR_REVALIDATE = -1;
    /**
     * Attribute index - The cache filter that manages us.
     */
    protected static int ATTR_CACHE_FILTER = -1;
    /**
     * Attribute index - The date at which the reply was emited.
     */
    protected static int ATTR_DATE = -1;
    /**
     * Attribute index - The reply status.
     */
    protected static int ATTR_STATUS = -1;
    /**
     * Attribute index - The entity tag (if any) associated with the resource.
     */
    protected static int ATTR_ETAG = -1;
    /**
     * Attribute index - This cached resource generation.
     */
    protected static int ATTR_GENERATION = -1;
    /**
     * Attribute index - The extension headers attribute.
     */
    protected static int ATTR_EXTRA_HEADERS = -1;

    static {
	Attribute a = null;
	Class     c = null;
	try {
	    c = Class.forName("w3c.www.protocol.http.cache.CachedResource");
	} catch (Exception ex) {
	    ex.printStackTrace();
	    System.exit(1);
	}
	// Declare the File attribute:
	a = new FileAttribute("file"
			      , null
			      , Attribute.COMPUTED);
	ATTR_FILE = AttributeRegistry.registerAttribute(c, a);
	// Declare the contenht type attribute:
	a = new MimeTypeAttribute("content-type"
				  , null
				  , Attribute.COMPUTED);
	ATTR_CONTENT_TYPE = AttributeRegistry.registerAttribute(c, a);
	// Declare the content length attribuite:
	a = new IntegerAttribute("content-length"
				 , null
				 , Attribute.COMPUTED);
	ATTR_CONTENT_LENGTH = AttributeRegistry.registerAttribute(c, a);
	// Declare the max-age value.
	a = new LongAttribute("max-age"
			      , null
			      , Attribute.COMPUTED);
	ATTR_MAXAGE = AttributeRegistry.registerAttribute(c, a);
	// Declare the time stamp attribute
	a = new LongAttribute("initial-age"
			      , null
			      , Attribute.COMPUTED);
	ATTR_INITAGE = AttributeRegistry.registerAttribute(c, a);
	// Declare the reponse-time attribute
	a = new LongAttribute("response-time"
			      , null
			      , Attribute.COMPUTED);
	ATTR_RESPONSE_TIME = AttributeRegistry.registerAttribute(c, a);
	// Declare the last-modified attribute value.
	a = new LongAttribute("last-modified"
			      , null
			      , Attribute.COMPUTED);
	ATTR_LAST_MODIFIED = AttributeRegistry.registerAttribute(c, a);
	// Declare the revalidate attribute value.
	a = new BooleanAttribute("revalidate"
				 , Boolean.FALSE
				 , Attribute.COMPUTED);
	ATTR_REVALIDATE = AttributeRegistry.registerAttribute(c, a);
	// Declare the cache filter attribute:
	a = new ObjectAttribute("cache-filter"
				, "w3c.www.protocol.http.cache.CacheFilter"
				, null
				, Attribute.DONTSAVE|Attribute.EDITABLE);
	ATTR_CACHE_FILTER = AttributeRegistry.registerAttribute(c, a);
	// Declare the date attribute.
	a = new LongAttribute("date"
			      , null
			      , Attribute.COMPUTED);
	ATTR_DATE = AttributeRegistry.registerAttribute(c, a);
	// Declare the status attribute:
	a = new IntegerAttribute("status"
				 , null
				 , Attribute.COMPUTED);
	ATTR_STATUS = AttributeRegistry.registerAttribute(c, a);
	// This resource ntity tag:
	a = new StringAttribute("etag"
				, null
				, Attribute.COMPUTED);
	ATTR_ETAG = AttributeRegistry.registerAttribute(c, a);
	// This resource generation number:
	a = new IntegerAttribute("generation"
				 , new Integer(0)
				 , Attribute.COMPUTED);
	ATTR_GENERATION = AttributeRegistry.registerAttribute(c, a);
	// The extra headers attribute:
	a = new PropertiesAttribute("headers"
				    , null
				    , Attribute.COMPUTED);
	ATTR_EXTRA_HEADERS = AttributeRegistry.registerAttribute(c, a);
    }

    // Cached Entity tag HTTP list value for this resource.
    HttpEntityTag etags[] = null;
    // The cache filter we are attached to
    CacheFilter   filter  = null;

    public void setValue(int idx, Object value) {
	super.setValue(idx, value);
	if ( idx == ATTR_ETAG )
	    etags = null;
    }

    public boolean isShared() {
	return filter.isShared();
    }

    /**
     * Compute a reasonable default value for the max-age of this resource.
     * <p>This method computes and sets the default max age for this resource,
     * it should be called as a last resort only.
     */

    protected void setDefaultMaxAge() {
	setMaxAge(DEFAULT_MAXAGE);
    }

    /**
     * Get the file in which that resource's content is saved.
     * @return A File instance.
     */

    public File getFile() {
	return (File) getValue(ATTR_FILE, null);
    }

    /**
     * Set the file to which that resource's content should be saved into.
     * @param file The file to use.
     */

    public void setFile(File file) {
	setValue(ATTR_FILE, file);
    }

    /**
     * Get the content type associated to that cache entry.
     * @return A MimeType instance, or <strong>null</strong> if undefined.
     */

    public MimeType getContentType() {
	return (MimeType) getValue(ATTR_CONTENT_TYPE, null);
    }

    /**
     * Set this cached entry content-type.
     * @param type The new content type for that entry.
     */

    public void setContentType(MimeType type) {
	setValue(ATTR_CONTENT_TYPE, type);
    }

    /**
     * Get this cached entry content length.
     * @return An integer, giving the content length, or <strong>-1</strong>
     * if undefined.
     */

    public int getContentLength() {
	return getInt(ATTR_CONTENT_LENGTH, -1);
    }

    /**
     * Set the content length of that cached entry.
     * @param length The new content length of that entry.
     */

    public void setContentLength(int length) {
	setInt(ATTR_CONTENT_LENGTH, length);
    }

    /**
     * Get this resource's max age.
     * @return A long number of milliseconds for which that entry will remain
     * valid, or <strong>-1</strong> if undefined.
     */
     
    public long getMaxAge() {
	return getLong(ATTR_MAXAGE, (long) -1);
    }

    /**
     * Set this cached entry max age.
     * @param maxage A number of milliseconds during which the entry will 
     * remain valid, or <strong>-1</strong> to undefine previous setting.
     */

    public void setMaxAge(long maxage) {
	setLong(ATTR_MAXAGE, maxage);
    }

    /**
     * Get this cached entry initial age.
     * @return A long number of milliseconds giving the initial age relative
     * to Java epoch, or <strong>-1</strong> if undefined.
     */

    public long getInitialAge() {
	return getLong(ATTR_INITAGE, (long) -1);
    }

    /**
     * Set this resource's initial age.
     * @param initage The initial age as a number of milliseconds since Java 
     * epoch, or <strong>-1</strong> to undefine previous setting.
     */

    public void setInitialAge(long initage) {
	setLong(ATTR_INITAGE, initage);
    }

    /**
     * Get the time of the response used to cached that entry.
     * @return A long number of milliseconds since Java epoch, or <strong>
     * -1</strong> if undefined.
     */

    public long getResponseTime() {
	return getLong(ATTR_RESPONSE_TIME, -1);
    }

    /**
     * Set this cached entry response time.
     * @param responsetime A long number of milliseconds indicating the 
     * response time relative to Java epoch, or <strong>-1</strong> to 
     * undefined previous setting.
     */

    public void setResponseTime(long responsetime) {
	setLong(ATTR_RESPONSE_TIME, responsetime);
    }

    /**
     * Get the last modified time of that entry.
     * This usually corresponds to the <code>Last-Modified</code> HTTP header.
     * @return A long number of milliseconds since java epoch giving the last
     * modified date of the cached entry, or <strong>-1</strong> if undefined.
     */

    public long getLastModified() {
	return getLong(ATTR_LAST_MODIFIED, -1);
    }

    /**
     * Set the last modified time of that cached entry.
     * @param lastmodified The last modification date as a number of 
     * milliseconds since Java epoch, or <strong>-1</strong> to undefine
     * previous setting.
     */

    public void setLastModified(long lastmodified) {
	setLong(ATTR_LAST_MODIFIED, lastmodified);
    }

    /**
     * Should this cache entry always be revalidated ?
     * @return A boolean, <strong>true</strong> if revalidation is always
     * needed before serving it, <strong>false</strong> otherwise.
     */

    public boolean getRevalidate() {
	return getBoolean(ATTR_REVALIDATE, false);
    }

    /**
     * Set the revalidation flag for that cached entry.
     * @param A boolean.
     */

    public void setRevalidate(boolean onoff) {
	setBoolean(ATTR_REVALIDATE, onoff);
    }

    /**
     * Get the HTTP date of the reply used to created that entry.
     * @return The HTTP date encoded as the number of milliseconds relative
     * to Java epoch, or <strong>-1</strong> if undefined.
     */

    public long getDate() {
	return getLong(ATTR_DATE, -1);
    }

    /**
     * Set the HTTP date of the reply used to create or update that entry.
     * @param date The HTTP date encoded as a number of milliseconds since 
     * Java epoch, or <strong>-1</strong> to undefine previous setting.
     */
     
    public void setDate(long date) {
	setLong(ATTR_DATE, date);
    }

    /**
     * Get the HTTP status of that cached entry.
     * @return An integer HTTP status code, or <strong>-1</strong> if 
     * undefined.
     */

    public int getStatus() {
	return getInt(ATTR_STATUS, -1);
    }

    /**
     * Set the reply status for that entry.
     * @param status The HTTP status code of that entry, or <strong>-1</strong>
     * to undefine the previous setting.
     */

    public void setStatus(int status) {
	setInt(ATTR_STATUS, status);
    }

    /**
     * Get the entity tag associated with that cached entry.
     * @return The String encoded entity tag, or <strong>null</strong> if 
     * undefined.
     */

    public String getETag() {
	return getString(ATTR_ETAG, null);
    }

    /**
     * Associate an entity tag with that cached enrty.
     * @param etag The entity tag of the entry, or <strong>null</strong>
     * to reset the value.
     */

    public void setETag(String etag) {
	setValue(ATTR_ETAG, etag);
    }

    /**
     * Get the generation of that cached entry.
     * @return An integer giving the generation number of that resource.
     */

    public int getGeneration() {
	return getInt(ATTR_GENERATION, -1);
    } 

    /**
     * Set the generation number of that resource.
     * @param generation The new generation number of that resource.
     */

    public void setGeneration(int generation) {
	// Avoid dirty'ing the resource itself, if possible:
	if ( generation != getGeneration() )
	    setInt(ATTR_GENERATION, generation);
    }

    /**
     * Get the extra headers stored for that resource.
     * @return An ArrayDictionary with the extra headers, or <strong>null
     * </strong> if undefined.
     */

    public ArrayDictionary getExtraHeaders() {
	return (ArrayDictionary) getValue(ATTR_EXTRA_HEADERS, null);
    }

    /**
     * Set a new set of extra headers for that resource.
     * @param headers The new set of headers.
     */

    public void setExtraHeaders(ArrayDictionary a) {
	setValue(ATTR_EXTRA_HEADERS, a);
    }

    /**
     * Get the cached data for that cached entry.
     * @return A <em>non-buffered</em> output stream.
     */

    public synchronized InputStream getInputStream() 
	throws IOException
    {
	return new BufferedInputStream(new FileInputStream(getFile()));
    }

    public void notifyTeeFailure() {
	// FIXME, invalidate the whole cached resource
	System.out.println(getIdentifier()+": tee streaming failed !");
	cleanUpload();
	// Delete this resource from the cache:
	delete();
    }

    public synchronized void notifyTeeSuccess(int size) {
        try {
	    if ( upnewsize > 0 ) {
		if ( size != upnewsize ) {
		    System.out.println(getIdentifier()
				       +": tee stream mismatch, "
				       + "bytes(adv/got)="+upnewsize+"/"+size);
		    setContentLength(upnewsize = size);
		    delete();
		}
	    } else {
		setContentLength(upnewsize = size);
	    }
	    // Update cache filter space usage:
	    filter.markUsed(this, upoldsize, upnewsize);
	} finally {
	    cleanUpload();
	}
    }
    
    boolean uploading = false;
    int     upoldsize = -1;
    int     upnewsize = -1;

    /**
     * Try using an active stream to cache the content.
     * Byte size usage is taken care of only at the end of the download
     * to make sure we get the right sizes (might different from the
     * advertized ones).
     * @return An InputStream instance if active caching was possible,
     * <strong>null</strong> otherwise.
     */

    public synchronized InputStream tryActiveCacheContent(InputStream in)
	throws IOException
    {
	// If we don't return null, we *are* responsible for cleaning up
	// the upload *whatever* happens ...
	InputStream  tee = null;
	OutputStream out = null;
	// Open the output stream:
	try {
	    out = new FileOutputStream(getFile());
	} catch (IOException ex) {
	    // We'll let cacheContent take care of that situation:
	    return null;
	}
	// We might be able to use active streams:
	if (upnewsize > ACTIVE_STREAM_THRESOLD ) {
	    tee = ActiveStream.createTee(this, in, out);
	    if ( tee != null )
		return tee;
	} 
	// We were not able to active stream:
	try {
	    out.close();
	} catch (IOException ex) {
	}
	return null;
    }

    /**
     * Cache this content, then return the corresponding stream.
     * This method is called as a fallback to 
     * <code>tryActiveCacheContent</code>. At the end of the method, the
     * cache filter is notified of byte size usage.
     */

    public synchronized InputStream cacheContent(InputStream in) 
	throws IOException
    {
	IOException error = null;

	try {
	    // Ok, let's do the dumb way and update cache size straight:
	    OutputStream out = new FileOutputStream(getFile());
	    byte buffer[] = new byte[ACTIVE_STREAM_THRESOLD];
	    int  count    = 0;
	    int  total    = 0;
	    // We may get an IOException if reading from a peer's closed:
	    try {
		while ((count = in.read(buffer)) > 0) {
		    out.write(buffer, 0, count);
		    total += count;
		}
		out.close();
		in.close();
	    } catch (IOException ex) {
		error = ex;
	    }
	    // Check that we got the right number of bytes:
	    if ( error != null ) {
		if ((upnewsize > 0) && (total != upnewsize)) {
		    // We really can't keep that in the cache:
		    setContentLength(total);
		    delete();
		    throw ((error != null)
			   ? error
			   : new IOException("Invalid content stream"));
		} else {
		    // Only now do we now the size of the content:
		    setContentLength(total);
		}
	    }
	    // Update our delta'ed size:
	    filter.markUsed(this, upoldsize, total);
	    return getInputStream();
	} finally {
	    cleanUpload();
	}
    }

    /**
     * Cache all the headers that can be cached after the given transaction.
     * Most reply headers are cached as attributes, other ones are left over
     * to a slow, dictionary.
     * @param request The request that triggered the reply.
     * @param reply The origin server's reply.
     */

    public void setResourceHeaders(Request request, Reply reply) {
	// Well known headers first:
	if ( reply.hasHeader(reply.H_CONTENT_TYPE) )
	    setContentType(reply.getContentType());
	if ( reply.hasHeader(reply.H_CONTENT_LENGTH) )
	    setContentLength(reply.getContentLength());
	if ( reply.hasHeader(reply.H_LAST_MODIFIED) )
	    setLastModified(reply.getLastModified());
	if ( reply.hasHeader(reply.H_ETAG) )
	    setETag(reply.getETag().getTag());
	// We hope not to end up here as much as possible:
	ArrayDictionary a = new ArrayDictionary(5, 5);
	Enumeration     e = reply.enumerateHeaderDescriptions();
	while ( e.hasMoreElements() ) {
	    HeaderDescription d = (HeaderDescription) e.nextElement();
	    // Skip all well-known headers:
	    if ( d.isHeader(Reply.H_CONTENT_TYPE)
		 || d.isHeader(Reply.H_CONTENT_LENGTH)
		 || d.isHeader(Reply.H_LAST_MODIFIED)
		 || d.isHeader(Reply.H_ETAG)
		 || d.isHeader(Reply.H_AGE)
		 || d.isHeader(Reply.H_DATE)
		 || d.isHeader(reply.H_CONNECTION))
		continue;
	    // This is an extra header:
	    a.put(d.getName(), reply.getValue(d));
	}
	// This one is a real nightmare
	String nocache[] = reply.getNoCache();
	if ((nocache != null) && (nocache.length > 0)) {
	    for (int i = 0 ; i < nocache.length ; i++) 
		a.remove(nocache[i].toLowerCase());
	}
	// This will cost a resource pickling on revalidation...
	setExtraHeaders(a);
    }

    /**
     * Dump all our knowledge about this cached resource into the reply.
     * @param reply The reply we are building.
     */

    public void setReplyHeaders(Reply reply) {
	ArrayDictionary a = getExtraHeaders();
	if ( reply.getStatus() != HTTP.NOT_MODIFIED ) {
	    int cl = getContentLength();
	    if ((cl > 0) && (reply.getStatus() != HTTP.PARTIAL_CONTENT))
		reply.setContentLength(getContentLength());
	    reply.setContentType(getContentType());
	    reply.setLastModified(getLastModified());
	    // Take all remaining extra headers, and define them:
	    if ( a != null ) {
		// This is the slowest operation of the whole cache :-(
		Enumeration e = a.keys();
		while (e.hasMoreElements() ) {
		    String hname  = (String) e.nextElement();
		    String hvalue = (String) a.get(hname);
		    reply.setValue(hname, hvalue);
		}
	    }
	} else {
	    // Unset from orig reply, the headers that are not needed:
	    reply.setContentLength(-1);
	    // Just pick the mandatory ones (HTTP/1.1, draft 7, 10.3.5)
	    // I am happy not to have to write the *fastest* server
	    if ( a != null ) {
		String str = (String) a.get("cache-control");
		if ( str != null )
		    reply.setValue("cache-control", str);
		str = (String) a.get("expires");
		if ( str != null )
		    reply.setValue("expires", str);
		str = (String) a.get("vary");
		if ( str != null )
		    reply.setValue("vary", str);
		str = (String) a.get("content-location");
		if ( str != null )
		    reply.setValue("content-location", str);
	    }
	}
	reply.setAge((int) (computeCurrentAge() / 1000));
	long date = getDate();
	if ( date > 0 )
	    reply.setDate(getDate());
	// Always send the etag, if available:
	if ((etags == null) && definesAttribute(ATTR_ETAG)) {
	    etags    = new HttpEntityTag[1];
	    etags[0] = HttpFactory.parseETag(getETag());
	}
	if ( etags != null ) 
	    reply.setETag(etags[0]);
    }

    /**
     * Update an original request for a revalidation.
     * This method updates the original request to use as much conditionals
     * as possible.
     * @param request The request to update.
     */

    public void setRequestValidation(Request request) {
	request.setState(CacheFilter.STATE_RESOURCE, this);
	// At this point, we use the suggested way of using date as etag:
	if (definesAttribute(ATTR_LAST_MODIFIED))
	    request.setIfModifiedSince(getLastModified());
	else
	    request.setIfModifiedSince(-1);
	// But if we do have an etag, we also uses it, as recommended:
	if ((etags == null) && definesAttribute(ATTR_ETAG)) {
	    etags    = new HttpEntityTag[1];
	    etags[0] = HttpFactory.parseETag(getETag());
	}
	if ( etags != null ) 
	    request.setIfNoneMatch(etags);
	else
	    request.setIfNoneMatch(null);
	// We have to remove all other conditionals here:
	request.setIfRange(null);
	request.setRange(null);
	request.setIfUnmodifiedSince(-1);
	request.setIfMatch(null);
    }

    /**
     * Mark that resource as now being loaded.
     */

    protected synchronized void cleanUpload() {
	this.uploading = false;
	this.upnewsize = -1;
	this.upoldsize = -1;
	notifyAll();
    }

    /**
     * Is this resource already being loaded from the net.
     * If not, mark that resource has currently being uploaded. When that 
     * method returns <strong>true</strong>, the caller MUST make sure
     * the <code>cleanUpload</code> method gets called latter on.
     * @param upoldsize The old size of cache entry (if available)
     * @param upnewsize The expected size of the entry.
     * @return A boolean, <strong>true</strong> if that resource is being
     * loaded, <strong>false</strong> otherwise.
     */

    protected final synchronized boolean notifyUploading(int upoldsize
							 , int upnewsize) {
	if ( uploading ) {
	    return true;
	} else {
	    uploading      = true;
	    this.upoldsize = upoldsize;
	    this.upnewsize = upnewsize;
	    return false;
	}
    }

    /**
     * Wait for the upload to finish, if needed.
     */

    protected final synchronized void waitUpload() {
	while ( uploading ) {
	    try {
		wait();
	    } catch (InterruptedException ex) {
	    }
	}
    }

    /**
     * Given an HTTP transaction, validate that cached entry.
     * @param request The request that we used to validate.
     * @param reply The origin's server reply.
     * @return A reply instance suitable to emit back to the client.
     */

    public synchronized Reply validate(Request request, Reply reply)
	throws IOException
    {
	String      mth       = request.getMethod();
	boolean     hasEntity = !(mth.equals("HEAD") || mth.equals("OPTIONS"));
	InputStream in        = null;
	// Do we need to update the cached content ?
	if ((reply.getStatus() != HTTP.NOT_MODIFIED)
	    && (reply.getStatus() != HTTP.PRECONDITION_FAILED)) {
	    int oldsz = getContentLength();
	    // Save a number of usefull 1.0/1.1 header values:
	    setStatus(reply.getStatus());
	    setResourceHeaders(request, reply);
	    // Try active caching (if reply has a stream):
	    if ( hasEntity ) {
		// Mark that entry as being loaded
		// Once marked, it is mandatory to notify end of load
		// through a call to cleanUpload.
		if ( notifyUploading(oldsz, reply.getContentLength()) )
		    return null;
		in = tryActiveCacheContent(reply.getInputStream());
		if ( in == null ) 
		    in = cacheContent(reply.getInputStream());
		reply.setStream(in);
	    } else {
		reply.setStream(null);
	    }
	} else {
	    // Check against the original request for successfull cond:
	    Request or = (Request) request.getState(CacheFilter.STATE_ORIGREQ);
	    int     st = HTTP.OK;
	    if ( checkIfMatch(or) == COND_FAILED ) {
		st        = HTTP.PRECONDITION_FAILED;
		hasEntity = false;
	    } else if ( checkIfNoneMatch(or) == COND_FAILED ) {
		st        = HTTP.NOT_MODIFIED;
		hasEntity = false;
	    } else if ( checkIfModifiedSince(or) == COND_FAILED ) {
		st        = HTTP.NOT_MODIFIED;
		hasEntity = false;
	    } else if ( checkIfUnmodifiedSince(or) == COND_FAILED ) {
		st        = HTTP.PRECONDITION_FAILED;
		hasEntity = false;
	    } 
	    reply.setStatus(st);
	    // Override cached headers with new values when available:
	    setResourceHeaders(request, reply);
	    reply.setStream(hasEntity ? getInputStream() : null);
	}
	// Update the age of this resource:
	updateAges(request, reply);
	setReplyHeaders(reply);
	return reply;
    }

    /**
     * Try to validate an <code>If-Modified-Since</code> request.
     * @param request The request to validate.
     * @return An integer, <code>COND_FAILED</code>, if the condition  was
     * checked, but failed; <code>COND_OK</code> of condition was checked
     * and succeeded, <strong>0</strong> otherwise.
     */

    public int checkIfModifiedSince(Request request) {
	long ims = request.getIfModifiedSince();
	long cmt = getLastModified();
	if ( ims >= 0 )
	    return ((cmt > 0) && (cmt - 1000 <= ims)) ? COND_FAILED : COND_OK;
	return 0;
    }

    /**
     * Try to validate an <code>If-Unmodified-Since</code> request.
     * @param request The request to validate.
     * @return An integer, <code>COND_FAILED</code>, if the condition  was
     * checked, but failed; <code>COND_OK</code> of condition was checked
     * and succeeded, <strong>0</strong> otherwise.
     */

    public int checkIfUnmodifiedSince(Request request) {
	// Check for an If-Unmodified-Since conditional:
	long iums = request.getIfUnmodifiedSince();
	long cmt = getLastModified();
	if ( iums >= 0 ) 
	    return ((cmt > 0) && (cmt - 1000) >= iums) ? COND_FAILED : COND_OK;
	return 0;
    }

    /**
     * Try to validate an <code>If-Match</code> request.
     * @param request The request to validate.
     * @return An integer, <code>COND_FAILED</code>, if the condition  was
     * checked, but failed; <code>COND_OK</code> of condition was checked
     * and succeeded, <strong>0</strong> otherwise.
     */

    public int checkIfMatch(Request request) {
	HttpEntityTag tags[] = request.getIfMatch();
	if ( tags != null ) {
	    String etag = getETag();
	    // Good, real validators in use:
	    if ( etag != null ) {
		for (int i = 0 ; i < tags.length ; i++) {
		    HttpEntityTag t = tags[i];
		    if ((!t.isWeak()) && t.getTag().equals(etag))
			return COND_OK;
		}
	    }
	    return COND_FAILED;
	}
	return 0;
    }

    /**
     * Try to validate an <code>If-None-Match</code> request.
     * @param request The request to validate.
     * @return An integer, <code>COND_FAILED</code>, if the condition  was
     * checked, but failed; <code>COND_OK</code> of condition was checked
     * and succeeded, <strong>0</strong> otherwise.
     */

    public int checkIfNoneMatch(Request request) {
	// Check for an If-None-Match conditional:
	HttpEntityTag tags[] = request.getIfNoneMatch();
	if ( tags != null ) {
	    String etag = getETag();
	    if ( etag == null )
		return COND_OK;
	    for (int i = 0 ; i < tags.length ; i++) {
		HttpEntityTag t = tags[i];
		if (( ! t.isWeak()) && t.getTag().equals(etag))
		    return COND_FAILED;
	    }
	    return COND_OK;
	}
	return 0;
    }

    /**
     * Is the currently cached version usable to answer the given request ?
     * @return A boolean, <strong>true</strong> if we are able to generate
     * a valid answer to this request by the <code>perform</code> method,
     * <strong>false</strong> otherwise (the resource needs to be refreshed).
     */

    public boolean isValid(Request request) {
	// Check for mandatory revalidation:
	if ( getRevalidate() ) {
	    setRequestValidation(request);
	    return false;
	}
	// Check for zero max-age on request (enforces revalidation):
	if ( request.getMaxAge() == 0 ) {
	    setRequestValidation(request);
	    return false;
	}
	// Check freshness:
	long current_age = computeCurrentAge();
	long freshness   = getMaxAge();
	long minfresh = ((long) request.getMinFresh()) * 1000;
	long maxstale = ((long) request.getMaxStale()) * 1000;
	if ( maxstale >= 0 ) {
	    // Check against maxstale:
	    if (freshness + maxstale <= current_age ) {
		setRequestValidation(request);
		return false;
	    } else if ( freshness <= current_age ) {
		filter.addWarning(request, CacheFilter.WARN_STALE);
	    } 
	    return true;
	} else if (minfresh >= 0) {
	    // Check against min freshness:
	    if (freshness - minfresh <= current_age) {
		setRequestValidation(request);
		return false;
	    }
	    return true;
	} else if ( freshness <= current_age ) {
	    // Normal freshness validation:
	    setRequestValidation(request);
	    return false;
	}
	return true;
    }

    public Reply handleRangeRequest(Request request, HttpRange r) {
	// Should we check against a IfRange header ?
	HttpEntityTag t = request.getIfRange();
	if ( t != null ) {
	    if (t.isWeak() || ! t.getTag().equals(getETag()))
		return null;
	}
	// Check the range:
	int cl = getContentLength();
	int fb = r.getFirstPosition();
	int lb = r.getLastPosition();
	if ((fb < 0) && (lb >= 0)) {
	    fb = cl - 1 - lb;
	    lb = cl;
	} else if (lb < 0) {
	    lb = cl;
	}
	if ((fb < 0) || (lb < 0) || (fb <= lb)) {
	    HttpContentRange cr = null;
	    fb = (fb < 0) ? 0 : fb;
	    lb = ((lb > cl) || (lb < 0)) ? cl : lb;
	    cr = HttpFactory.makeContentRange("bytes", fb, lb, cl);
	    // Emit reply:
	    Reply rr = request.makeReply(HTTP.PARTIAL_CONTENT);
	    try {
		rr.setContentLength(lb-fb);
		rr.setHeaderValue(rr.H_CONTENT_RANGE, cr);
		rr.setStream(new ByteRangeOutputStream(getFile(), fb, lb+1));
		return rr;
	    } catch (IOException ex) {
	    }
	} 
	return null;
    }

    /**
     * This cached entry has been checked valid, perform given request.
     * @param request The request to perform.
     * @return An Reply instance.
     * @exception HTTPException If something went wrong.
     */

    public Reply perform(Request request)
	throws HttpException
    {
	// If the resource is currently being uploaded, wait:
	waitUpload();
	// Now perform the request:
	try {
	    Reply   reply       = null;
	    boolean needsEntity = true;
	    // Handle range requests:
	    HttpRange ranges[] = request.getRange();
	    if ((ranges != null) && (ranges.length == 1)) 
		reply = handleRangeRequest(request, ranges[0]);
	    // Handle full retreivals:
	    if ( reply == null ) {
		int status = getStatus();
		// Try validating first 
		// NOTE: We know we are only dealing with GETs and HEADs here
		// otherwise the cache wouldn't be used...
		if ( checkIfMatch(request) == COND_FAILED ) {
		    status      = HTTP.PRECONDITION_FAILED;
		    needsEntity = false;
		} else if ( checkIfNoneMatch(request) == COND_FAILED ) {
		    status      = HTTP.NOT_MODIFIED;
		    needsEntity = false;
		} else if ( checkIfModifiedSince(request) == COND_FAILED ) {
		    status      = HTTP.NOT_MODIFIED;
		    needsEntity = false;
		} else if ( checkIfUnmodifiedSince(request) == COND_FAILED ) {
		    status      = HTTP.PRECONDITION_FAILED;
		    needsEntity = false;
		}
		// Emit reply:
		reply = request.makeReply(status);
		if ( needsEntity )
		    reply.setStream(getInputStream());
	    }
	    setReplyHeaders(reply);
	    // Check if entity is needed:
	    String mth = request.getMethod();
	    if ( mth.equals("HEAD") || mth.equals("OPTIONS") )
		reply.setStream(null);
	    filter.markUsed(this);
	    return reply;
	} catch (IOException ex) {
	    // Some exception occured, delete that resource (no longer usefull)
	    delete();
	}
	return null;
    }

    /**
     * Delete this cached entry from the cache.
     */

    public synchronized void delete() {
	// Delete file:
	File file = getFile();
	if ( file != null )
	    file.delete();
	// Update cache sizes:
	int cl = getContentLength();
	if ( cl > 0 ) {
	    filter.state.updateGenerationSize(getGeneration(),-cl);
	    filter.updateCacheSpaceCounter(-cl);
	}
	// Remove the resource from store:
	ResourceStore store = getResourceStore();
	if ( store != null ) {
	    store.removeResource(getIdentifier());
	} else {
	    // This can happen if the cached resource was "under construction"
	    ;
	}
    }

    /**
     * Compute this cached entry's current age.
     */

    protected long computeCurrentAge() {
	long now = System.currentTimeMillis();
	return getInitialAge()+(now - getResponseTime());
    }

    /**
     * Update this entry's age according to the given HTTP transaction.
     * @param request Our original request.
     * @param reply The corresponding reply.
     */

    public void updateAges(Request request, Reply reply) {
	// Quickly save the reponse time:
	long response_time = System.currentTimeMillis();
	setResponseTime(response_time);
	// HTTP/1.1, Section 13.2.3, Age Calculation
	long age_value     = reply.getAge()*1000;
	long date_value    = reply.getDate();
	long request_time  = request.getEmitDate();
	
	long apparent_age   = Math.max(0, response_time-date_value);
	long c_received_age = Math.max(apparent_age, age_value);
	long response_delay = response_time - request_time;
	// Save the initial age:
	setInitialAge(c_received_age + response_delay);
	// Save the date of the reply:
	if ( date_value > 0 )
	    setDate(date_value);
	// Look for HTTP/1.1 specific headers:
	// HTTP/1.x specific headers: maxage
	long maxage = ((long) reply.getMaxAge()) * 1000;
	if ((maxage < 0) &&  reply.hasHeader(reply.H_EXPIRES) ) 
	    maxage = Math.min(reply.getExpires()-reply.getDate(), 0);
	if ( maxage >= 0 )
	    setMaxAge(maxage);
	else
	    setDefaultMaxAge();
	// HTTP/1.1 specific headers: *-revalidate
	if ( reply.checkMustRevalidate() ) {
	    setRevalidate(true);
	} else if ( ( ! isShared()) && reply.checkProxyRevalidate() ) {
	    setRevalidate(true);
	}
    }

    public void initialize(CacheFilter filter, Request request, Reply reply)
	throws IOException
    {
	slowpickle = false;
	setValue(ATTR_IDENTIFIER, request.getURL().toExternalForm());
	setValue(ATTR_CACHE_FILTER, filter);
	setInt(ATTR_GENERATION, filter.state.getGeneration());
	// Keep fast track of the filter:
	this.filter = filter;
	// Save the content of resource into the content cache:
	setFile(filter.getFile(request.getURL()));
	validate(request, reply);
    }

    CachedResource(CacheFilter filter, Request request, Reply reply)
	throws IOException
    {
	initialize(filter, request, reply);
    }

    public void initialize(Object values[]) {
	super.initialize(values);
	// Grab the filter pointer:
	this.filter = (CacheFilter) getValue(ATTR_CACHE_FILTER, null);
    }

    public CachedResource() {
	super();
    }
}
