/*							       	    HTCache.c
**	CACHE WRITER
**
**	(c) COPYRIGHT MIT 1995.
**	Please first read the full copyright statement in the file COPYRIGH.
**	@(#) $Id: HTCache.c,v 1.3 1997/02/07 14:25:16 cvs Exp $
**
**	This modules manages the cache
**
**      History:
**         HFN: spawned from HTFwrite
**         HWL: converted the caching scheme to be hierachical by taking
**              AL code from Deamon
**
*/

/* Library include files */
#include "sysdep.h"
#include "WWWUtil.h"
#include "WWWCore.h"
#include "WWWTrans.h"
#include "WWWApp.h"
#include "HTNetMan.h"
#include "HTCache.h"					 /* Implemented here */

/* This is the default cache directory: */
#define HT_CACHE_ROOT	"/tmp/w3c-lib"
#define HT_CACHE_INDEX	".index"
#define HT_CACHE_META	".meta"

#define HASH_SIZE 	67
#define DUMP_FREQUENCY	10			/* Dump index after 10 loads */

#define MEGA		0x100000L
#define CACHE_SIZE	(20*MEGA)		/* Default cache size is 20M */
#define MIN_CACHE_SIZE  (5*MEGA)			   /* Min cache size */
#define SIZE_BUFFER	(1*MEGA)      /* Buffer for metainfo and directories */

/* Final states have negative value */
typedef enum _CacheState {
    CL_ERROR		= -3,
    CL_NO_DATA		= -2,
    CL_GOT_DATA		= -1,
    CL_BEGIN		= 0,
    CL_NEED_INDEX,
    CL_NEED_HEAD,
    CL_NEED_BODY,
    CL_NEED_OPEN_FILE,
    CL_NEED_CONTENT
} CacheState;

/* This is the context structure for the this module */
typedef struct _cache_info {
    CacheState		state;		  /* Current state of the connection */
    char *		local;		/* Local representation of file name */
    BOOL		meta;		  /* Are we reading metainformation? */
    struct stat		stat_info;	      /* Contains actual file chosen */
} cache_info;

struct _HTCache {
    /* Location */
    int 		hash;
    char *		url;
    char *		cachename;

    /* Cache expiration time */
    time_t		expires;

    /* GC parameters */
    long		size;		       /* Size of cached entity body */
    BOOL		range;	      /* Is this the full part or a subpart? */
    int			hits;				       /* Hit counts */
    time_t		freshness_lifetime;
    time_t		response_time;
    time_t		corrected_initial_age;
    BOOL		must_revalidate;
    HTRequest *		lock;
};

struct _HTStream {
    const HTStreamClass *	isa;
    FILE *			fp;
    long			bytes_written;	  /* Number of bytes written */
    HTCache *			cache;
    HTRequest *			request;
    HTResponse *		response;
    HTChunk *			buffer;			/* For index reading */
    HTEOLState			EOLstate;
    BOOL			append;		   /* Creating or appending? */
};

struct _HTInputStream {
    const HTInputStreamClass *	isa;
};

/* Cache parameters */ 
PRIVATE BOOL		HTCacheEnable = NO;	      /* Disabled by default */
PRIVATE char *		HTCacheRoot = NULL;  	    /* Destination for cache */
PRIVATE HTExpiresMode	HTExpMode = HT_EXPIRES_IGNORE;
PRIVATE HTDisconnectedMode DisconnectedMode = HT_DISCONNECT_NONE;

/* List of cache entries */
PRIVATE HTList ** 	CacheTable = NULL;

/* Cache size variables */
PRIVATE long		HTCacheSize = CACHE_SIZE;
PRIVATE long		HTTotalSize = 0L;

PRIVATE int		new_entries = 0;	   /* Number of new entries */

/* ------------------------------------------------------------------------- */
/*  			     CACHE GARBAGE COLLECTOR			     */
/* ------------------------------------------------------------------------- */

PRIVATE BOOL HTCacheGarbage (void)
{
    long old_size = HTTotalSize;
    if (CACHE_TRACE) HTTrace("Cache....... Garbage collecting\n");
    if (CacheTable) {
	time_t cur_time = time(NULL);
	HTList * cur;
	int cnt;
	int hits;

	/*
	**  Tell the use that we're gc'ing.
	*/
	{
	    HTAlertCallback * cbf = HTAlert_find(HT_PROG_GC);
	    if (cbf) (*cbf)(NULL, HT_PROG_GC, HT_MSG_NULL,NULL, NULL, NULL);
	}

	/*
	**  Walk through and delete all the expired entries. If this is not
	**  sufficient then take the fresh ones which have the lowest cache
	**  hit count. This algorithm could be made a lot fancier by including
	**  the size and also the pain it took to get the document in the first
	**  case. It could also include max_stale.
	*/
	if (CACHE_TRACE) HTTrace("Cache....... Collecting Stale entries\n");
	for (cnt=0; cnt<HASH_SIZE; cnt++) {
	    if ((cur = CacheTable[cnt])) { 
		HTCache * pres;
		HTList * old_cur = cur;
		while ((pres = (HTCache *) HTList_nextObject(cur)) != NULL) {
		    time_t resident_time = cur_time - pres->response_time;
		    time_t current_age = pres->corrected_initial_age +
			resident_time;
		    if (pres->freshness_lifetime < current_age) {
			HTCache_remove(pres);
			cur = old_cur;
		    } else {
			old_cur = cur;
		    }
		}
	    }
	}

	/*
	**  We must at least free the min buffer size so that we don't
	**  dead lock ourselves. We start from the bottom up by taking
	**  all the documents with 0 hits, 1 hits, 2 hits, etc.
	*/
	hits = 0;
	while (1) {
	    BOOL removed = NO;
	    if (CACHE_TRACE)
		HTTrace("Cache....... Collecting entries with %d hits\n",hits);
	    if (HTTotalSize + SIZE_BUFFER > HTCacheSize) {
		for (cnt=0; cnt<HASH_SIZE; cnt++) {
		    if ((cur = CacheTable[cnt])) { 
			HTCache * pres;
			HTList * old_cur = cur;
			while ((pres = (HTCache *) HTList_nextObject(cur))) {
			    if (pres->hits <= hits) {
				HTCache_remove(pres);
				cur = old_cur;
				removed = YES;
			    } else {
				old_cur = cur;
			    }
			}
		    }
		}
	    } else
		break;
	    if (!removed) break;
	    hits++;
	}
	if (CACHE_TRACE)
	    HTTrace("Cache....... Size reduced from %ld to %ld\n",
		    old_size, HTTotalSize);
	/*
	**  Dump the new content to the index file
	*/
	HTCacheIndex_write(HTCacheRoot);
	new_entries = 0;
	return YES;
    }
    return NO;
}

/* ------------------------------------------------------------------------- */
/*  			      CACHE INDEX				     */
/* ------------------------------------------------------------------------- */

