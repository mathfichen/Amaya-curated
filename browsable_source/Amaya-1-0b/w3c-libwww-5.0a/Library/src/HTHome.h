/*                                          W3C Reference Library libwww Home Page Management
                                   HOME PAGE MANAGEMENT
                                             
 */
/*
**      (c) COPYRIGHT MIT 1995.
**      Please first read the full copyright statement in the file COPYRIGH.
*/
/*

   This module provides some "_make life easier_" functions in order to get the
   application going. The functionality of this module was originally in HTAccess, but now
   it has been moved here as a part of the application interface where the application
   mayuse it if desired.
   
   This module is implemented by HTHome.c, and it is a part of the W3C Reference Library.
   
 */
#ifndef HTHOME_H
#define HTHOME_H
#include "WWWLib.h"
/*

   The _home page _is special in that this is is the first page to visit when  a client
   application starts up. Note that a home page is a generic URL and hence can be any
   resouce - not only resources on the local file system.
   
PERSONAL HOME PAGE

 */
#define LOGICAL_DEFAULT         "WWW_HOME"    /* Defined to be the home page */

#ifndef PERSONAL_DEFAULT
#define PERSONAL_DEFAULT        "WWW/default.html"      /* in home directory */
#endif

/* If the home page isn't found, use this file: */
#ifndef LAST_RESORT
#define LAST_RESORT             "http://www.w3.org/"
#endif
/*

HOME PAGE FOR REMOTE ACCESS

   Some Web applications can also be run remotely - for example as a telnet login shell.
   The Line Mode Browser is an example of such an application. In that case, the home page
   is often more generic than a personal home page.
   
 */
/* If one telnets to an access point it will look in this file for home page */
#ifndef REMOTE_POINTER
#define REMOTE_POINTER           "/etc/www-remote.url"      /* can't be file */
#endif

/* and if that fails it will use this. */
#ifndef REMOTE_ADDRESS
#define REMOTE_ADDRESS          "http://www.w3.org/"        /* can't be file */
#endif

#ifndef LOCAL_DEFAULT_FILE
#define LOCAL_DEFAULT_FILE      "/usr/local/lib/WWW/default.html"
#endif
/*

GET AN ANCHOR FOR THE HOME PAGE

   Getting an anchor for the _home page_ involves looking for the (environment) variables
   described in the section above. As this is something that almost all client
   applications must do then we provide some simple methods that do the work for you.
   
 */
extern HTParentAnchor * HTHomeAnchor (void);
/*

CREATE A NEW ANCHOR FOR TEMPORARY LOCAL FILES

   When the user starts writing a new document, the client application should create a new
   anchor which can contain the document while it is created. This can also be the
   location for backups and for security "auto-save" functionality. This functions creates
   a new anchor with a URL pointing to the temporary location defined by this user profile
   and returns that anchor.
   
 */
extern HTParentAnchor * HTTmpAnchor (HTUserProfile * up);
/*

GET THE CURRENT DIRECTORY IN URL FORM

   Creates a local file URL that can be used as a relative name when calling expanding
   other URLs relative to the current location in the local file system tree where the
   application is running. The code for this routine originates from the Line Mode Browser
   and was moved here by howcome@w3.orgin order for all clients to take advantage.
   
 */
#define HTFindRelatedName       HTGetCurrentDirectoryURL
extern char *  HTGetCurrentDirectoryURL (void);
/*

HANDLE LIBRARY TRACE MESSAGES

   Standard interface to libwww TRACE messages. Pass this function a string of characters
   and it will set up the appropriate TRACE flags. The shortnames for the trace messages
   are not as intuitive as they could be :-(. The string must be null terminated
   
 */
extern int HTSetTraceMessageMask (const char * shortnames);
/*

 */
#endif /* HTHOME_H */
/*

   
   ___________________________________
   
                            @(#) $Id: HTHome.h,v 1.1.1.1 1996/10/15 13:08:40 cvs Exp $
                                                                                          
    */
