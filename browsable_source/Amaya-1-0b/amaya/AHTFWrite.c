/*
 *
 *  (c) COPYRIGHT MIT and INRIA, 1996.
 *  Please first read the full copyright statement in file COPYRIGHT.
 *
 */
 
/*
 * AHTFWrite.c:  it's a rewrite of libwww's HTFWrite.c module. It
 * provides a callback to a user defined function each time a new data
 * block is received over the network.  
 * See libwww for a more complete documentation.
 *
 * Author: J. Kahan
 *
 */

#ifndef AMAYA_JAVA

#define THOT_EXPORT extern
#include "amaya.h"

/*
   **
   **              A H T    F W R I T E R   C O N V E R T E R   C L A S S
   **
 */
struct _HTStream
  {
     const HTStreamClass *isa;
     FILE               *fp;
     BOOL                leave_open;	  /* Close file when TtaFreeMemory? */
     char               *end_command;	  /* Command to execute       */
     BOOL                remove_on_close; /* Remove file?             */
     char               *filename;	  /* Name of file             */
     HTRequest          *request;	  /* saved for callback       */
     HTRequestCallback  *callback;
  };

/***
  Static function prototypes 
***/

#ifdef __STDC__
static int AHTFWriter_flush ( HTStream * me );
static int AHTFWriter_put_character ( HTStream * me,
                                              char c );
static int AHTFWriter_put_string ( HTStream * me,
                                           const char *s );
static int AHTFWriter_put_block ( HTStream * me,
                                      const char *s,
                                      int l );
static int AHTFWriter_abort (HTStream * me, HTList *e);
#else 
static int AHTFWriter_flush (/* HTStream * me */);
static int AHTFWriter_put_character (/* HTStream * me,
                                                char c */);
static int AHTFWriter_put_string (/* HTStream * me,
                                             const char *s */);
static int AHTFWriter_put_block (/* HTStream * me,
                                        const char *s,
                                        int l */);
static int AHTFWriter_abort (/*HTStream * me, HTList *e */);
#endif

/*----------------------------------------------------------------------
  AHTFWriter_put_character
  ----------------------------------------------------------------------*/
#ifdef __STDC__
static int         AHTFWriter_put_character (HTStream * me, char c)
#else				/* __STDC__ */
static int         AHTFWriter_put_character (me, c)
Stream             *me;
char                c;

#endif /* __STDC__ */
{
   int                 status;
   AHTReqContext      *reqcont;

   reqcont = (AHTReqContext *) HTRequest_context (me->request);
   status = (fputc (c, me->fp) == EOF) ? HT_ERROR : HT_OK;

   if (status == HT_OK)
      status = AHTFWriter_flush (me);
   if (reqcont && reqcont->incremental_cbf)
      (*reqcont->incremental_cbf) (reqcont, &c, 1, status);
   return status;
}

/*----------------------------------------------------------------------
  AHTFWriter_put_string
  ----------------------------------------------------------------------*/
#ifdef __STDC__
static int         AHTFWriter_put_string (HTStream * me, const char *s)
#else  /* __STDC__ */
static int         AHTFWriter_put_string (me, s)
HTStream           *me;
const char         *s;
#endif /* __STDC__ */
{
   int                 status;
   AHTReqContext      *reqcont;

   reqcont = (AHTReqContext *) HTRequest_context (me->request);
   if (*s)
     {
	status = (fputs (s, me->fp) == EOF) ? HT_ERROR : HT_OK;
	if (status == HT_OK)
	   status = AHTFWriter_flush (me);
     }

   if (reqcont && reqcont->incremental_cbf)
      (*reqcont->incremental_cbf) (reqcont, s, strlen (s), status);
   return status;
}


/*----------------------------------------------------------------------
  AHTFWriter_put_block
  ----------------------------------------------------------------------*/
#ifdef __STDC__
static int         AHTFWriter_put_block (HTStream * me, const char *s, int l)
#else  /* __STDC__ */
static int         AHTFWriter_write (me, s, l)
HTStream           *me;
const char         *s;
int                 l;

