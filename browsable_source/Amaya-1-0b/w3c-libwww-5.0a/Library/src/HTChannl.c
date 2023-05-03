/*								     HTChannl.c
**	CONTAINS STREAMS FOR READING AND WRITING TO AND FROM A TRANSPORT
**
**	(c) COPYRIGHT MIT 1995.
**	Please first read the full copyright statement in the file COPYRIGH.
**	@(#) $Id: HTChannl.c,v 1.1.1.1 1996/10/15 13:08:37 cvs Exp $
**
**
** HISTORY:
**	April 96  HFN	Written
*/

/* Library Include files */
#include "sysdep.h"
#include "WWWUtil.h"
#include "HTAlert.h"
#include "HTHost.h"
#include "HTError.h"
#include "HTChannl.h"					 /* Implemented here */

#define HASH_SIZE	67
#define HASH(s)		((s) % HASH_SIZE)

struct _HTChannel {
    SOCKET		sockfd;					   /* Socket */
    FILE *		fp;
    HTInputStream *	input;				     /* Input stream */
    HTOutputStream *	output;				    /* Output stream */
    BOOL		active;			/* Active or passive channel */
    int			semaphore;			   /* On channel use */
    HTHost *		host;			       /* Zombie connections */
};

struct _HTInputStream {
    const HTInputStreamClass *	isa;    
};

struct _HTOutputStream {
    const HTOutputStreamClass *	isa;    
};

PRIVATE HTList	** channels = NULL;			 /* List of channels */

/* ------------------------------------------------------------------------- */

PRIVATE void free_channel (HTChannel * ch)
{
    if (ch) {

	/* Close the input and output stream */
	if (ch->input) {
	    (*ch->input->isa->close)(ch->input);
	    ch->input = NULL;
	}
	if (ch->output) {
	    (*ch->output->isa->close)(ch->output);
	    ch->output = NULL;
	}

	/* Close the socket */
	if (ch->sockfd != INVSOC) {
	    NETCLOSE(ch->sockfd);
	    HTEvent_unregister(ch->sockfd, (SockOps) FD_ALL);
   	    HTNet_decreaseSocket();
	    if (PROT_TRACE)
		HTTrace("Channel..... Deleted %p, socket %d\n", ch,ch->sockfd);
	}

	/* Close the file */
	if (ch->fp) {
	    fclose(ch->fp);
	    if (PROT_TRACE)
		HTTrace("Channel..... Deleted %p, file %p\n", ch, ch->fp);
	}
	HT_FREE(ch);
    }
}

/*
**	A channel is uniquely identified by a socket.
**	Note that we don't create the input and output stream - they are 
**	created later.
**
**	We only keep a hash on sockfd's as we don't have to look for channels
**	for ANSI file descriptors.
*/
PUBLIC HTChannel * HTChannel_new (HTNet * net, BOOL active)
{
    if (net) {
	HTList * list = NULL;
	HTChannel * ch = NULL;
	SOCKET sockfd = HTNet_socket(net);
	int hash = sockfd < 0 ? 0 : HASH(sockfd);
	if (PROT_TRACE) HTTrace("Channel..... Hash value is %d\n", hash);
	if (!channels) {
	    if (!(channels = (HTList **) HT_CALLOC(HASH_SIZE,sizeof(HTList*))))
		HT_OUTOFMEM("HTChannel_new");
	}
	if (!channels[hash]) channels[hash] = HTList_new();
	list = channels[hash];
	if ((ch = (HTChannel *) HT_CALLOC(1, sizeof(HTChannel))) == NULL)
	    HT_OUTOFMEM("HTChannel_new");	    
	ch->sockfd = sockfd;
	ch->active = active;
	ch->semaphore = 1;
	HTList_addObject(list, (void *) ch);
	if (PROT_TRACE) HTTrace("Channel..... Added %p to list %p\n", ch,list);
	return ch;
    }
    return NULL;
}

/*
**	Look for a channel object if we for some reason should have lost it
**	Returns NULL if nothing found
*/
PUBLIC HTChannel * HTChannel_find (SOCKET sockfd)
{
    if (channels && sockfd != INVSOC) {
	int hash = HASH(sockfd);
	HTList * list = channels[hash];
	if (list) {
	    HTChannel * ch = NULL;
	    while ((ch = (HTChannel *) HTList_nextObject(list)))
		if (ch->sockfd == sockfd) return ch;
	}
    }
    return NULL;
}

