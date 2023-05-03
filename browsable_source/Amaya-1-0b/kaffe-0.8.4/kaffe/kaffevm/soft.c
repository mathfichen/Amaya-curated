/*
 * soft.c
 * Soft instruction support.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#define	MDBG(s)
#define	ADBG(s)
#define	CDBG(s)
#define	IDBG(s)

#if MDBG(1) - 1 == 0
#undef CDBG
#define	CDBG(s) s
#endif

#include "config.h"
#include "config-std.h"
#include "config-math.h"
#include "config-mem.h"
#include <stdarg.h>
#include "jtypes.h"
#include "bytecode.h"
#include "slots.h"
#include "access.h"
#include "object.h"
#include "constants.h"
#include "classMethod.h"
#include "baseClasses.h"
#include "lookup.h"
#include "errors.h"
#include "exception.h"
#include "locks.h"
#include "soft.h"
#include "external.h"
#include "thread.h"
#include "baseClasses.h"
#include "flags.h"

/*
 * soft_new
 */
void*
soft_new(Hjava_lang_Class* c)
{
	Hjava_lang_Object* obj;

	obj = alloc_object(c);

ADBG(	printf("New object of type %s (%d,%x)\n", c->name->data, c->fsize, obj);
		fflush(stdout);						)

	return (obj);
}

/*
 * soft_newarray
 */
void*
soft_newarray(jint type, jint size)
{
	Hjava_lang_Object* obj;

	if (size < 0) {
		throwException(NegativeArraySizeException);
	}

	obj = alloc_array(size, type);

ADBG(	printf("New object of %d type (%d,%x)\n", type, size, obj);
	fflush(stdout);							)

	return (obj);
}

/*
 * soft_multianewarray.
 */
#define	MAXDIMS	16

#if defined(INTERPRETER)
void*
soft_multianewarray(Hjava_lang_Class* class, jint dims, slots* args)
{
        int array[MAXDIMS];
        Hjava_lang_Object* obj;
        jint arg;
	int i;
	int* arraydims;

        if (dims < MAXDIMS) {
		arraydims = array;
	}
	else {
		arraydims = checked_calloc(dims+1, sizeof(int));
	}

        /* Extract the dimensions into an array */
        for (i = 0; i < dims; i++) {
		arg = args[i].v.tint;
                if (arg < 0) {
                        throwException(NegativeArraySizeException);
		}
                arraydims[dims-i-1] = arg;
        }
        arraydims[i] = 0;

        /* Mmm, okay now build the array using the wonders of recursion */
        obj = alloc_multiarray(arraydims, CLASS_CNAME (class));

	if (arraydims != array) {
		checked_free(arraydims);
	}

        /* Return the base object */
	return (obj);
}
#endif

#if defined(TRANSLATOR)
void*
soft_multianewarray(Hjava_lang_Class* class, jint dims, ...)
{
	va_list ap;
	int array[MAXDIMS];
	int i;
	jint arg;
	Hjava_lang_Object* obj;
	int* arraydims;

        if (dims < MAXDIMS) {
		arraydims = array;
	}
	else {
		arraydims = checked_calloc(dims+1, sizeof(int));
	}

	/* Extract the dimensions into an array */
	va_start(ap, dims);
	for (i = 0; i < dims; i++) {
		arg = va_arg(ap, jint);
		if (arg < 0) {
                        throwException(NegativeArraySizeException);
		}
		arraydims[i] = arg;
	}
	arraydims[i] = 0;
	va_end(ap);

	/* Mmm, okay now build the array using the wonders of recursion */
	obj = alloc_multiarray(arraydims, CLASS_CNAME(class));

	if (arraydims != array) {
		checked_free(arraydims);
	}

	/* Return the base object */
	return (obj);
}
#endif

/*
 * soft_monitorenter.
 */
void
soft_monitorenter(Hjava_lang_Object* o)
{
	lockMutex(o);
}

/*
 * soft_monitorexit.
 */
void
soft_monitorexit(Hjava_lang_Object* o)
{
	unlockMutex(o);
}

/*
 * soft_lookupmethod.
 */
