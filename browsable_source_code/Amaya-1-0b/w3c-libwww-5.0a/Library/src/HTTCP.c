/*									HTTCP.c
**	TCP SPECIFIC CODE
**
**	(c) COPYRIGHT MIT 1995.
**	Please first read the full copyright statement in the file COPYRIGH.
**	@(#) $Id: HTTCP.c,v 1.2 1997/05/20 08:34:57 cvs Exp $
**
**	This code is in common between client and server sides.
**
**	16 Jan 92  TBL	Fix strtol() undefined on CMU Mach.
**	25 Jun 92  JFG  Added DECNET option through TCP socket emulation.
**	13 Sep 93  MD   Added correct return of vmserrorno for HTInetStatus.
**			Added decoding of vms error message for MULTINET.
**	31 May 94  HF	Added cache on host id's; now use inet_ntoa() to
**			HTInetString and some other fixes. Added HTDoConnect
**			and HTDoAccept
*/

/* Library include files */
#include "sysdep.h"
#include "WWWUtil.h"
#include "WWWCore.h"

#include "HTReqMan.h"
#include "HTNetMan.h"
#include "HTTCP.h"					 /* Implemented here */

/* VMS stuff */
#ifdef VMS
#ifndef MULTINET
#define FD_SETSIZE 32
#else /* Multinet */
#define FD_SETSIZE 256
#endif /* Multinet */
#endif /* VMS */

/* Macros and other defines */
/* x seconds penalty on a multi-homed host if IP-aess is down */
#define TCP_PENALTY		1200

/* x seconds penalty on a multi-homed host if IP-address is timed out */
#define TCP_DELAY		600

/* imperical study in socket call error codes
 */
#ifdef _WINSOCKAPI_					/* windows */
#define NETCALL_ERROR(ret)	(ret == SOCKET_ERROR)
#define NETCALL_DEADSOCKET(err)	(err == WSAEBADF)
#define NETCALL_WOULDBLOCK(err)	(err == WSAEWOULDBLOCK)
#else /* _WINSOCKAPI_ 					   unix    */
#define NETCALL_ERROR(ret)	(ret < 0)
#define NETCALL_DEADSOCKET(err)	(err == EBADF)
#if defined(EAGAIN) && defined(EALREADY)
#define NETCALL_WOULDBLOCK(err)	(err == EINPROGRESS || \
				 err == EALREADY || \
				 err == EAGAIN)
#else /* (EAGAIN && EALREADY) */
#ifdef EALREADY
#define NETCALL_WOULDBLOCK(err)	(err == EINPROGRESS || err == EALREADY)
#else /* EALREADY */
#ifdef EAGAIN
#define NETCALL_WOULDBLOCK(err)	(err == EINPROGRESS || err == EAGAIN)
#else /* EAGAIN */
#define NETCALL_WOULDBLOCK(err)	(err == EINPROGRESS)
#endif /* !EAGAIN */
#endif /* !EALREADY */
#endif /* !(EAGAIN && EALREADY) */
#endif /* !_WINSOCKAPI_ 				   done */
/* ------------------------------------------------------------------------- */
/*	       	      CONNECTION ESTABLISHMENT MANAGEMENT 		     */
/* ------------------------------------------------------------------------- */

/* _makeSocket - create a socket, if !net->preemptive, set FIONBIO
 * returns 1: blocking
 *	   0: non-blocking
 *	  -1: creation error
 */
