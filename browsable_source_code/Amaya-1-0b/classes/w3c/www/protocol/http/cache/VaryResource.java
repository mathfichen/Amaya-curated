// VaryResource.java
// $Id: VaryResource.java,v 1.2 1997/03/27 13:57:51 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html


package w3c.www.protocol.http.cache;

import java.net.*;
import java.util.*;
import java.io.*;

import w3c.tools.store.*;
import w3c.www.http.*;
import w3c.www.protocol.http.*;

public class VaryResource extends CachedResource {
    /**
     * Attribute index - The location of the variants.
     */
    protected static int ATTR_VARIANT_LOCATIONS = -1;
    /**
     * Attribute index - The dimension on which this resource varies.
     */
    protected static int ATTR_VARY = -1;
     
    static {
	Class     c = null;
	Attribute a = null;
	try {
	    c = Class.forName("w3c.www.protocol.http.cache.VaryResource");
	} catch (Exception ex) {
	    ex.printStackTrace();
	    System.exit(1);
	}
	// Register the variants attribute:
	a = new StringArrayAttribute("variant-locations"
				     , null
				     , Attribute.COMPUTED);
	ATTR_VARIANT_LOCATIONS = AttributeRegistry.registerAttribute(c, a);
	// Register the vary attribute:
	a = new StringArrayAttribute("vary"
				     , null
				     , Attribute.COMPUTED);
	ATTR_VARY = AttributeRegistry.registerAttribute(c, a);
    }

    /**
     * The loaded list of cached variants.
     */
    protected CachedResource variants[] = null;

    /**
     * Get this varying resource cached variant locations.
     * @return A array of URL encoded as String a String array, or <strong>
     * null</strong> if no variants have been cached yet.
     */
     
    public synchronized String[] getVariantLocations() {
	return (String[]) getValue(ATTR_VARIANT_LOCATIONS, null);
    }

    /**
     * Get the dimension on which this resource varies.
     * @return A list of HTTP header field names. This method will never
     * return <strong>null</strong> since this would prevent it from
     * being cached.
     */

    public String[] getVary() {
	return (String[]) getValue(ATTR_VARY, null);
    }

    public synchronized void addVariant(CachedResource v) {
	String urlloc    = v.getIdentifier();
	String varlocs[] = getVariantLocations();
	if ( varlocs == null ) {
	    varlocs    = new String[1];
	    varlocs[0] = urlloc;
	} else {
	    // Check if this variant already exists:
	    for (int i = 0 ; i < varlocs.length ; i++) {
		if ( urlloc.equalsIgnoreCase(varlocs[i]) )
		    return;
	    }
	    // Add it:
	    String newlocs[] = new String[varlocs.length+1];
	    System.arraycopy(varlocs, 0, newlocs, 0, varlocs.length);
	    newlocs[varlocs.length] = urlloc;
	    varlocs = newlocs;
	}
	variants = null;
	etags    = null;
	setValue(ATTR_VARIANT_LOCATIONS, varlocs);
    }
	
    public synchronized CachedResource[] getVariants() {
	if ( variants == null ) {
	    String varlocs[]  = getVariantLocations();
	    if ( varlocs == null )
		return null;
	    variants  = new CachedResource[varlocs.length];
	    int found = 0;
	    for (int i = 0 ; i < varlocs.length ; i++) {
		try {
		    variants[i] = filter.loadResource(varlocs[i]);
		} catch (InvalidResourceException ex) {
		    filter.removeResource(varlocs[i]);
		}
		if ( variants[i] != null )
		    found++;
	    }
	    // Check that we did load all variants:
	    if ( found != varlocs.length ) {
		// Fix both varlocs, and variants:
		String         newlocs[] = new String[found];
		CachedResource newvars[] = new CachedResource[found];
		int            newcnt    = 0;
		for (int i = 0 ; i < variants.length ; i++) {
		    if ( variants[i] != null ) {
			newlocs[newcnt] = varlocs[i];
			newvars[newcnt] = variants[i];
			newcnt++;
		    }
		}
		variants = newvars;
		setValue(ATTR_VARIANT_LOCATIONS, newlocs);
	    }
	}
	return variants;
    }

