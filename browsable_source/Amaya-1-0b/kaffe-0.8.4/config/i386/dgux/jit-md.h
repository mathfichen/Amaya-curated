/*
 * i386/dgux/jit-md.h
 * Unixware i386 JIT configuration information.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#ifndef __i386_dgux_jit_md_h
#define __i386_dgux_jit_md_h

/**/
/* Include common information. */
/**/
#include "i386/jit.h"

/*
 * graf 961201: apparently DG/UX assembler does not support numeric labels
 */

#undef	CALL_KAFFE_FUNCTION_VARARGS
#define	CALL_KAFFE_FUNCTION_VARARGS(meth, obj, nargs, argptr, retval)	\
	asm volatile ("							\n\
		movl %3,%%eax						\n\
.L1_%5:		cmpl $0,%%eax						\n\
		je .L2_%5						\n\
		decl %%eax						\n\
		pushl (%4,%%eax,4)					\n\
		jmp .L1_%5						\n\
.L2_%5:									\n\
		pushl %2						\n\
		call *%1						\n\
		movl %%eax,%0						\n\
		" : "=r" (retval) :					\
	    "r" (meth->ncode), "r" (obj), "r" (nargs), "r" (argptr),	\
	    "X" (__LINE__)						\
	    : "eax", "cc" );						\
	asm volatile ("							\n\
		addl %0,%%esp" : : "r" (4*(nargs+1)) : "cc")

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
	(f).retbp = (c)->uc_mcontext.gregs[R_EBP];			\
	(f).retpc = (c)->uc_mcontext.gregs[R_EIP] + 1

#endif
