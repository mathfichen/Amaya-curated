/*
 * itypes.c
 * Internal types.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#include "config.h"
#include "config-std.h"
#include "config-mem.h"
#include "jtypes.h"
#include "itypes.h"
#include "baseClasses.h"
#include "classMethod.h"

Class* intClass;
Class* longClass;
Class* booleanClass;
Class* charClass;
Class* floatClass; 
Class* doubleClass;
Class* byteClass; 
Class* shortClass;     
Class* voidClass;

extern Utf8Const* makeUtf8Const(char*, int);

Class* types[MAXTYPES];

Class*
initPrimClass(char* name, char sig, int len)
{
	Class* class;

        class = alloc_class();
	class->dtable = _PRIMITIVE_DTABLE;

	class->name = makeUtf8Const (name, -1);
	CLASS_PRIM_SIG(class) = sig;
	TYPE_PRIM_SIZE(class) = len;

	return (class);
}

/*
 * Intialise the internal types.
 */
void
initTypes(void)
{
	byteClass = initPrimClass("byte", 'B', 1);
	shortClass = initPrimClass("short", 'S', 2);
	intClass = initPrimClass("int", 'I', 4);
	longClass = initPrimClass("long", 'J', 8);
	booleanClass = initPrimClass("boolean", 'Z', 1);
	charClass = initPrimClass("char", 'C', 2);
	floatClass = initPrimClass("float", 'F', 4);
	doubleClass = initPrimClass("double", 'D', 8);
	voidClass = initPrimClass("void", 'V', 0);

	TYPE_CLASS(TYPE_Boolean) = booleanClass;
	TYPE_CLASS(TYPE_Char) = charClass;
	TYPE_CLASS(TYPE_Float) = floatClass;
	TYPE_CLASS(TYPE_Double) = doubleClass;
	TYPE_CLASS(TYPE_Byte) = byteClass;
	TYPE_CLASS(TYPE_Short) = shortClass;
	TYPE_CLASS(TYPE_Int) = intClass;
	TYPE_CLASS(TYPE_Long) = longClass;
}

Class*
classFromSig(char** strp, struct _classLoader* loader)
{
	char* start;
	char* end;

	switch (*(*strp)++) {
	case 'V': return (voidClass);
	case 'I': return (intClass);
	case 'Z': return (booleanClass);
	case 'S': return (shortClass);
	case 'B': return (byteClass);
	case 'C': return (charClass);
	case 'F': return (floatClass);
	case 'D': return (doubleClass);
	case 'J': return (longClass);
	case '[': return (lookupArray(classFromSig (strp, loader)));
	case 'L':
		start = *strp;
		for (end = start; *end != 0 && *end != ';'; end++)
			;
		*strp = end;
		if (*end != 0) {
			(*strp)++;
		}
		return (loadClass(makeUtf8Const(start, end - start), loader));
	default:
		return (NULL);
	}
}
