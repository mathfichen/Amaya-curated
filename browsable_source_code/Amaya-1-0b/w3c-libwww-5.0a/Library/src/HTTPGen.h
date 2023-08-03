/*                                    W3C Reference Library libwww HTTP General Header Stream
                                HTTP GENERAL HEADER STREAM
                                             
 */
/*
**      (c) COPYRIGHT MIT 1995.
**      Please first read the full copyright statement in the file COPYRIGH.
*/
/*

   The HTTP General Header stream generates the general headers of a HTTP request or
   response and writes it to the target which is normally either a HTTP response stream or
   a HTTP request stream.
   
   This module is implemented by HTTPGen.c, and it is a part of the W3C Reference Library.
   
 */
#ifndef HTTPGEN_H
#define HTTPGEN_H

#include "HTStream.h"
#include "HTReq.h"
/*

  Streams Definition
  
   This stream makes a general HTTP header before it goes into transparent mode. If
   endHeaderis YES then we send an empty CRLFin order to end the header.
   
 */
extern HTStream * HTTPGen_new  (HTRequest * request, HTStream * target,
                                BOOL endHeader, int version);
/*

 */
#endif
/*

   
   ___________________________________
   
                            @(#) $Id: HTTPGen.h,v 1.1.1.1 1996/10/15 13:08:41 cvs Exp $
                                                                                          
    */
