/*
 * java.lang.Runtime.c
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "lib-license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#define	DBG(s)

#include "config.h"
#include "config-std.h"
#include "config-mem.h"
#include "config-io.h"
#include "../../../../kaffe/kaffevm/gtypes.h"
#include <native.h>
#include "files.h"
#include "defs.h"
#include "java.lang.stubs/Runtime.h"
#include "../../../../kaffe/kaffevm/external.h"
#include "../../../../kaffe/kaffevm/gc.h"

#define	LIBRARY_PREFIX	"/libkaffe_"

extern char* getLibraryPath(void);
extern void* checked_calloc(size_t, size_t);
extern void checked_free(void*);


/*
 * Initialise the linker and return the search path for shared libraries.
 */
struct Hjava_lang_String*
java_lang_Runtime_initializeLinkerInternal(struct Hjava_lang_Runtime* this)
{
	char* libraryPath;

	libraryPath = getLibraryPath();
	if (libraryPath == NULL) libraryPath = "";
	return (makeJavaString(libraryPath, strlen(libraryPath)));
}

/*
 * Construct a library name.
 */
struct Hjava_lang_String*
java_lang_Runtime_buildLibName(struct Hjava_lang_Runtime* this, struct Hjava_lang_String* s1, struct Hjava_lang_String* s2)
{
	char lib[MAXLIBPATH];
	char str[MAXPATHLEN];

	/*
	 * Note. Although the code below will build a library string, if
	 * it doesn't fit into the buffer, it will truncate the path
	 * silently.
	 */
	javaString2CString(s1, str, sizeof(str));
	strncpy(lib, str, MAXLIBPATH-1);
	strncat(lib, LIBRARY_PREFIX, MAXLIBPATH-1);
	javaString2CString(s2, str, sizeof(str));
	strncat(lib, str, MAXLIBPATH-1);
	strncat(lib, LIBRARYSUFFIX, MAXLIBPATH-1);
	lib[MAXLIBPATH-1] = 0;

	return (makeJavaString(lib, strlen(lib)));
}

/*
 * Load in a library file.
 */
jint /* bool */
java_lang_Runtime_loadFileInternal(struct Hjava_lang_Runtime* this, struct Hjava_lang_String* s1)
{
	char lib[MAXPATHLEN];
	int r;

	javaString2CString(s1, lib, sizeof(lib));
	r = loadNativeLibrary(lib);

	return (r == 0 ? 1 : 0);
}

/*
 * Exit - is this just a thread or the whole thing?
 */
void
java_lang_Runtime_exitInternal(struct Hjava_lang_Runtime* r, jint v)
{
	/* exit (v); */
}

/*
 * Exec another program.
 */
struct Hjava_lang_Process*
java_lang_Runtime_execInternal(struct Hjava_lang_Runtime* this, HArrayOfObject* argv, HArrayOfObject* arge)
{
	struct Hjava_lang_Process* child;

	child = (struct Hjava_lang_Process*)execute_java_constructor(0, "java.lang.UNIXProcess", 0, "([Ljava/lang/String;[Ljava/lang/String;)V", argv, arge);

	return (child);
}

/*
 * Free memory.
 */
jlong
java_lang_Runtime_freeMemory(struct Hjava_lang_Runtime* this)
{
	return (0);
}

/*
 * Total memory.
 */
jlong
java_lang_Runtime_totalMemory(struct Hjava_lang_Runtime* this)
{
	return (0);
}

/*
 * Run the garbage collector.
 */
void
java_lang_Runtime_gc(struct Hjava_lang_Runtime* this)
{
	invokeGC();
}

/*
 * Run any pending finialized methods.
 *  Finalising is part of the garbage collection system - so just run that.
 */
void
java_lang_Runtime_runFinalization(struct Hjava_lang_Runtime* this)
{
	invokeGC();
}

/*
 * Enable/disable tracing of instructions.
 */
void
java_lang_Runtime_traceInstructions(struct Hjava_lang_Runtime* this, jint on)
{
	abort();
}

/*
 * Enable/disable tracing of method calls.
 */
void
java_lang_Runtime_traceMethodCalls(struct Hjava_lang_Runtime* this, jint on)
{
	abort();
}
