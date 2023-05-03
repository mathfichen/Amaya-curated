/*
 * i386/univel_svr4/jit-md.h
 * Unixware i386 JIT configuration information.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#ifndef __i386_univel_svr4_jit_md_h
#define __i386_univel_svr4_jit_md_h

/**/
/* Include common information. */
/**/
#include "i386/jit.h"

/**/
/* Extra exception handling information. */
/**/
#include <siginfo.h>
#include <ucontext.h>

/* Function prototype for signal handlers */
#define	EXCEPTIONPROTO							\
	int sig, siginfo_t* sip, ucontext_t* ctx

/* Get the first exception frame from a signal handler */
#define	EXCEPTIONFRAME(f, c)						\
	(f).retbp = (c)->uc_mcontext.gregs[EBP];			\
	(f).retpc = (c)->uc_mcontext.gregs[EIP] + 1

#endif