PRIVATE char * cache_index_name (const char * cache_root)
{
    if (cache_root) {
	char * location = NULL;
	if ((location = (char *)
	     HT_MALLOC(strlen(cache_root) + strlen(HT_CACHE_INDEX) + 1)) == NULL)
	    HT_OUTOFMEM("cache_index_name");
	strcpy(location, cache_root);
	strcat(location, HT_CACHE_INDEX);
	return location;
    }
    return NULL;
}

/*
**  Remove the cache index file
*/
PUBLIC BOOL HTCacheIndex_delete (const char * cache_root)
{
    if (cache_root) {
	char * index = cache_index_name(cache_root);
	REMOVE(index);
	HT_FREE(index);
	return YES;
    }
    return NO;
}

/*
**	Walk through the list of cached objects and save them to disk.
**	We override any existing version but that is normally OK as we have
**	already read its contents.
*/
PUBLIC BOOL HTCacheIndex_write (const char * cache_root)
{
    if (cache_root && CacheTable) {
	char * index = cache_index_name(cache_root);
	FILE * fp = NULL;
	if (CACHE_TRACE) HTTrace("Cache Index. Writing index `%s\'\n", index);

	/*
	**  Open the file for writing. Note - we don't take a backup!
	**  This should probably be fixed!
	*/
	if (!index) return NO;
	if ((fp = fopen(index, "wb")) == NULL) {
	    if (CACHE_TRACE)
		HTTrace("Cache Index. Can't open `%s\' for writing\n", index);
	    HT_FREE(index);
	    return NO;
	}

	/*
	**  Walk through the list and write it out. The format is really
	**  simple as we keep it all in ASCII.
	*/
	{
	    HTList * cur;
	    int cnt;
	    for (cnt=0; cnt<HASH_SIZE; cnt++) {
		if ((cur = CacheTable[cnt])) { 
		    HTCache * pres;
		    while ((pres = (HTCache *) HTList_nextObject(cur))) {
			if (fprintf(fp, "%s %s %ld %ld %c %d %d %ld %ld %ld %c\r\n",
				    pres->url,
				    pres->cachename,
				    pres->expires,
				    pres->size,
				    pres->range+0x30,
				    pres->hash,
				    pres->hits,
				    pres->freshness_lifetime,
				    pres->response_time,
				    pres->corrected_initial_age,
				    pres->must_revalidate+0x30) < 0) {
			    if (CACHE_TRACE)
				HTTrace("Cache Index. Error writing cache index\n");
			    return NO;
			}
		    }
		}
	    }
	}

	/* Done writing */
	fclose(fp);
	HT_FREE(index);
    }
    return NO;
}

/*
**	Load one line of index file
**	Returns YES if line OK, else NO
*/
PRIVATE BOOL HTCacheIndex_parseLine (char * line)
{
    HTCache * cache = NULL;
    if (line) {
	char validate;
	char range;
	if ((cache = (HTCache *) HT_CALLOC(1, sizeof(HTCache))) == NULL)
	    HT_OUTOFMEM("HTCacheIndex_parseLine");

	/*
	**  Read the line and create the cache object
	*/
	{
	    char * url = HTNextField(&line);
	    char * cachename = HTNextField(&line);
	    StrAllocCopy(cache->url, url);
	    StrAllocCopy(cache->cachename, cachename);
	}
	/*
	 * D.V. 2/5/97 error if nb_item read < 9
	 * and range was nether initialized
	 */
	if (sscanf(line, "%ld %ld %c %d %d %ld %ld %ld %c",
		   &cache->expires,
		   &cache->size,
		   &range,
		   &cache->hash,
		   &cache->hits,
		   &cache->freshness_lifetime,
		   &cache->response_time,
		   &cache->corrected_initial_age,
		   &validate) < 9) {
	    if (CACHE_TRACE) HTTrace("Cache Index. Error reading cache index\n");
	    return NO;
	}
	cache->range = range-0x30;
	cache->must_revalidate = validate-0x30;

	/*
	**  Create the new anchor and fill in the expire information we have read
	**  in the index.
	*/
	if (cache) {
	    HTAnchor * anchor = HTAnchor_findAddress(cache->url);
	    HTParentAnchor * parent = HTAnchor_parent(anchor);
	    HTAnchor_setExpires(parent, cache->expires);
	}

	/*
	**  Create the cache table if not already existent and add the new
	**  entry. Also check that the hash is still within bounds
	*/
	if (!CacheTable) {
	    if ((CacheTable = (HTList **) HT_CALLOC(HASH_SIZE,
						    sizeof(HTList *))) == NULL)
		HT_OUTOFMEM("HTCache_parseLine");
	}
	if (cache->hash >= 0 && cache->hash < HASH_SIZE) {
	    int hash = cache->hash;
	    if (!CacheTable[hash]) CacheTable[hash] = HTList_new();
	    HTList_addObject(CacheTable[hash], (void *) cache);
	}

	/* Update the total cache size */
	HTTotalSize += cache->size;

	return YES;
    }
    return NO;
}

/*
**	Folding is either of CF LWS, LF LWS, CRLF LWS
*/
PRIVATE int HTCacheIndex_put_block (HTStream * me, const char * b, int l)
{
    while (l > 0) {
	if (me->EOLstate == EOL_FCR) {
	    if (*b == LF)				   	     /* CRLF */
		me->EOLstate = EOL_FLF;
	    else if (WHITE(*b))				   /* Folding: CR SP */
		me->EOLstate = EOL_DOT;
	    else {						 /* New line */
		HTCacheIndex_parseLine(HTChunk_data(me->buffer));
		me->EOLstate = EOL_BEGIN;
		HTChunk_clear(me->buffer);
		continue;
	    }
	} else if (me->EOLstate == EOL_FLF) {
	    if (WHITE(*b))		       /* Folding: LF SP or CR LF SP */
		me->EOLstate = EOL_DOT;
	    else {						/* New line */
		HTCacheIndex_parseLine(HTChunk_data(me->buffer));
		me->EOLstate = EOL_BEGIN;
		HTChunk_clear(me->buffer);
		continue;
	    }
	} else if (me->EOLstate == EOL_DOT) {
	    if (WHITE(*b)) {
		me->EOLstate = EOL_BEGIN;
		HTChunk_putc(me->buffer, ' ');
	    } else {
		HTCacheIndex_parseLine(HTChunk_data(me->buffer));
		me->EOLstate = EOL_BEGIN;
		HTChunk_clear(me->buffer);
		continue;
	    }
	} else if (*b == CR) {
	    me->EOLstate = EOL_FCR;
	} else if (*b == LF) {
	    me->EOLstate = EOL_FLF;			       /* Line found */
	} else
	    HTChunk_putc(me->buffer, *b);
	l--; b++;
    }
    return HT_OK;
}

PRIVATE int HTCacheIndex_put_character (HTStream * me, char c)
{
    return HTCacheIndex_put_block(me, &c, 1);
}

PRIVATE int HTCacheIndex_put_string (HTStream * me, const char * s)
{
    return HTCacheIndex_put_block(me, s, (int) strlen(s));
}

