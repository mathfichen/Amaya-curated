/*
 * baseClasses.c
 * Handle base classes.
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
#include "config-mem.h"
#include "config-signal.h"
#include "gtypes.h"
#include "access.h"
#include "object.h"
#include "constants.h"
#include "classMethod.h"
#include "baseClasses.h"
#include "thread.h"
#include "lookup.h"
#include "slots.h"
#include "machine.h"
#include "exception.h"
#include "md.h"

Utf8Const* init_name;
Utf8Const* void_signature;
Utf8Const* final_name;
Utf8Const* constructor_name;
Utf8Const* Code_name;
Utf8Const* LineNumberTable_name;

Class* StringClass;
Class* ClassClass;
Class* ObjectClass;
Class* SystemClass;
#define SYSTEMCLASS "java/lang/System"

#define	INIT			"<clinit>"
#define	VOIDSIG			"()V"
#define	FINAL			"finalize"
#define	CONSTRUCTOR_NAME	"<init>"

/* Initialisation prototypes */
void initClasspath(void);
void initExceptions(void);
void initNative(void);
void initThreads(void);
void initTypes(void);

/*
 * Initialise the machine.
 */
void
initialiseKaffe(void)
{
	Method* meth;

	/* Machine specific initialisation first */
#if defined(INIT_MD)
	INIT_MD();
#endif

	/* Setup garbage collection system */
	initGc();

	/* Setup CLASSPATH */
	initClasspath();

	/* Init native support */
	initNative();

	/* Create the initialise and finalize names and signatures. */
	init_name = makeUtf8Const (INIT, sizeof(INIT)-1);
	void_signature = makeUtf8Const (VOIDSIG, sizeof (VOIDSIG)-1);
	final_name = makeUtf8Const (FINAL, sizeof(FINAL)-1);
	constructor_name = makeUtf8Const (CONSTRUCTOR_NAME,
					  sizeof(CONSTRUCTOR_NAME)-1);
	Code_name = makeUtf8Const ("Code", 4);
	LineNumberTable_name = makeUtf8Const ("LineNumberTable", 15);

	/* Read in base classes */
	initBaseClasses();

	/* Setup exceptions */
	initExceptions();

	/* Init thread support */
	initThreads();

#if 0
	/* If we're using JDK 1.1 we need to call this following method.
	 * But for the moment, we'll only call it if we can find it so we
	 * can handle JDK 1.0.2 as well.
	 */
	SystemClass = loadStaticClass(makeUtf8Const(SYSTEMCLASS, sizeof(SYSTEMCLASS)-1));
	initializeClass(SystemClass);
	meth = findMethod(SystemClass, makeUtf8Const("initializeSystemClass", -1), void_signature);
	if (meth != 0) {
		CALL_KAFFE_FUNCTION(meth, 0);
	}
#endif
}

/*
 * We need to use certain classes in the internal machine so we better
 * get them in now in a known way so we can refer back to them.
 * Currently we need java/lang/Object, java/lang/Class and java/lang/String.
 */
void
initBaseClasses(void)
{
	/* Start with the simple types. */

	ObjectClass = loadStaticClass(makeUtf8Const(OBJECTCLASS, sizeof(OBJECTCLASS)-1));
	ClassClass = loadStaticClass(makeUtf8Const(CLASSCLASS, sizeof(CLASSCLASS)-1));

	/* Fixup mtable because it couldn't be made for the first classes */
	ClassClass->head.dtable = ClassClass->dtable;
	ObjectClass->head.dtable = ClassClass->dtable;
	initTypes();
	StringClass = loadStaticClass(makeUtf8Const(STRINGCLASS, sizeof(STRINGCLASS)-1));
	initializeClass(StringClass);
}

/*
 * Setup the internal exceptions.
 */
void
initExceptions(void)
{
DBG(	printf("initExceptions()\n");				)
#if !defined(DEBUG)
	/* Catch signal we need to convert to exceptions */
#if defined(SIGSEGV)
	signal(SIGSEGV, (SIG_T)nullException);
#endif
#if defined(SIGBUS)
	signal(SIGBUS, (SIG_T)nullException);
#endif
#if defined(SIGFPE)
	signal(SIGFPE, (SIG_T)arithmeticException);
#endif
#if defined(SIGPIPE)
	signal(SIGPIPE, SIG_IGN);
#endif
#endif
}
