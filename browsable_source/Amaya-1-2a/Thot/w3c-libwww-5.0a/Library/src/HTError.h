/*                                                   W3C Reference Library libwww Error Class
                                     THE ERROR CLASS
                                             
 */
/*
**      (c) COPYRIGHT MIT 1995.
**      Please first read the full copyright statement in the file COPYRIGH.
*/
/*

   The Error class provides an easy API for registering errors ocurring while the Library
   serves a request. All errors are registered in an "error stack" in the Request object
   which allows for nested errors. The Error class is both natural language independent
   and application independent in that it uses enumerations in order to refer to specific
   errors. It is for the application to provide an error presentation module which
   interprets the errors associated with a request. An eample of such an implementation
   can be found in the HTDialog module.
   
   This module is implemented by HTError.c, and it is a part of the W3C Reference Library.
   
 */
#ifndef HTERROR_H
#define HTERROR_H

typedef struct _HTError HTError;

typedef enum _HTSeverity {
    ERR_UNKNOWN           = 0x0,
    ERR_FATAL             = 0x1,
    ERR_NON_FATAL         = 0x2,
    ERR_WARN              = 0x4,
    ERR_INFO              = 0x8
} HTSeverity;

#include "HTReq.h"
/*

ERROR CODES AND MESSAGES

   _Note:_ All non-HTTP error codes have index numbers > HTERR_HTTP_CODES, and they will
   not be shown in the error-message generated.
   
 */
typedef enum _HTErrorElement {
        HTERR_CONTINUE = 0,                                     /* 100 */
        HTERR_SWITCHING,                                        /* 101 */
        HTERR_OK,                                               /* 200 */
        HTERR_CREATED,                                          /* 201 */
        HTERR_ACCEPTED,                                         /* 202 */
        HTERR_NON_AUTHORITATIVE,                                /* 203 */
        HTERR_NO_CONTENT,                                       /* 204 */
        HTERR_RESET,                                            /* 205 */
        HTERR_PARTIAL,                                          /* 206 */
        HTERR_MULTIPLE,                                         /* 300 */
        HTERR_MOVED,                                            /* 301 */
        HTERR_FOUND,                                            /* 302 */
        HTERR_METHOD,                                           /* 303 */
        HTERR_NOT_MODIFIED,                                     /* 304 */
        HTERR_USE_PROXY,                                        /* 305 */
        HTERR_BAD_REQUEST,                                      /* 400 */
        HTERR_UNAUTHORIZED,                                     /* 401 */
        HTERR_PAYMENT_REQUIRED,                                 /* 402 */
        HTERR_FORBIDDEN,                                        /* 403 */
        HTERR_NOT_FOUND,                                        /* 404 */
        HTERR_NOT_ALLOWED,                                      /* 405 */
        HTERR_NONE_ACCEPTABLE,                                  /* 406 */
        HTERR_PROXY_UNAUTHORIZED,                               /* 407 */
        HTERR_TIMEOUT,                                          /* 408 */
        HTERR_CONFLICT,                                         /* 409 */
        HTERR_GONE,                                             /* 410 */
        HTERR_LENGTH_REQUIRED,                                  /* 411 */
        HTERR_PRECON_FAILED,                                    /* 412 */
        HTERR_TOO_BIG,                                          /* 413 */
        HTERR_URI_TOO_BIG,                                      /* 414 */
        HTERR_UNSUPPORTED,                                      /* 415 */
        HTERR_REAUTH,                                           /* 418 */
        HTERR_PROXY_REAUTH,                                     /* 419 */
        HTERR_INTERNAL,                                         /* 500 */
        HTERR_NOT_IMPLEMENTED,                                  /* 501 */
        HTERR_BAD_GATE,                                         /* 502 */
        HTERR_DOWN,                                             /* 503 */
        HTERR_GATE_TIMEOUT,                                     /* 504 */
        HTERR_BAD_VERSION,                                      /* 505 */

        /* Cache warnings */
        HTERR_STALE,                                            /* 10 */
        HTERR_REVALIDATION_FAILED,                              /* 11 */
        HTERR_DISCONNECTED_CACHE,                               /* 12 */
        HTERR_HEURISTIC_EXPIRATION,                             /* 13 */
        HTERR_TRANSFORMED,                                      /* 14 */
        HTERR_CACHE,                                            /* 99 */

        /* Put all non-HTTP status codes after this */
        HTERR_NO_REMOTE_HOST,
        HTERR_NO_HOST,
        HTERR_NO_FILE,
        HTERR_FTP_SERVER,
        HTERR_FTP_NO_RESPONSE,
        HTERR_TIME_OUT,
        HTERR_GOPHER_SERVER,
        HTERR_INTERRUPTED,
        HTERR_CON_INTR,
        HTERR_CSO_SERVER,
        HTERR_HTTP09,
        HTERR_BAD_REPLY,
        HTERR_UNKNOWN_AA,
        HTERR_NEWS_SERVER,
        HTERR_FILE_TO_FTP,
        HTERR_AUTO_REDIRECT,
        HTERR_MAX_REDIRECT,
        HTERR_EOF,
        HTERR_WAIS_OVERFLOW,
        HTERR_WAIS_MODULE,
        HTERR_WAIS_NO_CONNECT,
        HTERR_SYSTEM,
        HTERR_CLASS,
        HTERR_ACCESS,
        HTERR_LOGIN,
        HTERR_CACHE_EXPIRED,
        HTERR_ELEMENTS                      /* This MUST be the last element */
} HTErrorElement;
/*

WHAT ERRORS SHOULD BE PARSED THROUGH?

   This variable dictates which errors should be put out when generating the message to
   the user. The first four enumerations make it possible to see `everything as bad or
   worse than' this level, e.g. HT_ERR_SHOW_NON_FATALshows messages of type
   HT_ERR_SHOW_NON_FATAL and HT_ERR_SHOW_FATAL.
   
   _Note:_ The default value is made so that it only puts a message to stderrif a `real'
   error has occurred. If a separate widget is available for information and error
   messages then probably HT_ERR_SHOW_DETAILEDwould be more appropriate.
   
 */
