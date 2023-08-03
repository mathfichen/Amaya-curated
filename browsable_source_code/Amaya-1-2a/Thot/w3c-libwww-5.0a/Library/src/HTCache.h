/*                                      W3C Reference Library libwww Persistent Cache Manager
                                 PERSISTENT CACHE MANAGER
                                             
 */
/*
**      (c) COPYRIGHT MIT 1995.
**      Please first read the full copyright statement in the file COPYRIGH.
*/
/*

   The cache contains details of persistent files which contain the contents of remote
   documents. The existing cache manager is somewhat naive - especially in its garbage
   collection but it is just an example of how it can be done.However, it is a fully
   HTTP/1.1 compliant cache manager.&nbsp;More advanced implementations are welcome!
   
   This module is implemented by HTCache.c, and it is a part of the W3C Reference Library.
   
 */
#ifndef HTCACHE_H
#define HTCACHE_H

#include "WWWLib.h"
/*

Initialize and Terminate the Persistent Cache

   If `cache_root' is NULL then use HT_CACHE_ROOTwhich by default is set to
   "/tmp/w3c-lib". The cache_root location does not have to exist, it will be created
   automatically if not. An empty string will make '/' as cache root. The size is the
   total size in MBytes - the default size is 20M. The cache can not be less than 5M. We
   can only enable the cache if we are in secure mode where we can not access the local
   file system.&nbsp;This is for example the case if using an application as a telnet
   shell.
   
 */
extern BOOL HTCacheInit (const char * cache_root, int size);
/*

   After the cache has been terminated it can not be used anymore unless you do another
   HTCacheInit() call.
   
 */
extern BOOL HTCacheTerminate (void);
/*

Cache Mode Parameters

   The persistent cache has a set of overall parameters &nbsp;that you can adust
   
  ENABLE AND DISABLE THE CACHE
  
   The cache can be temporarily suspended by using the enable/disable flag. This does not
   prevent the cache from being enabled/disable at a later point in time.
   
 */
extern void HTCacheMode_setEnabled (BOOL mode);
extern BOOL HTCacheMode_enabled (void);
/*

  WHAT IS THE CURRENT CACHE ROOT?
  
   Return the value of the cache root. The cache root can only be set through the
   HTCacheInit() function
   
 */
extern const char * HTCacheMode_getRoot (void);
/*

  TOTAL CACHE SIZE
  
   We set the default cache size to 20M. We set the minimum size to 5M in order not to get
   into weird problems while writing the cache. The size is indicated in Mega bytes. The
   size is given in MBytes and is also returned in MBytes. We don't consider the
   metainformation as part of the total cache size which is the the reason for why the min
   cache size should not be less than 5M.
   
 */
extern BOOL HTCacheMode_setMaxSize (int size);
extern int  HTCacheMode_maxSize    (void);
/*

  HOW DO WE HANDLE EXPIRATION OF CACHED OBJECTS?
  
   There are various ways of handling Expires header when met in a history list. Either it
   can be ignored all together, the user can be notified with a warning, or the document
   can be reloaded automatically. This flag decides what action to be taken. The default
   action is HT_EXPIRES_IGNORE. In HT_EXPIRES_NOTIFY mode , we push a message on to the
   Error stack which is presented to the user.
   
 */
typedef enum _HTExpiresMode {
    HT_EXPIRES_IGNORE = 0,
    HT_EXPIRES_NOTIFY,
    HT_EXPIRES_AUTO
} HTExpiresMode;

extern void HTCacheMode_setExpires (HTExpiresMode mode);
extern HTExpiresMode HTCacheMode_expires (void);
/*

  DISCONNECTED OPERATION
  
   The cache can be set to handle disconnected operation where it does not use the network
   to validate entries and do not attempt to load new versions. All requests that can not
   be fulfilled by the cache will be returned with a "504 Gateway Timeout" response. There
   are two modes of how the cache can operate in disconnected mode: it can use diconnected
   mode on its own persistent cache or it can forward the disconnected request to a proxy
   cache, for example. The latter mode only really makes sense when you are using a proxy,
   of course.
   
 */
typedef enum _HTDisconnectedMode {
    HT_DISCONNECT_NONE     = 0,
    HT_DISCONNECT_NORMAL   = 1,
    HT_DISCONNECT_EXTERNAL = 2
} HTDisconnectedMode;

extern void HTCacheMode_setDisconnected (HTDisconnectedMode mode);
extern HTDisconnectedMode HTCacheMode_disconnected (void);
extern BOOL HTCacheMode_isDisconnected (HTReload mode);
/*

The Cache Index

   The persistent cache keeps an index of its current entries so that garbage collection
   and lookup becomes more efficient. This index is stored automatically at regular
   intervals so that we don't get out of sync. Also, it is automatically loaded at startup
   and saved at closedown of the cache.
   
  READING THE CACHE INDEX
  
   Read the saved set of cached entries from disk. we only allow the index ro be read when
   there is no entries in memory. That way we can ensure consistancy.
   
 */
