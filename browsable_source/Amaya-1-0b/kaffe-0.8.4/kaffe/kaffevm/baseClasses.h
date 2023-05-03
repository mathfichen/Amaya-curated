/*
 * baseClasses.h
 * Handle base classes.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#ifndef __baseclasses_h
#define __baseclasses_h

#include "object.h"

typedef struct Hjava_lang_String {
	Hjava_lang_Object	head;
	Hjava_lang_Object*	value;
	int			offset;
	int			count;
} Hjava_lang_String;

#define STRING_SIZE(STR)  (((Hjava_lang_String*)(STR))->count)
#define STRING_DATA(STR)  ((jchar*)ARRAY_DATA(((Hjava_lang_String*)(STR))->value) + ((Hjava_lang_String*)(STR))->offset)

#define	STRINGCLASS	"java/lang/String"
#define	STRINGINIT	"<init>"
#define	STRINGINITSIG	"([C)V"

#define	OBJECTCLASS	"java/lang/Object"
#define	CLASSCLASS	"java/lang/Class"

#define	OBJECTCLASSSIG	"Ljava/lang/Object;"

/*
 * Exception object.
 */
typedef struct _throwable {
	Hjava_lang_Object	head;
	Hjava_lang_Object*	backtrace;
	Hjava_lang_String*	message;
} throwable;

void		initBaseClasses(void);

extern Class*	ObjectClass;
extern Class*	ClassClass;
extern Class*	StringClass;
extern Class*	SystemClass;

#endif
