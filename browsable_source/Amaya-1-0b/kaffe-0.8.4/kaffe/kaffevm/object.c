/*
 * object.c
 * Handle create and subsequent garbage collection of objects.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#define	DBG(s)
#define	ADBG(s)

#include "config.h"
#include "config-std.h"
#include "config-mem.h"
#include "gtypes.h"
#include "access.h"
#include "object.h"
#include "constants.h"
#include "classMethod.h"
#include "lookup.h"
#include "itypes.h"
#include "baseClasses.h"
#include "errors.h"
#include "exception.h"
#include "itypes.h"
#include "external.h"
#include "gc.h"

extern Hjava_lang_Class* ThreadClass;

static void walkRefArray(gcInfo*);
static void walkClass(gcInfo*);
static bool finalizeObject(gcInfo*);

static gcFuncs gcFinalizeObject = { walkConservative, finalizeObject };
static gcFuncs gcRefArray = { walkRefArray, 0 };
static gcFuncs gcClassObject = { walkClass, (void*)1 };

/*
 * Create a new array of data items (not objects).
 */
Hjava_lang_Object*
alloc_array(int sz, int type)
{
	assert(type < MAXTYPES);
	assert(TYPE_CLASS(type) != 0);

	return (newPrimArray(TYPE_CLASS(type), sz));
}

Hjava_lang_Object*
alloc_array_object(int sz, Class* artype)
{
	return (newArray(CLASS_ELEMENT_TYPE(artype), sz));
}

/*
 * Create a new array of objects.
 */
Hjava_lang_Object*
alloc_objectarray(int sz, char* csig)
{
	char* esig;
	
        esig = &csig[1];
	return (newRefArray(classFromSig(&esig, NULL), sz));
}

/*
 * Build a multi-dimensional array.
 */
Hjava_lang_Object*
alloc_multiarray(int* dims, char* cname)
{
	Hjava_lang_Object* obj;
	Hjava_lang_Object** array;
	int i;
	char* esig;
	
	esig = &cname[1];
	obj = newArray(classFromSig(&esig, NULL), dims[0]);

	if (dims[1] > 0) {
		array = (Hjava_lang_Object**)ARRAY_DATA(obj);
		for (i = 0; i < dims[0]; i++) {
			array[i] = alloc_multiarray(dims+1, cname+1);
		}
	}

	return (obj);
}

/*
 * Create a new Java object.
 * If the object is a Class then we make it a root (for the moment).
 * Otherwise, if the object has a finalize method we look it up and store
 * it with the object for it's later use.  Otherwise the object is normal.
 */
Hjava_lang_Object*
newObject(int sz, Class* class)
{
	Hjava_lang_Object* obj;
	gcFuncs* type;

        sz += sizeof(Hjava_lang_Object);

	if (class == ClassClass) {
		type = &gcClassObject;
	}
	else if (class->final == false) {
		type = &gcNormal;
	}
	else {
		type = &gcFinalizeObject;
	}

	obj = gc_malloc(sz, type);

        /* Fill in object information */
        obj->dtable = (class != 0 ? class->dtable : 0);

ADBG(	printf("newObject %x class %s ref %d\n", MEM2GC(obj),
		(class ? class->name->data : "<none>"),
		MEM2GC(obj)->ref);
		fflush(stdout);						)

        return (obj);
}

/* Allocate a new array whose elements are ELCLASS (a primitive type),
   and that has COUNT elements. */
Hjava_lang_Object*
newPrimArray(Class* elclass, int count)
{
	int size;
	Class* class;
	Hjava_lang_Object* obj;

	/* Calculate object size - add an extra jint of space to avoid
	 * any possible page faults when accessing the last elements
	 */
	size = count*TYPE_SIZE(elclass)+sizeof(jint)+sizeof(Array);
	class = lookupArray(elclass);

	obj = gc_malloc(size, &gcNoWalk);
	obj->dtable = class->dtable;
	ARRAY_SIZE(obj) = count;

	return (obj);
}

/* Allocate a new array whose elements are ELCLASS (an Object type),
   and that has COUNT elements. */
Hjava_lang_Object*
newRefArray(Class* elclass, int count)
{
	int size;
	Class* class;
	Hjava_lang_Object* obj;

	if (count < 0) {
		throwException(NegativeArraySizeException);
	}
	size = count * PTR_TYPE_SIZE + sizeof(Array);
	class = lookupArray(elclass);

	obj = gc_malloc(size, &gcRefArray);
	obj->dtable = class->dtable;
	ARRAY_SIZE(obj) = count;

	return (obj);
}

/*
 * Allocate a new array, of whatever types.
 */
Hjava_lang_Object*
newArray(Class* eltype, int count)
{
	if (CLASS_IS_PRIMITIVE(eltype)) {
		return (newPrimArray(eltype, count));
	}
	else {
		return (newRefArray(eltype, count));
	}
}

/*
 * Walk an array object objects.
 */
static
void
walkRefArray(gcInfo* base)
{
	Hjava_lang_Object *arr;
	int i;
	Hjava_lang_Object** ptr;
#ifdef notyet
	markObject (.. class ..);
#endif
	gcStats.markedmem += base->size;
	arr = GC2MEM(base);
	ptr = OBJARRAY_DATA(arr);
	for (i = ARRAY_SIZE(arr); --i>= 0; ) {
		Hjava_lang_Object* el = *ptr++;
		if (el != NULL) {
			markObject(MEM2GC(el));
		}
	}
}

/*
 * Object requires finalising - find the method and call it.
 */
static
bool
finalizeObject(gcInfo* ob)
{
	Method* final;

	final = findMethod(OBJECT_CLASS((Hjava_lang_Object*)GC2MEM(ob)),final_name,void_signature);
	CALL_KAFFE_FUNCTION(final, (Hjava_lang_Object*)GC2MEM(ob));
	return (false);
}

/*
 * Walk a class object.
 */
static
void
walkClass(gcInfo* base)
{
	Hjava_lang_Class* class;

	gcStats.markedmem += base->size;
	class = GC2MEM(base);

	MARK_REFERENCE(class->name);
	if (class->state == CSTATE_PREPARED) {
		MARK_REFERENCE(class->superclass);
	}
	MARK_REFERENCE(class->constants.data);
	MARK_REFERENCE(class->methods);
	MARK_REFERENCE(class->fields);
	MARK_REFERENCE(class->staticData);
	if (!CLASS_IS_PRIMITIVE(class)) {
		MARK_REFERENCE(class->dtable);
	}
	MARK_REFERENCE(class->interfaces);
	MARK_REFERENCE(class->loader);
}
