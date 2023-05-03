/*                                                W3C Reference Library libwww Protocol Class
                                    THE PROTOCOL CLASS
                                             
 */
/*
**      (c) COPYRIGHT MIT 1995.
**      Please first read the full copyright statement in the file COPYRIGH.
*/
/*

   The Protocol class defines an application level protocol (HTTP, FTP, Gopher, etc.) to
   be used by libwww. Please note that access to the local file system also is considered
   to be an appliaction level protocol treated identically to for example the HTTP
   protocol. The Protocol class does only know about the application layer protocol and it
   relies on the Transport Class to do the actualt communication with the network, the
   local file system etc. The protocol class defines an access method for botg a client
   and a server. A typical client application would probably only want to use the client
   method and a server only the server method. However, any application can use both which
   allows it to seemlessly to change between server and client profile as needed.
   
   _Note_: The library _core_ does not define any default application layer protocols -
   they are all considered part of the application. The library comes with a default set
   of protocols including the ones mentioned above which can be initiated using the
   function HTProtocolInit()in HTInit module
   
   This module is implemented by HTProt.c, and it is a part of the W3C Reference Library.
   
 */
#ifndef HTPROT_H
#define HTPROT_H

#include "HTReq.h"
#include "HTAnchor.h"
#include "HTEvent.h"
#include "HTTrans.h"
/*

   An access scheme module takes as a parameter a socket (which is an invalid socket the
   first time the function is called), a request structure containing details of the
   request, and the action by which the (valid) socket was selected in the event loop.
   When the protocol class routine is called, the anchor element in the request is already
   valid (made valid by HTAccess).
   
 */
typedef struct _HTProtocol HTProtocol;
/*

CREATION AND DELETION METHODS

  Add an Protocol
  
   This functions registers a protocol module and binds it to a specific access acheme
   (the part before the first colon in a URL). For example, the HTTP  client module is
   bound to http URLs. The callback function is the function to be called for loading.
   
 */
extern BOOL HTProtocol_add (const char *        name,
                            const char *        transport,
                            BOOL                preemptive,
                            HTEventCallback *   client,
                            HTEventCallback *   server);
/*

  Delete a Protocol
  
   This functions deletes a registered protocol module so that it can not be used for
   accessing a resource anymore.
   
 */
extern BOOL HTProtocol_delete (const char * name);
/*

  Remove ALL Registered Protocols
  
   This is the garbage collection function. It is called by HTLibTerminate()
   
 */
extern BOOL HTProtocol_deleteAll (void);
/*

PROTOCOL CLASS METHODS

  Find a Protocol Object
  
   You can search the list of registered protocol objects as a function of the access
   acheme. If an access scheme is found then the protocol object is returned.
   
 */
extern HTProtocol * HTProtocol_find (HTRequest * request, const char * access);
/*

  Get the callback functions
  
   You can get the callback functions registered together with a protocol object using the
   following methods.
   
 */
extern HTEventCallback * HTProtocol_client (HTProtocol * protocol);
extern HTEventCallback * HTProtocol_server (HTProtocol * protocol);
/*

  Is Access Scheme Preemptive
  
   Returns YES if the implementation of the access scheme supports preemptive access only.
   
 */
extern BOOL HTProtocol_preemptive (HTProtocol * protocol);
/*

  Binding to the Transport Class
  
   An application protocol is registered together with a transport protocol in order to
   communicate with the thansport layer.
   
 */
extern BOOL HTProtocol_setTransport (HTProtocol * protoccol,
                                     const char * transport);
extern const char * HTProtocol_transport (HTProtocol * protocol);
/*

 */
#endif /* HTPROT_H */
/*

   
   ___________________________________
   
                            @(#) $Id: HTProt.h,v 1.1.1.1 1996/10/15 13:08:39 cvs Exp $
                                                                                          
    */