int _makeSocket(HTNet * net)
{
    int status;
#ifdef DECNET
	    if ((net->sockfd=socket(AF_DECnet, SOCK_STREAM, 0))==INVSOC)
#else
	    if ((net->sockfd=socket(AF_INET, SOCK_STREAM,IPPROTO_TCP))==INVSOC)
#endif
	    {
		HTRequest_addSystemError(net->request, ERR_FATAL, socerrno, 
					 NO, "socket");
		net->tcpstate = TCP_ERROR;
		return -1;
	    }
	    if (PROT_TRACE)
		HTTrace("Socket...... Created %d\n", net->sockfd);

	    /* Increase the number of sockets by one */
	    HTNet_increaseSocket();

	    /* If non-blocking protocol then change socket status
	    ** I use fcntl() so that I can ask the status before I set it.
	    ** See W. Richard Stevens (Advan. Prog. in UNIX environment, p.364)
	    ** Be CAREFULL with the old `O_NDELAY' - it will not work as read()
	    ** returns 0 when blocking and NOT -1. FNDELAY is ONLY for BSD and
	    ** does NOT work on SVR4 systems. O_NONBLOCK is POSIX.
	    */
	    if (!net->preemptive) {
#ifdef _WINSOCKAPI_
		{		/* begin windows scope  */
		    long levents = FD_READ | FD_WRITE | FD_ACCEPT | 
			FD_CONNECT | FD_CLOSE ;
		    int rv = 0 ;
		    u_long one = 1;
				    
		    status = ioctlsocket(net->sockfd, FIONBIO, &one) == 
			     SOCKET_ERROR ? -1 : 0;
		} /* end scope */
#else /* _WINSOCKAPI_ */
#if defined(VMS)
		{
		    int enable = 1;
		    status = IOCTL(net->sockfd, FIONBIO, &enable);
		}
#else /* VMS */
		if((status = fcntl(net->sockfd, F_GETFL, 0)) != -1) {
#ifdef O_NONBLOCK
		    status |= O_NONBLOCK;			    /* POSIX */
#else /* O_NONBLOCK */
#ifdef F_NDELAY
		    status |= F_NDELAY;				      /* BSD */
#endif /* F_NDELAY */
#endif /* !O_NONBLOCK */
		    status = fcntl(net->sockfd, F_SETFL, status);
		}
#endif /* !VMS */
#endif /* !_WINSOCKAPI_ */
		if (PROT_TRACE) {
		    if (status == -1)
			HTTrace("Sockrt...... Blocking socket\n");
		    else
			HTTrace("Socket...... Non-blocking socket\n");
		}
	    } else if (PROT_TRACE)
		HTTrace("Socket...... Blocking socket\n");

    return status == -1 ? 1 : 0;
}

