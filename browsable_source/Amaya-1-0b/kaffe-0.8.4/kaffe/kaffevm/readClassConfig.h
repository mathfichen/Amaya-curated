/*
 * readClassConfig.h
 * Configure the class reader.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#ifndef __readclassconfig_h
#define __readclassconfig_h

#include "classMethod.h"
#include "errors.h"
#include "lookup.h"
#include "exception.h"
#include "code.h"
#include "slots.h"

/*
 * Add a class to the system.
 */
#define	ADDCLASS(this, super, access, constants)			\
	classThis = addClass(classThis, this, super, access, loader);	\
	if (classThis == 0) {						\
                throwException(ClassFormatError);			\
	}

/*
 * Add the interfaces.
 */
#define	READINTERFACES(fp, this, count)					\
	do {								\
		Hjava_lang_Class** interfaces;				\
		u2 iface;						\
		u2 i;							\
		if (count == 0) {					\
			return;						\
		}							\
		interfaces = (Hjava_lang_Class**)			\
			gc_malloc(sizeof(Hjava_lang_Class**) * count, &gcNormal);\
		for (i = 0; i < count; i++) {				\
			readu2(&iface, fp);				\
			interfaces[i] = (Hjava_lang_Class*) (size_t) iface; \
		}							\
		GC_WRITE(this, interfaces);				\
		addInterfaces(this, count, interfaces);			\
	} while(0)

#define	READFIELD_START(count, this) \
	do {								\
		CLASS_NFIELDS(this) = count;				\
		CLASS_FSIZE(this) = count;				\
		CLASS_FIELDS(this) = count == 0 ? (Field*)0		\
			: (Field*) gc_malloc(sizeof(Field) * count, &gcNormal);\
 	} while (0)

/*
 * Read in a field.
 */
#define	READFIELD(fp, this)						\
	do {								\
		field_info f;						\
		readu2(&f.access_flags, fp);				\
		readu2(&f.name_index, fp);				\
		readu2(&f.signature_index, fp);				\
		addField(this, &f);					\
	} while (0)

#define	READFIELD_END(this) finishFields(this)

#define READMETHOD_START(METHODS_COUNT, THIS_CLASS)			\
	do {								\
		THIS_CLASS->methods =					\
			gc_malloc(sizeof(Method)*(METHODS_COUNT), &gcNormal);\
		GC_WRITE(THIS_CLASS, THIS_CLASS->methods);		\
		THIS_CLASS->nmethods = 0;				\
	} while (0)

/*
 * Read in a method.
 */
#define	READMETHOD(fp, this)						\
	do {								\
		method_info m;						\
		readu2(&m.access_flags, fp);				\
		readu2(&m.name_index, fp);				\
		readu2(&m.signature_index, fp);				\
		methodThis = addMethod(this, &m);			\
	} while(0)

/*
 * Finished reading in methods.
 */
#define	READMETHOD_END() /* nothing */

/*
 * Process the attributes.
 */
#define	READATTRIBUTE(fp, this, method)					\
	do {								\
		u2 idx;							\
		u4 len;							\
		readu2(&idx, fp);					\
		readu4(&len, fp);					\
		if (CLASS_CONST_TAG (this, idx) == CONSTANT_Utf8 &&	\
		    equalUtf8Consts (WORD2UTF (CLASS_CONST_DATA (this, idx)), \
				     Code_name)) {			\
			addCode(method, len, fp);			\
		}							\
		else if (CLASS_CONST_TAG (this, idx) == CONSTANT_Utf8 && \
		    equalUtf8Consts (WORD2UTF (CLASS_CONST_DATA (this, idx)), \
				     LineNumberTable_name)) {		\
			addLineNumbers(method, len, fp);		\
		}							\
		else {							\
			seekm(fp, len);					\
		}							\
	} while(0)

#endif
