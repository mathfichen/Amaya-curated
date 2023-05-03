/*                                                     W3C Reference Library libwww DNS Class
                                DOMAIN NAME SERVICE CLASS
                                             
 */
/*
**      (c) COPYRIGHT MIT 1995.
**      Please first read the full copyright statement in the file COPYRIGH.
*/
/*

   The DNS Class defines generic access to  the DNS system. It maintains a cache of all
   visited hosts so that subsequent connects to the same host doesn't imply a new request
   to the DNS every time. Multihomed hosts are treated specially in that the time spend on
   every connect is measured and kept in the cache. On the next request to the same host,
   the IP-address with the lowest average connect time is chosen. If one IP-address fails
   completely, e.g. connection refusedthen it disabled and HTDoConnect tries one of the
   other IP-addresses to the same host.
   
   Every entry in the cache has its own time to live (TTL) and hence the cache manages its
   own automatic garbage collection. Currently the TTL is _not_ bound to the DNS records
   which should be changed. You can set the DNS object TTL
   
   This module is implemented by HTDNS.c, and it is a part of the W3C Reference Library.
   
 */
#ifndef HTDNS_H
#define HTDNS_H

/*

 */
typedef struct _HTdns HTdns;
/*

DNS CACHE EXPIRATION TIME

   When to remove an entry in the cache. The default value is 12h.
   
 */
extern void HTDNS_setTimeout (time_t timeout);
extern time_t HTDNS_timeout  (time_t timeout);
/*

CREATION AND DELETION METHODS

  Add a DNS Object
  
   Add an element to the cache of visited hosts. The homesvariable indicates the number of
   IP addresses found when looking up the name. A host name must _NOT_ contain a port
   number.
   
 */
extern HTdns * HTDNS_add (HTList * list, struct hostent * element,
                          char * host, int * homes);
/*

  Delete a DNS object
  
   This function flushes the DNS object from the cache and frees up memory
   
 */
extern BOOL HTDNS_delete (const char * host);
/*

  Delete ALL DNS objects
  
   This function is called from HTLibTerminate. It can be called at any point in time if
   the DNS cache is going to be flushed.
   
 */
extern BOOL HTDNS_deleteAll (void);
/*

DNS CLASS METHODS

  Recalculating the Time Weights on Multihomed Host
  
   On every connect to a multihomed host, the average connect time is updated
   exponentially for all the entries.
   
 */
extern BOOL HTDNS_updateWeigths (HTdns *dns, int cur, time_t deltatime);
/*

RESOLVER FUNCTIONS

   These are the functions that resolve a host name
   
  Get Host By Socket
  
   This function should have been called HTGetHostByAddr but for historical reasons this
   is not the case.
   
 */
extern char * HTGetHostBySock (int soc);
/*

  Get Host By Name
  
   This function gets the address of the host and puts it in to the socket structure. It
   maintains its own cache of connections so that the communication to the Domain Name
   Server is minimized. Returns the number of homes or -1 if error.
   
 */
extern int HTGetHostByName (struct _HTNet *net, char *host);
/*

 */
#endif
/*

   
   ___________________________________
   
                             @(#) $Id: HTDNS.h,v 1.1.1.1 1996/10/15 13:08:39 cvs Exp $
                                                                                          
    */
