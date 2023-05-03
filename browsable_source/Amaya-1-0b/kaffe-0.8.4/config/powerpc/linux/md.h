/*
 * powerpc/linux/md.h
 * Linux PowerPC configuration information.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#ifndef __powerpc_linux_md_h
#define __powerpc_linux_md_h

#include "powerpc/threads.h"

/* Linux requires a little initialisation */
#define	INIT_MD()	init_md()

#endif