void*
soft_lookupmethod(Hjava_lang_Object* obj, methods* meth)
{
	Hjava_lang_Class* cls = OBJECT_CLASS (obj);

	meth = findMethod(cls, meth->name, meth->signature);
	if (meth == 0) {
		throwException(NoSuchMethodError);
	}
	return ((void*)meth);
}

#if defined(TRANSLATOR)
nativecode*
soft_get_method_code (Method* meth)
{
	/* If this class needs initialising then do it now */
	if (meth->class->state != CSTATE_OK) {
		initializeClass (meth->class);
	}

	/*
	 * Generate code on demand.
	 */
	if (meth->ncode == 0) {
		translate(meth);
	}

	if (flag_trace != 0 CDBG( || 1) ) {
		printf("Calling %s:%s%s @ 0x%x\n",
			meth->class->name->data, meth->name->data,
			meth->signature->data, meth->ncode);
			fflush(stdout);
	}

	return (meth->ncode);
}
#endif /* TRANSLATOR */

/*
 * soft_checkcast.
 */
void
soft_checkcast(Hjava_lang_Class* c, Hjava_lang_Object* o)
{
        /* Null can be cast to anything */
        if (o == 0) {
                return;
        }

	/* If object is instance of class, return */
	if (soft_instanceof(c, o)) {
		return;
	}

	/* Otherwise throw exception */
        throwException(ClassCastException);
}

/*
 * soft_instanceof.
 */
jint
soft_instanceof(Hjava_lang_Class* c, Hjava_lang_Object* o)
{
	/* Null object are never instances of anything */
	if (o == 0) {
		return (0);
	}

	/* We seperate the casting to objects and the casting to arrays. */
	if (CLASS_IS_ARRAY(c)) {
		return (instanceof_array(c, OBJECT_CLASS(o)));
	}
	else {
		return (instanceof(c, OBJECT_CLASS(o)));
	}
}

jint
instanceof(Hjava_lang_Class* c, Hjava_lang_Class* oc)
{
	int i;

	if (oc == c) {
		return (1);
	}

	if (oc == 0) {
		return (0);
	}

	if (instanceof(c, oc->superclass)) {
		return (1);
	}

        for (i = 0; i < oc->interface_len; i++) {
                if (instanceof(c, oc->interfaces[i])) {
                        return (1);
                }
        }

        return (0);
}

jint
instanceof_array(Hjava_lang_Class* c, Hjava_lang_Class* oc)
{
	/* Skip as many arrays of arrays as we can.  We stop when we find
	 * a base class in either. */
	while (CLASS_IS_ARRAY(c) && CLASS_IS_ARRAY(oc)) {
		c = CLASS_ELEMENT_TYPE(c);
		oc = CLASS_ELEMENT_TYPE(oc);
	}

	/* If we are still casting to an array then we have failed already */
	if (CLASS_IS_ARRAY(c))
		return (0);

	/* If a base type, they must match exact. */
	if (CLASS_IS_PRIMITIVE(c)) {
		return (c == oc);
	}

	/* Casting to an object of some description. */
	if (CLASS_IS_ARRAY(oc)) {
		/* The only thing we can cast an array to is java/lang/Object.
		 * Checking this here willl save time.
		 */
		return (c == ObjectClass);
	}

	/* Cannot cast to a primitive class. */
	if (CLASS_IS_PRIMITIVE(oc))
		return (0);

	/* Casting one object to another.  */
	return (instanceof(c, oc));
}

/*
 * soft_athrow.
 */
void
soft_athrow(Hjava_lang_Object* o)
{
	throwExternalException(o);
}

/*
 * soft_badarrayindex.
 */
void
soft_badarrayindex(void)
{
	throwException(ArrayIndexOutOfBoundsException);
}

/*
 * soft_nullpointer.
 */
void
soft_nullpointer(void)
{
	throwException(NullPointerException);
}

/*
 * soft_initialise_class.
 */
void
soft_initialise_class (Class* c)
{
	if (c->state != CSTATE_OK) {
		initializeClass (c);
	}
}

/*
 * Check we can store 'obj' into the 'array'.
 */
void
soft_checkarraystore(Hjava_lang_Object* array, Hjava_lang_Object* obj)
{
	if (obj != 0 && soft_instanceof(CLASS_ELEMENT_TYPE(OBJECT_CLASS(array)), obj) == 0) {
		throwException(ArrayStoreException);
	}
}

