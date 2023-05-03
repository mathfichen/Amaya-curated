/*                                               W3C Reference Library libwww Icon Management
                                     ICON MANAGEMENT
                                             
 */
/*
**      (c) COPYRIGHT MIT 1995.
**      Please first read the full copyright statement in the file COPYRIGH.
*/
/*

   Icons for directory listsings etc. are bound to MIME content-typesand
   content-encodingsas described in the format manager. These functions bind icon URLs to
   given content-typeor encoding templates. Templates containing a slash are taken to be
   content-typetemplates, other are content-encodingtemplates.
   
   This module is implemented by HTIcons.c, and it is a part of the W3C Reference Library.
   
 */
#ifndef HTICONS_H
#define HTICONS_H

#include "WWWLib.h"
/*

 */
typedef struct _HTIconNode HTIconNode;
/*

ADD NEW ICONS

   All of these functions take an absolute URL and alternate text to use. Add an icon the
   list
   
  Generic Icons
  
 */
extern BOOL HTIcon_add (const char * url, const char * prefix,
                                char * alt, char * type_templ);
/*

  Specific Icons
  
   We also have a special set of icons used to represent well-known things in direcctory
   listings.
   
    Unknown Icon
    
   Add a unknown icon representing files that we can't figure out what is and hence can`'t
   come up with a better icon.
   
 */
extern BOOL HTIcon_addUnknown (const char * url, const char * prefix,
                                char * alt);
/*

    Empty Icon
    
   In order to aligned HTML pages for directory listings in preformatted mode, we need an
   empty (or blank) icon of the same size as the other icons.
   
 */
extern BOOL HTIcon_addBlank (const char * url, const char * prefix,
                                char * alt);
/*

    Parent Icon
    
   Add an icon representing a level up in a directory listing - the parent directory.
   
 */
extern BOOL HTIcon_addParent (const char * url, const char * prefix,
                                char * alt);
/*

    Directory Icon
    
   This icon represents a directory or a folder
   
 */
extern BOOL HTIcon_addDir (const char * url, const char * prefix,
                                char * alt);
/*

FIND AN ICON

   This is a simplified file mode enumeration that can is used in directory listings.
   
 */
typedef  enum _HTFileMode {
    HT_IS_FILE,                         /* Normal file */
    HT_IS_DIR,                          /* Directory */
    HT_IS_BLANK,                        /* Blank Icon */
    HT_IS_PARENT                        /* Parent Directory */
} HTFileMode;


extern HTIconNode * HTIcon_find (HTFileMode     mode,
                                 HTFormat       content_type,
                                 HTEncoding     content_encoding);
/*

ICON URL

   When you want to add the icon reference into a directory listing, you can get the URL
   of the icon by using this method. Don't free or modify the string returned!
   
 */
extern char * HTIcon_url (HTIconNode * node);
/*

ALTERNATIVE TEXT

   Get the alternative text (if any) for text based clients or if you don't want to
   download the image right away. The string returned must be freed by the caller.
   
 */
extern char * HTIcon_alternative (HTIconNode * node, BOOL brackets);
/*

A STANDARD SET OF ICONS

   The WWWFile interface does not define a default set of icons but the Library
   distribution files comes with a _standard_ set of icons that can be used if desired.
   The Icons can be found in $(datadir)/www-icons.The set covers the types described below
   and they can be set up using the HTIconInit() initialization function in the WWWInit
   startup interface
   
      blank.xbmfor the blank icon
      
      directory.xbmfor directory icon
      
      back.xbmfor parent directory
      
      unknown.xbmfor unknown icon
      
      binary.xbmfor binary files
      
      text.xbmfor ascii files
      
      image.xbmfor image files
      
      movie.xbmfor video files
      
      sound.xbmfor audio files
      
      tar.xbmfor tar and gtar files
      
      compressed.xbmfor compressed and gzipped files
      
 */
#endif /* HTICONS */
/*

   
   ___________________________________
   
                           @(#) $Id: HTIcons.h,v 1.1.1.1 1996/10/15 13:08:40 cvs Exp $
                                                                                          
    */
