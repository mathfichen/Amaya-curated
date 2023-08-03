/*
 * powerpc/linux/md.c
 * Linux PowerPC specific functions.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#include "config.h"
#include <malloc.h>

void
init_md(void)
{
#if defined(HAVE_MALLOPT)
	mallopt(M_MMAP_MAX, 0);
#endif
}

/*
 * Dummy volatile function.
 */
void
thread_dummy(char* s, ...)
{
	volatile int n;
	n = 0;
}
