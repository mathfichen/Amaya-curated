/*
 * exception.h
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#ifndef __exception_h
#define __exception_h

struct _exceptionFrame;
struct Hjava_lang_Class;
struct Hjava_lang_Object;

typedef struct _jexception {
	uintp			start_pc;
	uintp			end_pc;
	uintp			handler_pc;
	struct Hjava_lang_Class* catch_type;
} jexception;

#if defined(INTERPRETER)
#include <setjmp.h>
struct _methods;
typedef struct _vmException {
	u4				pc;
	struct Hjava_lang_Object*	mobj;
	struct _methods*		meth;
	jmp_buf				jbuf;
	struct _vmException*		prev;
} vmException;
#endif

struct _exceptionFrame;

void		throwException(struct Hjava_lang_Object*);
void		throwExternalException(struct Hjava_lang_Object*);
struct Hjava_lang_Object* buildStackTrace(struct _exceptionFrame*);

extern void nullException();
extern void arithmeticException();

#if defined(__WIN32__)
#define SIG_T   void(*)()
#else
#define SIG_T   void*
#endif

#endif
