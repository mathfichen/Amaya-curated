/*
 * gc.h
 * The garbage collector.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

/* Enable the garbage collector - recommended */
#define	GC_ENABLE

/* Enable incremental collection - recommended but if you have odd behaviour
 * turn this option off - non-incremental collection is more debugged.
 */
#undef	GC_INCREMENTAL

/* Use the incremental garbage collector */
#include "gc-incremental.h"
