/*
 * java.lang.SecurityManager.c
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "lib-license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#include <stdlib.h>
#include <native.h>
#include "java.lang.stubs/SecurityManager.h"

HArrayOfObject* /* HArrayOfClass */
java_lang_SecurityManager_getClassContext(struct Hjava_lang_SecurityManager* this)
{
	abort();
	return (0);
}

struct Hjava_lang_ClassLoader*
java_lang_SecurityManager_currentClassLoader(struct Hjava_lang_SecurityManager* this)
{
	/* abort(); */
	return (0);
}

jint
java_lang_SecurityManager_classDepth(struct Hjava_lang_SecurityManager* this, struct Hjava_lang_String* str)
{
	abort();
	return (0);
}

jint
java_lang_SecurityManager_classLoaderDepth(struct Hjava_lang_SecurityManager* this)
{
	/* abort(); */
	return (0);
}
