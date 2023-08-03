/*
 * classMethod.h
 * Class, method and field tables.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#ifndef __classmethod_h
#define __classmethod_h

#include "gtypes.h"
#include "object.h"
#include "constants.h"

#define	MAXMETHOD		64

/* Class state */
#define	CSTATE_LOADED		0
#define CSTATE_DOING_PREPARE	1
#define CSTATE_PREPARED		2
#define	CSTATE_DOING_LINK	3
#define CSTATE_LINKED		4
#define	CSTATE_DOINGINIT	5
#define	CSTATE_OK		6

typedef struct _classLoader {
	int	dummy;
} classLoader;

typedef struct Hjava_lang_Class {
	Hjava_lang_Object	head;		/* A class is an object too */

	/* Used to chain classes in the same hash bucket of classPool. */
	struct Hjava_lang_Class* next;

	Utf8Const*		name;
	accessFlags		accflags;

	/* If non-NULL, a pointer to the superclass.
	 * However, if state < CSTATE_DOING_PREPARE, then
	 * (int) superclass is a constant pool index. */
	struct Hjava_lang_Class* superclass;

	struct _constants	constants;
	/* For regular classes, an array of the methods defined in this class.
	   For array types, used for CLASS_ELEMENT_TYPE.
	   For primitive types, used by CLASS_ARRAY_CACHE. */
	Method*			methods;
	short			nmethods;

	/* Number of methods in the dtable. */
	/* If CLASS_IS_PRIMITIVE, then the CLASS_PRIM_SIG. */
	short			msize;

	/* Pointer to array of Fields, on for each field.
	   Static fields come first. */
	Field*			fields;

	/* The size of the non-static fields, in bytes.
	   For a primitive type, the length in bytes.
	   Also used temporarily while reading fields.  */
	int			bfsize;

	/* Number of fields, including static fields. */
	short			nfields;
	/* Number of static fields. */
	short			nsfields;

	/* The data for the static fields. */
	void*			staticData;

	struct _dispatchTable*	dtable;

        struct Hjava_lang_Class** interfaces;
	int			interface_len;
	struct _classLoader*	loader;
	int			state;
	bool			final;
} Hjava_lang_Class;

typedef struct _methods {
	Utf8Const*		name;
	Utf8Const*		signature;
	accessFlags		accflags;
	u2			__align__;
	unsigned char*		code;
	int			codelen;
	struct _instn*		insn;
	nativecode*		ncode_start;
	nativecode*		ncode;
	nativecode*		ncode_end;
	struct _jexception*	exception_table;
	int			exception_table_len;
	int			stacksz;
	int			localsz;
	int			ins;
	int			outs;
	Hjava_lang_Class*	class;
	struct _lineNumbers*	lines;

	/* Index into class->dtable.  Is -1 if method is static. */
	int			idx;
} methods;

typedef struct _dispatchTable {
	Hjava_lang_Class*	class;
	methods*		method[1];
} dispatchTable;

#define	CLASS_STATE		((int)&(((Hjava_lang_Class*)0)->state))

#define	DTABLE_CLASS		0
#define	DTABLE_METHODOFFSET	(sizeof(void*))
#define	DTABLE_METHODSIZE	(sizeof(void*))

typedef struct _fields {
	Utf8Const*		name;
	/* The type of the field, if FIELD_RESOLVED.
	   If !FIELD_RESOLVED:  The fields's signature as a (Utf8Const*). */
	Hjava_lang_Class*	type;
	accessFlags		accflags;
	u2			bsize; /* in bytes */
	int			boffset; /* in bytes */
} fields;

#define FIELD_UNRESOLVED_FLAG	0x8000

#define FIELD_RESOLVED(FLD)	(! ((FLD)->accflags & FIELD_UNRESOLVED_FLAG))

/* Type of field FLD.  Only valid if FIELD_RESOLVED(FLD). */
#define FIELD_TYPE(FLD)		((FLD)->type)
/* Size of field FLD, in bytes. */
#define FIELD_SIZE(FLD)		((FLD)->bsize)
#define FIELD_WSIZE(FLD)	((FLD)->bsize <= sizeof(jint) ? 1 : 2)
#define FIELD_OFFSET(FLD)	((FLD)->boffset)
#define FIELD_ISREF(FLD)	(!CLASS_IS_PRIMITIVE(FIELD_TYPE(FLD)))

#define	CLASSMAXSIG		256

struct _Code;
struct _method_info;
struct _field_info;
struct _classFile;

#define CLASS_METHODS(CLASS)  ((CLASS)->methods)
#define CLASS_NMETHODS(CLASS)  ((CLASS)->nmethods)