typedef enum _HTErrorShow {
    HT_ERR_SHOW_FATAL     = 0x1,
    HT_ERR_SHOW_NON_FATAL = 0x3,
    HT_ERR_SHOW_WARNING   = 0x7,
    HT_ERR_SHOW_INFO      = 0xF,
    HT_ERR_SHOW_PARS      = 0x10,
    HT_ERR_SHOW_LOCATION  = 0x20,
    HT_ERR_SHOW_IGNORE    = 0x40,
    HT_ERR_SHOW_FIRST     = 0x80,
    HT_ERR_SHOW_LINKS     = 0x100,
    HT_ERR_SHOW_DEFAULT   = 0x13,
    HT_ERR_SHOW_DETAILED  = 0x1F,
    HT_ERR_SHOW_DEBUG     = 0x7F
} HTErrorShow;

typedef struct _HTErrorMessage {
    int         code;                   /* Error number */
    char *      msg;                    /* Short explanation */
    char *      url;                    /* Explaning URL */
} HTErrorMessage;

/*    CODE  ERROR MESSAGE                               ERROR URL */
#define HTERR_ENGLISH_INITIALIZER \
    { 100, "Continue",                                  "information" }, \
    { 101, "Switching Protocols",                       "information" }, \
    { 200, "OK",                                        "success" }, \
    { 201, "Created",                                   "success" }, \
    { 202, "Accepted",                                  "success" }, \
    { 203, "Non-authoritative Information",             "success" }, \
    { 204, "No Content",                                "success" }, \
    { 205, "Reset Content",                             "success" }, \
    { 206, "Partial Content",                           "success" }, \
    { 300, "Multiple Choices",                          "redirection" }, \
    { 301, "Moved Permanently",                         "redirection" }, \
    { 302, "Moved Temporarily",                         "redirection" }, \
    { 303, "See Other",                                 "redirection" }, \
    { 304, "Not Modified",                              "redirection" }, \
    { 305, "Use Proxy",                                 "redirection" }, \
    { 400, "Bad Request",                               "client_error" }, \
    { 401, "Unauthorized",                              "client_error" }, \
    { 402, "Payment Required",                          "client_error" }, \
    { 403, "Forbidden",                                 "client_error" }, \
    { 404, "Not Found",                                 "client_error" }, \
    { 405, "Method Not Allowed",                        "client_error" }, \
    { 406, "Not Acceptable",                            "client_error" }, \
    { 407, "Proxy Authentication Required",             "client_error" }, \
    { 408, "Request Timeout",                           "client_error" }, \
    { 409, "Conflict",                                  "client_error" }, \
    { 410, "Gone",                                      "client_error" }, \
    { 411, "Length Required",                           "client_error" }, \
    { 412, "Precondition Failed",                       "client_error" }, \
    { 413, "Request Entity Too Large",                  "client_error" }, \
    { 414, "Request-URI Too Large",                     "client_error" }, \
    { 415, "Unsupported Media Type",                    "client_error" }, \
    { 500, "Internal Server Error",                     "server_error" }, \
    { 501, "Not Implemented",                           "server_error" }, \
    { 502, "Bad Gateway",                               "server_error" }, \
    { 503, "Service Unavailable",                       "server_error" }, \
    { 504, "Gateway Timeout",                           "server_error" }, \
    { 505, "HTTP Version not supported",                "server_error" }, \
 \
    /* Cache Warnings */ \
    { 10,  "Response is Stale",                         "cache" }, \
    { 11,  "Revalidation Failed",                       "cache" }, \
    { 12,  "Disconnected Opeartion",                    "cache" }, \
    { 13,  "Heuristic Expiration",                      "cache" }, \
    { 14,  "Transformation Applied",                    "cache" }, \
    { 99,  "Cache warning",                             "cache" }, \
 \
    /* Non-HTTP Error codes and warnings */ \
    { 0,   "Can't locate remote host",                  "internal" }, \
    { 0,   "No host name found",                        "internal" }, \
    { 0,   "No file name found or file not accessible", "internal" }, \
    { 0,   "FTP-server replies",                        "internal" }, \
    { 0,   "FTP-server doesn't reply",                  "internal" }, \
    { 0,   "Server timed out",                          "internal" }, \
    { 0,   "Gopher-server replies",                     "internal" }, \
    { 0,   "Data transfer interrupted",                 "internal" }, \
    { 0,   "Connection establishment interrupted",      "internal" }, \
    { 0,   "CSO-server replies",                        "internal" }, \
    { 0,   "This is probably a HTTP server 0.9 or less","internal" }, \
    { 0,   "Bad, Incomplete, or Unknown Response",      "internal" }, \
    { 0,   "Unknown access authentication scheme",      "internal" }, \
    { 0,   "News-server replies",                       "internal" }, \
    { 0,   "Trying `ftp://' instead of `file://'",      "internal" }, \
    { 0,   "Too many redirections",                     "internal" }, \
    { 0,   "Method not suited for automatic redirection","internal" }, \
    { 0,   "Premature End Of File",                     "internal" }, \
    { 0,   "Response from WAIS Server too Large - Extra lines \
ignored","internal"}, \
    { 0,   "WAIS-server doesn't return any data",       "internal" }, \
    { 0,   "Can't connect to WAIS-server",              "internal" }, \
    { 0,   "System replies",                            "internal" }, \
    { 0,   "Wrong or unknown access scheme",            "internal" }, \
    { 0,   "Access scheme not allowed in this context", "internal" }, \
    { 0,   "When you are connected, you can log in",    "internal" }, \
    { 0,   "This version has expired and will be automatically reloaded", "internal" }

