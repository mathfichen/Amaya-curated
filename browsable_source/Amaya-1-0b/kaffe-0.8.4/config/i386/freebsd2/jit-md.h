/*
 * i386/freebsd2/jit-md.h
 * FreeBSD i386 JIT configuration information.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#ifndef __i386_freebsd2_jit_md_h
#define __i386_freebsd2_jit_md_h

/**/
/* Include common information. */
/**/
#include "i386/jit.h"

/**/
/* Extra exception handling information. */
/**/

/* Function prototype for signal handlers */
#define	EXCEPTIONPROTO							\
	int sig, int code, struct sigcontext* ctx

/* Get the first exception frame from a signal handler */
#define	EXCEPTIONFRAME(f, c)						\
	(f).retbp = (c)->sc_ebp;					\
	(f).retpc = (c)->sc_eip + 1

#endif