/*
 * soft_dcmpg
 */
jint
soft_dcmpg(jdouble v1, jdouble v2)
{
	jint ret;
	if ((!isinf(v1) && isnan(v1)) || (!isinf(v2) && isnan(v2))) {
		ret = 1;
	}
	else if (v1 > v2) {
		ret = 1;
	}
	else if (v1 == v2) {
		ret = 0;
	}
	else {
		ret = -1;
	}

	return (ret);
}

/*
 * soft_dcmpl
 */
jint
soft_dcmpl(jdouble v1, jdouble v2)
{
        jint ret;
	if ((!isinf(v1) && isnan(v1)) || (!isinf(v2) && isnan(v2))) {
		ret = -1;
	}
        else if (v1 > v2) {
                ret = 1;
        }
        else if (v1 == v2) {
                ret = 0;
        }
        else {
                ret = -1;
        }
	return (ret);
}

/*
 * soft_fcmpg
 */
jint
soft_fcmpg(jfloat v1, jfloat v2)
{
        jint ret;
	if ((!isinf(v1) && isnan(v1)) || (!isinf(v2) && isnan(v2))) {
		ret = 1;
	}
        else if (v1 > v2) {
                ret = 1;
        }
        else if (v1 == v2) {
                ret = 0;
        }
        else {
                ret = -1;
        }
	return (ret);
}

/*
 * soft_fcmpg
 */
jint
soft_fcmpl(jfloat v1, jfloat v2)
{
        jint ret;
	if ((!isinf(v1) && isnan(v1)) || (!isinf(v2) && isnan(v2))) {
		ret = -1;
	}
        else if (v1 > v2) {
                ret = 1;
        }
        else if (v1 == v2) {
                ret = 0;
        }
        else {
                ret = -1;
        }
	return (ret);
}

jlong
soft_lmul(jlong v1, jlong v2)
{
	return (v1 * v2);
}

jlong
soft_ldiv(jlong v1, jlong v2)
{
	return (v1 / v2);
}

jlong
soft_lrem(jlong v1, jlong v2)
{
	return (v1 % v2);
}

jfloat
soft_fdiv(jfloat v1, jfloat v2)
{
	if (v2 == 0.0) {
		if (v1 > 0) {
			return (1e300*1e300);
		}
		else {
			return (-1e300*1e300);
		}
	}
	return (v1 / v2);
}

jdouble
soft_fdivl(jdouble v1, jdouble v2)
{
	if (v2 == 0.0) {
		if (v1 > 0) {
			return (1e300*1e300);
		}
		else {
			return (-1e300*1e300);
		}
	}
	return (v1 / v2);
}

jfloat
soft_frem(jfloat v1, jfloat v2)
{
	return (remainderf(v1, v2));
}

jdouble
soft_freml(jdouble v1, jdouble v2)
{
	return (remainder(v1, v2));
}

jlong
soft_lshll(jlong v1, jint v2)
{
	return (v1 << (v2 & 63));
}

jlong
soft_ashrl(jlong v1, jint v2)
{
	return (v1 >> (v2 & 63));
}

jlong
soft_lshrl(jlong v1, jint v2)
{
	return (((uint64)v1) >> (v2 & 63));
}

jint
soft_lcmp(jlong v1, jlong v2)
{
	jlong lcc = v2 - v1;
	if (lcc < 0) {
		return (-1);
	}
	else if (lcc > 0) {
		return (1);
	}
	else {
		return (0);
	}
}

jint
soft_mul(jint v1, jint v2)
{
	return (v1*v2);
}

jint
soft_div(jint v1, jint v2)
{
	return (v1/v2);
}

jint
soft_rem(jint v1, jint v2)
{
	return (v1%v2);
}

jfloat
soft_cvtlf(jlong v)
{
	return ((jfloat)v);
}

jdouble
soft_cvtld(jlong v)
{
	return ((jdouble)v);
}

jlong
soft_cvtfl(jfloat v)
{
	return ((jlong)floor(v));
}

jlong
soft_cvtdl(jdouble v)
{
	return ((jlong)floor(v));
}

jint
soft_cvtfi(jfloat v)
{
	return ((jint)v);
}

jint
soft_cvtdi(jdouble v)
{
	return ((jint)v);
}