PRIVATE int HTCacheIndex_flush (HTStream * me)
{
    if (me) {
	char * flush = HTChunk_data(me->buffer);
	if (flush) HTCacheIndex_parseLine(flush);
	HTChunk_clear(me->buffer);
    }
    return HT_OK;
}

PRIVATE int HTCacheIndex_free (HTStream * me)
{
    if (me) {
	int status = HTCacheIndex_flush(me);
	if (APP_TRACE) HTTrace("Cache Index. FREEING....\n");
	HTChunk_delete(me->buffer);
	HT_FREE(me);
	return status;
    }
    return HT_ERROR;
}

PRIVATE int HTCacheIndex_abort (HTStream * me, HTList * e)
{
    if (me) {
	int status = HT_ERROR;
	if (APP_TRACE) HTTrace("Cache Index. ABORTING...\n");
	HTChunk_delete(me->buffer);
	HT_FREE(me);
	return status;
    }
    return HT_ERROR;
}

/*	Structured Object Class
**	-----------------------
*/
PRIVATE const HTStreamClass HTCacheIndexClass =
{		
    "CacheIndexParser",
    HTCacheIndex_flush,
    HTCacheIndex_free,
    HTCacheIndex_abort,
    HTCacheIndex_put_character,
    HTCacheIndex_put_string,
    HTCacheIndex_put_block
};

PRIVATE HTStream * HTCacheIndexReader (HTRequest *	request)
{
    HTStream * me;
    if ((me = (HTStream *) HT_CALLOC(1, sizeof(HTStream))) == NULL)
	HT_OUTOFMEM("HTCacheIndexs");
    me->isa = &HTCacheIndexClass;
    me->request = request;
    me->buffer = HTChunk_new(512);
    me->EOLstate = EOL_BEGIN;
    return me;
}

/*
**	Read the saved set of cached entries from disk. we only allow the index
**	ro be read when there is no entries in memory. That way we can ensure
**	consistancy.
*/
PUBLIC BOOL HTCacheIndex_read (const char * cache_root)
{
    BOOL status = NO;
    if (cache_root && CacheTable == NULL) {
	char * file = cache_index_name(cache_root);
	char * index = HTParse(file, "cache:", PARSE_ALL);
	HTAnchor * anchor = HTAnchor_findAddress(index);
	HTRequest * request = HTRequest_new();
	HTRequest_setPreemptive(request, YES);
	HTRequest_setOutputFormat(request, WWW_SOURCE);
	HTRequest_setOutputStream(request, HTCacheIndexReader(request));
	HTRequest_setAnchor(request, anchor);
	HTAlert_setInteractive(NO);
	status = HTLoad(request, NO);
	HTRequest_delete(request);
	HT_FREE(file);
	HT_FREE(index);
    }
    return status;
}

/* ------------------------------------------------------------------------- */
/*  			      CACHE PARAMETERS				     */
/* ------------------------------------------------------------------------- */

PRIVATE BOOL create_cache_root (const char * cache_root)
{
    struct stat stat_info;
    char * loc = NULL;
    char * cur = NULL;
    BOOL create = NO;
    if (!cache_root) return NO;
    StrAllocCopy(loc, cache_root);			 /* Get our own copy */
    cur = loc+1;
    while ((cur = strchr(cur, '/'))) {
	*cur = '\0';
	if (create || HT_STAT(loc, &stat_info) == -1) {
	    create = YES;		   /* To avoid doing stat()s in vain */
	    if (CACHE_TRACE) HTTrace("Cache....... Creating dir `%s\'\n", loc);
	    if (MKDIR(loc, 0777) < 0) {
		if (CACHE_TRACE) HTTrace("Cache....... can't create\n");
		HT_FREE(loc);
		return NO;
	    }
	} else {
	    if (CACHE_TRACE)
		HTTrace("Cache....... dir `%s\' already exists\n", loc);
	}
	*cur++ = '/';
    }
    HT_FREE(loc);
    return YES;
}

/*
**	If `cache_root' is NULL then the current value (might be a define)
**	Should we check if the cache_root is actually OK? I think not!
*/
PRIVATE BOOL HTCacheMode_setRoot (const char * cache_root)
{
    StrAllocCopy(HTCacheRoot, cache_root ? cache_root : HT_CACHE_ROOT);
    if (*(HTCacheRoot+strlen(HTCacheRoot)-1) != '/')
	StrAllocCat(HTCacheRoot, "/");
    if (create_cache_root(HTCacheRoot) == NO) return NO;
    if (CACHE_TRACE) HTTrace("Cache Root.. Root set to `%s\'\n", HTCacheRoot);
    return YES;
}

/*
**	Return the value of the cache root. The cache root can only be
**	set through the HTCacheInit() function
*/
PUBLIC const char * HTCacheMode_getRoot (void)
{
    return HTCacheRoot;
}

/*
**	If `cache_root' is NULL then reuse old value or use HT_CACHE_ROOT.
**	An empty string will make '/' as cache root
**	We can only enable the cache if the HTSecure flag is not set. This
**	is for example the case if using an application as a telnet shell.
*/
PUBLIC BOOL HTCacheInit (const char * cache_root, int size)
{
    if (!HTLib_secure() && !HTCacheRoot) {

	/*
	**  Find an appropriate root for the cache
	*/
	if (HTCacheMode_setRoot(cache_root) != YES) return NO;

	/*
	**  Set the max size of the cache 
	*/
	HTCacheMode_setMaxSize(size);

	/*
	**  Look for the cache index and read the contents
	*/
	HTCacheIndex_read(HTCacheRoot);

	/*
	**  Do caching from now on
	*/
	HTCacheEnable = YES;
	return YES;
    }
    return NO;
}

/*
**	Turns off the cache and updates entries on disk.
*/
PUBLIC BOOL HTCacheTerminate (void)
{
    /*
    **  Write the index to file
    */
    HTCacheIndex_write(HTCacheRoot);

    /*
    **  Cleanup memory by deleting all HTCache objects
    */
    HTCache_deleteAll();

    /*
    **  Don't do anymore caching from now on
    */
    HT_FREE(HTCacheRoot);
    HTCacheEnable = NO;
    return YES;
}

/*
**	The cache can be temporarily suspended by using the enable/disable
**	flag. This does not prevent the cache from being enabled/disable at
**	a later point in time.
*/
PUBLIC void HTCacheMode_setEnabled (BOOL mode)
{
    HTCacheEnable = mode;
}

PUBLIC BOOL HTCacheMode_enabled (void)
{
    return HTCacheEnable;
}

/*
**  We can set the cache to operate in disconnected mode in which we only
**  return (valid) responses from the cache. Disconnected mode does not
**  automatically deliver stale documents as this must be declared 
**  explicitly. 
*/
PUBLIC void HTCacheMode_setDisconnected (HTDisconnectedMode mode)
{
    DisconnectedMode = mode;
}

PUBLIC HTDisconnectedMode HTCacheMode_disconnected (void)
{
    return DisconnectedMode;
}

PUBLIC BOOL HTCacheMode_isDisconnected (HTReload mode)
{
    return (DisconnectedMode != HT_DISCONNECT_NONE);
}