/*								HTDoConnect()
**
**	Note: Any port indication in URL, e.g., as `host:port' overwrites
**	the default port value.
**
**	returns		HT_ERROR	Error has occured or interrupted
**			HT_OK		if connected
**			HT_WOULD_BLOCK  if operation would have blocked
*/
PUBLIC int HTDoConnect (HTNet * net, char * url, u_short default_port)
{
    int status;
    HTRequest * request = HTNet_request(net);
    char * hostname = HTHost_name(HTNet_host(net));

    /* Jump into the state machine */
    while (1) {
	switch (net->tcpstate) {
	  case TCP_BEGIN:
	  {
	      char * proxy = HTRequest_proxy(request);
	      char * fullhost = NULL;
	      char * host = NULL;

	      /* Check to see whether we connect directly or via a proxy */
	      fullhost = HTParse(proxy ? proxy : url, "", PARSE_HOST);

	      /* If there's an @ then use the stuff after it as a hostname */
	      if (fullhost) {
		  char * at_sign;
		  if ((at_sign = strchr(fullhost, '@')) != NULL)
		      host = at_sign+1;
		  else
		      host = fullhost;
	      }
	      if (!host || !*host) {
		  HTRequest_addError(request, ERR_FATAL, NO, HTERR_NO_HOST,
				     NULL, 0, "HTDoConnect");
		  HT_FREE(fullhost);
		  return HT_ERROR;
	      } else {
		  char *port = strchr(host, ':');
		  SockA *sin = &net->sock_addr;
		  memset((void *) sin, '\0', sizeof(SockA));
		  if (PROT_TRACE)
		      HTTrace("HTDoConnect. Looking up `%s\'\n", host);
		  if (port) {
		      *port++ = '\0';
		      if (*port && isdigit(*port)) {
#ifdef DECNET
			  sin->sdn_family = AF_DECnet;
			  sin->sdn_objnum =
			      (unsigned char)(strtol(port, (char **) 0, 10));
#else
			  sin->sin_family = AF_INET;
			  sin->sin_port = htons(atol(port));
#endif
		      }
		  } else {
#ifdef DECNET
		      sin->sdn_family = AF_DECnet;
		      net->sock_addr.sdn_objnum = DNP_OBJ;
#else  /* Internet */
		      sin->sin_family = AF_INET;
		      sin->sin_port = htons(default_port);
#endif
		  }
	      }

	      /* Find information about this host */
	      if ((net->host = HTHost_new(host)) == NULL) {
		  if (PROT_TRACE)HTTrace("HTDoConnect. Can't get host info\n");
		  net->tcpstate = TCP_ERROR;
		  break;
	      }

	      /*
	      ** Add the net object to the host object found above. If the
	      ** host is idle then we can start the request right away,
	      ** otherwise we must wait until it is free. 
	      */
	      if ((status = HTHost_addNet(net->host, net)) == HT_PENDING)
		  if (PROT_TRACE) HTTrace("HTDoConnect. Pending...\n");
	      HT_FREE(fullhost);

	      /*
	      ** If we are pending hen return here, otherwise go to next state
	      ** which is setting up a channel
	      */
	      net->tcpstate = TCP_CHANNEL;
	      if (status == HT_PENDING) return HT_PENDING;
	  }
	  break;

	case TCP_CHANNEL:
	    /*
	    **  The next state depends on whether we have a connection
	    **  or not - if so then we can jump directly to connect() to
	    **  test it - otherwise we must around DNS to get the name
	    **  Resolved
	    */
	    if ((net->channel = HTHost_channel(net->host)) != NULL) {
		net->sockfd = HTChannel_socket(net->channel);
		HTChannel_upSemaphore(net->channel);
		net->tcpstate = TCP_CONNECTED;
	    } else
		net->tcpstate = TCP_DNS;
	    hostname = HTHost_name(HTNet_host(net));
	    break;

	case TCP_DNS:
	    if ((status = HTParseInet(net, hostname)) < 0) {
		if (PROT_TRACE)
		    HTTrace("HTDoConnect. Can't locate `%s\'\n", hostname);
		HTRequest_addError(request, ERR_FATAL, NO,
				   HTERR_NO_REMOTE_HOST,
				   (void *) hostname, strlen(hostname),
				   "HTDoConnect");
		net->tcpstate = TCP_ERROR;
		break;
	    }
	    if (!net->retry && status > 1)		/* If multiple homes */
		net->retry = status;
	    net->tcpstate = TCP_NEED_SOCKET;
	    break;

	  case TCP_NEED_SOCKET:
	    if (_makeSocket(net) == -1)
		break;
	    /* Create a channel for this socket */
	    net->channel = HTChannel_new(net, YES);

	    /* If multi-homed host then start timer on connection */
	    if (net->retry) net->connecttime = time(NULL);

	    /* Progress */
	    {
		HTAlertCallback *cbf = HTAlert_find(HT_PROG_CONNECT);
		if (cbf) (*cbf)(net->request, HT_PROG_CONNECT, HT_MSG_NULL,
				NULL, hostname, NULL);
	    }
	    net->tcpstate = TCP_NEED_CONNECT;
	    break;
	  case TCP_NEED_CONNECT:
	    status = connect(net->sockfd, (struct sockaddr *) &net->sock_addr,
			     sizeof(net->sock_addr));
	    /*
	     * According to the Sun man page for connect:
	     *     EINPROGRESS         The socket is non-blocking and the  con-
	     *                         nection cannot be completed immediately.
	     *                         It is possible to select(2) for  comple-
	     *                         tion  by  selecting the socket for writ-
	     *                         ing.
	     * According to the Motorola SVR4 man page for connect:
	     *     EAGAIN              The socket is non-blocking and the  con-
	     *                         nection cannot be completed immediately.
	     *                         It is possible to select for  completion
	     *                         by  selecting  the  socket  for writing.
	     *                         However, this is only  possible  if  the
	     *                         socket  STREAMS  module  is  the topmost
	     *                         module on  the  protocol  stack  with  a
	     *                         write  service  procedure.  This will be
	     *                         the normal case.
	     */
	    if (NETCALL_ERROR(status))
	    {
		if (NETCALL_WOULDBLOCK(socerrno))
		{
		    if (PROT_TRACE)
			HTTrace("HTDoConnect. WOULD BLOCK `%s'\n", hostname);
		    HTEvent_register(net->sockfd, request, (SockOps)FD_CONNECT,
				     net->cbf, net->priority);
		    return HT_WOULD_BLOCK;
		}
		if (socerrno == EISCONN) {
		    net->tcpstate = TCP_CONNECTED;
		    break;
		}
		if (NETCALL_DEADSOCKET(socerrno))     /* We lost the socket */
		{
		    net->tcpstate = TCP_NEED_SOCKET;
		    break;
		}
		if (net->retry) {
		    net->connecttime -= time(NULL);
		    /* Added EINVAL `invalid argument' as this is what I 
		       get back from a non-blocking connect where I should 
		       get `connection refused' on BSD. SVR4 gives SIG_PIPE */
#if defined(__svr4__) || defined (_WINSOCKAPI_)
		    if (socerrno==ECONNREFUSED || socerrno==ETIMEDOUT ||
			socerrno==ENETUNREACH || socerrno==EHOSTUNREACH ||
			socerrno==EHOSTDOWN)
#else
		    if (socerrno==ECONNREFUSED || socerrno==ETIMEDOUT ||
			socerrno==ENETUNREACH || socerrno==EHOSTUNREACH ||
			socerrno==EHOSTDOWN || socerrno==EINVAL)
#endif
		        net->connecttime += TCP_DELAY;
		    else
		        net->connecttime += TCP_PENALTY;
		    HTDNS_updateWeigths(net->dns, net->home, net->connecttime);
		}
		net->tcpstate = TCP_ERROR;		
	    } else
		net->tcpstate = TCP_CONNECTED;
	    break;

	  case TCP_CONNECTED:
	    HTEvent_unregister(net->sockfd, (SockOps) FD_CONNECT);
	    if (net->retry) {
		net->connecttime -= time(NULL);
		HTDNS_updateWeigths(net->dns, net->home, net->connecttime);
	    }
	    net->retry = 0;
	    net->tcpstate = TCP_BEGIN;
	    return HT_OK;
	    break;

	  case TCP_NEED_BIND:
	  case TCP_NEED_LISTEN:
	  case TCP_ERROR:
	    if (PROT_TRACE)
		HTTrace("HTDoConnect. Connect failed %d\n", socerrno);
	    if (net->sockfd != INVSOC) {
	        HTEvent_unregister(net->sockfd, (SockOps) FD_ALL);
		NETCLOSE(net->sockfd);
		net->sockfd = INVSOC;
		if (HTHost_isPersistent(net->host)) {	 /* Inherited socket */
		    HTHost_clearChannel(net->host, HT_ERROR);
		    net->tcpstate = TCP_NEED_SOCKET;
		    break;
		}
	    }

	    /* Do we have more homes to try? */
	    if (--net->retry > 0) {
	        HTRequest_addSystemError(request, ERR_NON_FATAL, socerrno, NO,
			      "connect");
		net->tcpstate = TCP_DNS;
		break;
	    }
	    HTRequest_addSystemError(request, ERR_FATAL,socerrno,NO,"connect");
	    HTDNS_delete(hostname);
	    net->retry = 0;
	    net->tcpstate = TCP_BEGIN;
	    return HT_ERROR;
	    break;
	}
    }
}

