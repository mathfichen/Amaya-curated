/*
 * external.c
 * Handle method calls to other languages.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#define	DBG(s)
#define	LDBG(s)

#include "config.h"
#include "config-std.h"
#include "config-mem.h"
#include "jtypes.h"
#include "access.h"
#include "object.h"
#include "constants.h"
#include "classMethod.h"
#include "slots.h"
#include "external.h"
#include "errors.h"
#include "exception.h"
#include "slib.h"
#include "paths.h"
#include "support.h"
#if defined(NO_SHARED_LIBRARIES)
#include "../../packages/external_native.h"
#endif

#if defined(NO_SHARED_LIBRARIES)
#define	STUB_PREFIX		""
#define	STUB_PREFIX_LEN		0
#define	STUB_POSTFIX		""

/*
 * Some version of dlsym need an underscore, some don't.
 */
#elif defined(INTERPRETER)

#if defined(HAVE_DYN_UNDERSTORE)
#define	STUB_PREFIX		"_Kaffe_"
#define	STUB_PREFIX_LEN		7
#else
#define	STUB_PREFIX		"Kaffe_"
#define	STUB_PREFIX_LEN		6
#endif
#define	STUB_POSTFIX		"_stub"

#elif defined(TRANSLATOR)

#if defined(HAVE_DYN_UNDERSTORE)
#define	STUB_PREFIX		"_"
#define	STUB_PREFIX_LEN		1
#else
#define	STUB_PREFIX		""
#define	STUB_PREFIX_LEN		0
#endif
#define	STUB_POSTFIX		""

#endif

#if !defined (NO_SHARED_LIBRARIES)
static struct {
	LIBRARYHANDLE	desc;
	char*		name;
	int		ref;
} libHandle[MAXLIBS];
#endif

static char* libraryPath;

/*
 * Error stub function.  Point unresolved link errors here to avoid
 * problems.
 */
static
void*
error_stub(void)
{
	return (0);
}

void
initNative(void)
{
#if !defined(NO_SHARED_LIBRARIES)
	char lib[MAXLIBPATH];
	char* ptr;
	char* nptr;

	ptr = getenv(LIBRARYPATH);
	if (ptr == 0) {
#if defined(DEFAULT_LIBRARYPATH)
		ptr = DEFAULT_LIBRARYPATH;
#else
		fprintf(stderr, "No library path set.\n");
		return;
#endif
	}
	libraryPath = checked_malloc(strlen(ptr) + 1);
	strcpy(libraryPath, ptr);

	LIBRARYINIT();

	/* Find the default library */
	for (ptr = libraryPath; ptr != 0; ptr = nptr) {
		nptr = strchr(ptr, PATHSEP);
		if (nptr == 0) {
			strcpy(lib, ptr);
		}
		else if (nptr == ptr) {
			nptr++;
			continue;
		}
		else {
			strncpy(lib, ptr, nptr - ptr);
			lib[nptr-ptr] = 0;
			nptr++;
		}
		strcat(lib, DIRSEP);
		strcat(lib, NATIVELIBRARY);
		strcat(lib, LIBRARYSUFFIX);

		if (loadNativeLibrary(lib) == 0) {
			return;
		}
	}
	fprintf(stderr, "Failed to locate native library in path:\n");
	fprintf(stderr, "\t%s\n", libraryPath);
	fprintf(stderr, "Aborting.\n");
	fflush(stderr);
	exit(1);
#else
	int i;

	/* Initialise the native function table */
	for (i = 0; default_natives[i].name != 0; i++) {
		addNativeMethod(default_natives[i].name, default_natives[i].func);
	}
#endif
}

int
loadNativeLibrary(char* lib)
{
#if !defined(NO_SHARED_LIBRARIES)
	int i;
	int j;

	/* Find a library handle.  If we find the library has already
	 * been loaded, don't bother to get it again, just increase the
	 * reference count.
	 */
	for (i = 0; i < MAXLIBS; i++) {
		if (libHandle[i].desc == 0) {
			goto open;
		}
		if (strcmp(libHandle[i].name, lib) == 0) {
			libHandle[i].ref++;
			return (0);
		}
	}
	return (-1);

	/* Open the library */
	open:
	LIBRARYLOAD(libHandle[i].desc, lib);
	if (libHandle[i].desc == 0) {
LDBG(		printf("Library load failed: %s\n", LIBRARYERROR());	)
		return (-1);
	}
	libHandle[i].ref = 1;
	libHandle[i].name = checked_malloc(strlen(lib) + 1);
	strcpy(libHandle[i].name, lib);
#endif
	return (0);
}

void
native(methods* m)
{
	char stub[MAXSTUBLEN];
	char* ptr;
	int i;
	void* func;

	/* Construct the stub name */
	strcpy(stub, STUB_PREFIX);
	ptr = m->class->name->data;
	for (i = STUB_PREFIX_LEN; *ptr != 0; ptr++, i++) {
		if (*ptr == '/') {
			stub[i] = '_';
		}
		else {
			stub[i] = *ptr;
		}
	}
	stub[i] = '_';
	stub[i+1] = 0;
	strcat(stub, m->name->data);
	strcat(stub, STUB_POSTFIX);

DBG(	printf("Method = %s.%s%s\n", m->class->name, m->name->data, m->signature->data);)
DBG(	printf("Native stub = '%s'\n", stub);fflush(stdout);		)

#if !defined(NO_SHARED_LIBRARIES)
	/* Find the native method */
	LIBRARYFUNCTION(func, stub);
	if (func != 0) {
		/* Fill it in */
		m->ncode = func;
		return;
	}
#else
	/*
	 * If we don't support shared libraries, fall back on the
	 * wrapped up native method table.
	 */
	for (i = 0; native_funcs[i].name != 0; i++) {
		if (strcmp(native_funcs[i].name, stub) == 0) {
			m->ncode = native_funcs[i].func;
			return;
		}
	}
#endif
	fprintf(stderr, "Failed to locate native function:\n\t%s.%s%s\n", m->class->name->data, m->name->data, m->signature->data);
	fflush(stderr);
	m->ncode = (void*)error_stub;

        throwException(UnsatisfiedLinkError);
}

/*
 * Return the library path.
 */
char*
getLibraryPath(void)
{
	return (libraryPath);
}
