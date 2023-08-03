/*									HTDNS.c
**	DOMAIN NAME SERVICE MANAGER
**
**	(c) COPYRIGHT MIT 1995.
**	Please first read the full copyright statement in the file COPYRIGH.
**	@(#) $Id: HTDNS.c,v 1.1.1.1 1996/10/15 13:08:36 cvs Exp $
**
**	This object manages a cache of hosts we have looked up vis DNS.
**	The object contains the necessary parts from hostent. For Internet host
**	hostent->h_addr_list is not an array of char pointers but an array of 
**	pointers of type in_addr.
**
**	13 Sep 95  HFN	Spawned from HTTCP.c and rewritten
*/

/* Library include files */
#include "sysdep.h"
#include "WWWUtil.h"
#include "HTParse.h"
#include "HTAlert.h"
#include "HTError.h"
#include "HTNetMan.h"
#include "HTTrans.h"
#include "HTDNS.h"					 /* Implemented here */

#define DNS_TIMEOUT		43200L	      /* Default DNS timeout is 12 h */
#define HASH_SIZE		67

/* Type definitions and global variables etc. local to this module */
struct _HTdns {
    char *  		hostname;			     /* name of host */
    time_t		ntime;				    /* Creation time */
    int			addrlength;	       /* Length of address in bytes */
    int			homes;	       /* Number of IP addresses on the host */
    char **		addrlist;      /* List of addresses from name server */
    double *		weight;			   /* Weight on each address */
};

PRIVATE HTList	**CacheTable = NULL;
PRIVATE time_t	DNSTimeout = DNS_TIMEOUT;	   /* Timeout on DNS entries */

/* ------------------------------------------------------------------------- */

PRIVATE void free_object (HTdns * me)
{
    if (me) {
	HT_FREE(me->hostname);
	if (*me->addrlist)
	    HT_FREE(*me->addrlist);
	HT_FREE(me->addrlist);
	HT_FREE(me->weight);
	HT_FREE(me);
    }
}

PRIVATE BOOL delete_object (HTList * list, HTdns * me)
{
    if (PROT_TRACE)
	HTTrace("DNS Delete.. object %p from list %p\n", me, list);
    HTList_removeObject(list, (void *) me);
    free_object(me);
    return YES;
}

/*	HTDNS_setTimeout
**	----------------
**	Set the cache timeout for DNS entries. Default is DNS_TIMEOUT
*/
PUBLIC void HTDNS_setTimeout (time_t timeout)
{
    DNSTimeout = timeout;
}

/*	HTDNS_timeout
**	-------------
**	Get the cache timeout 
*/
PUBLIC time_t HTDNS_timeout (time_t timeout)
{
    return DNSTimeout;
}

/*	HTDNS_add
**	---------
**	Add an element to the cache of visited hosts. Note that this function
**	requires the system implemented structure hostent and not our own
**	host_info. The homes variable indicates the number of IP addresses 
**	found. A host name must NOT contain a port number.
**	Returns address of new HTdns object
*/
PUBLIC HTdns * HTDNS_add (HTList * list, struct hostent * element,
			  char *host, int *homes)
{
    HTdns *me;
    char *addr = NULL;
    char **index = element->h_addr_list;
    int cnt = 1;

    while(*index++) cnt++;
    if ((me = (HTdns *) HT_CALLOC(1, sizeof(HTdns))) == NULL ||
	(me->addrlist = (char **) HT_CALLOC(1, cnt*sizeof(char*))) == NULL ||
	(addr = (char *) HT_CALLOC(1, cnt*element->h_length)) == NULL)
	HT_OUTOFMEM("HTDNS_add");
    StrAllocCopy(me->hostname, host);
    me->ntime = time(NULL);
    index = element->h_addr_list;
    cnt = 0;
    while (*index) {
	*(me->addrlist+cnt) = addr+cnt*element->h_length;
	memcpy((void *) *(me->addrlist+cnt++), *index++, element->h_length);
    }
    me->homes = cnt;
    *homes = cnt;
    if ((me->weight = (double *) HT_CALLOC(me->homes, sizeof(double))) == NULL)
        HT_OUTOFMEM("HTDNS_add");
    me->addrlength = element->h_length;
    if (PROT_TRACE)
	HTTrace("DNS Add..... `%s\' with %d home(s) to %p\n",
		host, *homes, list);
    HTList_addObject(list, (void *) me);
    return me;
}


