/*
 * support.c
 * Native language support.
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
#include <stdarg.h>
#include "jtypes.h"
#include "access.h"
#include "object.h"
#include "constants.h"
#include "baseClasses.h"
#include "classMethod.h"
#include "lookup.h"
#include "errors.h"
#include "exception.h"
#include "slots.h"
#include "external.h"
#include "machine.h"
#include "support.h"
#include "md.h"
#include "itypes.h"

#define	MAXEXCEPTIONLEN		200
#define	ERROR_SIGNATURE		"(Ljava/lang/String;)V"

/* Anchor point for user defined properties */
userProperty* userProperties;

#if defined(NO_SHARED_LIBRARIES)
/* Internal native functions */
static nativeFunction null_funcs[1];
nativeFunction* native_funcs = null_funcs;
#endif

static bool finalizeString(gcInfo*);

extern int strLengthUtf8 (char* str, int len);

static Hjava_lang_String** strhash = NULL;
static int strhash_count = 0;  /* Number of slots used in strhash. */
static int strhash_size = 0;  /* Number of slots available in strhash.
			       * Assumed be power of 2! */

static gcFuncs gcFinalizeString = { walkConservative, finalizeString };

#if INTERN_UTF8CONSTS
#define HASH_CHARS(STR, LEN) hashChars(STR, LEN)
#else
/* To be compatible with Utf8Const 16-bit hash values. */
#define HASH_CHARS(STR, LEN) (uint16) hashChars(STR, LEN)
#endif
#define DELETED_STRING ((Hjava_lang_String*)(~0))
#define STRING_IS_INTERNED(STR) (MEM2GC(STR)->funcs == &gcFinalizeString)  
#define SET_STRING_IS_INTERNED(STR)  (MEM2GC(STR)->funcs = &gcFinalizeString)  

/* Find a slot where the string with elements DATA, length LEN,
   and hash HASH should go in the strhash table of interned strings. */

Hjava_lang_String**
findInternSlot (jchar* data, int len, int hash)
{
	int start_index = hash & (strhash_size - 1);
	int deleted_index = -1;
	
	register int index = start_index;
	/* step must be non-zero, and relatively prime with strhash_size. */
	int step = 8 * hash + 7;
	for (;;) {
		register Hjava_lang_String** ptr = &strhash[index];
		if (*ptr == NULL) {
			if (deleted_index >= 0) {
				return (&strhash[deleted_index]);
			}
			else {
				return (ptr);
			}
		}
		else if (*ptr == DELETED_STRING) {
			deleted_index = index;
		}
		else if (STRING_SIZE(*ptr) == len
			 && memcmp(STRING_DATA(*ptr), data, 2*len) == 0) {
			return (ptr);
		}
		index = (index + step) & (strhash_size - 1);
		if (index == start_index) {
			abort ();
		}
	}
}

/* Calculate a hash code for the string starting at PTR at given LENGTH.
   This uses the same formula as specified for java.lang.String.hash. */

int32
hashChars (jchar* ptr, int length)
{
	register jchar* limit = ptr + length;
	int32 hash;
	if (length <= 15) {
		hash = 0;
		while (ptr < limit) {
			hash = (37 * hash) + *ptr++;
		}
	}
	else {
		int i = 7;
		hash = *ptr;
		for (; i < length;  i+=7) {
			int ch = *(ptr += 7);
			hash = (39 * hash) + ch;
		}
	}
	return (hash);
}

Hjava_lang_String**
findInternSlotFromString (Hjava_lang_String* str)
{
	jchar* data = STRING_DATA(str);
	int length = STRING_SIZE(str);
	return (findInternSlot(data, length, HASH_CHARS (data, length)));
}

void
rehashStrings ()
{
	if (strhash == NULL) {
		strhash_size = 1024;
		/* Note we do *not* want the GC scanning strhash,
		   so we use checked_calloc instead of gc_malloc. */
		strhash = checked_calloc (strhash_size, sizeof(Hjava_lang_String*));
	}
	else {
		register int i;
		register Hjava_lang_String** ptr;

		i = strhash_size;
		ptr = strhash + i;
		strhash_size *= 2;
		strhash = checked_calloc (strhash_size, sizeof (Hjava_lang_String*));

		while (--i >= 0) {
			int hash;
			int index;
			int step;

			--ptr;
			if (*ptr == NULL || *ptr == DELETED_STRING) {
				continue;
			}
			/* This is faster equivalent of
			 * *findInternSlotFromString (*ptr) = *ptr; */
			hash = HASH_CHARS(STRING_DATA(*ptr),STRING_SIZE(*ptr));
			index = hash & (strhash_size - 1);
			step = 8 * hash + 7;
			for (;;) {
				if (strhash[index] == NULL) {
					strhash[index] = *ptr;
					break;
				}
				index = (index + step) & (strhash_size - 1);
			}
		}
		checked_free (ptr); /* Old value of strhash. */
	}
}