/*
**	When deleting a channel we first look at if there are no more requests
**	using the channel (the semaphore is <= 0). Then, if the socket supports
**	persistent connections then we register the channel in the Host cache
**	and wait until the other end closes it or we get a time out on our side
*/
PUBLIC BOOL HTChannel_delete (HTChannel * channel, int status)
{
    if (channel) {
	if (PROT_TRACE) HTTrace("Channel..... Delete %p with semaphore %d\n",
				channel, channel->semaphore);
	/*
	**  We call the free methods on both the input stream and the output
	**  stream so that we can free up the stream pipes. However, note that
	**  this doesn't mean that we close the input stream and output stream
	**  them selves - only the generic streams
	*/
	if (status != HT_IGNORE) {
	    if (channel->input) 
		if (status == HT_INTERRUPTED)
		    (*channel->input->isa->abort)(channel->input, NULL);
		else
		    (*channel->input->isa->_free)(channel->input);
	    if (channel->output)
		if (status == HT_INTERRUPTED)
		    (*channel->output->isa->abort)(channel->output, NULL);
		else
		    (*channel->output->isa->_free)(channel->output);
	}

	/*
	**  Check whether this channel is used by other objects or we can
	**  delete it and free memory.
	*/
	if (channel->semaphore <= 0 && channels) {
	    int hash = HASH(channel->sockfd);
	    HTList * list = channels[hash];
	    if (list) {
		HTList_removeObject(list, (void *) channel);
		free_channel(channel);
		return YES;
	    }
	} else
	    HTChannel_downSemaphore(channel);
    }
    return NO;
}

/*	HTChannel_deleteAll
**	-------------------
**	Destroys all channels. This is called by HTLibTerminate(0
*/
PUBLIC BOOL HTChannel_deleteAll (void)
{
    if (channels) {
	HTList * cur;
	int cnt;
	for (cnt=0; cnt<HASH_SIZE; cnt++) {
	    if ((cur = channels[cnt])) { 
		HTChannel * pres;
		while ((pres = (HTChannel *) HTList_nextObject(cur)) != NULL)
		    free_channel(pres);
	    }
	    HTList_delete(channels[cnt]);
	}
	HT_FREE(channels);
    }
    return YES;
}

/*
**	Return the socket associated with this channel
*/
PUBLIC SOCKET HTChannel_socket (HTChannel * channel)
{
    return channel ? channel->sockfd : INVSOC;
}

/*
**	Return the file descriptor associated with this channel
*/
PUBLIC FILE * HTChannel_file (HTChannel * channel)
{
    return channel ? channel->fp : NULL;
}

/*
**	We keep the associated Host object in case we have a
**	sleeping connection. 
*/
PUBLIC BOOL HTChannel_setHost (HTChannel * ch, HTHost * host)
{
    if (ch && host) {
	ch->host = host;
	return YES;
    }
    return NO;
}

PUBLIC HTHost * HTChannel_host (HTChannel * ch)
{
    return (ch ? ch->host : NULL);
}

/*
**	Increase the semaphore for this channel
*/
PUBLIC void HTChannel_upSemaphore (HTChannel * channel)
{
    if (channel) {
	channel->semaphore++;
	if (PROT_TRACE)
	    HTTrace("Channel..... Semaphore increased to %d for channel %p\n",
		    channel->semaphore, channel);
    }
}

/*
**	Decrease the semaphore for this channel
*/
PUBLIC void HTChannel_downSemaphore (HTChannel * channel)
{
    if (channel) {
	channel->semaphore--;
	if (channel->semaphore <= 0) channel->semaphore = 0;
	if (PROT_TRACE)
	    HTTrace("Channel..... Semaphore decreased to %d for channel %p\n",
		    channel->semaphore, channel);
    }
}

/*
**	Explicitly set the semaphore for this channel
*/
PUBLIC void HTChannel_setSemaphore (HTChannel * channel, int semaphore)
{
    if (channel) {
	channel->semaphore = semaphore;
	if (channel->semaphore <= 0) channel->semaphore = 0;
	if (PROT_TRACE)
	    HTTrace("Channel..... Semaphore set to %d for channel %p\n",
		    channel->semaphore, channel);
    }
}

/*
**	Create the input stream and bind it to the channel
**	Please read the description in the HTIOStream module on the parameters
*/
PUBLIC BOOL HTChannel_setInput (HTChannel * ch, HTInputStream * input)
{
    if (ch) {
	ch->input = input;
	return YES;
    }
    return NO;
}

PUBLIC HTInputStream * HTChannel_input (HTChannel * ch)
{
    return ch ? ch->input : NULL;
}

/*
**	Create the output stream and bind it to the channel
**	Please read the description in the HTIOStream module on the parameters
*/
PUBLIC BOOL HTChannel_setOutput (HTChannel * ch, HTOutputStream * output)
{
    if (ch) {
	ch->output = output;
	return YES;
    }
    return NO;
}

PUBLIC HTOutputStream * HTChannel_output (HTChannel * ch)
{
    return ch ? ch->output : NULL;
}