/*
**  Set the mode for how we handle Expires header from the local history
**  list. The following modes are available:
**
**	HT_EXPIRES_IGNORE : No update in the history list
**	HT_EXPIRES_NOTIFY : The user is notified but no reload
**	HT_EXPIRES_AUTO   : Automatic reload
*/
PUBLIC void HTCacheMode_setExpires (HTExpiresMode mode)
{
    HTExpMode = mode;
}

PUBLIC HTExpiresMode HTCacheMode_expires (void)
{
    return HTExpMode;
}

/*
**  Cache size management. We set the default cache size to 20M.
**  We set the minimum size to 5M in order not to get into weird
**  problems while writing the cache. The size is indicated in Mega
**  bytes
*/
PUBLIC BOOL HTCacheMode_setMaxSize (int size)
{
    long new_size = size < 5 ? MIN_CACHE_SIZE : size * MEGA;
    if (new_size < HTTotalSize) HTCacheGarbage();
    HTCacheSize = new_size - SIZE_BUFFER;
    if (CACHE_TRACE) HTTrace("Cache...... Total cache size: %ld\n", new_size);
    return YES;
}

PUBLIC int HTCacheMode_maxSize (void)
{
    return HTCacheSize / MEGA;
}

/* ------------------------------------------------------------------------- */
/*  				 CACHE OBJECT				     */
/* ------------------------------------------------------------------------- */

PRIVATE BOOL free_object (HTCache * me)
{
    HT_FREE(me->url);
    HT_FREE(me->cachename);
    HT_FREE(me);
    return YES;
}

PRIVATE BOOL delete_object (HTList * list, HTCache * me)
{
    if (CACHE_TRACE) HTTrace("Cache....... delete %p from list %p\n",me, list);
    HTList_removeObject(list, (void *) me);
    HTTotalSize -= me->size;
    free_object(me);
    return YES;
}

/*
**	Create directory path for cache file
**
** On exit:
**	return YES
**		if directories created -- after that caller
**		can rely on fopen(cfn,"w") succeeding.
**
*/
PRIVATE BOOL HTCache_createLocation (HTCache * me)
{
    if (me && HTCacheRoot) {
	BOOL status = YES;
	char * path = NULL;
	struct stat stat_info;
	if ((path = (char *) HT_MALLOC(strlen(HTCacheRoot) + 10)) == NULL)
	    HT_OUTOFMEM("HTCache_createLocation");
	sprintf(path, "%s%d", HTCacheRoot, me->hash);
	if (HT_STAT(path, &stat_info) == -1) {
	    if (CACHE_TRACE) HTTrace("Cache....... Create dir `%s\'\n", path);
	    if (MKDIR(path, 0777) < 0) {
		if (CACHE_TRACE) HTTrace("Cache....... Can't create...\n");
		status = NO;
	    }
	} else {
	    if (CACHE_TRACE)
		HTTrace("Cache....... Directory `%s\' already exists\n", path);
	}
	HT_FREE(path);
	return status;
    }
    return NO;
}

/*
**	Find a cache filename for this cache object.
*/
PRIVATE BOOL HTCache_findName (HTCache * me)
{
    if (me) {
	/*
	** Create path for this cache entry. We base the cache location on the
	** hash calculated as a function of the URL. That way, we ensure a 
	** resonably uniform distribution.
	*/
	me->cachename = HTGetTmpFileName(NULL);
	return HTCache_createLocation(me);
    }
    return NO;
}

/*
**  Calculate the corrected_initial_age of the object. We use the time
**  when this function is called as the response_time as this is when
**  we have received the complete response. This may cause a delay if
**  the reponse header is very big but should not cause any incorrect
**  behavior.
*/
PRIVATE BOOL calculate_time (HTCache * me, HTRequest * request,
			     HTResponse * response)
{
    if (me && request) {
	HTParentAnchor * anchor = HTRequest_anchor(request);
	time_t date = HTAnchor_date(anchor);
	me->response_time = time(NULL);
	me->expires = HTAnchor_expires(anchor);
	{
	    time_t apparent_age = HTMAX(0, me->response_time - date);
	    time_t corrected_received_age = HTMAX(apparent_age, HTAnchor_age(anchor));
	    time_t response_delay = me->response_time - HTRequest_date(request);
	    me->corrected_initial_age = corrected_received_age + response_delay;
	}

	/*
	**  Estimate an expires time using the max-age and expires time. If we
	**  don't have an explicit expires time then set it to 10% of the LM
	**  date. If no LM date is available then use 24 hours.
	*/
	{
	    time_t freshness_lifetime = HTResponse_maxAge(response);
	    if (freshness_lifetime < 0) {
		if (me->expires < 0) {
		    time_t lm = HTAnchor_lastModified(anchor);
		    if (lm < 0)
			freshness_lifetime = 24*3600;		/* 24 hours */
		    else 
			freshness_lifetime = (date - lm) / 10;
		} else
		    freshness_lifetime = me->expires - date;
	    }
	    me->freshness_lifetime = HTMAX(0, freshness_lifetime);
	}
	if (CACHE_TRACE) {
	    HTTrace("Cache....... Received Age %d, corrected %d, freshness lifetime %d\n",
		    HTAnchor_age(anchor),
		    me->corrected_initial_age,
		    me->freshness_lifetime);
	}
	return YES;
    }
    return NO;
}

/*
**  Create a new cache entry and add it to the list
*/
PRIVATE HTCache * HTCache_new (HTRequest * request, HTResponse * response,
			       HTParentAnchor * anchor)
{
    HTList * list = NULL;			    /* Current list in cache */
    HTCache * pres = NULL;
    int hash = 0;
    char * url = NULL;
    if (!request || !response || !anchor) {
	if (CORE_TRACE) HTTrace("Cache....... Bad argument\n");
	return NULL;
    }
    
    /* Find a hash for this anchor */
    if ((url = HTAnchor_address((HTAnchor *) anchor))) {
	char * ptr;
	for (ptr=url; *ptr; ptr++)
	    hash = (int) ((hash * 3 + (*(unsigned char *) ptr)) % HASH_SIZE);
	if (!CacheTable) {
	    if ((CacheTable = (HTList **) HT_CALLOC(HASH_SIZE,
						   sizeof(HTList *))) == NULL)
	        HT_OUTOFMEM("HTCache_new");
	}
	if (!CacheTable[hash]) CacheTable[hash] = HTList_new();
	list = CacheTable[hash];
    } else
	return NULL;

    /* Search the cache */
    {
	HTList * cur = list;
	while ((pres = (HTCache *) HTList_nextObject(cur))) {
	    if (!strcmp(pres->url, url)) break;
	}
    }

    /* If not found then create new cache object, else use existing one */
    if (!pres) {
	if ((pres = (HTCache *) HT_CALLOC(1, sizeof(HTCache))) == NULL)
	    HT_OUTOFMEM("HTCache_new");
	pres->hash = hash;
	pres->url = url;
	pres->range = NO;
	HTCache_findName(pres);
	HTList_addObject(list, (void *) pres);
	new_entries++;
    } else
	HT_FREE(url);

    if (HTCache_hasLock(pres)) {
	if (CACHE_TRACE) HTTrace("Cache....... Entry %p locked\n");
	return pres;
    }

    /* Calculate the various times */
    calculate_time(pres, request, response);

    /* Must we revalidate this every time? */
    pres->must_revalidate = HTResponse_mustRevalidate(response);
    return pres;
}

