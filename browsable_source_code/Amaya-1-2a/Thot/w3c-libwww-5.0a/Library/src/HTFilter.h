/*                                      W3C Reference Library libwww BEFORE and AFTER Filters
                            STANDARD BEFORE AND AFTER FILTERS
                                             
 */
/*
**      (c) COPYRIGHT MIT 1995.
**      Please first read the full copyright statement in the file COPYRIGH.
*/
/*

   This module provides a set of default _BEFORE_ and _AFTER_ filters that can be
   registered by the Net manager to be called before and after a request. All filters can
   be registered either to be called _globally_ (all requests) or _locally_ (pr request
   basis).
   
   This module is implemented by HTFilter.c, and it is a part of the W3C Reference
   Library.
   
 */
#ifndef HTFILTER_H
#define HTFILTER_H
#include "WWWLib.h"
/*

BEFORE FILTERS

   This is a standard set of _BEFORE_ filters which the application may initialize. This
   can be done in an easy way using the function HTBeforeInit()in the Initialization
   interface.
   
  Proxy and Gateway BEFORE filter
  
   Checks for registerd proxy servers or gateways and sees whether this request should be
   redirected to a proxy or a gateway. Proxies have higher priority than gateways so we
   look for them first! For HTTP/1.0 and HTTP/1.1 we may only send a full URL (including
   the host portion) to proxy servers. Therefore, we tell the Library whether to use the
   full URL or the traditional HTTP one without the host part.
   
 */
extern HTNetBefore HTProxyFilter;
/*

  Rule Translation BEFORE Filter
  
   If we have a set of rules loaded (see the Rule manager) then check before each request
   whether how that should be translated. The trick is that a parent anchor has a
   "address" which is the part from the URL we used when we created the anchor. However,
   it also have a "physical address" which is the place we are actually going to look for
   the resource. Hence this filter translates from the address to the physical address (if
   any translations are found)
   
 */
extern HTNetBefore HTRuleFilter;
/*

  Memory Cache (History List) Validation BEFORE Filter
  
   Check if document is already loaded. The user can define whether the history list
   should follow normal expiration or work as a traditional history list where expired
   documents are not updated. We don't check for anything but existence proof of a
   document associated with the anchor as the definition is left to the application.
   
 */
extern HTNetBefore HTMemoryCacheFilter;
/*

  Persistent Cache Validation BEFORE Filter
  
   Check the cache mode to see if we can use an already loaded version of this document.
   If so and our copy is valid then we don't have to go out and get it unless we are
   forced to
   
 */
extern HTNetBefore HTCacheFilter;
/*

  Client side authentication BEFORE filter
  
   The filter generates the credentials required to access a document Getting the
   credentials may involve asking the user in which case we use the methods registered by
   the HTAlert module
   
 */

extern HTNetBefore HTCredentialsFilter;
/*

AFTER FILTERS

   Like _BEFORE_ filters we provide a default set of typical _AFTER_ filters that may be
   initialized by the application. Again, an easy way of doing this is to call the
   HTAfterInit()function in the Initialization interface.
   
  Persistent Cache Update AFTER filter
  
   On our way out we catch the metainformation and stores it in our persistent store. If
   we have a cache validation (a 304 response then we use the new metainformation and
   merges it with the existing information already captured in the cache.
   
 */
extern HTNetAfter HTCacheUpdateFilter;
/*

  Error and Information filter
  
   It checks the status code from a request and generates an error/information message if
   required.
   
 */
extern HTNetAfter HTInfoFilter;
/*

  Redirection filter
  
   The redirection handler only handles redirections on the GETor HEADmethod (or any other
   safe method)
   
 */
extern HTNetAfter HTRedirectFilter;
/*

  Proxy Redirection filter
  
   This filter handles a "305 Use Proxy"response and retries the request through the proxy
   
 */
extern HTNetAfter HTUseProxyFilter;
/*

  Client side authentication filter
  
   The client side authentication filter uses the user dialog messages registered in the
   HTAlert module. By default these are the ones used by the line mode browser but you can
   just register something else.
   
 */
extern HTNetAfter HTAuthFilter;
/*

  Request Logging filter
  
   Default Logging filter using the log manager provided by the Log Manager.
   
 */
extern HTNetAfter HTLogFilter;
/*

 */
#endif /* HTFILTER_H */
/*

   
   ___________________________________
   
                           @(#) $Id: HTFilter.h,v 1.1.1.1 1996/10/15 13:08:41 cvs Exp $
                                                                                          
    */