/* An array containing all the Fields, static fields first. */
#define CLASS_FIELDS(CLASS)   ((CLASS)->fields)

/* An array containing all the static Fields. */
#define CLASS_SFIELDS(CLASS)  ((CLASS)->fields)

/* An array containing all the instance (non-static) Fields. */
#define CLASS_IFIELDS(CL)     (&(CL)->fields[CLASS_NSFIELDS(CL)])

/* Total number of fields (instance and static). */
#define CLASS_NFIELDS(CLASS)  ((CLASS)->nfields)
/* Number of instance (non-static) fields. */
#define CLASS_NIFIELDS(CLASS) ((CLASS)->nfields - (CLASS)->nsfields)
/* Number of static fields. */
#define CLASS_NSFIELDS(CLASS) ((CLASS)->nsfields)

/* Size of a class fields (not counting header), in words. */
#define CLASS_WFSIZE(CLASS)   ((CLASS)->bfsize / sizeof(jint))

/* Size of a class's fields (not counting header), in bytes. */
#define CLASS_FSIZE(CLASS)    ((CLASS)->bfsize)

#define OBJECT_CLASS(OBJ)     ((OBJ)->dtable->class)
#define CLASS_CNAME(CL)  ((CL)->name->data)
#define _PRIMITIVE_DTABLE ((struct _dispatchTable*)(-1))
#define CLASS_IS_PRIMITIVE(CL) ((CL)->dtable == _PRIMITIVE_DTABLE)

/* Assuming CLASS_IS_PRIMITIVE(CL), return the 1-letter signature code. */
#define CLASS_PRIM_SIG(CL) ((CL)->msize)

#define CLASS_IS_ARRAY(CL)  (CLASS_CNAME(CL)[0] == '[')

/* For an array type, the types of the elements. */
#define CLASS_ELEMENT_TYPE(ARRAYCLASS) (*(Hjava_lang_Class**)&(ARRAYCLASS)->methods)

/* Used by the lookupArray function. */
#define CLASS_ARRAY_CACHE(PRIMTYPE) (*(Hjava_lang_Class**)&(PRIMTYPE)->methods)

#define TYPE_PRIM_SIZE(CL) ((CL)->bfsize)
#define TYPE_SIZE(CL) \
  (CLASS_IS_PRIMITIVE(CL) ? TYPE_PRIM_SIZE (CL) : PTR_TYPE_SIZE)

Hjava_lang_Class*	addClass(Hjava_lang_Class*, constIndex, constIndex, u2, struct _classLoader*);
methods*		addMethod(Hjava_lang_Class*, struct _method_info*);
void 			addMethodCode(methods*, struct _Code*);
fields*        		addField(Hjava_lang_Class*, struct _field_info*);
void			addCode(methods*, uint32, struct _classFile*);
Hjava_lang_Class*	loadClass(Utf8Const*, struct _classLoader*);
Hjava_lang_Class*	loadClassOrArray(char*, uint16, struct _classLoader*);
void			initializeClass (Hjava_lang_Class*);
Hjava_lang_Class*	lookupClass(char*);
Hjava_lang_Class*	lookupArray(Class*);
Hjava_lang_Class*	lookupObjectArrayClass(Hjava_lang_Class*);
fields*			lookupClassField(Hjava_lang_Class*, Utf8Const*, bool);
void			countInsAndOuts(char*, int*, int*, char*);
int			sizeofSig(char**, bool);
int			sizeofSigItem(char**, bool);
void			establishMethod(methods*);
void			addInterfaces(Hjava_lang_Class*, int, Hjava_lang_Class**);
Hjava_lang_Class*	getClass(constIndex, Hjava_lang_Class*);
Utf8Const*		makeUtf8Const(char*, int);
struct Hjava_lang_String* Utf8Const2JavaString(Utf8Const*);
void			linkClass(Hjava_lang_Class*);
Hjava_lang_Class*	classFromSig(char**, struct _classLoader*);
Hjava_lang_Class*	loadStaticClass(Utf8Const*);
void			finishFields(Hjava_lang_Class*);
Method*			findMethodFromPC(uintp);

extern Utf8Const* init_name;		/* "<clinit>" */
extern Utf8Const* constructor_name;	/* "<init>" */
extern Utf8Const* final_name;		/* "finalize" */
extern Utf8Const* void_signature;	/* "()V" */
extern Utf8Const* Code_name;		/* "Code" */
extern Utf8Const* LineNumberTable_name;	/* "LineNumberTable" */

#define VOID_SIGNATURE (void_signature->data)  /* same as "()V" but shared */

#endif
