/*
 * i386/dgux/md.h
 * FreeBSD i386 configuration information.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 * Patches by Andy Johnson <andyj@osf.org>, March 1996.
 */

#ifndef __i386_dgux_md_h
#define __i386_dgux_md_h

#include "i386/threads.h"

/*
 * graf 961201: apparently DG/UX assembler does not support numeric labels
 */
#undef  THREADSWITCH
#define	THREADSWITCH(to, from)					\
	asm("	pushl $.L%2					\n\
		pushal						\n\
		movl %%esp,%0					\n\
		movl %1,%%esp					\n\
		popal						\n\
		ret						\n\
.L%2:		nop						\n\
		" : : "g" (from->restorePoint), "g" (to->restorePoint), "X" (__LINE__))


#if defined(TRANSLATOR)
#include "jit-md.h"
#endif

#endif