/*	HTDoAccept()
**	------------
**	This function makes a non-blocking accept which will turn up as ready
**	read in the select.
**	Returns
**		HT_ERROR	Error has occured or interrupted
**		HT_OK		if connected
**		HT_WOULD_BLOCK  if operation would have blocked
*/
PUBLIC int HTDoAccept (HTNet * net, HTNet ** accepted)
{
    int status;
    int size = sizeof(net->sock_addr);
    HTRequest * request = HTNet_request(net);
    if (!request || net->sockfd==INVSOC) {
	if (PROT_TRACE) HTTrace("HTDoAccept.. Invalid socket\n");
	return HT_ERROR;
    }

    /* Progress report */
    {
	HTAlertCallback *cbf = HTAlert_find(HT_PROG_ACCEPT);
	if (cbf) (*cbf)(request, HT_PROG_ACCEPT, HT_MSG_NULL,NULL, NULL, NULL);
    }
    status = accept(net->sockfd, (struct sockaddr *) &net->sock_addr, &size);
    if (NETCALL_ERROR(status))
    {
	if (NETCALL_WOULDBLOCK(socerrno))
	{
	    if (PROT_TRACE)
		HTTrace("HTDoAccept.. WOULD BLOCK %d\n", net->sockfd);
	    HTEvent_register(net->sockfd, request, (SockOps) FD_ACCEPT,
			     net->cbf, net->priority);
	    return HT_WOULD_BLOCK;
	}
	HTRequest_addSystemError(request, ERR_WARN, socerrno, YES, "accept");
	if (PROT_TRACE) HTTrace("HTDoAccept.. Accept failed\n");
	return HT_ERROR;
    }

    if (PROT_TRACE) HTTrace("Accepted.... socket %d\n", status);

    /*
    ** If accepted is the same as the net obejct then reuse it, else create
    ** a new object and leave the original alone
    */
    if (*accepted == net)
	HTDoClose(net);
    else
	*accepted = HTNet_dup(net);
    (*accepted)->sockfd = status;	

    /* Create a channel for the new socket */
    (*accepted)->channel = HTChannel_new(*accepted, NO);

    return HT_OK;
}


