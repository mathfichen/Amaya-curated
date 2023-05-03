/*
 * object.h
 * Object representation.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#ifndef __object_h
#define __object_h

#include <stddef.h>
#include "gtypes.h"
#include "locks.h"
#include "gc.h"

struct _dispatchTable;
struct Hjava_lang_Class;

typedef struct Hjava_lang_Object {
	/* WARNING: This struct is duplicated in include/native.h  FIXME */
	struct _dispatchTable*	dtable;
	iMux			mux;
	iCv			cv;
	/* Data follows on immediately */
} Hjava_lang_Object;

struct Array {
	Hjava_lang_Object	obj;
	/* Must match ARRAY_FIELDS in native.h. FIXME */
	uint32			length;
	double			align[0];  /* for alignment (Gcc extension) */
};

/* Number of elements. */
#define	ARRAY_SIZE(ARRAY)	(((Array*)(ARRAY))->length)
#define	ARRAY_DATA(ARRAY)	((void*)((Array*)(ARRAY)+1))
#define	OBJARRAY_DATA(ARRAY)	((Hjava_lang_Object**)((Array*)(ARRAY)+1))

/*
 * These bizzare casts provide various offset into the object structure.
 */
#define	OBJECT_DTABLE_OFFSET	((int)&(*(Hjava_lang_Object*)0).dtable)
#define	OBJECT_DATA_OFFSET	((int)(((Hjava_lang_Object*)0)+1))
#define	ARRAY_SIZE_OFFSET	((int) &ARRAY_SIZE(0))
#define	ARRAY_DATA_OFFSET	((int)(((Array*)0)+1))

extern Class*	ClassClass;

#define	alloc_object(c) \
	newObject(CLASS_FSIZE(c) * sizeof(int32), (c))
#define	alloc_class() \
	(struct Hjava_lang_Class*)newObject(sizeof(struct Hjava_lang_Class)-sizeof(Hjava_lang_Object), ClassClass)

Hjava_lang_Object*	alloc_array(int, int);
Hjava_lang_Object*	alloc_array_object(int, struct Hjava_lang_Class*);
Hjava_lang_Object*	alloc_objectarray(int, char*);
Hjava_lang_Object*	alloc_multiarray(int*, char*);

Hjava_lang_Object*	newObject(int, Class*);
Hjava_lang_Object*	newArray(Class*, int);
Hjava_lang_Object*	newPrimArray(Class*, int);
Hjava_lang_Object*	newRefArray(Class*, int);
struct _ctx*		newThreadCtx(int);

extern void*		checked_malloc (size_t);
extern void*		checked_calloc (size_t, size_t);
extern void*		checked_realloc (void *, size_t);
extern void		checked_free (void *);

#endif
