/*                                                  W3C Reference Library libwww Anchor Class
                                     THE ANCHOR CLASS
                                             
 */
/*
**      (c) COPYRIGHT MIT 1995.
**      Please first read the full copyright statement in the file COPYRIGH.
*/
/*

   An anchor represents a region of a hypertext document which is linked to another anchor
   in the same or a different document. Another name for anchors would be URLs as an
   anchor represents all we know about a URL - including where it points to and who points
   to it. Because the anchor objects represent the part of the Web, the application has
   been in touch, it is often useful to maintain the anchors throughout the lifetime of
   the application. It would actually be most useful if we had persistent anchors so that
   an application could build up a higher knowledge about the Web topology.
   
   This module is implemented by HTAnchor.c, and it is a part of the W3C Reference
   Library.
   
 */
#ifndef HTANCHOR_H
#define HTANCHOR_H

/*

TYPES DEFINED AND USED BY THE ANCHOR OBJECT

   This is a set of videly used type definitions used through out the Library:
   
 */
#include "WWWUtil.h"

typedef HTAtom * HTFormat;
typedef HTAtom * HTLevel;                      /* Used to specify HTML level */
typedef HTAtom * HTEncoding;                                /* C-E and C-T-E */
typedef HTAtom * HTCharset;
typedef HTAtom * HTLanguage;

typedef struct _HTAnchor        HTAnchor;
typedef struct _HTParentAnchor  HTParentAnchor;
typedef struct _HTChildAnchor   HTChildAnchor;

#include "HTLink.h"
#include "HTMethod.h"
#include "HTResponse.h"
/*

THE ANCHOR CLASS

   We have three variants of the Anchor object - I guess some would call them superclass
   and subclasses ;-)
   
  Anchor Base Class
  
   This is the super class of anchors. We often use this as an argument to the functions
   that both accept parent anchors and child anchors. We separate the first link from the
   others to avoid too many small mallocs involved by a list creation. Most anchors only
   point to one place.
   
  Anchor for a Parent Object
  
   These anchors points to the whole contents of any resource accesible by a URI. The
   parent anchor now contains all known metainformation about that object and in some
   cases the parent anchor also contains the document itself. Often we get the
   metainformation about a document via the entity headers in the HTTP specification.
   
  Anchor for a Child Object
  
   A child anchor is a anchor object that points to a subpart of a hypertext document. In
   HTML this is represented by the NAMEtag of the Anchor element.
   
   After we have defined the data structures we must define the methods that can be used
   on them. All anchors are kept in an internal hash table so that they are easier to find
   again.
   
  Find/Create a Parent Anchor
  
   This one is for a reference (link) which is found in a document, and might not be
   already loaded. The parent anchor returned can either be created on the spot or is
   already in the hash table.
   
 */
extern HTAnchor * HTAnchor_findAddress          (const char * address);
/*

  Find/Create a Child Anchor
  
   This one is for a new child anchor being edited into an existing document. The parent
   anchor must already exist but the child returned can either be created on the spot or
   is already in the hash table. The tagis the part that's after the '#' sign in a URI.
   
 */
extern HTChildAnchor * HTAnchor_findChild       (HTParentAnchor *parent,
                                                 const char *   tag);
/*

  Find/Create a Child Anchor and Link to Another Parent
  
   Find a child anchor anchor with a given parent and possibly a tag, and (if passed) link
   this child to the URI given in the href. As we really want typed links to the caller
   should also indicate what the type of the link is (see HTTP spec for more information).
   The link is relativeto the address of the parent anchor.
   
 */
extern HTChildAnchor * HTAnchor_findChildAndLink (
                HTParentAnchor * parent,                /* May not be 0 */
                const char * tag,                       /* May be "" or 0 */
                const char * href,                      /* May be "" or 0 */
                HTLinkType ltype);                      /* May be 0 */
/*

  Delete an Anchor
  
   All outgoing links from parent and children are deleted, and this anchor is removed
   from the sources list of all its targets. We also delete the targets. If this anchor's
   source list is empty, we delete it and its children.
   
 */
extern BOOL HTAnchor_delete     (HTParentAnchor *me);
/*

  Delete all Anchors
  
   Deletes allanchors and return a list of all the objects (hyperdoc) hanging of the
   parent anchors found while doing it. The application may keep its own list of
   HyperDocs, but this function returns it anyway. It is alwaysfor the application to
   delete any HyperDocs. If NULL then no hyperdocs are returned. Return YES if OK, else
   NO.
   
   _Note:_ This function is different from cleaning up the history list!
   
 */
extern BOOL HTAnchor_deleteAll  (HTList * objects);
/*

LINKS AND ANCHORS

   Anchor objects are bound together by Link objects that carry information about what
   type of link and whetther we have followed the link etc. Any anchor object can have
   zero, one, or many links but the normal case is one. Therefore we treat this is a
   special way.
   
  Handling the Main Link
  
   Any outgoing link can at any time be the main destination.
   
 */
