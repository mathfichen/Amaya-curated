/*
 * alpha/osf/md.h
 * OSF/1 Alpha configuration information.
 *
 * Copyright (c) 1997 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Richard Henderson <rth@tamu.edu>, 1997
 */

#ifndef __alpha_osf_md_h
#define __alpha_osf_md_h

#include "alpha/threads.h"

#if defined(TRANSLATOR)
#include "jit-md.h"
#endif

/* Alpha's require a little initialisation for proper IEEE math.  */
#define INIT_MD()       init_md()

#endif