extern BOOL HTCacheIndex_read (const char * cache_root);
/*

  WRITE THE CACHE INDEX
  
   Walk through the list of cached objects and save them to disk. We override any existing
   version but that is normally OK as we have already read its contents.
   
 */
extern BOOL HTCacheIndex_write (const char * cache_root);
/*

The HTCache Object

   The cache object is what we store about a cached objet in memory.
   
 */
typedef struct _HTCache HTCache;
/*

  CREATE AND UPDATE A CACHE OBJECT
  
   Filling the cache is done as all other transportation of bulk data in libwww using
   streams. The cache object creater is a stream which in many cases sits on a T stream so
   that we get the original feed and at the same time can parse the contents.
   
   In some situations, we want to append data to an already exiting cache entry. This is
   the case when a use has interrupted a download and we are stuck with a subpart of the
   document. If the user later on whishes to download the object again we can issue a
   range request and continue from where we were. This will in many situations save a lot
   of bandwidth.
   
 */
extern HTConverter HTCacheWriter, HTCacheAppend;
/*

   This function writes the metainformation along with the data object stored by the
   HTCacheWriter stream above. If no headers are available then the meta file is empty
   
 */
extern BOOL HTCache_writeMeta (HTCache * cache, HTRequest * request,
                               HTResponse * response);
/*

   In case we received a "304 Not Modified" response then we do not have to tough the body
   but must merge the metainformation with the previous version. Therefore we need a
   special metainformation update function.
   
 */
extern BOOL HTCache_updateMeta (HTCache * cache, HTRequest * request,
                                HTResponse * response);
/*

  LOAD A CACHED OBJECT
  
   Loading a cached object is also done as all other loads in libwww by using a protocol
   load module. For the moment, this load function handles the persistent cache as if it
   was on local file but in fact &nbsp;it could be anywhere.
   
 */
extern HTEventCallback HTLoadCache;
/*

  DELETE A CACHE OBJECT
  
   Remove a HTCache object from memory and from disk. You must explicitly remove a lock
   before this operation can succeed
   
 */
extern BOOL HTCache_remove (HTCache * cache);
/*

  DELETE ALL CACHE OBJECTS IN MEMORY
  
   Destroys all cache entried in memory but does not write anything to disk. Use the index
   methods above for doing that. We do not delete the disk contents.
   
 */
extern BOOL HTCache_deleteAll (void);
/*

  DELETE ALL CACHE OBJECT AND FILE ENTRIES
  
   Destroys all cache entried in memory and on disk. This call basically resets the cache
   to the inital state but it does not terminate the cache. That is, you don't have to
   reinitialize the cache before you can use it again.
   
 */
extern BOOL HTCache_flushAll (void);
/*

  FIND A CACHED OBJECT
  
   Verifies if a cache object exists for this URL and if so returns a URL for the cached
   object. It does not verify whether the object is valid or not, for example it might
   have expired. Use the cache validation methods for checking this.
   
 */
extern HTCache * HTCache_find (HTParentAnchor * anchor);
/*

  VERIFY IF AN OBJECT IS FRESH
  
   This function checks whether a document has expired or not. The check is based on the
   metainformation passed in the anchor object The function returns the level of
   validation needed for getting a fresh version. We also check the cache control
   directives in the request to see if they change the freshness discission.
   
 */
extern HTReload HTCache_isFresh (HTCache * me, HTRequest * request);
/*

  REGISTER A CACHE HIT
  
   As a cache hit may occur several places, we have a public function where we can declare
   a download to be a true cache hit. The number of hits a cache object has affects its
   status when we are doing garbage collection.
   
 */
extern BOOL HTCache_addHit (HTCache * cache);
/*

  FIND THE LOCATION OF A CACHED OBJECT
  
   Is we have a valid entry in the cache then we also need a location where we can get it.
   Hopefully, we may be able to access it thourgh one of our protocol modules, for example
   the local file module. The name returned is in URL syntax and must be freed by the
   caller
   
 */
extern char * HTCache_name (HTCache * cache);
/*

  LOCKING A CACHE OBJECT
  
   While we are creating a new cache object or while we are validating an existing one, we
   must have a lock on the entry so that not other requests can get to it in the mean
   while. A lock can be broken if the same request tries to create the cache entry again.
   This means that we have tried to validate the cache entry but we got a new shipment of
   bytes back from the origin server or an intermediary proxy.
   
 */
extern BOOL HTCache_getLock     (HTCache * cache, HTRequest * request);
extern BOOL HTCache_breakLock   (HTCache * cache, HTRequest * request);
extern BOOL HTCache_hasLock     (HTCache * cache);
extern BOOL HTCache_releaseLock (HTCache * cache);
/*

 */
#endif
/*

   
   ___________________________________
   
                            @(#) $Id: HTCache.h,v 1.2 1996/10/15 13:40:32 cvs Exp $
                                                                                          
    */
