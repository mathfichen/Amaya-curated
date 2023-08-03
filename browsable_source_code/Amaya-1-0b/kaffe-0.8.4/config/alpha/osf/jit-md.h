/*
 * alpha/osf/jit-md.h
 * OSF/1 Alpha JIT configuration information.
 *
 * Copyright (c) 1997 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Richard Henderson <rth@tamu.edu>, 1997.
 */

#ifndef __alpha_osf_jit_md_h
#define __alpha_osf_jit_md_h

/**/
/* Include common information. */
/**/
#include "alpha/jit.h"

/**/
/* Extra exception handling information. */
/**/
#include <signal.h>

#define	EXCEPTIONPROTO							\
	int sig, int code, struct sigcontext *ctx

/* Get the first exception frame from a signal handler */
#define	EXCEPTIONFRAME(f, c)						\
	do {								\
		exceptionFrame *_cur = TCTX(currentThread)->exceptPtr;	\
		if (_cur)						\
			(f) = *_cur;					\
		else {							\
			(f).retfp = (c)->sc_regs[15];			\
			(f).retpc = (c)->sc_pc;				\
		}							\
	} while (0)

#endif
