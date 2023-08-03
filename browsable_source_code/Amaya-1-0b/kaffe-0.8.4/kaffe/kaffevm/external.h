/*
 * external.h
 * Handle method calls to other languages.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#ifndef __external_h
#define __external_h

#define	MAXSTUBLEN	1024
#define	MAXLIBPATH	1024
#define	MAXLIBS		16

/* Default library info. */
#if !defined(LIBRARYPATH)
#define	LIBRARYPATH	"LD_LIBRARY_PATH"
#endif
#define	NATIVELIBRARY	"libkaffe_native"

/*
 * Define the Kaffe function call routine.
 *  'func' is a pointer to the method block.
 *  'obj' is the object.
 *  'nargs' is the number of arguments.
 *  'argptr' is a pointer to the arguments.
 */
#if defined(INTERPRETER)

#include <stdarg.h>
#include "config-mem.h"
#include "machine.h"

#define	CALL_KAFFE_FUNCTION_VARARGS(func, obj, nargs, argptr, retval)	\
	{								\
		int i;							\
		va_list ap;						\
		slots* kargs;						\
		slots retslot;						\
		memcpy(&ap, &(argptr), sizeof(va_list));		\
		kargs = alloca(sizeof(slots) * ((nargs) + 1));		\
		for (i = 0; i < (nargs); i++) {				\
			kargs[(nargs)-i-1].v.tword = va_arg(ap, jword);	\
		}							\
		kargs[(nargs)].v.taddr = (void*)obj;			\
		virtualMachine((func), kargs, &retslot);		\
		retval = retslot.v.tword;				\
	}

#define	CALL_KAFFE_FUNCTION(func, obj)					\
	{								\
		slots kargs[1];						\
		slots retval[1];					\
		kargs[0].v.taddr = (void*)obj;				\
		virtualMachine((func), kargs, retval);			\
	}
#endif

struct _methods;

void	initNative(void);
int	loadNativeLibrary(char*);
void	native(struct _methods*);
void	addNativeFunc(char*, void*);

#endif
