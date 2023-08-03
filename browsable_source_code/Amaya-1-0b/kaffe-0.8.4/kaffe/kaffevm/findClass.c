/*
 * findClass.c
 * Search the CLASSPATH for the given class name.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#define	FDBG(s)
#define ZDBG(s)
#define	PDBG(s)
#define	CDBG(s)

#include "config.h"
#include "config-std.h"
#include "config-io.h"
#include "config-mem.h"
#include "gtypes.h"
#include "file.h"
#include "exception.h"
#include "zipfile.h"
#include "readClass.h"
#include "paths.h"
#include "flags.h"
#include "errors.h"
#include "locks.h"

#define	CLASSPATH1	"KAFFE_CLASSPATH"
#define	CLASSPATH2	"CLASSPATH"
#define	MAXBUF		256
#define	MAXPATHELEM	16

#define	CP_INVALID	0
#define	CP_FILE		1
#define	CP_DIR		2

static struct {
	int	type;
	char*	path;
	ZipFile	zipf;
} classpath[MAXPATHELEM+1];

char* realClassPath;

void initClasspath(void);

/*
 * Find the named class in a directory or zip file.
 */
Class*
findClass(Class* class, char* cname)
{
	int i;
	char buf[MAXBUF];
	int fp;
	struct stat sbuf;
	classFile hand;
	ZipDirectory *zipd;
	int j;

	/* Look for the class */
CDBG(	printf("Scanning for class %s\n", cname);		)

	intsDisable();

	for (i = 0; classpath[i].path != 0; i++) {
		switch (classpath[i].type) {
		case CP_FILE:
ZDBG(			printf("Opening zip file %s for %s\n", classpath[i].path, cname); )
			if (classpath[i].zipf.central_directory == 0) {
				classpath[i].zipf.fd = open(classpath[i].path, O_RDONLY|O_BINARY);
				if (classpath[i].zipf.fd < 0 || read_zip_archive (&classpath[i].zipf) != 0) {
					continue;
				}
				close(classpath[i].zipf.fd);
			}

			strcpy(buf, cname);
			strcat(buf, ".class");
			zipd = (ZipDirectory*)classpath[i].zipf.central_directory;
			for (j = 0; j < classpath[i].zipf.count; j++, zipd = ZIPDIR_NEXT(zipd)) {
ZDBG(	printf ("%d: size:%d, name(#%d)%s, offset:%d\n", i, zipd->size,
  zipd->filename_length, ZIPDIR_FILENAME (zipd), zipd->filestart);	)
				if (buf[0] == ZIPDIR_FILENAME(zipd)[0] && strcmp(buf, ZIPDIR_FILENAME(zipd)) == 0) {
ZDBG(					printf("FOUND!!\n");		)

#if defined(HAVE_MMAP) && defined(HAVE_UNALIGNEDACCESS)
					hand.size = zipd->size;
					hand.buf = classpath[i].zipf.mmap_base + zipd->filestart;
					if (flag_classload) {
						printf("Loading class '%s' from zipfile '%s'.\n", cname, classpath[i].path);
					}
					goto mmap_found;
#else
					fp = open(classpath[i].path, O_RDONLY|O_BINARY);
					lseek(fp, zipd->filestart, SEEK_SET);
					hand.size = zipd->size;
					if (flag_classload) {
						printf("Loading class '%s' from zipfile '%s'.\n", cname, classpath[i].path);
					}
					goto found;
#endif
				}
			}
			continue;

		case CP_DIR:
			strcpy(buf, classpath[i].path);
			strcat(buf, DIRSEP);
			strcat(buf, cname);
			strcat(buf, ".class");
FDBG(			printf("Opening java file %s for %s\n", buf, cname); )
			fp = open(buf, O_RDONLY|O_BINARY);
			if (fp < 0 || fstat(fp, &sbuf) < 0) {
				continue;
			}
			hand.size = sbuf.st_size;

			if (flag_classload) {
				printf("Loading class '%s' from file '%s'.\n", cname, buf);
			}

		found:
			hand.base = checked_malloc(hand.size);
			hand.buf = hand.base;
			if (read(fp, hand.buf, hand.size) != hand.size) {
				abort();
			}
			close(fp);
			class = readClass(class, &hand, NULL);
			checked_free(hand.base);
			break;

#if defined(HAVE_MMAP) && defined(HAVE_UNALIGNEDACCESS)
		mmap_found:
			class = readClass(class, &hand, NULL);
			break;
#endif

		/* Ignore bad entries */
		default:
			continue;
		}
		intsRestore();
		return (class);
	}
	/*
	 * Certain classes are essential.  If we don't find them then
	 * abort.
	 */
	if (strcmp(cname, "java/lang/ClassNotFoundException") == 0 ||
	    strcmp(cname, "java/lang/Object") == 0) {
		fprintf(stderr, "Cannot find essential class '%s' in class library ... aborting.\n", cname);
		abort();
	}
	intsRestore();
	return (0);
}

/*
 * Initialise class path.
 */
void
initClasspath(void)
{
	struct stat sbuf;
	char* cp;
	int i;

	/* If classpath isn't set, get if from the environment. */
	if (realClassPath == 0) {
		cp = getenv(CLASSPATH1);
		if (cp == 0) {
			cp = getenv(CLASSPATH2);
		}
		if (cp == 0) {
#if defined(DEFAULT_CLASSPATH)
			cp = DEFAULT_CLASSPATH;
#else
			fprintf(stderr, "CLASSPATH is not set!\n");
			exit(1);
#endif
		}
		realClassPath = checked_malloc(strlen(cp) + 1);
		strcpy(realClassPath, cp);
	}
	cp = realClassPath;

PDBG(	printf("initClasspath(): '%s'\n", cp);				)
	for (i = 0; cp != 0 && i < MAXPATHELEM; i++) {
		classpath[i].path = cp;
		cp = strchr(cp, PATHSEP);
		if (cp != 0) {
			*cp = 0;
			cp++;
		}
		if (stat(classpath[i].path, &sbuf) < 0) {
			classpath[i].type = CP_INVALID;
		}
		else if (S_ISDIR(sbuf.st_mode)) {
			classpath[i].type = CP_DIR;
		}
		else {
			classpath[i].type = CP_FILE;
		}
PDBG(		printf("path '%s' type %d\n", classpath[i].path, classpath[i].type); )
	}
	i++;
	classpath[i].path = 0;
}

/*
 * Add an entry in the Classpath dynamically.
 */
int
addClasspath(char *cp)
{
	struct stat sbuf;
	int i;

	/* If classpath isn't set, initialize it */
	if (realClassPath == 0) initClasspath();

PDBG(	printf("addClasspath(): '%s'\n", cp);				)
	for (i = 0; i < MAXPATHELEM; i++) {
	    if (classpath[i].path == 0) break;
	    if (!strcmp(cp, classpath[i].path)) return(0); /* already in */
	}
	if (i >= MAXPATHELEM) {
	    fprintf(stderr, "addClasspath : CLASSPATH is full!\n");
	    return(-1);
	}
	classpath[i].path = strdup(cp);
	if (stat(classpath[i].path, &sbuf) < 0) {
		classpath[i].type = CP_INVALID;
	}
	else if (S_ISDIR(sbuf.st_mode)) {
		classpath[i].type = CP_DIR;
	}
	else {
		classpath[i].type = CP_FILE;
	}
PDBG(		printf("path '%s' type %d\n", classpath[i].path, classpath[i].type); )
	i++;
	classpath[i].path = 0;
}
