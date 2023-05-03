/*
 * classMethod.c
 * Dictionary of classes, methods and fields.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#define DBG(s)
#define	CDBG(s)
#define	MDBG(s)
#define	FDBG(s)
#define	LDBG(s)

#include "config.h"
#include "config-std.h"
#include "config-mem.h"
#include "gtypes.h"
#include "slots.h"
#include "access.h"
#include "object.h"
#include "classMethod.h"
#include "code.h"
#include "file.h"
#include "readClass.h"
#include "baseClasses.h"
#include "thread.h"
#include "itypes.h"
#include "errors.h"
#include "exception.h"
#include "external.h"
#include "lookup.h"
#include "support.h"
#include "gc.h"

#define	CLASSHASHSZ		256
#if CLASSHASHSZ & (CLASSHASHSZ - 1)
  #error CLASSHASHSZ must be power of two
#endif
static Hjava_lang_Class* classPool[CLASSHASHSZ];

extern void linkClass(Hjava_lang_Class*);
extern Hjava_lang_Class* findClass(Hjava_lang_Class*, char*);
extern void verify2(Hjava_lang_Class*);
extern void verify3(Hjava_lang_Class*);

static void prepareClass(Hjava_lang_Class*);
static Hjava_lang_Class* simpleLookupClass(Utf8Const*, struct _classLoader*);
static Hjava_lang_Class* internalAddClass(Hjava_lang_Class*, Utf8Const*, int, int, struct _classLoader*);

Hjava_lang_Class*
addClass(Hjava_lang_Class* cl, constIndex c, constIndex s, u2 flags, struct _classLoader* loader)
{
	Utf8Const* str;
	constants* pool = CLASS_CONSTANTS(cl);

	/* Find the name of the class */
	if (pool->tags[c] != CONSTANT_Class) {
CDBG(		printf("addClass: not a class.\n");			)
		return (0);
	}
	c = CLASS_CONST_USHORT1(cl, c);
	if (pool->tags[c] != CONSTANT_Utf8) {
CDBG(		printf("addClass: not a Utf8.\n");			)
		return (0);
	}
	str = WORD2UTF(pool->data[c]);

	return (internalAddClass(cl, str, flags, s, loader));
}

#if INTERN_UTF8CONSTS
static
int
hashClassName(Utf8Const *name)
{
	int len = (name->length+1) >> 1;  /* Number of shorts */
	uint16 *ptr = (uint16*) name->data;
	int hash = len;
	while (--len >= 0)
		hash = (hash << 1) ^ *ptr++;
	return hash;
}
#else
#define hashClassName(NAME) ((NAME)->hash)
#endif

static
Hjava_lang_Class*
internalAddClass(Hjava_lang_Class* cl, Utf8Const* name, int flags, int su, struct _classLoader* loader)
{
	Class** clp;
	uint32 hash = hashClassName (name) & (CLASSHASHSZ-1);

	/* All classes are entered in the global classPool.
	 * This is done, even for classes using a ClassLoader, following
	 * the prescription of the "Java Language Specification"
	 * (section 12.2:  Loading of Classes and Interfaces). */

	clp = &classPool[hash];
#ifdef DEBUG
	while (*clp != 0) {
		assert(! equalUtf8Consts (name, (*clp)->name)
		       || loader != (*clp)->loader);
		clp = &(*clp)->next;
	}
#endif

	cl->name = name;
	CLASS_METHODS(cl) = NULL;
	CLASS_NMETHODS(cl) = 0;
	cl->superclass = (Hjava_lang_Class*)(uintp)su;
	cl->msize = 0;
	CLASS_FIELDS(cl) = 0;
	CLASS_FSIZE(cl) = 0;
	cl->accflags = flags;
	cl->dtable = 0;
        cl->interfaces = 0;
	cl->interface_len = 0;
	cl->state = CSTATE_LOADED;
	cl->final = false;
	cl->loader = loader;
	/* Add into list. */
	cl->next = *clp;
	*clp = cl;

	return (cl);
}