/*
**  Set the size of a cached object. We don't consider the metainformation as
**  part of the size which is the the reason for why the min cache size should
**  not be less than 5M. When we set the cache size we also check whether we 
**  should run the gc or not.
*/
PRIVATE BOOL HTCache_setSize (HTCache * cache, long written, BOOL append)
{
    if (cache) {
	/*
	**  First look to see if we already have registered this cache entry
	**  with a certain size. This size may be a subpart of the total entity
	**  (in case the download was interrupted)
	*/
	if (cache->size > 0 && !append) HTTotalSize -= cache->size;
	cache->size = written;
	HTTotalSize += written;

	/*
	**  Now add the new size to the total cache size. If the new size is
	**  bigger than the legal cache size then start the gc.
	*/
	if (CACHE_TRACE) HTTrace("Cache....... Total size %ld\n", HTTotalSize);
	if (HTTotalSize > HTCacheSize) HTCacheGarbage();
	return YES;
    }
    return NO;
}

/*
**  Verifies if a cache object exists for this URL and if so returns a URL
**  for the cached object. It does not verify whether the object is valid or
**  not, for example it might have expired.
**
**  Returns: file name	If OK (must be freed by caller)
**	     NULL	If no cache object found
*/
PUBLIC HTCache * HTCache_find (HTParentAnchor * anchor)
{
    HTList * list = NULL;
    HTCache * pres = NULL;

    /* Find a hash entry for this URL */
    if (HTCacheMode_enabled() && anchor && CacheTable) {
	char * url = HTAnchor_address((HTAnchor *) anchor);
	int hash = 0;
	char * ptr = url;
	for (; *ptr; ptr++)
	    hash = (int) ((hash * 3 + (*(unsigned char *) ptr)) % HASH_SIZE);
	if (!CacheTable[hash]) {
	    HT_FREE(url);
	    return NULL;
	}
	list = CacheTable[hash];

	/* Search the cache */
	{
	    HTList * cur = list;
	    while ((pres = (HTCache *) HTList_nextObject(cur))) {
		if (!strcmp(pres->url, url)) {
		    if (CACHE_TRACE) HTTrace("Cache....... Found %p hits %d\n",
					     pres, pres->hits);
		    break;
		}
	    }
	}
	HT_FREE(url);
    }
    return pres;
}

/*	HTCache_delete
**	--------------
**	Deletes a cache entry
*/
PRIVATE BOOL HTCache_delete (HTCache * cache)
{
    if (cache && CacheTable) {
	HTList * cur = CacheTable[cache->hash];
	return cur && delete_object(cur, cache);
    }
    return NO;
}

/*	HTCache_deleteAll
**	-----------------
**	Destroys all cache entried in memory but does not write anything to
**	disk
*/
PUBLIC BOOL HTCache_deleteAll (void)
{
    if (CacheTable) {
	HTList * cur;
	int cnt;

	/* Delete the rest */
	for (cnt=0; cnt<HASH_SIZE; cnt++) {
	    if ((cur = CacheTable[cnt])) { 
		HTCache * pres;
		while ((pres = (HTCache *) HTList_nextObject(cur)) != NULL)
		    free_object(pres);
	    }
	    HTList_delete(CacheTable[cnt]);
	}
	HT_FREE(CacheTable);
	HTTotalSize = 0L;
	return YES;
    }
    return NO;
}

/*
**  Is we have a valid entry in the cache then we also need a location
**  where we can get it. Hopefully, we may be able to access it
**  thourgh one of our protocol modules, for example the local file
**  module. The name returned is in URL syntax and must be freed by
**  the caller
*/
PRIVATE char * HTCache_location (HTCache * cache, BOOL meta)
{
    char * local = NULL;
    if (cache && HTCacheRoot) {
	if (meta) {
	    if ((local = (char *) HT_MALLOC(strlen(HTCacheRoot) + 10 +
					    strlen(HT_CACHE_META) +
					    strlen(cache->cachename))) == NULL)
		HT_OUTOFMEM("HTCache_location");
	    sprintf(local, "%s%d/%s%s", HTCacheRoot, cache->hash, cache->cachename,
		    HT_CACHE_META);
	} else {
	    if ((local = (char *) HT_MALLOC(strlen(HTCacheRoot) + 10 +
					    strlen(cache->cachename))) == NULL)
		HT_OUTOFMEM("HTCache_location");
	    sprintf(local, "%s%d/%s", HTCacheRoot, cache->hash, cache->cachename);
	}
    }
    return local;
}

/*
**  Remove from disk. You must explicitly remove a lock
**  before this operation can succeed
*/
PRIVATE BOOL flush_object (HTCache * cache)
{
    if (cache && !HTCache_hasLock(cache)) {
	char * head = HTCache_location(cache, YES);
	char * body = HTCache_location(cache, NO);
	REMOVE(head);
	REMOVE(body);
	HT_FREE(head);
	HT_FREE(body);
	return YES;
    }
    return NO;
}

/*	HTCache_flushAll
**	----------------
**	Destroys all cache entried in memory and on disk. Resets the cache
**	to empty but the cache does not have to be reinitialized before we
**	can use it again.
*/
PUBLIC BOOL HTCache_flushAll (void)
{
    if (CacheTable) {
	HTList * cur;
	int cnt;

	/* Delete the rest */
	for (cnt=0; cnt<HASH_SIZE; cnt++) {
	    if ((cur = CacheTable[cnt])) { 
		HTCache * pres;
		while ((pres = (HTCache *) HTList_nextObject(cur)) != NULL) {
		    flush_object(pres);
		    free_object(pres);
		}
	    }
	    HTList_delete(CacheTable[cnt]);
	    CacheTable[cnt] = NULL;
	}

	/* Write the new empty index to disk */
	HTCacheIndex_write(HTCacheRoot);
	HTTotalSize = 0L;
	return YES;
    }
    return NO;
}

