/*
 * lookup.c
 * Various lookup calls for resolving objects, methods, exceptions, etc.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#define DBG(s)
#define FDBG(s)
#define EDBG(s)

#include "config.h"
#include "config-std.h"
#include "config-mem.h"
#include "jtypes.h"
#include "errors.h"
#include "slots.h"
#include "access.h"
#include "object.h"
#include "constants.h"
#include "classMethod.h"
#include "lookup.h"
#include "exception.h"
#include "thread.h"
#include "baseClasses.h"
#include "machine.h"

static void throwNoSuchMethodError(void);

/*
 * Lookup a method reference and get the various interesting bits.
 */
void
getMethodSignatureClass(constIndex idx, methods* meth, callInfo* call)
{
	constants* pool = CLASS_CONSTANTS (meth->class);
	constIndex ci;
	constIndex ni;
	constIndex nin;
	constIndex nis;
	Hjava_lang_Class* class;
	Utf8Const* name;
	Utf8Const* sig;
        Method* mptr;
        Method* nmptr;
        Hjava_lang_Class* cptr;
	int nmethods;
	dispatchTable* dtable;

	if (pool->tags[idx] != CONSTANT_Methodref &&
	    pool->tags[idx] != CONSTANT_InterfaceMethodref) {
DBG(		printf("No Methodref found\n");				)
                throwNoSuchMethodError();
	}

	ni = METHODREF_NAMEANDTYPE(idx, pool);
	nin = NAMEANDTYPE_NAME(ni, pool);
	name = WORD2UTF(pool->data[nin]);
	nis = NAMEANDTYPE_SIGNATURE(ni, pool);
	sig = WORD2UTF(pool->data[nis]);

	ci = METHODREF_CLASS(idx, pool);
	if (pool->tags[ci] == CONSTANT_Class) {
		pool->data[ci] = (ConstSlot)getClass (ci, meth->class);
		pool->tags[ci] = CONSTANT_ResolvedClass;
	}
	class = CLASS_CLASS (ci, pool);

DBG(	printf("getMethodSignatureClass(%s,%s,%s)\n",
		class->name, name->data, sig->data);		)

	/*
	 * We now have a complete class and method signature.  We can
	 * Now work out some things we might need to know, like no. of
	 * arguments, address of function, etc.
	 */
	countInsAndOuts(sig->data, &call->in, &call->out, &call->rettype);
DBG(	printf("in = %d, out = %d\n", call->in, call->out);		)
	call->class = class;

	/* Find method */
        for (cptr = class; cptr != 0; cptr = cptr->superclass) {
		nmethods = CLASS_NMETHODS(cptr);
                for (mptr = CLASS_METHODS(cptr); --nmethods >= 0; ++mptr) {
			if (equalUtf8Consts (name, mptr->name)
			    && equalUtf8Consts (sig, mptr->signature)) {
				goto foundit;
			}
		}
	}

	/* Not found - allocate a dummy method which will generate an exception
	 * and use that for any calls (but check we've not already done this).
	 */
	mptr = class->dtable->method[class->msize-1];
	if (mptr->ncode == (void*)throwNoSuchMethodError) {
		goto foundit;
	}

	dtable = (dispatchTable*)gc_malloc(sizeof(dispatchTable) + ((class->msize + 1) * sizeof(void*)), &gcNormal);
	for (nmethods = 0; nmethods < class->msize; nmethods++) {
		dtable->method[nmethods] = class->dtable->method[nmethods];
	}
	class->msize++;
	class->dtable = dtable;
	GC_WRITE(class, dtable);

	mptr = gc_malloc(sizeof(Method), &gcNormal);
	dtable->method[nmethods] = mptr;
	mptr->accflags = ACC_NATIVE;
	mptr->name = name;
	mptr->signature = sig;
	mptr->ncode = (void*)throwNoSuchMethodError;
	mptr->class = class;
	mptr->idx = nmethods;

	foundit:
	call->method = mptr;
}

/*
 * Extra argument information from a class method.
 */
void
getMethodArguments(constIndex idx, methods* meth, callInfo* call)
{
	constants* pool = CLASS_CONSTANTS (meth->class);
	constIndex ni;
	constIndex nis;
	Utf8Const* sig;

	if (pool->tags[idx] != CONSTANT_Methodref &&
	    pool->tags[idx] != CONSTANT_InterfaceMethodref) {
DBG(		printf("No Methodref found\n");				)
                throwNoSuchMethodError();
	}

	ni = METHODREF_NAMEANDTYPE(idx, pool);
	nis = NAMEANDTYPE_SIGNATURE(ni, pool);
	sig = WORD2UTF(pool->data[nis]);

	countInsAndOuts(sig->data, &call->in, &call->out, &call->rettype);
DBG(	printf("in = %d, out = %d\n", call->in, call->out);		)

	call->class = 0;
	call->method = 0;
}

