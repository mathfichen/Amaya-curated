/*
 * m68k/aux/md.c
 * A/UX specific functions.
 *
 * Copyright (c) 1996 Matthias Hopf <mshopf@informatik.uni-erlangen.de>
 *
 * Permission granted for Tim Wilkinson to include this source in his
 * Kaffe system, Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 */

#ifdef TRANSLATOR
void
init_md(void)
{
	extern int jit_debug;
	if (getenv("KAFFE_JIT_DEBUG"))
		jit_debug = 1;
}
#endif