/*
**  This function checks whether a document has expired or not.
**  The check is based on the metainformation passed in the anchor object
**  The function returns the level of validation needed for getting a fresh
**  version. We also check the cache control directives in the request to
**  see if they change the freshness discission. 
*/
PUBLIC HTReload HTCache_isFresh (HTCache * cache, HTRequest * request)
{
    HTAssocList * cc = HTRequest_cacheControl(request);
    if (cache) {
	time_t max_age = -1;
	time_t max_stale = -1;
	time_t min_fresh = -1;

	/*
	**  If we only have a part of this request then make a range request
	**  using the If-Range condition GET request
	*/
	if (cache->range) {
	    char buf[20];
	    sprintf(buf, "%ld-", cache->size);
	    if (CACHE_TRACE) HTTrace("Cache....... Asking for range `%s\'\n", buf);
	    HTRequest_addRange(request, "bytes", buf);
	    HTRequest_addRqHd(request, HT_C_RANGE);	    
	    return HT_CACHE_RANGE_VALIDATE;
	}

	/*
	**  In case this entry is of type "must-revalidate" then we just
	**  go ahead and validate it.
	*/
	if (cache->must_revalidate)
	    return HT_CACHE_VALIDATE;
	/*
	**  Check whether we have any special constraints like min-fresh in
	**  the cache control
	*/
	if (cc) {
	    char * token = NULL;
	    if ((token = HTAssocList_findObject(cc, "max-age")))
		max_age = atol(token);
	    if ((token = HTAssocList_findObject(cc, "max-stale")))
		max_stale = atol(token);
	    if ((token = HTAssocList_findObject(cc, "min-fresh")))
		min_fresh = atol(token);
	}

	/*
	**  Now do the checking against the age constraints that we've got
	*/
	{
	    time_t resident_time = time(NULL) - cache->response_time;
	    time_t current_age = cache->corrected_initial_age + resident_time;

	    /*
	    ** Check that the max-age, max-stale, and min-fresh directives
	    ** given in the request cache control header is followed.
	    */
	    if (max_age >= 0 && current_age > max_age) {
		if (CACHE_TRACE) HTTrace("Cache....... Max-age validation\n");
		return HT_CACHE_VALIDATE;
	    }
	    if (min_fresh >= 0 &&
		cache->freshness_lifetime < current_age + min_fresh) {
		if (CACHE_TRACE) HTTrace("Cache....... Min-fresh validation\n");
		return HT_CACHE_VALIDATE;
	    }

	    return (cache->freshness_lifetime +
		    (max_stale >= 0 ? max_stale : 0) > current_age) ?
		HT_CACHE_OK : HT_CACHE_VALIDATE;
	}
    }
    return HT_CACHE_FLUSH;
}

/*
**  While we are creating a new cache object or while we are validating an
**  existing one, we must have a lock on the entry so that not other
**  requests can get to it in the mean while.
*/
PUBLIC BOOL HTCache_getLock (HTCache * cache, HTRequest * request)
{
    if (cache && request) {
	if (CACHE_TRACE) HTTrace("Cache....... Locking cache entry %p\n", cache);
	cache->lock = request;
	return YES;
    }
    return NO;
}

PUBLIC BOOL HTCache_releaseLock (HTCache * cache)
{
    if (cache) {
	if (CACHE_TRACE) HTTrace("Cache....... Unlocking cache entry %p\n", cache);
	cache->lock = NULL;
	return YES;
    }
    return NO;
}

PUBLIC BOOL HTCache_hasLock (HTCache * cache)
{
    return cache && cache->lock;
}

PUBLIC BOOL HTCache_breakLock (HTCache * cache, HTRequest * request)
{
    if (cache && cache->lock) {
	if (cache->lock == request) {
	    if (CACHE_TRACE)
		HTTrace("Cache....... Breaking lock on entry %p\n", cache);
	    cache->lock = NULL;
	    return YES;
	}
    }
    return NO;
}

/*
**  Is we have a valid entry in the cache then we also need a location
**  where we can get it. Hopefully, we may be able to access it
**  thourgh one of our protocol modules, for example the local file
**  module. The name returned is in URL syntax and must be freed by
**  the caller
*/
PUBLIC char * HTCache_name (HTCache * cache)
{
    if (cache && HTCacheRoot) {
	char * local = HTCache_location(cache, NO);
	char * url = HTParse(local, "cache:", PARSE_ALL);
	HT_FREE(local);
	return url;
    }
    return NULL;
}

/*
**  Remove from memory AND from disk. You must explicitly remove a lock
**  before this operation can succeed
*/
PUBLIC BOOL HTCache_remove (HTCache * cache)
{
    return flush_object(cache) && HTCache_delete(cache);
}

/*
**  Walk through the set of headers and write those out that we are allowed
**  to store in the cache. We look into the connection header to see what the 
**  hop-by-hop headers are and also into the cache-control directive to see what
**  headers should not be cached.
*/
PRIVATE BOOL meta_write (FILE * fp, HTRequest * request, HTResponse * response)
{
    if (fp && request && response) {
	HTAssocList * headers = HTResponse_header(response);
	HTAssocList * connection = HTResponse_connection(response);
	char * nocache = HTResponse_noCache(response);

	/*
	**  If we don't have any headers then just return now.
	*/
	if (!headers) return NO;

	/*
	**  Check whether either the connection header or the cache control
	**  header includes header names that we should not cache
	*/
	if (connection || nocache) {

	    /*
	    **  Walk though the cache control no-cache directive
	    */
	    if (nocache) {
		char * line = NULL;
		char * ptr = NULL;
		char * field = NULL;
		StrAllocCopy(line, nocache);		 /* Get our own copy */
		ptr = line;
		while ((field = HTNextField(&ptr)) != NULL)
		    HTAssocList_removeObject(headers, field);
		HT_FREE(line);
	    }

	    /*
	    **  Walk though the connection header
	    */
	    if (connection) {
		HTAssoc * pres;
		while ((pres=(HTAssoc *) HTAssocList_nextObject(connection))) {
		    char * field = HTAssoc_name(pres);
		    HTAssocList_removeObject(headers, field);
		}
	    }
	}

	/*
	**  Write out the remaining list of headers that we not already store
	**  in the index file.
	*/
	{
	    HTAssocList * cur = headers;
	    HTAssoc * pres;
	    while ((pres = (HTAssoc *) HTAssocList_nextObject(cur))) {
		if (fprintf(fp, "%s: %s\n", HTAssoc_name(pres), HTAssoc_value(pres))<0) {
		    if (CACHE_TRACE) HTTrace("Cache....... Error writing metainfo\n");
		    return NO;
		}
	    }
	}
	return YES;
    }
    return NO;
}

/* ------------------------------------------------------------------------- */
/*  			        CACHE WRITER				     */
/* ------------------------------------------------------------------------- */

/*
**  Save the metainformation along with the data object. If no headers
**  are available then the meta file is empty
*/
PUBLIC BOOL HTCache_writeMeta (HTCache * cache, HTRequest * request,
			       HTResponse * response)
{
    if (cache && request && response) {
	BOOL status;
	FILE * fp;
	char * name = HTCache_location(cache, YES);
	if ((fp = fopen(name, "wb")) == NULL) {
	    if (CACHE_TRACE)
		HTTrace("Cache....... Can't open `%s\' for writing\n", name);
	    HTCache_remove(cache);
	    HT_FREE(name);	    
	    return NO;
	}
	status = meta_write(fp, request, response);
	fclose(fp);
	HT_FREE(name);
	return status;
    }
    return NO;
}

