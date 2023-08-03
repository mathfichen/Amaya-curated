/*
 * m68k/amigaos/md.c
 * AmigaOS specific functions.
 *
 * Copyright (c) 1996 Matthias Hopf <mshopf@informatik.uni-erlangen.de>
 *
 * Permission granted for Tim Wilkinson to include this source in his
 * Kaffe system, Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 */

#include "m68k/amigaos/md.h"
#include "object.h"
#include "thread.h"

#include <stdio.h>

#include <exec/exec.h>
#include <proto/exec.h>

#define DBG(x)


struct Task *AmigaThisTask = NULL;

/*
 * Thread switching
 * Addapt stack values of the Amiga Task structure accordingly.
 */
void md_threadswitch (ctx *to, ctx *from)
{
/* we should use StackSwap instead of native code, but that would be too
 * complicated and extra overhead...
 * we *should* surround this with Forbid()/Permit() (Task struct stack
 * consistency), but overhead is too high. */
    AmigaThisTask->tc_SPLower = (to)->stackBase;
    AmigaThisTask->tc_SPUpper = (to)->stackEnd;
DBG(printf ("setting task stack info from %x to %x\n", (to)->stackBase, (to)->stackEnd); )
    MD_THREADSWITCH(to, from);
}

/*
 * First Thread initialization
 * Find Amiga Task and check first stack size.
 */
void md_threadinfo (ctx *ee)
{
    AmigaThisTask = FindTask (NULL);
    MD_THREADINFO (ee);
    if ((uint8 *) AmigaThisTask->tc_SPLower > (ee)->stackBase)
    {
	fprintf (stderr, "stack size too low - stack left: %ld, stack needed: %ld\n",
		 (ee)->stackEnd - (uint8 *) AmigaThisTask->tc_SPLower, threadStackSize);
	exit (20);
    }
}

