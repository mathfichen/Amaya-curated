/*
 * verify.c
 * Perform stages 2 & 3 of class verification.  Stage 1 is performed
 *  when the class is being loaded (so isn't here) and stage 4 is performed
 *  as the method is being executed.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#define	DBG(s)

#include "config.h"
#include "config-std.h"
#include "constants.h"
#include "baseClasses.h"
#include "errors.h"
#include "flags.h"
#include "exception.h"

/*
 * Verify pass 2:  Check the internal consistency of the class file
 *  but do not check the bytecode.
 */
void
verify2(Class* class)
{
	constants* info;
	bool error;
	int i;

DBG(	printf("Verifing class %s\n", (char*)class->name->data);	)

	error = false;

	/* 1: Check final directives are obeyed */
		/* NOT YET */

	/* 2: Check class has a superclass or it java.lang.Object */
	if (class->superclass == 0 && strcmp((char*)class->name->data, OBJECTCLASS) != 0) {
		error = true;
	}

	/* 3: Check class constant pool is consistent */
	info = CLASS_CONSTANTS(class);
	/* Constant pool loaded - check it's integrity. */
	for (i = 1; i < info->size; i++) {
		switch (info->tags[i]) {
		case CONSTANT_Utf8:
		case CONSTANT_Integer:
		case CONSTANT_Float:
			/* Always legal */
			break;

		case CONSTANT_Long:
		case CONSTANT_Double:
			/* Always legal */
			i++;
			break;

		case CONSTANT_Class:
		case CONSTANT_String: /* Same as String */
			if (CONST_TAG(CLASS_NAME(i, info), info) != CONSTANT_Utf8) {
				error = true;
			}
			break;

		case CONSTANT_Fieldref:
		case CONSTANT_Methodref: /* Same as Fieldref */
		case CONSTANT_InterfaceMethodref: /* Same as Fieldref */
			if (CONST_TAG(FIELDREF_CLASS(i, info), info) != CONSTANT_Class) {
				error = true;
			}
			if (CONST_TAG(FIELDREF_NAMEANDTYPE(i, info), info) != CONSTANT_NameAndType) {
				error = true;
			}
			break;

		case CONSTANT_NameAndType:
			if (CONST_TAG(NAMEANDTYPE_NAME(i, info), info) != CONSTANT_Utf8) {
				error = true;
			}
			if (CONST_TAG(NAMEANDTYPE_SIGNATURE(i, info), info) != CONSTANT_Utf8) {
				error = true;
			}
			break;

		default:
			error = true;
			break;
		}
	}

	/* 4: Check field and method references have valid names and types */
		/* NOT YET */

	/* If we found an inconsistency then throw an exception */
	if (error == true) {
		throwException(ClassFormatError);
	}
}

/*
 * Verify pass 3:  Check the consistency of the bytecode.
 */
void
verify3(Class* class)
{
	if ((class->loader == 0 && (flag_verify & 1) == 0) ||
	    (class->loader != 0 && (flag_verify & 2) == 0)) {
		return;
	}

	/* Run bytecode verifier - NOT YET!! */
}