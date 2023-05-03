/*
 * m68k/aux/md.h
 * aux/m68k specific functions.
 *
 * Copyright (c) 1996 Matthias Hopf <mshopf@informatik.uni-erlangen.de>
 *
 * Permission granted for Tim Wilkinson to include this source in his
 * Kaffe system, Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 */

#ifndef __m68k_netbsd_md_h
#define __m68k_netbsd_md_h

#include "m68k/aux/threads.h"

#if defined(TRANSLATOR)
#include "jit-md.h"
#define INIT_MD()       init_md()
#endif

#endif