    public synchronized HttpEntityTag[] getVariantsETag() {
	if ( etags == null ) {
	    // Compute a fresh value:
	    CachedResource variants[] = getVariants();
	    if ( variants != null ) {
		etags = new HttpEntityTag[variants.length];
		for (int i = 0 ; i < variants.length ; i++) {
		    // We know all cached variants have entity tags, otherwise 
		    // they wouldn't be cached, see updateVariant.
		    String etag = variants[i].getETag();
		    if ( etag != null )
			etags[i] = HttpFactory.parseETag(etag);
		}
	    }
	}
	return etags;
    }

    public synchronized CachedResource getVariant(HttpEntityTag etag) {
	CachedResource variants[] = getVariants();
	for (int i = 0 ; i < variants.length ; i++) {
	    if ( etag.getTag().equals(variants[i].getETag()) ) {
		return variants[i];
	    }
	}
	return null;
    }

    public Reply updateVariant(Request request, Reply reply) 
	throws IOException
    {
	// We use the content location as a key, this is bad !
	String location = reply.getContentLocation();
	if ( location == null )
	    return reply;
	URL    urlloc = null;
	try {
	    urlloc = new URL(request.getURL(), location);
	} catch (Exception ex) {
	    return reply;
	}
	// Check that this variant does have an entity tag:
	if ( ! reply.hasHeader(reply.H_ETAG) ) {
	    delete();
	    return null;
	}
	// Check that our vary header is still valid:
	String vary[] = reply.getVary();
	if ( vary != null ) {
	    String dims[] = getVary();
	    if ( dims != null ) {
		int found  = 0;
		for (int i = 0 ; i < dims.length ; i++) {
		  inner:
		    for (int j = 0 ; j < vary.length ; j++) {
			if ( dims[i].equalsIgnoreCase(vary[j]) ) {
			    found++;
			    break inner;
			}
		    }
		}
		if ( found != vary.length ) {
		    // This resource has changed too much, get rid of it:
		    delete();
		    return reply;
		}
	    } else {
		// We are at init time for that resource:
		setValue(ATTR_VARY, vary);
	    }
	}
	// Okay (sigh) time to add that variant:
	reply.setVary(null);
	request.setURL(urlloc);
	CachedResource r = null; 
	r = CachedResourceFactory.createResource(filter, request, reply);
	reply.setVary(vary);
	filter.store.addResource(r);
	addVariant(r);
	return reply;
    }

    public void setRequestValidation(Request request) {
	request.setState(CacheFilter.STATE_RESOURCE, this);
	// Append all the etags of the variants we know of:
	request.setIfNoneMatch(getVariantsETag());
    }

    public boolean isValid(Request request) {
	// A varying resource *always* need at least revalidation:
	setRequestValidation(request);
	return false;
    }

    public synchronized Reply validate(Request request, Reply reply)
	throws IOException
    {
	// Update any variant that needs it:
	if ( reply.getStatus() != HTTP.NOT_MODIFIED ) 
	    return updateVariant(request, reply);
	// Try to pick the right variant now:
	HttpEntityTag etag = reply.getETag();
	if ( etag != null ) {
	    // Select and return the appropriate variant:
	    CachedResource r = getVariant(etag);
	    if ( r != null ) 
		return r.validate(request, reply);
	} 
	return null;
    }
 
    /**
     * Delete this cached entry from the cache.
     */

    public synchronized void delete() {
	// Delete all variants first:
	CachedResource vars[] = getVariants();
	if ( vars != null ) {
	    for (int i = 0 ; i < vars.length ; i++)
		vars[i].delete();
	}
	// super delete:
	super.delete();
    }

    VaryResource(CacheFilter filter, Request request, Reply reply)
	throws IOException
    {
	super.initialize(filter, request, reply);
    }

    public VaryResource() {
	super();
    }

}

