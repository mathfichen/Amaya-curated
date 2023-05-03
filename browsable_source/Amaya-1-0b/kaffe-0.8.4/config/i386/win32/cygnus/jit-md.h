/*
 * i386/win32/cygnus/jit-md.h
 * Windows'95 (Cygnus GNU C) i386 JIT configuration information.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>
 */

#ifndef __i386_win32_cygnus_jit_md_h
#define __i386_win32_cygnus_jit_md_h

/**/
/* Include common information. */
/**/
#include "i386/jit.h"

/**/
/* Extra exception handling information. */
/**/

/*
 * No signal handler support yet!!
 */
#define	EXCEPTIONPROTO							\
	int sig

#define	EXCEPTIONFRAME(f, c)						\
	(f).retbp = 0;							\
	(f).retpc = 0

#endif