extern BOOL HTAnchor_setMainLink        (HTAnchor * anchor, HTLink * link);
extern HTLink * HTAnchor_mainLink       (HTAnchor * anchor);

extern HTAnchor * HTAnchor_followMainLink (HTAnchor * anchor);
/*

  Handling the Sub Links
  
 */
extern BOOL HTAnchor_setSubLinks        (HTAnchor * anchor, HTList * list);
extern HTList * HTAnchor_subLinks       (HTAnchor * anchor);
/*

RELATIONS BETWEEN CHILDREN AND PARENTS

   As always, children and parents have a compliated relationship and the libwww Anchor
   class is no exception.
   
  Who is Parent?
  
   For parent anchors this returns the anchor itself
   
 */
extern HTParentAnchor * HTAnchor_parent (HTAnchor *me);
/*

  Does it have any Anchors within it?
  
   Does this parent anchor have any children
   
 */
extern BOOL HTAnchor_hasChildren        (HTParentAnchor *me);
/*

ANCHOR ADDRESSES

   There are two addresses of an anchor. The URI that was passed when the anchor was
   crated and the physical address that's used when the URI is going to be requested. The
   two addresses may be different if the request is going through a proxy or a gateway or
   it may have been mapped through a rule file.
   
  Logical Address
  
   Returns the full URI of the anchor, child or parent as a malloc'd string to be freed by
   the caller as when the anchor was created.
   
 */
extern char * HTAnchor_address          (HTAnchor * me);
/*

  Expanded Logical Address
  
   When expanding URLs within a hypertext document, the base address is taken as the
   following value if present (in that order):
   
      Content-Baseheader
      
      Content-Locationheader
      
      Logical address
      
 */
extern char * HTAnchor_expandedAddress  (HTAnchor * me);
/*

  Physical address
  
   Contains the physical address after we haved looked for proxies etc.
   
 */
extern char * HTAnchor_physical         (HTParentAnchor * me);
extern void HTAnchor_setPhysical        (HTParentAnchor * me, char * protocol);
extern void HTAnchor_clearPhysical      (HTParentAnchor * me);
/*

ENTITY BODY INFORMATION

   A parent anchor can have a data object bound to it. This data object does can for
   example be a parsed version of a HTML that knows how to present itself to the user, or
   it can be an unparsed data object. It's completely free for the application to use this
   possibility, but a typical usage would to manage the data object as part of a memory
   cache.
   
 */
extern void HTAnchor_setDocument        (HTParentAnchor *me, void * doc);
extern void * HTAnchor_document         (HTParentAnchor *me);
/*

ENTITY HEADER INFORMATION

   The anchor object also contains all the metainformation that we know about the object.
   
  Clear All header Information
  
 */
extern void HTAnchor_clearHeader        (HTParentAnchor *me);
/*

  Inherit Metainformation from the Response object
  
   Once we have decided to cache the object we transfer already parsed metainformation
   from the HTResponse object to the anchor object and also the unparsed headers as we may
   wanna use that information later.
   
 */
extern BOOL HTAnchor_update (HTParentAnchor * me, HTResponse * response);
/*

  Is the Anchor searchable?
  
 */
extern void HTAnchor_clearIndex         (HTParentAnchor * me);
extern void HTAnchor_setIndex           (HTParentAnchor * me);
extern BOOL HTAnchor_isIndex            (HTParentAnchor * me);
/*

  Anchor Title
  
   We keep the title in the anchor as we then can refer to it later in the history list
   etc. We can also obtain the title element if it is passed as a HTTP header in the
   response. Any title element found in an HTML document will overwrite a title given in a
   HTTP header.
   
 */
extern const char * HTAnchor_title      (HTParentAnchor *me);
extern void HTAnchor_setTitle           (HTParentAnchor *me,
                                         const char *   title);
extern void HTAnchor_appendTitle        (HTParentAnchor *me,
                                         const char *   title);
/*

  Content Base
  
   The Content-Baseheader may be used for resolving relative URLs within the entity. If it
   there is no Content-Baseheader then we use the Content-Location if present and
   absolute.
   
 */
extern char * HTAnchor_base     (HTParentAnchor * me);
extern BOOL HTAnchor_setBase    (HTParentAnchor * me, char * base);
/*

  Content Location
  
   Content location can either be an absolute or a relative URL. The URL may be either
   absolute or relative. If it is relative then we parse it relative to the
   Content-Baseheader of the request URI if any, otherwise we use the Request URI.
   
 */
extern char * HTAnchor_location         (HTParentAnchor * me);
extern BOOL HTAnchor_setLocation        (HTParentAnchor * me, char * location);
/*

  Media Types (Content-Type)
  
 */
extern HTFormat HTAnchor_format         (HTParentAnchor *me);
extern void HTAnchor_setFormat          (HTParentAnchor *me,
                                         HTFormat       form);
/*

  Content Type Parameters
  
   The Anchor obejct stores all content parameters in an Association list so here you will
   always be able to find them. We also have a few methods for the special cases:
   charsetand levelas they are often needed.
   
 */
