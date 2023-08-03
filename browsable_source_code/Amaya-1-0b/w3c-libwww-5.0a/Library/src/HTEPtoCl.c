/*								 HTEpToClient.c
**	EXTERNAL PARSE TO CLIENT
**
**	(c) COPYRIGHT MIT 1995.
**	Please first read the full copyright statement in the file COPYRIGH.
**	@(#) $Id: HTEPtoCl.c,v 1.1.1.1 1996/10/15 13:08:36 cvs Exp $
**
**	This module contains the interface between the 
**      the XParse module and the client. The dummy function is
**      only here so that clients that use the XParse module
**      can overWrite it.
**
** History:
**  	19 Sep 94	Written by Hakon W Lie, howcome@w3.org
**      5  Dec 95       howcome changed name from Ext to X
*/

/* Library include files */
#include "sysdep.h"
#include "HTUtils.h"
#include "HTStream.h"

PUBLIC void HTCallClient (HTStream * me)
{
    return;
}