/*	HTDoListen
**	----------
**	Listens on the specified port. 0 means that we chose it here
**	If master==INVSOC then we listen on all local interfaces (using a 
**	wildcard). If !INVSOC then use this as the local interface
**	returns		HT_ERROR	Error has occured or interrupted
**			HT_OK		if connected
*/
PUBLIC int HTDoListen (HTNet * net, u_short port, SOCKET master, int backlog)
{
    int status;

    /* Jump into the state machine */
    while (1) {
	switch (net->tcpstate) {
	  case TCP_BEGIN:
	    {
		SockA *sin = &net->sock_addr;
		memset((void *) sin, '\0', sizeof(SockA));
#ifdef DECNET
		sin->sdn_family = AF_DECnet;
		sin->sdn_objnum = port;
#else
		sin->sin_family = AF_INET;
		if (master != INVSOC) {
		    int len = sizeof(SockA);
		    if (getsockname(master, (struct sockaddr *) sin, &len)<0) {
			HTRequest_addSystemError(net->request, ERR_FATAL,
						 socerrno, NO, "getsockname");
			net->tcpstate = TCP_ERROR;
			break;
		    }
		} else
		    sin->sin_addr.s_addr = INADDR_ANY;
		sin->sin_port = htons(port);
#endif
	    }
	    if (PROT_TRACE)
		HTTrace("Socket...... Listen on port %d\n", port);
	    net->tcpstate = TCP_NEED_SOCKET;
	    break;

	  case TCP_NEED_SOCKET:
	    if (_makeSocket(net) == -1)
	        break;
	    net->tcpstate = TCP_NEED_BIND;
	    break;

	  case TCP_NEED_BIND:
	    status = bind(net->sockfd, (struct sockaddr *) &net->sock_addr,
			  sizeof(net->sock_addr));
	    if (NETCALL_ERROR(status))
	    {
		if (PROT_TRACE)
		    HTTrace("Socket...... Bind failed %d\n", socerrno);
		net->tcpstate = TCP_ERROR;		
	    } else
		net->tcpstate = TCP_NEED_LISTEN;
	    break;

	  case TCP_NEED_LISTEN:
	    status = listen(net->sockfd, backlog);
	    if (NETCALL_ERROR(status))
		net->tcpstate = TCP_ERROR;		
	    else
		net->tcpstate = TCP_CONNECTED;
	    break;

	  case TCP_CONNECTED:
	    net->tcpstate = TCP_BEGIN;
	    if (PROT_TRACE)
		HTTrace("Socket...... Bind and listen on port %d %s\n",
			(int) ntohs(net->sock_addr.sin_port),
			HTInetString(&net->sock_addr));
	    return HT_OK;
	    break;

	  case TCP_CHANNEL:
	  case TCP_NEED_CONNECT:
	  case TCP_DNS:
	  case TCP_ERROR:
	    if (PROT_TRACE) HTTrace("Socket...... Listen failed\n");
	    HTRequest_addSystemError(net->request, ERR_FATAL, socerrno, NO, "HTDoListen");
	    net->tcpstate = TCP_BEGIN;
	    return HT_ERROR;
	    break;
	}
    }
}

/*	HTDoClose
**	---------
**	Closes a file descriptor whatever means are available on the current
**	platform. If we have unix file descriptors then use this otherwise use
**	the ANSI C file descriptors
**
**	returns		HT_ERROR	Error has occured or interrupted
**			HT_OK		if connected
**			HT_WOULD_BLOCK  if operation would have blocked
*/
PUBLIC int HTDoClose (HTNet * net)
{
    int status = -1;
    if (net && net->sockfd != INVSOC) {
	if (PROT_TRACE) HTTrace("HTDoClose... Close %d\n", net->sockfd);
	status = NETCLOSE(net->sockfd);
	HTEvent_unregister(net->sockfd, (SockOps) FD_ALL);
	HTNet_decreaseSocket();
 	net->sockfd = INVSOC;
	
	/*
	**  As we have a socket available we check for whether
	**  we can start any pending requests. We do this by asking for
	**  pending Host objects. If none then use the current object
	*/
	HTHost_launchPending(net->host);

    } else
	if (PROT_TRACE) HTTrace("HTDoClose... No pending requests\n");
    return status < 0 ? HT_ERROR : HT_OK;
}


