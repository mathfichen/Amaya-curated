/*
 * main.c
 * Kick off program.
 *
 * Copyright (c) 1996, 1997
 *	T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>
 */

#include "config.h"
#include "config-std.h"
#include "config-mem.h"
#include "jtypes.h"
#include "access.h"
#include "object.h"
#include "constants.h"
#include "classMethod.h"
#include "baseClasses.h"
#include "thread.h"
#include "support.h"
#include "slib.h"
#include "errors.h"
#include "exception.h"
#include "md.h"

void initialiseKaffe(void);
Hjava_lang_Object* AllocObjectArray(int, char*);
Hjava_lang_String* makeJavaString(char*, int);
extern jword do_execute_java_class_method(char*, char*, char*, ...);

extern char* engine_name;
extern char* engine_version;

extern int flag_verify;
extern int flag_gc;
extern int flag_classload;
extern int flag_jit;
extern int flag_trace;

extern char* realClassPath;
extern int threadStackSize;
extern int gcHeapsize;

static int options(char**);
static void usage(void);

#define	MAIN		"main"
#define	MAINSIG		"([Ljava/lang/String;)V"
#define	STRINGSIG	"Ljava/lang/String;"

/*
 * MAIN
 */
int
main(int argc, char* argv[])
{
	Hjava_lang_Object* args;
	Hjava_lang_String** str;
	int i;
	int farg;

	/* Process program options */
	farg = options(argv);

	/* Get the class name to start with */
	if (argv[farg] == 0) {
		usage();
		exit(1);
	}

	/* Initialise */
	initialiseKaffe();

	/* Build an array of strings as the arguments */
	args = newRefArray (StringClass, argc-(farg+1));

	/* Build each string and put into the array */
	str = (Hjava_lang_String**)OBJARRAY_DATA(args);
	for (i = farg+1; i < argc; i++) {
		str[i-(farg+1)] = makeJavaString(argv[i], strlen(argv[i]));
	}

	/* Kick it */
	do_execute_java_class_method(argv[farg], MAIN, MAINSIG, args);
	killThread();
	/* This should never return */
	exit(1);
	return(1);
}

/*
 * Process program's flags.
 */
static
int
options(char** argv)
{
	int i;
	int sz;
	userProperty* prop;

	for (i = 1; argv[i] != 0; i++) {
		if (argv[i][0] != '-') {
			break;
		}

		if (strcmp(argv[i], "-help") == 0) {
			usage();
			exit(0);
		}
		else if (strcmp(argv[i], "-version") == 0) {
			fprintf(stderr, "Kaffe Virtual Machine\n");
			fprintf(stderr, "Copyright (c) 1997 T. J. Wilkinson & Associates, London, UK.\n");
			fprintf(stderr, "Engine: %s   Version: %s\n", engine_name, engine_version);
			exit(0);
		}
		else if (strcmp(argv[i], "-classpath") == 0) {
			i++;
			if (argv[i] == 0) {
				fprintf(stderr, "Error: No path found for -classpath option.\n");
				exit(1);
			}
			realClassPath = argv[i];
		}
		else if (strcmp(argv[i], "-ss") == 0) {
			i++;
			if (argv[i] == 0) {
				fprintf(stderr, "Error: No stack size found for -ss option.\n");
				exit(1);
			}
			sz = atol(argv[i]);
			if (sz < THREADSTACKSIZE) {
				fprintf(stderr, "Warning: Attempt to set stack size smaller than %d - ignored.\n", THREADSTACKSIZE);
			}
			else {
				threadStackSize = sz;
			}
		}
		else if (strcmp(argv[i], "-mx") == 0) {
			i++;
			if (argv[i] == 0) {
				fprintf(stderr, "Error: No heap size found for -mx option.\n");
				exit(1);
			}
			sz = atol(argv[i]);
			gcHeapsize = sz;
		}
		else if (strcmp(argv[i], "-verify") == 0) {
			flag_verify = 3;
		}
		else if (strcmp(argv[i], "-verifyremote") == 0) {
			flag_verify = 2;
		}
		else if (strcmp(argv[i], "-noverify") == 0) {
			flag_verify = 0;
		}
		else if (strcmp(argv[i], "-verbosegc") == 0) {
			flag_gc = 1;
		}
		else if (strcmp(argv[i], "-verbosejit") == 0) {
			flag_jit = 1;
		}
		else if (strcmp(argv[i], "-verbose") == 0 || strcmp(argv[i], "-v") == 0) {
			flag_classload = 1;
		}
		else if (strcmp(argv[i], "-debug") == 0) {
			flag_trace = 1;
		}
		else if (argv[i][1] ==  'D') {
			/* Set a property */
			prop = malloc(sizeof(userProperty));
			assert(prop != 0);
			prop->next = userProperties;
			userProperties = prop;
			for (sz = 2; argv[i][sz] != 0; sz++) {
				if (argv[i][sz] == '=') {
					argv[i][sz] = 0;
					sz++;
					break;
				}
			}
			prop->key = &argv[i][2];
			prop->value = &argv[i][sz];
		}
		/* The following options are not supported and will be
		 * ignored for compatibility purposes.
		 */
		else if (strcmp(argv[i], "-noasyncgc") == 0 ||
		   strcmp(argv[i], "-cs") == 0 ||
		   strcmp(argv[i], "-checksource") == 0 ||
		   strcmp(argv[i], "-prof") == 0) {
		}
		else if (strcmp(argv[i], "-ms") == 0 ||
		   strcmp(argv[i], "-oss") == 0) {
			i++;
		}
		else {
			fprintf(stderr, "Unknown flag: %s\n", argv[i]);
		}
	}

	/* Return first no-flag argument */
	return (i);
}

/*
 * Print usage message.
 */
static
void
usage(void)
{
	fprintf(stderr, "usage: kaffe [-options] class\n");
	fprintf(stderr, "Options are:\n");
	fprintf(stderr, "	-help			Print this message\n");
	fprintf(stderr, "	-version		Print version number\n");
	fprintf(stderr, "	-ss <size>		Maximum native stack size\n");
	fprintf(stderr, "	-mx <size> 		Maximum heap size\n", gcHeapsize / (1024*1024));
	fprintf(stderr, "	-classpath <path>	Set classpath\n");
	fprintf(stderr, "	-verify *		Verify all bytecode\n");
	fprintf(stderr, "	-verifyremote *		Verify bytecode loaded from network\n");
	fprintf(stderr, "	-noverify		Do not verify any bytecode\n");
	fprintf(stderr, "	-D<property>=<value>	Set a property\n");
	fprintf(stderr, "	-verbosegc		Print message during garbage collection\n");
	fprintf(stderr, "	-v, -verbose		Be verbose\n");
	fprintf(stderr, "	-verbosejit		Print message during JIT code generation\n");
	fprintf(stderr, "	-debug 			Trace method calls\n");
	fprintf(stderr, "	-noasyncgc *		Do not garbage collect asynchronously\n");
	fprintf(stderr, "	-cs, -checksource *	Check source against class files\n");
	fprintf(stderr, "	-ms <size> *		Initial heap size\n");
	fprintf(stderr, "	-oss <size> *		Maximum java stack size\n");
	fprintf(stderr, "	-prof *			?\n");
	fprintf(stderr, "  * Option currently ignored.\n");
}

void
throwOutOfMemory ()
{
	if (OutOfMemoryError != NULL)
		throwException(OutOfMemoryError);
	fprintf (stderr, "(Insufficient memory)\n");
	exit (-1);
}