/*
**  Merge metainformation with existing version. This means that we have had a
**  successful validation and hence a true cache hit. We only regard the
**  following headers: Date, content-location, expires, cache-control, and vary.
*/
PUBLIC BOOL HTCache_updateMeta (HTCache * cache, HTRequest * request,
				HTResponse * response)
{
    if (cache && request && response) {
	cache->hits++;
	return calculate_time(cache, request, response);
    }
    return NO;
}

PUBLIC BOOL HTCache_addHit (HTCache * cache)
{
    if (cache) {
	cache->hits++;
	if (CACHE_TRACE) HTTrace("Cache....... Hits for %p is %d\n",
				 cache, cache->hits);
	return YES;
    }
    return NO;
}

PRIVATE int HTCache_flush (HTStream * me)
{
    return (fflush(me->fp) == EOF) ? HT_ERROR : HT_OK;
}

PRIVATE int HTCache_putBlock (HTStream * me, const char * s, int  l)
{
    int status = (fwrite(s, 1, l, me->fp) != l) ? HT_ERROR : HT_OK;
    if (l > 1 && status == HT_OK) {
	HTCache_flush(me);
	me->bytes_written += l;
    }
    return status;
}

PRIVATE int HTCache_putChar (HTStream * me, char c)
{
    return HTCache_putBlock(me, &c, 1);
}

PRIVATE int HTCache_putString (HTStream * me, const char * s)
{
    return HTCache_putBlock(me, s, (int) strlen(s));
}

PRIVATE BOOL free_stream (HTStream * me, BOOL abort)
{
    if (me) {
	HTCache * cache = me->cache;

	/*
	**  We close the file object. This does not mean that we have the
	**  complete object. In case of an "abort" then we only have a part,
	**  however, next time we do a load we can use byte ranges to complete
	**  the request.
	*/
	if (me->fp) fclose(me->fp);

	/*
	**  We are done storing the object body and can update the cache entry.
	**  Also update the meta information entry on disk as well. When we
	**  are done we don't need the lock anymore.
	*/
	if (cache) {
	    HTCache_writeMeta(cache, me->request, me->response);
	    HTCache_releaseLock(cache);

	    /*
	    **  Remember if this is the full entity body or only a subpart
	    **  We assume that an abort will only give a part of the object.
	    */
	    cache->range = abort;

	    /*
	    **  Set the size and maybe do gc. If it is an abort then set the
	    **  byte range so that we can start from this point next time. We
	    **  take the byte range as the number of bytes that we have already
	    **  written to the cache entry.
	    */
	    HTCache_setSize(cache, me->bytes_written, me->append);
	}

	/*
	**  In order not to loose information, we dump the current cache index
	**  every time we have created DUMP_FREQUENCY new entries
	*/
	if (new_entries > DUMP_FREQUENCY) {
	    HTCacheIndex_write(HTCacheRoot);
	    new_entries = 0;
	}
	HT_FREE(me);
	return YES;
    }
    return NO;
}


PRIVATE int HTCache_free (HTStream * me)
{
    return free_stream(me, NO);
}

PRIVATE int HTCache_abort (HTStream * me, HTList * e)
{
    if (CACHE_TRACE) HTTrace("Cache....... ABORTING\n");
    return free_stream(me, YES);
}

PRIVATE const HTStreamClass HTCacheClass =
{		
    "Cache",
    HTCache_flush,
    HTCache_free,
    HTCache_abort,
    HTCache_putChar,
    HTCache_putString,
    HTCache_putBlock
};

PRIVATE HTStream * HTCacheStream (HTRequest * request, BOOL append)
{
    HTCache * cache = NULL;
    FILE * fp = NULL;
    HTResponse * response = HTRequest_response(request);
    HTParentAnchor * anchor = HTRequest_anchor(request);
    if (!HTCacheEnable) {
	if (CACHE_TRACE) HTTrace("Cache....... Not enabled\n");
	return NULL;
    }

    /* Get a new cache entry */
    if ((cache = HTCache_new(request, response, anchor)) == NULL) {
	if (CACHE_TRACE) HTTrace("Cache....... Can't get a cache object\n");
	return NULL;
    }

    /* Test that the cached object is not locked */
    if (HTCache_hasLock(cache)) {
	if (HTCache_breakLock(cache, request) == NO) {
	    if (CACHE_TRACE) HTTrace("Cache....... Entry already in use\n");
	    return NULL;
	}
    }
    HTCache_getLock(cache, request);

    /*
    ** Test that we can actually write to the cache file. If the entry already
    ** existed then it will be overridden with the new data.
    */
    {
	char * name = HTCache_location(cache, NO);
	if ((fp = fopen(name, append ? "ab" : "wb")) == NULL) {
	    if (CACHE_TRACE)
		HTTrace("Cache....... Can't open `%s\' for writing\n", name);
	    HTCache_delete(cache);
	    HT_FREE(name);	    
	    return NULL;
	} else {
	    if (CACHE_TRACE)
		HTTrace("Cache....... %s file `%s\'\n",
			append ? "Append to" : "Creating", name);
	}
	HT_FREE(name);
    }

    /* Set up the stream */
    {
	HTStream * me = NULL;
	if ((me = (HTStream *) HT_CALLOC(1, sizeof(HTStream))) == NULL)
	    HT_OUTOFMEM("Cache");
	me->isa = &HTCacheClass;
	me->request = request;
	me->response = response;
	me->cache = cache;
	me->fp = fp;
	me->append = append;
	return me;
    }
    return NULL;
}

PUBLIC HTStream * HTCacheWriter (HTRequest *	request,
				 void *		param,
				 HTFormat	input_format,
				 HTFormat	output_format,
				 HTStream *	output_stream)
{
    return HTCacheStream(request, NO);
}

PUBLIC HTStream * HTCacheAppend (HTRequest *	request,
				 void *		param,
				 HTFormat	input_format,
				 HTFormat	output_format,
				 HTStream *	output_stream)
{
    return HTCacheStream(request, YES);
}

/* ------------------------------------------------------------------------- */
/*  			        CACHE READER				     */
/* ------------------------------------------------------------------------- */

/*
**      This function closes the connection and frees memory.
**      Returns YES on OK, else NO
*/
PRIVATE int CacheCleanup (HTRequest * request, int status)
{
    HTNet * net = HTRequest_net(request);
    cache_info * cache = (cache_info *) HTNet_context(net);
    if (status != HT_IGNORE) {
	if (cache) {
	    HT_FREE(cache->local);
	    HT_FREE(cache);
	}
	HTNet_delete(net, status);
    } else if (cache) {
	HTChannel * channel = HTNet_channel(net);
	HTChannel_delete(channel, HT_OK);
	HT_FREE(cache->local);
    }
    return YES;
}