Method*
addMethod(Hjava_lang_Class* c, method_info* m)
{
	constIndex nc;
	constIndex sc;
	methods* mt;
	constants* pool;
	Utf8Const* name;
	Utf8Const* signature;
	int ni;
	char outtype;

	pool = CLASS_CONSTANTS (c);

	nc = m->name_index;
	if (pool->tags[nc] != CONSTANT_Utf8) {
MDBG(		printf("addMethod: no method name.\n");			)
		return (0);
	}
	sc = m->signature_index;
	if (pool->tags[sc] != CONSTANT_Utf8) {
MDBG(		printf("addMethod: no signature name.\n");		)
		return (0);
	}
	name = WORD2UTF (pool->data[nc]);
	signature = WORD2UTF (pool->data[sc]);

	if (equalUtf8Consts (name, final_name)
	    && equalUtf8Consts (signature, void_signature)) {
		c->final = true;
	}

#ifdef DEBUG
	/* Search down class for method name - don't allow duplicates */
	for (ni = CLASS_NMETHODS(c), mt = CLASS_METHODS(c); --ni >= 0; ) {
		assert(! equalUtf8Consts (name, mt->name)
		       || ! equalUtf8Consts (signature, mt->signature));
	}
#endif

MDBG(	printf("Adding method %s:%s%s (%x)\n", c->name->data, WORD2UTF(pool->data[nc])->data, WORD2UTF(pool->data[sc])->data, m->access_flags);	)

	mt = &c->methods[c->nmethods++];
	mt->name = name;
	mt->signature = signature;
	mt->class = c;
	mt->accflags = m->access_flags;
	mt->code = 0;
	mt->insn = 0;
	mt->ncode = 0;
	mt->stacksz = 0;
	mt->localsz = 0;
	mt->exception_table = 0;
	mt->exception_table_len = 0;
	countInsAndOuts(signature->data, &mt->ins, &mt->outs, &outtype);

	return (mt);
}

Field*
addField(Hjava_lang_Class* c, field_info* f)
{
	constIndex nc;
	constIndex sc;
	Field* ft;
	constants* pool;
	int index;

	pool = CLASS_CONSTANTS (c);

	nc = f->name_index;
	if (pool->tags[nc] != CONSTANT_Utf8) {
FDBG(		printf("addField: no field name.\n");			)
		return (0);
	}

	--CLASS_FSIZE(c);
	if (f->access_flags & ACC_STATIC) {
		index = CLASS_NSFIELDS(c)++;
	}
	else {
		index = CLASS_FSIZE(c) + CLASS_NSFIELDS(c);
	}
	ft = &CLASS_FIELDS(c)[index];

FDBG(	printf("Adding field %s:%s\n", c->name, pool->data[nc].v.tstr);	)

	sc = f->signature_index;
	if (pool->tags[sc] != CONSTANT_Utf8) {
FDBG(		printf("addField: no signature name.\n");		)
		return (0);
	}
	ft->name = WORD2UTF (pool->data[nc]);
	FIELD_TYPE(ft) = (Hjava_lang_Class*)CLASS_CONST_UTF8(c, sc);
	ft->accflags = f->access_flags | FIELD_UNRESOLVED_FLAG;

	return (ft);
}

void
finishFields(Hjava_lang_Class *cl)
{
	Field tmp;
	Field* fld;
	int n;

	/* Reverse the instance fields, so they are in "proper" order. */
	fld = CLASS_IFIELDS(cl);
	n = CLASS_NIFIELDS(cl);
	while (n > 1) {
		tmp = fld[0];
		fld[0] = fld[n-1];
		fld[n-1] = tmp;
		fld++;
		n -= 2;
	}
}

void
addMethodCode(methods* m, Code* c)
{
	m->code = c->code;
	m->codelen = c->code_length;
	m->stacksz = c->max_stack;
	m->localsz = c->max_locals;
	m->exception_table = c->exception_table;
	m->exception_table_len = c->exception_table_length;
}

void
addInterfaces(Hjava_lang_Class* c, int inr, Hjava_lang_Class** inf)
{
	assert(inr > 0);

        c->interfaces = inf;
	c->interface_len = inr;
}

static char loadClassName[] = "loadClass";
static char loadClassSig[] = "(Ljava/lang/String;Z)Ljava/lang/Class;";

/*
 * Lookup a named class, loading it if necessary.
 * The name is as used in class files, e.g. "java/lang/String".
 */
Class*
loadClass(Utf8Const* name, struct _classLoader* loader)
{
	Class* class;

	class = simpleLookupClass(name, loader);
	if (class == NULL) {
		/* Failed to find class, so must now load it */

		if (loader != NULL) {
			Hjava_lang_String* str;

LDBG(			printf("classLoader: loading %s\n", name->data); )
			str = makeReplaceJavaStringFromUtf8(name->data, name->length, '/', '.');
			class = (Hjava_lang_Class*)do_execute_java_method (NULL, (Hjava_lang_Object*)loader, loadClassName, loadClassSig, 0, false, str, true);
LDBG(			printf("classLoader: done\n");			)
		}
		else {
			class = findClass(alloc_class(), name->data);
		}

		if (class == NULL) {
                        throwException(ClassNotFoundException(name->data));
		}
	}
	prepareClass (class);
	return (class);
}

