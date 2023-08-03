/*
 * java.lang.ClassLoader.c
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "lib-license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#include "config.h"
#include "config-std.h"
#include "../../../../kaffe/kaffevm/gtypes.h"
#include "../../../../kaffe/kaffevm/file.h"
#include "../../../../kaffe/kaffevm/readClass.h"
#include "../../../../kaffe/kaffevm/constants.h"
#include "../../../../kaffe/kaffevm/access.h"
#include "../../../../kaffe/kaffevm/classMethod.h"
#include "../../../../kaffe/kaffevm/object.h"
#include <native.h>
#include "java.lang.stubs/ClassLoader.h"
#include "defs.h"

extern void* checked_malloc(size_t);

/*
 * Translate an array of bytes into a class.
 */
struct Hjava_lang_Class*
java_lang_ClassLoader_defineClass0(struct Hjava_lang_ClassLoader* this, HArrayOfByte* data, jint offset, jint length)
{
	classFile hand;
	hand.base = &unhand(data)->body[offset];
	hand.buf = hand.base;
	hand.size = length;
	return (readClass(alloc_class(), &hand, (struct _classLoader*)this));
}

/*
 * Resolve classes reference by this class.
 */
void
java_lang_ClassLoader_resolveClass0(struct Hjava_lang_ClassLoader* this, struct Hjava_lang_Class* class)
{
	linkClass (class);
}

/*
 * Load a system class.
 */
struct Hjava_lang_Class*
java_lang_ClassLoader_findSystemClass0(struct Hjava_lang_ClassLoader* this, struct Hjava_lang_String* str)
{
	int len = javaStringLength(str);
	Utf8Const* c;
	char* name;
#if INTERN_UTF8CONSTS
	char buffer[100];
	if (len <= 100) {
		name = buffer;
	}
	else {
		name = checked_malloc (len);
	}
#else
	c = checked_malloc(sizeof(Utf8Const) + len + 1);
	name = c->data;
#endif
        javaString2CString(str, name, len+1);
	classname2pathname (name, name);
#if INTERN_UTF8CONSTS
	c = makeUtf8Const (name, len);
	if (name != buffer)
		free (name);
#else /* ! INTERN_UTF8CONSTS */
	c->length = len;
	c->hash = (uint16) hashUtf8String (name, len);
#endif /* ! INTERN_UTF8CONSTS */
	return loadClass (c, 0);
}

/*
 * Initialise this class loader.
 */
void
java_lang_ClassLoader_init(struct Hjava_lang_ClassLoader* this)
{
	/* Does nothing */
}