/*	HTDNS_updateWeights
**	-------------------
**	This function calculates the weights of the different IP addresses
**	on a multi homed host. Each weight is calculated as
**
**		w(n+1) = w(n)*a + (1-a) * deltatime
**		a = exp(-1/Neff)
**		Neff is the effective number of samples used
**		deltatime is time spend on making a connection
**
**	A short window (low Neff) gives a high sensibility, but this is
**	required as we can't expect a lot of data to test on.
**	"current" is the index returned by HTGetHostByName()
*/
PUBLIC BOOL HTDNS_updateWeigths(HTdns *dns, int current, time_t deltatime)
{
    if (dns) {
	int cnt;
	const double passive = 0.9; 	  /* Factor for all passive IP_addrs */
#if 0
	const int Neff = 3;
	const double alpha = exp(-1.0/Neff);
#else
	const double alpha = 0.716531310574;	/* Doesn't need the math lib */
#endif
	for (cnt=0; cnt<dns->homes; cnt++) {
	    if (cnt == current) {
		*(dns->weight+current) = *(dns->weight+current)*alpha + (1.0-alpha)*deltatime;
		if (*(dns->weight+current) < 0.0) *(dns->weight+current) = 0.0;
	    } else {
		*(dns->weight+cnt) = *(dns->weight+cnt) * passive;
	    }
	    if (PROT_TRACE)
		HTTrace("DNS Weigths. Home %d has weight %4.2f\n", cnt,
			*(dns->weight+cnt));
	}
	return YES;
    }
    if (PROT_TRACE)
	HTTrace("DNS Weigths. Object %p not found'\n", dns);
    return NO;
}

/*	HTDNS_delete
**	------------
**	Remove an element from the cache
*/
PUBLIC BOOL HTDNS_delete (const char * host)
{
    HTList *list;
    int hash = 0;
    const char *ptr;
    if (!host || !CacheTable) return NO;
    for(ptr=host; *ptr; ptr++)
	hash = (int) ((hash * 3 + (*(unsigned char *) ptr)) % HASH_SIZE);
    if ((list = CacheTable[hash])) {	 /* We have the list, find the entry */
	HTdns *pres;
	while ((pres = (HTdns *) HTList_nextObject(list))) {
	    if (!strcmp(pres->hostname, host)) {
		delete_object(CacheTable[hash], pres);
		break;
	    }
	}
    }
    return YES;
}

/*	HTDNS_deleteAll
**	---------------
**	Destroys the cache completely
*/
PUBLIC BOOL HTDNS_deleteAll (void)
{
    int cnt;
    HTList *cur;
    if (!CacheTable) return NO;
    for (cnt=0; cnt<HASH_SIZE; cnt++) {
	if ((cur = CacheTable[cnt])) { 
	    HTdns *pres;
	    while ((pres = (HTdns *) HTList_nextObject(cur)) != NULL)
		free_object(pres);
	}
	HTList_delete(CacheTable[cnt]);
	CacheTable[cnt] = NULL;
    }
    HT_FREE(CacheTable);
    return YES;
}

