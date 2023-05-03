/*
 * m68k/amigaos/md.h
 * AmigaOS specific functions.
 *
 * Copyright (c) 1996 Matthias Hopf <mshopf@informatik.uni-erlangen.de>
 *
 * Permission granted for Tim Wilkinson to include this source in his
 * Kaffe system, Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 */

#ifndef __m68k_amigaos_md_h
#define __m68k_amigaos_md_h


#include "m68k/amigaos/threads.h"

#if defined(TRANSLATOR)
#include "jit-md.h"
#endif

/* We do additional things here */
#undef  THREADINFO
#define THREADINFO(ee) md_threadinfo(ee)
void md_threadinfo (struct _ctx *ee);

#endif