#endif /* __STDC__ */
{
   int                 status;
   AHTReqContext      *reqcont;

   reqcont = (AHTReqContext *) HTRequest_context (me->request);
   status = (fwrite (s, 1, l, me->fp) != l) ? HT_ERROR : HT_OK;
   if (l > 1 && status == HT_OK)
      (void) AHTFWriter_flush (me);

   if (reqcont && reqcont->incremental_cbf)
      (*reqcont->incremental_cbf) (reqcont, s, l, status);

   return status;
}

/*----------------------------------------------------------------------
  AHTFWriter_flush
  ----------------------------------------------------------------------*/
#ifdef __STDC__
static int         AHTFWriter_flush (HTStream * me)
#else  /* __STDC__ */
static int         AHTFWriter_flush (me)
HTStream           *me
#endif				/* __STDC__ */
{
   return (fflush (me->fp) == EOF) ? HT_ERROR : HT_OK;
}


/*----------------------------------------------------------------------
  AHTFWriter_FREE
  ----------------------------------------------------------------------*/
#ifdef __STDC__
int         AHTFWriter_FREE (HTStream * me)
#else  /* __STDC__ */
int         AHTFWriter_FREE (me)
HTStream           *me;

#endif /* __STDC__ */
{
   if (me)
     {
	if (me->leave_open != YES)
	   fclose (me->fp);
#ifdef HAVE_SYSTEM
	if (me->end_command)
	   system (me->end_command);	/* SECURITY HOLE!!! */
#endif
	if (me->remove_on_close)
	   REMOVE (me->filename);
	if (me->callback)
	   (*me->callback) (me->request, me->filename);
	TtaFreeMemory (me->end_command);
	TtaFreeMemory (me->filename);
	TtaFreeMemory (me);
     }
   return HT_OK;
}

/*----------------------------------------------------------------------
  AHTFWriter_abort
  ----------------------------------------------------------------------*/
#ifdef __STDC__
static int  AHTFWriter_abort (HTStream * me, HTList *e)
#else  /* __STDC__ */
static int  AHTFWriter_abort (me, e)
HTStream           *me;
HTList             *e;

#endif /* __STDC__ */
{
   if (STREAM_TRACE)
      HTTrace ("FileWriter.. ABORTING...\n");
   if (me)
     {
	if (me->leave_open != YES)
	   fclose (me->fp);
	if (me->remove_on_close)
	   REMOVE (me->filename);
	TtaFreeMemory (me->end_command);
	TtaFreeMemory (me->filename);
	TtaFreeMemory (me);
     }
   return HT_ERROR;
}

/*      AHTFWriter class stream
 */

static const HTStreamClass AHTFWriter =	/* As opposed to print etc */
{
   "FileWriter",
   AHTFWriter_flush,
   AHTFWriter_FREE,
   AHTFWriter_abort,
   AHTFWriter_put_character,
   AHTFWriter_put_string,
   AHTFWriter_put_block
};


/*----------------------------------------------------------------------
  AHTFWriter_new
  ----------------------------------------------------------------------*/
#ifdef __STDC__
HTStream           *AHTFWriter_new (HTRequest * request, FILE * fp, BOOL leave_open)
#else  
HTStream           *AHTFWriter_new (request, fp, leave_open)
HTRequest          *request;
FILE               *fp;
BOOL                leave_open;
#endif /* __STDC__ */
{
   HTStream           *me = NULL;

   if (!fp)
     {
	if (STREAM_TRACE)
	   HTTrace ("FileWriter.. Bad file descriptor\n");
	return (HTStream *) HTErrorStream ();
     }
   if ((me = (HTStream *) HT_CALLOC (1, sizeof (HTStream))) == NULL)
      HT_OUTOFMEM ("HTFWriter_new");
   me->isa = &AHTFWriter;
   me->fp = fp;
   me->leave_open = leave_open;
   me->request = request;
   return me;
}


/*
  End of Module AHTFWrite.c
*/

#endif /* !AMAYA_JAVA */