Class*
loadStaticClass(Utf8Const* name)
{
	Class* class;

	class = alloc_class();

	if (findClass(class, name->data) == NULL) {
		throwException(ClassNotFoundException(name->data));
	}
	prepareClass (class);
	return (class);
}

Hjava_lang_Class*
lookupClass (char* name)
{
	Hjava_lang_Class* class;

	class = loadClass (makeUtf8Const (name, strlen (name)), NULL);
	initializeClass (class);
	return class;
}

static
int
resolveFields (Hjava_lang_Class* class, Field* fld, int n, int offset)
{
	int fsize;
	int align;
	char* sig;

	for (; --n >= 0; fld++) {
		sig = ((Utf8Const*)FIELD_TYPE(fld))->data;
		if (sig[0] == 'L' || sig[0] == '[') {
			/* Defer loading class until we need it. */
			fsize = PTR_TYPE_SIZE;
		}
		else {
			assert(!FIELD_RESOLVED(fld));
			FIELD_TYPE(fld) = classFromSig (&sig, class->loader);
			fsize = TYPE_PRIM_SIZE(FIELD_TYPE(fld));
			fld->accflags &= ~FIELD_UNRESOLVED_FLAG;
		}
		/* Align field offset */
		if (fsize < 4) {
			fsize = 4;
		}
		align = fsize;
		offset = ((offset + align - 1) / align) * align;
		FIELD_SIZE(fld) = fsize;
		FIELD_OFFSET(fld) = offset;
		offset += fsize;
	}
	return (offset);
}

static
void
buildDispatchTable(Hjava_lang_Class* class, Method* methods, int nmethods)
{
	Method* meth;
	Method** mtab;
	int i;
	Class* super;

	if (class->superclass != NULL) {
		class->msize = class->superclass->msize;
	}
	else {
		class->msize = 0;
	}
	for (meth = methods, i = nmethods; --i >= 0; ++meth) {
		super = class->superclass;
		if (meth->accflags & ACC_STATIC) {
			meth->idx = -1;
			continue;
		}
		/* Search superclasses for equivalent method name.
		 * If found extract its index nr.
		 */
		for (; super != NULL;  super = super->superclass) {
			int j = CLASS_NMETHODS(super);
			Method* mt = CLASS_METHODS(super);
			for (; --j >= 0;  ++mt) {
				if (equalUtf8Consts (mt->name, meth->name)
				    && equalUtf8Consts (mt->signature, meth->signature)) {
					meth->idx = mt->idx;
					goto foundmatch;
				}
			}
		}
		/* No match found so allocate a new index number */
		meth->idx = class->msize++;
		foundmatch:;
	}

	class->dtable = (dispatchTable*)gc_malloc(sizeof(dispatchTable) + (class->msize * sizeof(void*)), &gcNormal);
	class->dtable->class = class;
	mtab = class->dtable->method;

	/* Install inherited methods into dispatch table. */
	if (class->superclass != NULL) {
		Method** super_mtab = class->superclass->dtable->method;
		for (i = 0; i < class->superclass->msize; i++) {
			mtab[i] = super_mtab[i];
		}
	}
	for (meth = methods, i = nmethods;  --i >= 0;  ++meth) {
		if (meth->idx >= 0) {
			mtab[meth->idx] = meth;
		}
	}

	/* Check for undefined abstract methods if class is not abstract.
	 * See "Java Language Specification" (1996) section 12.3.2. */
	if ((class->accflags & ACC_ABSTRACT) == 0) {
		for (i = class->msize - 1; i >= 0; i--) {
			if (mtab[i] == NULL) {
				throwException(AbstractMethodError);
			}
		}
	}

	class->state = CSTATE_PREPARED;
}

