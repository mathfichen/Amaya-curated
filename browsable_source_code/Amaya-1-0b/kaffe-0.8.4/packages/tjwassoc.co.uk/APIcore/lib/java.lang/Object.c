/*
 * java.lang.Object.c
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
#include "config-mem.h"
#include "../../../../kaffe/kaffevm/gtypes.h"
#include "../../../../kaffe/kaffevm/locks.h"
#include "../../../../kaffe/kaffevm/object.h"
#include <native.h>
#include "../../../../kaffe/kaffevm/constants.h"
#include "../../../../kaffe/kaffevm/access.h"
#include "../../../../kaffe/kaffevm/classMethod.h"	/* Don't need java.lang.Object.h */

/*
 * Generate object hash code.
 */
jint
java_lang_Object_hashCode(struct Hjava_lang_Object* o)
{
	/* Hash code is object's address */
	return ((jint)(jword)o);
}

/*
 * Return class object for this object.
 */
struct Hjava_lang_Class*
java_lang_Object_getClass(struct Hjava_lang_Object* o)
{
	return (OBJECT_CLASS(o));
}

/*
 * Notify threads waiting here.
 */
void
java_lang_Object_notifyAll(struct Hjava_lang_Object* o)
{
	broadcastCond(o);
}

/*
 * Notify a thread waiting here.
 */
void
java_lang_Object_notify(struct Hjava_lang_Object* o)
{
	signalCond(o);
}

/*
 * Clone me.
 */
struct Hjava_lang_Object*
java_lang_Object_clone(struct Hjava_lang_Object* o)
{
	Hjava_lang_Object* obj;
	Class* class;
	int elsize;

	class = OBJECT_CLASS(o);

	if (!CLASS_IS_ARRAY(class)) {
		/* Clone an object */
		obj = (Hjava_lang_Object*)alloc_object(class);
		memcpy(obj+1, o+1, CLASS_FSIZE(OBJECT_CLASS(obj)));
	}
	else {
		/* Clone an array */
		elsize = TYPE_SIZE(CLASS_ELEMENT_TYPE (class));
		obj = (Hjava_lang_Object*)alloc_array_object(ARRAY_SIZE(o), class);
		memcpy(ARRAY_DATA(obj), ARRAY_DATA(o),
		       ARRAY_SIZE(o) * elsize);
	}
	return (obj);
}

/*
 * Wait for this object to be notified.
 */
void
java_lang_Object_wait(struct Hjava_lang_Object* o, jlong timeout)
{
	waitCond(o, timeout);
}
