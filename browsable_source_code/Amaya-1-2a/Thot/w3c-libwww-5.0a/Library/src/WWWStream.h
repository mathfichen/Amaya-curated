/*                                                       W3C Reference Library libwww Streams
                       DECLARATION OF W3C REFERENCE LIBRARY STREAMS
                                             
 */
/*
**      (c) COPYRIGHT MIT 1995.
**      Please first read the full copyright statement in the file COPYRIGH.
*/
/*

   The stream part of the Library is a set of streams that can be used in many contexts
   throughout the Library. It also contains conversions between streams and other memory
   containers, for example Chunks.
   
 */
#ifndef WWWSTREAM_H
#define WWWSTREAM_H
/*

 */
#ifdef __cplusplus
extern "C" {
#endif
/*

  System dependencies
  
   The sysdep.h file includes system-specific include files and flags for I/O to network
   and disk. The only reason for this file is that the Internet world is more complicated
   than Posix and ANSI.
   
 */
#include "sysdep.h"
/*

  Content Length Counter
  
   This stream also buffers the result to find out the content length. If a maximum buffer
   limit is reached Content-Length is calculated for logs but it is not sent to the client
   -- rather the buffer is flushed right away.
   
 */
#include "HTConLen.h"                   /* Content Length Counter */
/*

  Content Guess Stream
  
   This interface provides functionality for guessing unknown media types from magic
   words. The stream is a one that reads first a chunk of stuff, tries to figure out the
   format, and calls HTStreamStack(). This is a kind of lazy-evaluation of
   HTStreamStack(). This could be extended arbitrarily to recognize all the possible file
   formats in the world, if someone only had time to do it.
   
 */
#include "HTGuess.h"                    /* Guess stream */
/*

  Tee Stream
  
   The Tee stream just writes everything you put into it into two oter streams. One use
   (the only use?!) is for taking a cached copey on disk while loading the main copy,
   without having to wait for the disk copy to be finished and reread it.
   
 */
#include "HTTee.h"
/*

  Merge Stream
  
   The Merge stream can be used to merge multiple streams into a single target stream. The
   Merge stream does not prevent any of the streams from writing and no ordering is
   imposed. The main feature is basically that the free and abort methods can be called
   _n_ times where _n_ equals the number of _feeds_ that put data to the stream.
   
 */
#include "HTMerge.h"
/*

  Stream to Chunk Conversion
  
   If you do not like the stream model in libwww, then you can use this stream to convert
   a stream object into a Chunk object which is a dynamic character string buffer in
   memory.
   
 */
#include "HTSChunk.h"
/*

  Stream to Memory Object Conversion
  
   This version of the stream object is a hook for clients that want an unparsed stream
   from libwww. The HTXParse_put_* and HTXParse_write routines copy the content of the
   incoming buffer into a buffer that is realloced whenever necessary. This buffer is
   handed over to the client in HTXParse_free.
   
 */
#include "HTXParse.h"                   /* External parse stream */
/*

 */
#ifdef __cplusplus
} /* end extern C definitions */
#endif

#endif
/*

   
   ___________________________________
   
                          @(#) $Id: WWWStream.h,v 1.1.1.1 1996/10/15 13:08:38 cvs Exp $
                                                                                          
    */