Hjava_lang_String*
java_lang_String_intern(Hjava_lang_String* str)
{
	Hjava_lang_String** ptr;

	if (4 * strhash_count >= 3 * strhash_size) {
		rehashStrings();
	}
	ptr = findInternSlotFromString (str);
	if (*ptr != NULL && *ptr != DELETED_STRING) {
		return *ptr;
	}
	SET_STRING_IS_INTERNED(str);
	strhash_count++;
	*ptr = str;
	return (str);
}

/* Called by String fake finalizer. */
void
uninternJavaString(Hjava_lang_String* str)
{
	Hjava_lang_String** ptr = findInternSlotFromString(str);
	if (*ptr == NULL || *ptr == DELETED_STRING) {
		return;
	}
	*ptr = DELETED_STRING;
	strhash_count--;
}

/*
 * Convert an Java string to a C string.
 */
char*
javaString2CString(struct Hjava_lang_String* js, char* cs, int len)
{
	jchar* chrs;

	chrs = (jchar*) ARRAY_DATA(js->value) + js->offset;
	if (len <= 0) {
		return (0);
	}
	len--;
	if (len > js->count) {
		len = js->count;
	}
	cs[len] = 0;
	while (--len >= 0) {
		*cs++ = (char)*chrs++;
	}
	return (cs);
}

/*
 * Convert a Java string into a malloced C string buffer.
 */
char*
makeCString(Hjava_lang_String* js)
{
	char* str;

	str = checked_malloc(js->count + 1);
	if (str != 0) {
		javaString2CString(js, str, js->count + 1);
	}
	return (str);
}

/*
 * Convert a C string into a Java String.
 */
Hjava_lang_String*
makeJavaString(char* cs, int len)
{
	Hjava_lang_String* obj;
	jchar* chrs;

	obj = (Hjava_lang_String*)alloc_object(StringClass);
	/* FIXME - should intern string literals */
	obj->count = len;
	obj->value = alloc_array (len, TYPE_Char);
	obj->offset = 0;
	chrs = (jchar*) ARRAY_DATA(obj->value);

	while (--len >= 0) {
		*chrs++ = *(unsigned char*)cs++;
	}
	return (obj);
}

Hjava_lang_String*
makeReplaceJavaStringFromUtf8 (unsigned char* ptr, int len,
			       int from_ch, int to_ch)
{
	Hjava_lang_String* obj;
	register unsigned char* limit;
	jchar* chrs;
	int ch;

	limit = ptr + len;
	obj = (Hjava_lang_String*)alloc_object(StringClass);
	obj->count = strLengthUtf8 (ptr, len);
	obj->value = alloc_array (len, TYPE_Char);
	obj->offset = 0;
	chrs = (jchar*) ARRAY_DATA(obj->value);

	for (; ptr < limit;) {
		ch = UTF8_GET (ptr, limit);
		if (ch == from_ch) {
			ch = to_ch;
		}
		*chrs++ = ch;
	}

	return (obj);
}

Hjava_lang_String*
Utf8Const2JavaString(Utf8Const* str)
{
	Hjava_lang_String* obj;
	jchar *chrs;
	jchar buffer[100];
	Hjava_lang_Object* array;
	int hash;
	register unsigned char* data;
	register unsigned char* limit;
	int length;
	Hjava_lang_String** ptr;

	data = str->data;
	limit = data + str->length;
	length = strLengthUtf8(data, str->length);

	if (length <= (sizeof(buffer) / sizeof(jchar))) {
		chrs = buffer;
		array = NULL;
	}
	else {
		array = newPrimArray(charClass, length);
		chrs = (jchar*)ARRAY_DATA(array);
	}

	while (data < limit) {
		*chrs++ = UTF8_GET(data, limit);
        }
	chrs -= length;

	if (4 * strhash_count >= 3 * strhash_size) {
		rehashStrings();
	}
#if INTERN_UTF8CONSTS
	hash = HASH_CHARS(chrs, length);
#else
	hash = str->hash;
#endif
	ptr = findInternSlot (chrs, length, hash);
	if (*ptr != NULL && *ptr != DELETED_STRING) {
		return *ptr;
	}
	strhash_count++;
	if (array == NULL) {
		array = newPrimArray(charClass, length);
		chrs = (jchar*) ARRAY_DATA(array);
		memcpy (chrs, buffer, sizeof(jchar)*length);
	}
	obj = (Hjava_lang_String*)alloc_object(StringClass);
	obj->count = length;
	obj->value = array;
	obj->offset = 0;
	*ptr = obj;
	SET_STRING_IS_INTERNED(obj);
	return (obj);
}

