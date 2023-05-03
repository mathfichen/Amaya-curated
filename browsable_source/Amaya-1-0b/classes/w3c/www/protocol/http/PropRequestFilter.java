// RequestFilter.java
// $Id: PropRequestFilter.java,v 1.2 1997/03/27 13:57:48 cvs Exp $
// (c) COPYRIGHT MIT and INRIA, 1996.
// Please first read the full copyright statement in file COPYRIGHT.html

package w3c.www.protocol.http;

/**
 * The PropRequestFilter interface.
 * This interface extends the basic requestFilter interface, in order to 
 * allow the implementing filters to be set through the 
 * <code>w3c.www.protocol.http.filters</code> property.
 * <p>To set a PropRequestFilter through this property, you just need to
 * define the property to a <code>|</code> separated list of
 * PropRequestFilter compatible class. Upon initialization, the
 * HttpManager will read this property value, and <code>initialize</code>
 * all these filters in the global scope.
 */

public interface PropRequestFilter extends RequestFilter {

    /**
     * Initialize this filter, using the provided manager.
     * During initialization, it is up to the filter to install itself
     * in the manager, by invoking the appropriate <code>setFilter</code>
     * method.
     * @param manager The HttpManager initializing the filter.
     * @exception FilterInitException If the filter couldn't be 
     * initialized properly.
     */

    public void initialize(HttpManager manager) 
	throws PropRequestFilterException;

}