extern HTAssocList * HTAnchor_formatParam (HTParentAnchor * me);

extern BOOL HTAnchor_addFormatParam     (HTParentAnchor * me,
                                        const char * name, const char * value);
/*

    Charset parameter to Content-Type
    
 */
extern HTCharset HTAnchor_charset       (HTParentAnchor *me);
extern BOOL HTAnchor_setCharset         (HTParentAnchor *me,
                                         HTCharset      charset);
/*

    Level parameter to Content-Type
    
 */
extern HTLevel HTAnchor_level           (HTParentAnchor * me);
extern BOOL HTAnchor_setLevel           (HTParentAnchor * me,
                                         HTLevel        level);
/*

  Content Language
  
 */
extern HTList * HTAnchor_language       (HTParentAnchor * me);
extern BOOL HTAnchor_addLanguage        (HTParentAnchor *me, HTLanguage lang);
/*

  Content Encoding
  
 */
extern HTList * HTAnchor_encoding       (HTParentAnchor * me);
extern BOOL HTAnchor_addEncoding        (HTParentAnchor * me, HTEncoding enc);
/*

  Content Transfer Encoding
  
 */
extern HTEncoding HTAnchor_transfer     (HTParentAnchor *me);
extern void HTAnchor_setTransfer        (HTParentAnchor *me,
                                         HTEncoding             transfer);
/*

  Content Length
  
 */
extern long int HTAnchor_length (HTParentAnchor * me);
extern void HTAnchor_setLength  (HTParentAnchor * me, long int length);
extern void HTAnchor_addLength  (HTParentAnchor * me, long int deltalength);
/*

  Content MD5
  
 */
extern char * HTAnchor_md5      (HTParentAnchor * me);
extern BOOL HTAnchor_setMd5     (HTParentAnchor * me, const char * hash);
/*

  Allowed methods (Allow)
  
 */
extern HTMethod HTAnchor_allow   (HTParentAnchor * me);
extern void HTAnchor_setAllow    (HTParentAnchor * me, HTMethod methodset);
extern void HTAnchor_appendAllow (HTParentAnchor * me, HTMethod methodset);
/*

  Version
  
 */
extern char * HTAnchor_version  (HTParentAnchor * me);
extern void HTAnchor_setVersion (HTParentAnchor * me, const char * version);
/*

  Date
  
   Returns the date that was registered in the RFC822 header "Date"
   
 */
extern time_t HTAnchor_date             (HTParentAnchor * me);
extern void HTAnchor_setDate            (HTParentAnchor * me, const time_t date);
/*

  Last Modified Date
  
   Returns the date that was registered in the RFC822 header "Last-Modified"
   
 */
extern time_t HTAnchor_lastModified     (HTParentAnchor * me);
extern void HTAnchor_setLastModified    (HTParentAnchor * me, const time_t lm);
/*

  Entity Tag
  
   Entity tags are used for comparing two or more entities from the same requested
   resource. It is a cache validator much in the same way _Date_ can be. The difference is
   that we can't always trust the date and time stamp and hence we must have something
   stronger.
   
 */
extern char * HTAnchor_etag     (HTParentAnchor * me);
extern void HTAnchor_setEtag    (HTParentAnchor * me, const char * etag);
extern BOOL HTAnchor_isEtagWeak (HTParentAnchor * me);
/*

  Age Header
  
   The Ageresponse-header field conveys the sender's estimate of the amount of time since
   the response (or its revalidation) was generated at the origin server. A cached
   response is "fresh" if its age does not exceed its freshness lifetime.
   
 */
extern time_t HTAnchor_age    (HTParentAnchor * me);
extern void HTAnchor_setAge   (HTParentAnchor * me, const time_t age);
/*

  Expires Date
  
 */
extern time_t HTAnchor_expires          (HTParentAnchor * me);
extern void HTAnchor_setExpires         (HTParentAnchor * me, const time_t exp);
/*

  Derived from
  
 */
extern char * HTAnchor_derived  (HTParentAnchor *me);
extern void HTAnchor_setDerived (HTParentAnchor *me, const char *derived_from);
/*

STATUS OF HEADER PARSING

   This is primarily for internal use. It is so that we can check whether the header has
   been parsed or not.
   
 */
extern BOOL HTAnchor_headerParsed       (HTParentAnchor *me);
extern void HTAnchor_setHeaderParsed    (HTParentAnchor *me);
/*

  Original Response Headers
  
   The MIME parser may add the original response headers as (name,value) pairs.
   
 */
extern BOOL HTAnchor_setHeader       (HTParentAnchor * me, HTAssocList * list);
extern HTAssocList * HTAnchor_header (HTParentAnchor * me);
/*

 */
#endif /* HTANCHOR_H */
/*

   
   ___________________________________
   
                          @(#) $Id: HTAnchor.h,v 1.1.1.1 1996/10/15 13:08:40 cvs Exp $
                                                                                          
    */