/*	HTGetHostByName
**	---------------
**	Resolve the host name using internal DNS cache. As we want to refer   
**	a specific host when timing the connection the weight function must
**	use the 'current' value as returned.
**      Returns:
**	       	>0	Number of homes
**		-1	Error
*/
PUBLIC int HTGetHostByName (HTNet *net, char *host)
{
    SockA *sin = &net->sock_addr;
    int homes = -1;
    HTList *list;				    /* Current list in cache */
    HTdns *pres = NULL;
    if (!net || !host) {
	if (PROT_TRACE)
	    HTTrace("HostByName.. Bad argument\n");
	return -1;
    }
    net->home = 0;
    
    /* Find a hash for this host */
    {
	int hash = 0;
	char *ptr;
	for(ptr=host; *ptr; ptr++)
	    hash = (int) ((hash * 3 + (*(unsigned char *) ptr)) % HASH_SIZE);
	if (!CacheTable) {
	    if ((CacheTable = (HTList* *) HT_CALLOC(HASH_SIZE, sizeof(HTList *))) == NULL)
	        HT_OUTOFMEM("HTDNS_init");
	}
	if (!CacheTable[hash]) CacheTable[hash] = HTList_new();
	list = CacheTable[hash];
    }

    /* Search the cache */
    {
	HTList *cur = list;
	while ((pres = (HTdns *) HTList_nextObject(cur))) {
	    if (!strcmp(pres->hostname, host)) {
		if (time(NULL) > pres->ntime + DNSTimeout) {
		    if (PROT_TRACE)
			HTTrace("HostByName.. Refreshing cache\n");
		    delete_object(list, pres);
		    pres = NULL;
		}
		break;
	    }
	}
    }
    if (pres) {
	/*
	** Find the best home. We still want to do this as we use it as a
	** fall back for persistent connections
	*/
	homes = pres->homes;
	if (pres->homes > 1) {
	    int cnt = 0;
	    double best_weight = 1e30;			      /* Pretty good */
	    while (cnt < pres->homes) {
		if (*(pres->weight+cnt) < best_weight) {
		    best_weight = *(pres->weight+cnt);
		    net->home = cnt;
		}
		cnt++;
	    }
	}
	net->dns = pres;
	memcpy((void *) &sin->sin_addr, *(pres->addrlist+net->home),
	       pres->addrlength);
    } else {
	struct hostent *hostelement;			      /* see netdb.h */
	HTAlertCallback *cbf = HTAlert_find(HT_PROG_DNS);
#ifdef HT_REENTRANT
	int thd_errno;
	char buffer[HOSTENT_MAX];
	struct hostent result;			      /* For gethostbyname_r */
	if (cbf) (*cbf)(net->request, HT_PROG_DNS, HT_MSG_NULL,NULL,host,NULL);
	hostelement = gethostbyname_r(host, &result, buffer,
				      HOSTENT_MAX, &thd_errno);
#else
	if (cbf) (*cbf)(net->request, HT_PROG_DNS, HT_MSG_NULL,NULL,host,NULL);
	hostelement = gethostbyname(host);
#endif
	if (!hostelement) {
	    if (PROT_TRACE)
		HTTrace("HostByName.. Can't find node `%s'.\n", host);
	    return -1;
	}	
	net->dns = HTDNS_add(list, hostelement, host, &homes);
	memcpy((void *) &sin->sin_addr, *hostelement->h_addr_list,
	       hostelement->h_length);
    }
    return homes;
}


/*
**	Get host name of the machine on the other end of a socket.
**
*/
PUBLIC char * HTGetHostBySock (int soc)
{
    struct sockaddr addr;
    int len = sizeof(struct sockaddr);
    struct in_addr *iaddr;
    char *name = NULL;
    struct hostent * phost;		/* Pointer to host -- See netdb.h */
#ifdef HT_REENTRANT
    int thd_errno;
    char buffer[HOSTENT_MAX];
    struct hostent result;		      	      /* For gethostbyaddr_r */
#endif

#ifdef DECNET  /* Decnet ain't got no damn name server 8#OO */
    return NULL;
#else
    if (getpeername(soc, &addr, &len) < 0)
	return NULL;
    iaddr = &(((struct sockaddr_in *)&addr)->sin_addr);

#ifdef HT_REENTRANT
    phost = gethostbyaddr_r((char *) iaddr, sizeof(struct in_addr), AF_INET,
			    &result, buffer, HOSTENT_MAX, &thd_errno);
#else
    phost = gethostbyaddr((char *) iaddr, sizeof(struct in_addr), AF_INET);
#endif
    if (!phost) {
	if (PROT_TRACE)
	    HTTrace("TCP......... Can't find internet node name for peer!!\n");
	return NULL;
    }
    StrAllocCopy(name, phost->h_name);
    if (PROT_TRACE) HTTrace("TCP......... Peer name is `%s'\n", name);
    return name;

#endif	/* not DECNET */
}
