/*                                        W3C Reference Library libwww Default Initialization
                       DEFAULT INITIALIZATION MODULES AND PROFILES
                                             
 */
/*
**      (c) COPYRIGHT MIT 1995.
**      Please first read the full copyright statement in the file COPYRIGH.
*/
/*

   As mentioned in the Library Architecture, libwww consists of a small core and a large
   set of hooks for adding functionality. By itself, the core it not capable of performing
   any Web related tasks like accessing a HTTP server or parsing a HTML document. All this
   functionality must be registered by the application. This way, the core of libwww is
   kept application independent and can be used as the basic building block for any kind
   of Web application. The Library comes with a large set of default functions, for
   example for accessing HTTP and FTP servers, parsing RFC 822 headers etc. This module
   helps the application programmer setting up all this functionality, but it is important
   to note that none of it is _required_ in order to use the Library.
   
 */
#ifndef WWWINIT_H
#define WWWINIT_H
/*

 */
#ifdef __cplusplus
extern "C" {
#endif
/*

APPLICATION PROFILES

   Application profiles are initialization functions that are "preset" to initialize the
   Library with the set of features often used in _clients_, _servers_, _robots_, and
   _proxy servers_. They are basically collections of the more detailed initialization
   functions that you can find later in this interface description. In many cases you do
   not need to use anything else than the profiles, but if you have more specific
   requirements then you can always fall back on using the initialization functions below
   or even werite your own extensions.
   
 */
#include "HTProfil.h"
/*

DEFAULT PROTOCOLS, TRANSPORTS, MIME HEADERS, DIALOGS ETC.

   This module contains a large set of default initialization functions for protocol
   modules, stream converters, event managers etc.
   
 */
#include "HTInit.h"
/*

DEFAULT HTML PARSERS

   This file contains the initialization for the HTML parsers in libwww. The parsers are
   used for presenting HTML objects as well as clear text documents.
   
 */
#include "HTHInit.h"
/*

DEFAULT FILE SUFFIX BINDING

   Register the default set of bindings between file suffixes and media types. This is
   used for example to guess the media type of a FTP URL of a local file URL.
   
 */
#include "HTBInit.h"
/*

 */
#ifdef __cplusplus
} /* end extern C definitions */
#endif

#endif
/*

   
   ___________________________________
   
                            @(#) $Id: WWWInit.h,v 1.1.1.1 1996/10/15 13:08:39 cvs Exp $
                                                                                          
    */
