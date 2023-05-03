/*
 * java.lang.Class.c
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
#include "../../../../kaffe/kaffevm/access.h"
#include "../../../../kaffe/kaffevm/constants.h"
#include "../../../../kaffe/kaffevm/object.h"
#include "../../../../kaffe/kaffevm/classMethod.h"
#include "../../../../kaffe/kaffevm/itypes.h"
#include "java.lang.stubs/System.h"
#include <native.h>
#include "defs.h"

extern void* checked_malloc(size_t);

/*
 * Convert string name to class object.
 */
struct Hjava_lang_Class*
java_lang_Class_forName(struct Hjava_lang_Class* this, struct Hjava_lang_String* str)
{
	char buf[MAXNAMELEN];

	/* Get string and convert '.' to '/' */
	javaString2CString(str, buf, sizeof(buf));
	classname2pathname(buf, buf);

	return loadClass (makeUtf8Const (buf, strlen(buf)), 0);
}

/*
 * Convert class to string name.
 */
struct Hjava_lang_String*
java_lang_Class_getName(struct Hjava_lang_Class* c)
{
	char buffer[100];
	struct Hjava_lang_String* str;
	int len;
	char* name;
	int i;
	char* ptr;
	char ch;

	len = c->name->length;
	name = len > 100 ? (char*)checked_malloc(len) : buffer;
	ptr = c->name->data;
	for (i = 0; i < len; i++) {
		ch = *ptr++;
		if (ch == '/') {
			ch = '.';
		}
		name[i] = ch;
	}
	str = makeJavaString(name, len);
	if (name != buffer) {
		free (name);
	}
	return (str);
}

/*
 * Create a new instance of the derived class.
 */
struct Hjava_lang_Object*
java_lang_Class_newInstance(struct Hjava_lang_Class* this)
{
	return (execute_java_constructor(0, 0, this, VOID_SIGNATURE));
}

/*
 * Return super class.
 */
struct Hjava_lang_Class*
java_lang_Class_getSuperclass(struct Hjava_lang_Class* this)
{
	return (this->superclass);
}

HArrayOfObject* /* [Ljava.lang.Class; */
java_lang_Class_getInterfaces(struct Hjava_lang_Class* this)
{
	HArrayOfObject* obj;
	struct Hjava_lang_Class** ifaces;
	int i;

	obj = (HArrayOfObject*)AllocObjectArray(this->interface_len, "Ljava/lang/Class");
	ifaces = (struct Hjava_lang_Class**)unhand(obj)->body;
	for (i = 0; i < this->interface_len; i++) {
		ifaces[i] = this->interfaces[i];
	}

	return (obj);
}

/*
 * Return the class loader which loaded me.
 */
struct Hjava_lang_ClassLoader*
java_lang_Class_getClassLoader(struct Hjava_lang_Class* this)
{
	return ((struct Hjava_lang_ClassLoader*)this->loader);
}

/*
 * Is the class an interface?
 */
long /* bool */
java_lang_Class_isInterface(struct Hjava_lang_Class* this)
{
	return ((this->accflags & ACC_INTERFACE) ? 1 : 0);
}

long /* bool */
java_lang_Class_isPrimitive(struct Hjava_lang_Class* this)
{
	return (CLASS_IS_PRIMITIVE(this));
}

long /* bool */
java_lang_Class_isArray(struct Hjava_lang_Class* this)
{
	return (CLASS_IS_ARRAY(this));
}

struct Hjava_lang_Class*
java_lang_Class_getComponentType(struct Hjava_lang_Class* this)
{
	return CLASS_IS_ARRAY(this) ? CLASS_ELEMENT_TYPE(this) : (Class*)0;
}

long /* bool */
java_lang_Class_isAssignableFrom(struct Hjava_lang_Class* this, struct Hjava_lang_Class* cls)
{
	/* FIXME this doesn't handle arrays. */
	return (instanceof(this, cls));
}

/*
 * Get primitive class from class name (JDK 1.1)
 */
struct Hjava_lang_Class*
java_lang_Class_getPrimitiveClass (struct Hjava_lang_Class* none, struct Hjava_lang_String* name)
{
	jchar* chrs;

	chrs = (jchar*)ARRAY_DATA(unhand(name)->value) + unhand(name)->offset;
	switch (chrs[0]) {
	case 'b':
		if (chrs[1] == 'y') {
			return byteClass;
		}
		if (chrs[1] == 'o') {
			return booleanClass;
		}
		break;
	case 'c':
		return charClass;
	case 'd':
		return doubleClass;
	case 'f':
		return floatClass;
	case 'i':
		return intClass;
	case 'l':
		return longClass;
	case 's':
		return shortClass;
	case 'v':
		return voidClass;
	default:
		abort();
	}
}
