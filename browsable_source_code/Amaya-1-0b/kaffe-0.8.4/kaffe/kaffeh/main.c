/*
 * main.c
 * Generate native code stubs from .class files.
 *
 * Copyright (c) 1996, 1997
 *	T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#include "config.h"
#include "config-std.h"
#include "config-mem.h"

#define	BUFSZ	100
#define	PATHSZ	1024

FILE* include;
FILE* stub = 0;
char className[BUFSZ];
char pathName[BUFSZ];
char includeName[BUFSZ];
char stubName[BUFSZ];
char realClassPath[PATHSZ];

int flag_shrt = 0;
int flag_stub = 0;
char* postfix = "";
char* outputName = 0;
char* directoryName = 0;

static void usage(void);
static int options(char**);

/*
 * MAIN
 */
int
main(int argc, char* argv[])
{
	char* nm;
	int i;
	int j;
	int farg;

	/* Process arguments */
	farg = options(argv);

	if (argv[farg] == 0) {
		usage();
		exit(1);
	}

	/* If we specify an output file, use that instead */
	if (outputName != 0) {
		FILE* file = fopen(outputName, "w");;
		if (file == 0) {
			fprintf(stderr, "Failed to create '%s'.\n", outputName);
			exit(1);
		}
		if (flag_stub == 0) {
			include = file;
			/* Setup the include ifdef name */
			strcpy(className, outputName);
			initInclude();
		}
		else {
			stub = file;
			initStub();
		}
	}

	for (nm = argv[farg]; nm != 0; nm = argv[++farg]) {
		/* Prepend a directory name if given */
		if (directoryName != 0) {
			strcpy(stubName, directoryName);
			strcpy(includeName, directoryName);
			j = strlen(directoryName);
			stubName[j] = '/';
			includeName[j] = '/';
			j++;
		}
		else {
			j = 0;
		}
		for (i = 0; nm[i] != 0; i++) {
			switch (nm[i]) {
			case '/':
			case '.':
				className[i] = '_';
				pathName[i] = '/';
				includeName[j+i] = '_';
				stubName[j+i] = '_';
				break;
			default:
				className[i] = nm[i];
				pathName[i] = nm[i];
				includeName[j+i] = nm[i];
				stubName[j+i] = nm[i];
				break;
			}
		}
		className[i] = 0;
		pathName[i] = 0;
		includeName[j+i] = 0;
		stubName[j+i] = 0;

		/* If we are in 'base' mode, truncate the include and stub name
		 * to just the basename.
		 */
		if (flag_shrt == 1) {
			for (i = strlen(stubName); i >= 0; i--) {
				if (stubName[i] == '_') {
					strcpy(stubName, &stubName[i+1]);
					break;
				}
			}
			for (i = strlen(includeName); i >= 0; i--) {
				if (includeName[i] == '_') {
					strcpy(includeName, &includeName[i+1]);
					break;
				}
			}
		}

		strcat(includeName, postfix);
		strcat(stubName, postfix);
		strcat(includeName, ".h");
		strcat(stubName, ".c");

		if (outputName == 0) {
			if (flag_stub == 0) {
				include = fopen(includeName, "w");
				if (include == 0) {
					fprintf(stderr, "Failed to create '%s'.\n", includeName);
					exit(1);
				}
				initInclude();
			}
			else {
				stub = fopen(stubName, "w");
				if (stub == 0) {
					fprintf(stderr, "Failed to create '%s'.\n", stubName);
					exit(1);
				}
				initStub();
			}
		}
		if (flag_stub == 0) {
			startInclude();
		}
		else {
			startStub();
		}

		findClass(pathName);

		if (outputName == 0) {
			if (stub != 0) {
				fclose(stub);
			}
			if (include != 0) {
				endInclude();
				fclose(include);
			}
		}
	}

	if (outputName != 0) {
		if (stub != 0) {
			fclose(stub);
		}
		if (include != 0) {
			endInclude();
			fclose(include);
		}
	}

	exit(0);
}

/*
 * Process program's flags.
 */
static
int
options(char** argv)
{
	int i;

	for (i = 1; argv[i] != 0; i++) {
		if (argv[i][0] != '-') {
			break;
		}

		if (strcmp(argv[i], "-help") == 0) {
			usage();
			exit(0);
		}
		else if (strcmp(argv[i], "-version") == 0) {
			fprintf(stderr, "Kaffeh Stub Generator\n");
			fprintf(stderr, "Copyright (c) 1997 T. J. Wilkinson & Associates, London, UK.\n");
			fprintf(stderr, "Version: %s\n", KVER);
			exit(0);
		}
		else if (strcmp(argv[i], "-base") == 0) {
			flag_shrt = 1;
		}
		else if (strcmp(argv[i], "-stubs") == 0) {
			flag_stub = 1;
		}
		else if (strcmp(argv[i], "-classpath") == 0) {
			i++;
			strcpy(realClassPath, argv[i]);
		}
		else if (strcmp(argv[i], "-postfix") == 0) {
			i++;
			postfix = argv[i];
		}
		else if (strcmp(argv[i], "-o") == 0) {
			i++;
			outputName = argv[i];
		}
		else if (strcmp(argv[i], "-d") == 0) {
			i++;
			directoryName = argv[i];
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
	fprintf(stderr, "usage: kaffeh [-options] class ...\n");
	fprintf(stderr, "Options are:\n");
	fprintf(stderr, "	-help			Print this message\n");
	fprintf(stderr, "	-version		Print version number\n");
	fprintf(stderr, "	-classpath <path>	Set classpath\n");
	fprintf(stderr, "	-stubs			Generate stub rather than include\n");
	fprintf(stderr, "	-o <file>		Generate all output to the given file\n");
	fprintf(stderr, "	-d <directory>		Directory for the output\n");
	fprintf(stderr, "	-base			Truncate stub and include names\n");
	fprintf(stderr, "	-postfix <pfix>		Append the postfix to the generated file's name\n");
}

void
throwOutOfMemory ()
{
	fprintf (stderr, "(Insufficient memory)\n");
	exit (-1);
}
