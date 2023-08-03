/*
 * powerpc/mach10/md.h
 * MachTen powerpc configuration information.
 *
 * Copyright (c) 1996 Sandpiper software consulting, LLC
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Rick Greer <rick@sandpiper.com>, 1996.
 */

#ifndef __powerpc_mach10_md_h
#define __powerpc_mach10_md_h

#define  THREADFUNCTION(x) ((int *)(x))[0]; regstore[2] = ((int *)(x))[1]
#include "powerpc/threads.h"

#if defined(TRANSLATOR)
#include "jit-md.h"
#endif

#endif
