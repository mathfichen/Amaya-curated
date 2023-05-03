/*
 * i386/linux/jit-md.h
 * Linux i386 JIT configuration information.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#ifndef __i386_linux_jit_md_h
#define __i386_linux_jit_md_h

/**/
/* Include common information. */
/**/
#include "i386/jit.h"

/**/
/* Extra exception handling information. */
/**/
#include <asm/signal.h>
#if defined(HAVE_ASM_SIGCONTEXT_H)
#include <asm/sigcontext.h>
#endif

/* Function prototype for signal handlers */
#if defined(HAVE_STRUCT_SIGCONTEXT_STRUCT)
/* Linux < 2.1.1 */
#define	EXCEPTIONPROTO							\
	int sig, struct sigcontext_struct ctx

#elif defined(HAVE_STRUCT_SIGCONTEXT)
/* Linux >= 2.1.1 */
#define	EXCEPTIONPROTO							\
	int sig, struct sigcontext ctx
#endif

/* Get the first exception frame from a signal handler */
#define	EXCEPTIONFRAME(f, c)						\
	(f).retbp = (c).ebp;						\
	(f).retpc = (c).eip + 1

#endif
