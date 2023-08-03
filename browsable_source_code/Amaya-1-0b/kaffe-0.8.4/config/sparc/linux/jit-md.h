/*
 * sparc/linux/jit-md.h
 * Linux SPARC JIT configuration information.
 *
 * Copyright (c) 1996-97 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.co.uk>
 */

#ifndef __sparc_linux_jit_md_h
#define __sparc_linux_jit_md_h

/**/
/* Include common information. */
/**/
#include "sparc/jit.h"

/**/
/* Extra exception handling information. */
/**/
#include <asm/sigcontext.h>

/* Function prototype for signal handlers */
#define	EXCEPTIONPROTO							\
	int sig, __siginfo_t* ctx

/* Get the first exception frame from a signal handler */
#define	EXCEPTIONFRAME(f, c)						\
	(f).retbp = (c)->si_regs.u_regs[UREG_FP];			\
	(f).retpc = (c)->si_regs.pc

#endif
