/*
 * java.lang.Throwable.c
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "lib-license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#include <stdio.h>
#include <assert.h>
#include <native.h>
#include "java.io.stubs/FileDescriptor.h"
#include "java.io.stubs/FileOutputStream.h"
#include "java.io.stubs/PrintStream.h"
#include "java.lang.stubs/Throwable.h"

extern Hjava_lang_Object* buildStackTrace(void*);

/*
 * Fill in stack trace information - don't know what thought.
 */
struct Hjava_lang_Throwable*
java_lang_Throwable_fillInStackTrace(struct Hjava_lang_Throwable* o)
{
	unhand(o)->backtrace = buildStackTrace(0);
	return (o);
}

/*
 * Dump the stack trace to the given stream.
 */
void
java_lang_Throwable_printStackTrace0(struct Hjava_lang_Throwable* o, struct Hjava_io_PrintStream* p)
{
	int i;
	HArrayOfArray* strarray;

	strarray = (HArrayOfArray*)unhand(o)->backtrace;
	if (strarray != 0) {
		for (i = 0; i < obj_length(strarray); i++) {
			if (unhand(strarray)->body[i] != 0) {
				do_execute_java_method(0, (Hjava_lang_Object*)p, "write", "([B)V", 0, 0, unhand(strarray)->body[i]);
				do_execute_java_method(0, (Hjava_lang_Object*)p, "println", "()V", 0, 0);
			}
		}
	}
}