extern HTErrorShow HTError_show (void);
extern BOOL HTError_setShow (HTErrorShow mask);
/*

CREATION AND DELETION METHODS

  Add an Error
  
   Add an error message to the error list. `par' and `where' might be set to NULL. If par
   is a string, it is sufficient to let length be unspecified, i.e., 0. If only a part of
   the string is wanted then specify a length inferior to strlen((char *) par). The string
   is '\0' terminated automaticly. See also HTError_addSystem for system errors. Returns
   YES if OK, else NO.
   
 */
extern BOOL HTError_add (HTList *       list,
                         HTSeverity     severity,
                         BOOL           ignore,
                         int            element,
                         void *         par,
                         unsigned int   length,
                         char *         where);

/*

  Add a System Error
  
   Add a system error message to the error list. syscall is the name of the system call,
   e.g. "close". The message put to the list is that corresponds to the error number
   passed. See also HTError_add. Returns YES if OK, else NO.
   
 */
extern BOOL HTError_addSystem (HTList *         list,
                               HTSeverity       severity,
                               int              errornumber,
                               BOOL             ignore,
                               char *           syscall);
/*

  Delete an Entire Error Stack
  
   Deletes all errors in a list.
   
 */
extern BOOL HTError_deleteAll (HTList * list);
/*

  Deletes the Last Edded Entry
  
   Deletes the last error entry added to the list. Return YES if OK, else NO
   
 */
extern BOOL HTError_deleteLast (HTList * list);
/*

OBJECT METHODS

  Show the Error Entry?
  
   Should we show this entry in the list or just continue to the next one?
   
 */
extern BOOL HTError_doShow (HTError * info);
/*

  Ignore last Added Error
  
   Turns on the `ignore' flag for the most recent error entered the error list. Returns
   YES if OK else NO
   
 */
extern BOOL HTError_ignoreLast  (HTList * list);
extern BOOL HTError_setIgnore   (HTError * info);
/*

  Error Index Number
  
   Each error object is assigned an index number as defined by the HTErrorElementabove.
   The mapping from this index to an error code and a message must be done by the
   application. The Library provides a default implementation in the HTDialog module, but
   that can of course be changed depending on the application.
   
 */
extern int HTError_index                (HTError * info);
/*

  Error Severity
  
   This function returns the severity of the error object passed by the caller
   
 */
extern HTSeverity HTError_severity      (HTError * info);
/*

   You can ask whether a list of errors contains any error object with a severity level
   which is higher than the one specifed.
   
 */
extern BOOL HTError_hasSeverity         (HTList * list, HTSeverity severity);
/*

  Parameters Asscotiated with Error
  
 */
extern void * HTError_parameter         (HTError * info, int * length);
/*

  Where did it happen?
  
 */
extern const char * HTError_location    (HTError * info);
/*

 */
#endif
/*

   
   ___________________________________
   
                              @(#) $Id: HTError.h,v 1.2 1998/03/11 17:45:37 cvs Exp $
                                                                                          
    */