/*
**  This load function loads an object from the cache and puts it to the
**  output defined by the request object. For the moment, this load function
**  handles the persistent cache as if it was on local file but in fact 
**  it could be anywhere.
**
**  Returns		HT_ERROR	Error has occured in call back
**			HT_OK		Call back was OK
*/
PUBLIC int HTLoadCache (SOCKET soc, HTRequest * request, SockOps ops)
{
    int status = HT_ERROR;
    HTNet * net = HTRequest_net(request);
    HTParentAnchor * anchor = HTRequest_anchor(request);
    cache_info * cache;			      /* Specific access information */

    /*
    ** Initiate a new cache structure and bind to request structure
    ** This is actually state CACHE_BEGIN, but it can't be in the state
    ** machine as we need the structure first.
    */
    if (ops == FD_NONE) {
	if (PROT_TRACE) HTTrace("Load Cache.. Looking for `%s\'\n",
				HTAnchor_physical(anchor));
	if ((cache = (cache_info *) HT_CALLOC(1, sizeof(cache_info))) == NULL)
	    HT_OUTOFMEM("HTLoadCACHE");
	cache->state = CL_BEGIN;
	HTNet_setContext(net, cache);
    } if (ops == FD_CLOSE) {				      /* Interrupted */
	HTRequest_addError(request, ERR_FATAL, NO, HTERR_INTERRUPTED,
			   NULL, 0, "HTLoadCache");
	CacheCleanup(request, HT_INTERRUPTED);
	return HT_OK;
    } else
	cache = (cache_info *) HTNet_context(net);	/* Get existing copy */

    /* Now jump into the machine. We know the state from the previous run */
    while (1) {
	switch (cache->state) {
	case CL_BEGIN:
	    if (HTLib_secure()) {
		if (PROT_TRACE)
		    HTTrace("Load Cache.. No access to local file system\n");
		cache->state = CL_ERROR;
		break;
	    }
	    cache->state = CacheTable ?
		(HTAnchor_headerParsed(anchor) ? CL_NEED_BODY : CL_NEED_HEAD) :
		    CL_NEED_INDEX;
	    break;

	case CL_NEED_HEAD:
	{	    
	    char * meta = NULL;
	    HTResponse * response = HTRequest_response(request);
	    HTResponse_setCachable(response, YES);
	    StrAllocCopy(meta, HTAnchor_physical(anchor));
	    StrAllocCat(meta, HT_CACHE_META);
	    cache->meta = YES;
	    cache->local = HTWWWToLocal(meta, "",
					HTRequest_userProfile(request));
	    HT_FREE(meta);
	    if (cache->local) {
		if (HT_STAT(cache->local, &cache->stat_info) == -1) {
		    if (PROT_TRACE)
			HTTrace("Load Cache.. Not found `%s\'\n",cache->local);
		    HTRequest_addError(request, ERR_FATAL, NO, HTERR_NOT_FOUND,
				       NULL, 0, "HTLoadCache");
		    cache->state = CL_ERROR;
		    break;
		}

		/*
		**  The cache entry may be empty in which case we just return
		*/
		if (!cache->stat_info.st_size) {
		    HTRequest_addError(request, ERR_FATAL, NO,HTERR_NO_CONTENT,
				       NULL, 0, "HTLoadCache");
		    cache->state = CL_GOT_DATA;
		} else
		    cache->state = CL_NEED_OPEN_FILE;
	    } else 
		cache->state = CL_ERROR;
	    break;
	}

	case CL_NEED_INDEX:
	case CL_NEED_BODY:
	    cache->local = HTWWWToLocal(HTAnchor_physical(anchor), "",
					HTRequest_userProfile(request));
	    if (cache->local) {
		if (HT_STAT(cache->local, &cache->stat_info) == -1) {
		    if (PROT_TRACE)
			HTTrace("Load Cache.. Not found `%s\'\n", cache->local);
		    HTRequest_addError(request, ERR_FATAL, NO, HTERR_NOT_FOUND,
				       NULL, 0, "HTLoadCache");
		    cache->state = CL_ERROR;
		    break;
		}

		/*
		**  The cache entry may be empty in which case we just return
		*/
		if (!cache->stat_info.st_size) {
		    HTRequest_addError(request, ERR_FATAL, NO,HTERR_NO_CONTENT,
				       NULL, 0, "HTLoadCache");
		    cache->state = CL_NO_DATA;
		} else
		    cache->state = CL_NEED_OPEN_FILE;
	    } else 
		cache->state = CL_ERROR;
	    break;

	case CL_NEED_OPEN_FILE:
	    status = HTFileOpen(net, cache->local, HT_FT_RDONLY);
	    if (status == HT_OK) {
		/*
		** Create the stream pipe FROM the channel to the application.
		** The target for the input stream pipe is set up using the
		** stream stack.
		*/
		if (cache->meta) {
		    HTNet_getInput(net,
				   HTStreamStack(WWW_MIME_HEAD,
						 HTRequest_debugFormat(request),
						 HTRequest_debugStream(request),
						 request, NO), NULL, 0);
		    cache->state = CL_NEED_CONTENT;
		} else {
		    HTNet_getInput(net,
				   HTStreamStack(HTAnchor_format(anchor),
						 HTRequest_outputFormat(request),
						 HTRequest_outputStream(request),
						 request, YES), NULL, 0);
		    HTRequest_setOutputConnected(request, YES);
		    HTRequest_addError(request, ERR_INFO, NO, HTERR_OK,
				       NULL, 0, "HTLoadCache");
		    cache->state = CL_NEED_CONTENT;

#ifndef NO_UNIX_IO
		    /* If we are _not_ using preemptive mode and we are Unix fd's
		    ** then return here to get the same effect as when we are
		    ** connecting to a socket. That way, HTCache acts just like any
		    ** other protocol module even though we are in fact doing
		    ** blocking connect
		    */
		    if (!net->preemptive) {
			if (PROT_TRACE) HTTrace("Load Cache.. returning\n");
			HTEvent_register(net->sockfd, request, (SockOps) FD_READ,
					 net->cbf, net->priority);
			return HT_OK;
		    }
#endif
		}
	    } else if (status == HT_WOULD_BLOCK || status == HT_PENDING)
		return HT_OK;
	    else {
		HTRequest_addError(request, ERR_INFO, NO, HTERR_INTERNAL,
				   NULL, 0, "HTLoadCache");
		cache->state = CL_ERROR;	       /* Error or interrupt */
	    }
	    break;

	case CL_NEED_CONTENT:
	    status = (*net->input->isa->read)(net->input);
	    if (status == HT_WOULD_BLOCK)
		return HT_OK;
	    else if (status == HT_LOADED || status == HT_CLOSED) {
		cache->state = CL_GOT_DATA;
	    } else {
		HTRequest_addError(request, ERR_INFO, NO, HTERR_FORBIDDEN,
				   NULL, 0, "HTLoadCache");
		cache->state = CL_ERROR;
	    }
	    break;

	case CL_GOT_DATA:
	    if (cache->meta) {
		CacheCleanup(request, HT_IGNORE);
		cache->state = CL_NEED_BODY;
		cache->meta = NO;
	    } else {
		CacheCleanup(request, HT_LOADED);
		return HT_OK;
	    }
	    break;

	case CL_NO_DATA:
	    CacheCleanup(request, HT_NO_DATA);
	    return HT_OK;
	    break;

	case CL_ERROR:
	    CacheCleanup(request, HT_ERROR);
	    return HT_OK;
	    break;
	}
    } /* End of while(1) */
}