/* Return true iff a Utf8Const string is equal to a Java String. */

int
equalUtf8JavaStrings(Utf8Const* a, Hjava_lang_String* b)
{
	jchar* data = STRING_DATA(b);
	register unsigned char* ptr = a->data;
        register unsigned char* limit = ptr + a->length;
	int len = STRING_SIZE(b);
	if (len != a->length)
		return 0;
	while (--len >= 0) {
		if (*data++ != UTF8_GET(ptr, limit))
			return 0;
	}
	return 1;
}

/*
 * Convert a C string into a Java char array.
 */
Hjava_lang_Object*
makeJavaCharArray(char* cs, int len)
{
	Hjava_lang_Object* obj;
	int i;

	obj = alloc_array (len, TYPE_Char);
	if (cs != NULL) {
		jchar *ptr = (jchar*) ARRAY_DATA(obj);
		for (i = 0;  i < len;  i++) {
			*ptr++ = *(unsigned char*)cs++;
		}
	}
	return (obj);
}

/*
 * Finalize an interned string.
 */
static
bool
finalizeString(gcInfo* mem)
{
	Hjava_lang_String* str;

	str = (Hjava_lang_String*)GC2MEM(mem);

        assert(OBJECT_CLASS(&str->head) == StringClass);
	uninternJavaString(str);
	return (true);
}

/*
 * Call a Java method from native code.
 */
jword
do_execute_java_method(void* ee, Hjava_lang_Object* obj, char* method_name, char* signature, methods* mb, int isStaticCall, ...)
{
	char* sig;
	int args;
	va_list argptr;
	jword retval;

	if (mb == 0 || mb->ncode == 0) {
		mb = findMethod(OBJECT_CLASS(obj),
				makeUtf8Const (method_name, -1),
				makeUtf8Const (signature, -1));
		if (mb == 0) {
			throwException(NoSuchMethodError);
		}
		/* Method must be non-static to invoke it here */
		if ((mb->accflags & ACC_STATIC) != 0) {
			throwException(NoSuchMethodError);
		}
	}

	/* Calculate number of arguments */
	sig = signature;
	args = sizeofSig(&sig, false);

	/* Make the call */
	va_start(argptr, isStaticCall);
 	CALL_KAFFE_FUNCTION_VARARGS(mb, obj, args, argptr, retval);
	va_end(argptr);

	return (retval);
}

/*
 * Call a Java static method on a class from native code.
 */
jword
do_execute_java_class_method(char* cname, char* method_name, char* signature, ...)
{
	char* sig;
	int args;
	va_list argptr;
	Hjava_lang_Class* class;
	methods* mb;
	jword retval;
	char cnname[CLASSMAXSIG];	/* Unchecked buffer - FIXME! */

	/* Convert "." to "/" */
	classname2pathname(cname, cnname);

	class = lookupClass(cnname);
	assert(class != 0);
	mb = findMethod(class,
			makeUtf8Const (method_name, -1),
			makeUtf8Const (signature, -1));
	if (mb == 0) {
		throwException(NoSuchMethodError);
	}
	/* Method must be static to invoke it here */
	if ((mb->accflags & ACC_STATIC) == 0) {
		throwException(NoSuchMethodError);
	}

	/* Calculate number of arguments */
	sig = signature;
	args = sizeofSig(&sig, false);

	/* Make the call */
	va_start(argptr, signature);
 	CALL_KAFFE_FUNCTION_VARARGS(mb, 0, args, argptr, retval);
	va_end(argptr);

	return (retval);
}

/*
 * Allocate an object and execute the constructor.
 */