Hjava_lang_Class*
getClass(constIndex idx, Hjava_lang_Class* this)
{
	constants* pool;
	constIndex cs;
	Utf8Const *name;
	Hjava_lang_Class* class;

	pool = CLASS_CONSTANTS(this);
	if (pool->tags[idx] == CONSTANT_ResolvedClass) {
		return (CLASS_CLASS (idx, pool));
	}
	if (pool->tags[idx] != CONSTANT_Class) {
		throwException(ClassFormatError);
	}
	cs = CLASS_NAME(idx, pool);
	name = WORD2UTF(pool->data[cs]);
	/* Find the specified class.  We cannot use 'loadClassOrArray' here
	 * because the name is *not* a signature.
	 */
	if (name->data[0] == '[') {
		char* el_name = &name->data[1];
		Class* el_class = classFromSig(&el_name, this->loader);
		class = lookupArray(el_class);
	}
	else {
		class = loadClass(name, this->loader);
	}
	if (class == 0) {
		throwException(ClassNotFoundException(name->data));
	}
	return (class);
}

Field*
getField(constIndex idx, bool isStatic, Method* meth, Class** retclass)
{
	constants* pool = CLASS_CONSTANTS (meth->class);
	constIndex ci;
	constIndex ni;
	constIndex nin;
	constIndex nis;
	Field* field;
	Hjava_lang_Class* class;

	if (pool->tags[idx] != CONSTANT_Fieldref) {
FDBG(		printf("No Fieldref found\n");				)
                throwException(NoSuchFieldError);
	}

	ci = FIELDREF_CLASS(idx, pool);
	ni = FIELDREF_NAMEANDTYPE(idx, pool);
	nin = NAMEANDTYPE_NAME(ni, pool);
	nis = NAMEANDTYPE_SIGNATURE(ni, pool);
	if (pool->tags[ci] == CONSTANT_Class) {
		pool->data[ci] = (ConstSlot)getClass (ci, meth->class);
		pool->tags[ci] = CONSTANT_ResolvedClass;
	}
	class = CLASS_CLASS (ci, pool);

FDBG(	printf("*** getField(%s,%s,%s)\n",
		class->name, pool->data[nin], pool->data[nis]);	)

	field = lookupClassField(class, WORD2UTF(pool->data[nin]), isStatic);
	if (field == 0) {
FDBG(		printf("Field not found\n");				)
                throwException(NoSuchFieldError);
	}

	(*retclass) = class;
	return (field);
}

/*
 * Lookup a method (and translate) in the specified class.
 */
Method*
findMethodLocal (Class* class, Utf8Const* name, Utf8Const* signature)
{
	Method* mptr;
	int n;
	/*
	 * Lookup method - this could be alot more efficient but never mind.
	 * Also there is no attempt to honour PUBLIC, PRIVATE, etc.
	 */
	n = CLASS_NMETHODS(class);
	for (mptr = CLASS_METHODS(class); --n >= 0; ++mptr) {
		if (equalUtf8Consts (name, mptr->name)
		    && equalUtf8Consts (signature, mptr->signature)) {
#if defined(TRANSLATOR)
			/*
			 * Generate code on demand.
			 */
			if (mptr->ncode == 0) {
				translate(mptr);
			}
#endif
			return (mptr);
		}
	}
	return (NULL);
}

/*
 * Lookup a method (and translate) in the specified class.
 */
methods*
findMethod(Hjava_lang_Class* class, Utf8Const* name, Utf8Const* signature)
{
	linkClass (class);
	/*
	 * Lookup method - this could be alot more efficient but never mind.
	 * Also there is no attempt to honour PUBLIC, PRIVATE, etc.
	 */
	for (; class != 0; class = class->superclass) {
		methods* mptr = findMethodLocal (class, name, signature);
		if (mptr != NULL) {
			return mptr;
		}
	}
	return (0);
}

#if defined(TRANSLATOR)
/*
 * Find exception in method.
 */
void
findExceptionInMethod(uintp pc, Hjava_lang_Class* class, exceptionInfo* info)
{
	methods* ptr;

	info->handler = 0;
	info->class = 0;
	info->method = 0;

	ptr = findMethodFromPC(pc);
	if (ptr != 0) {
		if (findExceptionBlockInMethod(pc, class, ptr, info) == true) {
			return;
		}
	}
EDBG(	printf("Exception not found.\n");				)
}
#endif

/*
 * Look for exception block in method.
 */
bool
findExceptionBlockInMethod(uintp pc, Hjava_lang_Class* class, methods* ptr, exceptionInfo* info)
{
	jexception* eptr;
	Hjava_lang_Class* cptr;
	int i;

	/* Stash method & class */
	info->method = ptr;
	info->class = ptr->class;

	eptr = ptr->exception_table;

EDBG(	printf("Nr of exceptions = %d\n", ptr->exception_table_len); )

	/* Right method - look for exception */
	for (i = 0; i < ptr->exception_table_len; i++) {
		uintp start_pc = eptr[i].start_pc;
		uintp end_pc = eptr[i].end_pc;
		uintp handler_pc = eptr[i].handler_pc;

EDBG(		printf("Exceptions %x (%x-%x)\n", pc, start_pc, end_pc); )
		if (pc < start_pc || pc > end_pc) {
			continue;
		}
EDBG(		printf("Found exception 0x%x\n", handler_pc); )

		/* Found exception - is it right type */
		if (eptr[i].catch_type == NULL) {
			info->handler = handler_pc;
			return (true);
		}
		for (cptr = class; cptr != 0; cptr = cptr->superclass) {
			if (cptr == eptr[i].catch_type) {
				info->handler = handler_pc;
				return (true);
			}
		}
	}
	return (false);
}

static
void
throwNoSuchMethodError(void)
{
	throwException(NoSuchMethodError);
}
