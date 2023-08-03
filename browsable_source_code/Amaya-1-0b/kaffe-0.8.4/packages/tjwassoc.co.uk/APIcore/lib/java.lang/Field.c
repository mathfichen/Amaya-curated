/*     
 * java.lang.Field.c
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
#include "../../../../kaffe/kaffevm/gtypes.h"
#include "../../../../kaffe/kaffevm/access.h"
#include "../../../../kaffe/kaffevm/constants.h"
#include "../../../../kaffe/kaffevm/object.h"
#include "../../../../kaffe/kaffevm/classMethod.h"
#include "../../../../kaffe/kaffevm/itypes.h"
#include "java.lang.stubs/System.h"
#include <native.h>
#include "defs.h"
  
typedef struct Classjava_lang_reflect_Field {
	struct Hjava_lang_Class* clazz;
	int slot;
	struct Hjava_lang_String* name;
	struct Hjava_lang_Class* type;
} Classjava_lang_reflect_Field;
HandleTo(java_lang_reflect_Field);

Hjava_lang_reflect_Field*
makeField(struct Hjava_lang_Class* clazz, int slot)
{
	Hjava_lang_reflect_Field* field;
	Field* fld;

	fld = CLASS_FIELDS((Class*)clazz) + slot;
	field = (Hjava_lang_reflect_Field*)AllocObject("java/lang/reflect/Field");
	unhand(field)->clazz = (struct Hjava_lang_Class*) clazz;
	unhand(field)->slot = slot;
	unhand(field)->type = (struct Hjava_lang_Class*) fld->type;
	unhand(field)->name = Utf8Const2JavaString(fld->name);
	return (field);
}

HArrayOfObject*
java_lang_Class_getFields0(struct Hjava_lang_Class* clazz, int declared)
{ 
	int count;
	Class* clas;
	Field* fld;
	Hjava_lang_reflect_Field** ptr;
	HArrayOfObject* array;
	int i;

	if (declared) {
		count = CLASS_NFIELDS((Class*)clazz);
	}
	else {
		count = 0;
		clas = (Class*) clazz; 
		for (; clas != NULL; clas = clas->superclass) {
			fld = CLASS_FIELDS(clas);
			i = CLASS_NFIELDS(clas);
			for ( ; --i >= 0;  ++fld) {
				if (fld->accflags & ACC_PUBLIC) {
					count++;
				}
			}
		}
	}
	array = (HArrayOfObject*)AllocObjectArray(count, "Ljava/lang/reflect/Field;");
	ptr = (Hjava_lang_reflect_Field**) ARRAY_DATA(array) + count;
	clas = (Class*) clazz;
	do {
		fld = CLASS_FIELDS(clas);
		i = CLASS_NFIELDS(clas);
		for ( ; --i >= 0;  ++fld) {
			if (! (fld->accflags & ACC_PUBLIC) && ! declared) {
				continue;
			}
			*--ptr = makeField(clas, i);
		}
		clas = clas->superclass;
	} while (!declared && clas != NULL);

	return (array);
}                      

Hjava_lang_reflect_Field*
java_lang_Class_getField0(struct Hjava_lang_Class* clazz, struct Hjava_lang_String* name, int declared)
{ 
	Class* clas;

	clas = (Class*) clazz;
	do {
		Field* fld = CLASS_FIELDS(clas);
		int n = CLASS_NFIELDS(clas);
		int i;
		for (i = 0;  i < n;  ++fld, ++i) {
			if (((fld->accflags & ACC_PUBLIC) || declared) && equalUtf8JavaStrings (fld->name, name)) {
				return makeField(clas, i); 
			}
		}
		clas = clas->superclass;
	} while (!declared && clas != NULL);
	SignalError(0, "java.lang.NoSuchFieldException", ""); /* FIXME */
}
       
static
char*           
getFieldAddress(Hjava_lang_reflect_Field* this, struct Hjava_lang_Object* obj)
{
	Class* clas;
	Field* fld;
	char* base;

	clas = (Class*) unhand(this)->clazz; 
	fld = CLASS_FIELDS(clas) + unhand(this)->slot;
	if (unhand(this)->slot < CLASS_NSFIELDS(clas)) {
		base = (char*) clas->staticData;
	}
	else {
		if (obj == NULL) {
			SignalError(0, "java.lang.NullPointerException", "");
		}
		if  (!soft_instanceof(fld->type, obj)) {
			SignalError(0,"java.lang.IllegalArgumentException","");
		}
		base = (char*) (obj+1);
	}
	return base + FIELD_OFFSET(fld);
}
       
struct Hjava_lang_Object*
java_lang_reflect_Field_get(Hjava_lang_reflect_Field* this, struct Hjava_lang_Object* obj)
{
	Class* clas;
	Field* fld;
	char* base;

	clas = (Class*) unhand(this)->clazz;
	fld = CLASS_FIELDS(clas) + unhand(this)->slot;
	base = getFieldAddress(this, obj);
	if (CLASS_IS_PRIMITIVE(fld->type)) {  /* FIXME */
		SignalError(0,"java.lang.InternalError", "Field.get not implemented for primitive fields");
	}
	return (*(struct Hjava_lang_Object**)base);
}
               
void                   
java_lang_reflect_Field_set(Hjava_lang_reflect_Field* this, struct Hjava_lang_Object* obj, struct Hjava_lang_Object* value)
{      
	Class* clas;
	Field* fld;
	char* base;

	clas = (Class*) unhand(this)->clazz;
	fld = CLASS_FIELDS(clas) + unhand(this)->slot;
	base = getFieldAddress(this, obj);
	if (CLASS_IS_PRIMITIVE(fld->type)) {  /* FIXME */
		SignalError(0,"java.lang.InternalError", "Field.set not implemented for primitive fields");
	}
	if (fld->accflags & ACC_FINAL) {
		SignalError(0,"java.lang.IllegalAccessException", "");
	}
	if (value != NULL && ! soft_instanceof(fld->type, value)) {
		SignalError(0,"java.lang.IllegalArgumentException", "");
	}
	*(struct Hjava_lang_Object**)base = value;
}
