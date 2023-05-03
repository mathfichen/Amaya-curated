/*
 * lookup.h
 * Various lookup calls for resolving objects, methods, exceptions, etc.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#ifndef __lookup_h
#define __lookup_h

struct _dispatchTable;

typedef struct _callInfo {
	Hjava_lang_Class*	class;
	methods*		method;
	int			in;
	int			out;
	char			rettype;
} callInfo;

typedef struct _exceptionInfo {
	uintp			handler;
	struct Hjava_lang_Class* class;
	struct _methods*	method;
} exceptionInfo;

void	getMethodSignatureClass(constIndex, Method*, callInfo*);
void	getMethodArguments(constIndex, methods*, callInfo*);
Field*	getField(constIndex, bool, Method*, Class**);
Method* findMethod(Class*, Utf8Const*, Utf8Const*);
Method* findMethodLocal(Class*, Utf8Const*, Utf8Const*);
void	findExceptionInMethod(uintp, Class*, exceptionInfo*);
bool	findExceptionBlockInMethod(uintp, Class*, Method*, exceptionInfo*);

#endif