static
void
prepareClass (Hjava_lang_Class* class)
{
	int i;
	int super_idx;

	if (class->state >= CSTATE_DOING_PREPARE) {
		if (class->state == CSTATE_DOING_PREPARE) {
			throwException(ClassCircularityError);
		}
		return;
	}
	super_idx = (int) class->superclass;
	class->state = CSTATE_DOING_PREPARE;

	/* Load and link the super class */
	if (super_idx != 0) {
		class->superclass = getClass (super_idx, class);
		prepareClass (class->superclass);
		CLASS_FSIZE(class) = CLASS_FSIZE(class->superclass);
	}

	/* Load all the implemented interfaces. */
	for (i = 0;  i < class->interface_len;  i++) {
		uintp iface = (uintp)class->interfaces[i];
		class->interfaces[i] = getClass (iface, class);
	}

	CLASS_FSIZE(class) = resolveFields (class, CLASS_IFIELDS(class),
	CLASS_NIFIELDS(class),
	CLASS_FSIZE(class));

	i = resolveFields (class, CLASS_SFIELDS(class),
	CLASS_NSFIELDS(class), 0);
	if (i > 0) {
		class->staticData = gc_malloc(i, &gcNormal);
	}

	buildDispatchTable(class, CLASS_METHODS(class), CLASS_NMETHODS(class));

	class->state = CSTATE_PREPARED;
}

void
linkClass(Hjava_lang_Class* class)
{
	int i;
	int idx;
	constants* pool;

	if (class->state >= CSTATE_LINKED) {
		return;
	}
	if (class->state == CSTATE_DOING_LINK) {    
		while (class->state == CSTATE_DOING_LINK) {
			/* This may not work if the locking process is
			 * a lower priority than me - hey ho.
			 */
			yieldThread();
		}
		return;
	}
	/* Signal that we are linking */
	class->state = CSTATE_DOING_LINK;

	prepareClass (class);

	/* Second stage class verification - check the class format is okay */
	verify2(class);

	/* Load (only) all classes references in the constant pool.
	 * Replace each CONSTANT_Class by a CONSTANT_ResolvedClass. */
	pool = CLASS_CONSTANTS (class);
	for (i = 0;  i < pool->size; i++) {
		switch (pool->tags[i]) {
		case CONSTANT_Class:
			pool->data[i] = (ConstSlot)getClass (i, class);
			pool->tags[i] = CONSTANT_ResolvedClass;
			break;
		case CONSTANT_String:
			idx = CLASS_CONST_USHORT1(class, i);
			pool->data[i] = (ConstSlot)Utf8Const2JavaString (WORD2UTF (pool->data[idx]));
			break;
		}
	}

	/* Third stage class verification - check the bytecode is okay */
	verify3 (class);

	prepareClass (class);

	class->state = CSTATE_LINKED;
}

/* Initializes a class.
 * Does not follow the language spec yet. */

void
initializeClass(Hjava_lang_Class* class)
{
	methods* meth;
	Hjava_lang_Class* super;
	int i;
	Field *fld;

	if (class->state == CSTATE_OK) {
		return;
	}
	/* Not to spec:  should wait if different thread is doing init. */
	if (class->state == CSTATE_DOINGINIT) {
		return;
	}
	if (class->state < CSTATE_LINKED) {
		linkClass (class);
	}

	super = class->superclass;
	if (super != NULL && super->state != CSTATE_OK) {
		initializeClass (super);
	}

	/* Finish resolving the fields. */
	fld = CLASS_FIELDS(class);
	for (i = CLASS_NFIELDS(class);  --i >= 0; fld++) {
		if (!FIELD_RESOLVED(fld)) {
			char* sig;
			sig = ((Utf8Const*)FIELD_TYPE(fld))->data;
			FIELD_TYPE(fld) = classFromSig(&sig, class->loader);
			fld->accflags &= ~FIELD_UNRESOLVED_FLAG;
		}
	}

DBG(	printf("Initialising %s static %d\n", class->name->data, CLASS_SSIZE(class));
    fflush(stdout); )
	meth = findMethodLocal(class, init_name, void_signature);
	if (meth != NULL) {
		class->state = CSTATE_DOINGINIT;
		CALL_KAFFE_FUNCTION(meth, 0);
	}
	class->state = CSTATE_OK;
}

static
Class*
simpleLookupClass(Utf8Const* name, struct _classLoader* loader)
{
	Class* clp;

	for (clp = classPool[hashClassName(name) & (CLASSHASHSZ-1)]; clp != 0 && !(equalUtf8Consts(name, clp->name) && loader == clp->loader); clp = clp->next)
		;
	return (clp);
}

/*
 * Lookup a named field.
 */