Hjava_lang_Object*
execute_java_constructor(void* ee, char* cname, Hjava_lang_Class* cc, char* signature, ...)
{
	int args;
	Hjava_lang_Object* obj;
	char* sig;
	va_list argptr;
	methods* mb;
	char buf[MAXEXCEPTIONLEN];
	jword retval;

	if (cc == 0) {
		/* Convert "." to "/" */
		classname2pathname(cname, buf);

		cc = lookupClass (buf);
		assert(cc != 0);
	}

	/* We cannot construct interfaces or abstract classes */
	if ((cc->accflags & (ACC_INTERFACE|ACC_ABSTRACT)) != 0) {
		throwException(InstantiationException(cc->name->data));
	}

	initializeClass (cc);

	mb = findMethod(cc,
			constructor_name,
			signature==VOID_SIGNATURE ? void_signature
			: makeUtf8Const (signature, -1));
	if (mb == 0) {
		throwException(NoSuchMethodError);
	}

	obj = alloc_object(cc);
	assert(obj != 0);

	/* Calculate number of arguments */
	sig = signature;
	args = sizeofSig(&sig, false);

	/* Make the call */
	va_start(argptr, signature);
 	CALL_KAFFE_FUNCTION_VARARGS(mb, obj, args, argptr, retval);
	va_end(argptr);

	return (obj);
}

/*
 * Signal an error by creating the object and throwing the exception.
 */
void
SignalError(void* ee, char* cname, char* str)
{
	Hjava_lang_Object* obj;

	obj = execute_java_constructor(ee, cname, 0, ERROR_SIGNATURE, makeJavaString(str, strlen(str)));
	throwException(obj);
}

/*
 * Convert a class name to a path name.
 */
void
classname2pathname(char* from, char* to)
{
	int i;

	/* Convert any '.' in name to '/' */
	for (i = 0; from[i] != 0; i++) {
		if (from[i] == '.') {
			to[i] = '/';
		}
		else {
			to[i] = from[i];
		}
	}
	to[i] = 0;
}

/*
 * Return current time in milliseconds.
 */
jlong
currentTime(void)
{
	jlong tme;

#if defined(HAVE_GETTIMEOFDAY)
	struct timeval tm;
	gettimeofday(&tm, 0);
	tme = (((jlong)tm.tv_sec * (jlong)1000) + ((jlong)tm.tv_usec / (jlong)1000));
#else
	tme = 0;
#endif
	return (tme);
}

/*
 * Set a property to a value.
 */
void
setProperty(void* properties, char* key, char* value)
{
	Hjava_lang_String* jkey;
	Hjava_lang_String* jvalue;

	jkey = makeJavaString(key, strlen(key));
	jvalue = makeJavaString(value, strlen(value));

	do_execute_java_method(0, properties, "put",
		"(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
		0, false, jkey, jvalue);
}

/*
 * Allocate a new object of the given class name.
 */
Hjava_lang_Object*
AllocObject(char* classname)
{
	Hjava_lang_Class* class = lookupClass (classname);
	assert(class != 0);

	return (alloc_object(class));
}

/*
 * Allocate a new array of a given size and type.
 */
Hjava_lang_Object*
AllocArray(int sz, int type)
{
	return (alloc_array(sz, type));
}

/*
 * Allocate a new array of the given size and class name.
 */
Hjava_lang_Object*
AllocObjectArray(int sz, char* classname)
{
	char sig[CLASSMAXSIG];  /* FIXME - fixed-sized unchecked buffer! */
	/* Build signature for array type */
	strcpy(sig, "[");
	strcat(sig, classname);

	return (alloc_objectarray(sz, sig));
}

#if defined(NO_SHARED_LIBRARIES)
/*
 * Register an user function statically linked in the binary.
 */
void
addNativeMethod(char* name, void* func)
{
	static int funcs_nr = 0;
	static int funcs_max = 0;

	/* If we run out of space, reallocate */
	if (funcs_nr + 1 >= funcs_max) {
		funcs_max += NATIVE_FUNC_INCREMENT;
		if (native_funcs != null_funcs) {
			native_funcs = checked_realloc(native_funcs, funcs_max * sizeof(nativeFunction));
		}
		else {
			native_funcs = checked_malloc(NATIVE_FUNC_INCREMENT * sizeof(nativeFunction));
		}
	}
	native_funcs[funcs_nr].name = checked_malloc(strlen(name) + 1);
	strcpy(native_funcs[funcs_nr].name, name);
	native_funcs[funcs_nr].func = func;
	funcs_nr++;
	native_funcs[funcs_nr].name = 0;
	native_funcs[funcs_nr].func = 0;
}
#endif