Field*
lookupClassField(Hjava_lang_Class* clp, Utf8Const* name, bool isStatic)
{
	Field* fptr;
	int n;

	/* Search down class for field name */
	if (isStatic) {
		fptr = CLASS_SFIELDS(clp);
		n = CLASS_NSFIELDS(clp);
	}
	else {
		fptr = CLASS_IFIELDS(clp);
		n = CLASS_NIFIELDS(clp);
	}
	while (--n >= 0) {
		if (equalUtf8Consts (name, fptr->name)) {
			if (!FIELD_RESOLVED(fptr)) {
				char* sig;
				sig = ((Utf8Const*)FIELD_TYPE(fptr))->data;
				FIELD_TYPE(fptr) = classFromSig(&sig, clp->loader);
				fptr->accflags &= ~FIELD_UNRESOLVED_FLAG;
			}
			return (fptr);
		}
		fptr++;
	}
FDBG(	printf("Class:field lookup failed %s:%s\n", c, f);		)
	return (0);
}

/*
 * Determine the number of arguments and return values from the
 * method signature.
 */
void
countInsAndOuts(char* str, int* ins, int* outs, char* outtype)
{
	*ins = sizeofSig(&str, false);
	*outtype = str[0];
	*outs = sizeofSig(&str, false);
}

/*
 * Calculate size of data item based on signature.
 */
int
sizeofSig(char** strp, bool want_wide_refs)
{
	int count;
	int c;

	count = 0;
	for (;;) {
		c = sizeofSigItem(strp, want_wide_refs);
		if (c == -1) {
			return (count);
		}
		count += c;
	}
}

/*
 * Calculate size (in words) of a signature item.
 */
int
sizeofSigItem(char** strp, bool want_wide_refs)
{
	int count;
	char* str;

	for (str = *strp; ; str++) {
		switch (*str) {
		case '(':
			continue;
		case 0:
		case ')':
			count = -1;
			break;
		case 'V':
			count = 0;
			break;
		case 'I':
		case 'Z':
		case 'S':
		case 'B':
		case 'C':
		case 'F':
			count = 1;
			break;
		case 'D':
		case 'J':
			count = 2;
			break;
		case '[':
			count = want_wide_refs ? sizeof(void*) / sizeof(int32) : 1;
			arrayofarray:
			str++;
			if (*str == 'L') {
				while (*str != ';') {
					str++;
				}
			}
			else if (*str == '[') {
				goto arrayofarray;
			}
			break;
		case 'L':
			count = want_wide_refs ? sizeof(void*) / sizeof(int32) : 1;
			/* Skip to end of reference */
			while (*str != ';') {
				str++;
			}
			break;
		default:
			abort();
		}

		*strp = str + 1;
		return (count);
	}
}

/* Find (or create) an array class with component type C. */

Class*
lookupArray(Hjava_lang_Class* c)
{
	Utf8Const *arr_name;
	char sig[CLASSMAXSIG];  /* FIXME! unchecked fixed buffer! */
	Hjava_lang_Class* arr_class;

	/* Build signature for array type */
	if (CLASS_IS_PRIMITIVE (c)) {
		arr_class = CLASS_ARRAY_CACHE(c);
		if (arr_class) {
			return (arr_class);
		}
		sprintf (sig, "[%c", CLASS_PRIM_SIG(c));
	}
	else {
		char* cname = CLASS_CNAME (c);
		sprintf (sig, cname[0] == '[' ? "[%s" : "[L%s;", cname);
	}
	arr_name = makeUtf8Const (sig, strlen (sig));
	arr_class = simpleLookupClass(arr_name, c->loader);
	if (arr_class == NULL) {
		arr_class = internalAddClass (alloc_class (), arr_name, 0, 0, c->loader);
		arr_class->superclass = ObjectClass;
		buildDispatchTable (arr_class, NULL, 0);
		CLASS_ELEMENT_TYPE (arr_class) = c;
		arr_class->state = CSTATE_OK;
	}
#if !INTERN_UTF8CONSTS
	else {
		free (arr_name);
	}
#endif
	if (CLASS_IS_PRIMITIVE (c)) {
		CLASS_ARRAY_CACHE(c) = arr_class;
	}
	return (arr_class);
}

#if defined(TRANSLATOR)
/*
 * Find method containing pc.
 */
Method*
findMethodFromPC(uintp pc)
{
	Class *class;
	Method* ptr;
	int ipool, imeth;

	for (ipool = CLASSHASHSZ;  --ipool >= 0; ) {
		for (class = classPool[ipool];  class != NULL; ) {
			imeth = CLASS_NMETHODS(class);
			ptr = CLASS_METHODS(class);
			for (; --imeth >= 0;  ptr++) {
				if (pc >= (uintp)ptr->ncode
				    && pc < (uintp)ptr->ncode_end) {
					return ptr;
				}
			}
			class = class->next;
		}
	}
	return (NULL);
}
#endif
