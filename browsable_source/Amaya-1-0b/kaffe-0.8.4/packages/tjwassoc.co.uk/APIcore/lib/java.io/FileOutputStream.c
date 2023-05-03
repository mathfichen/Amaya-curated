/*
 * java.io.FileOutputStream.c
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "lib-license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#include "config.h"
#include "config-std.h"
#include "config-io.h"
#include "config-mem.h"
#include "files.h"
#include "defs.h"
#include "java.io.stubs/FileOutputStream.h"
#include "java.io.stubs/FileDescriptor.h"
#include "kthread.h"
#include "../../../../kaffe/kaffevm/threadCalls.h"

/*
 * Open a file for output.
 */
void
java_io_FileOutputStream_open(struct Hjava_io_FileOutputStream* fh, struct Hjava_lang_String* nm)
{
	int fd;
	char str[MAXPATHLEN];

	javaString2CString(nm, str, sizeof(str));

	fd = threadedOpen(str, O_WRONLY|O_CREAT|O_BINARY|O_TRUNC, 0666);
	unhand(unhand(fh)->fd)->fd = fd;
	if (fd < 0) {
		SignalError(NULL, "java.io.IOException", SYS_ERROR);
	}
}

/*
 * Close a file.
 */
void
java_io_FileOutputStream_close(struct Hjava_io_FileOutputStream* fh)
{
	int r;

	if (unhand(unhand(fh)->fd)->fd >= 0) {
		r = close(unhand(unhand(fh)->fd)->fd);
		unhand(unhand(fh)->fd)->fd = -1;
		if (r < 0) {
			SignalError(NULL, "java.io.IOException", SYS_ERROR);
		}
	}
}

/*
 * Write bytes to file.
 */
void
java_io_FileOutputStream_writeBytes(struct Hjava_io_FileOutputStream* fh, HArrayOfByte* byteArray, jint start, jint len)
{
	int fd;
	int r;

	fd = unhand(unhand(fh)->fd)->fd;
	r = threadedWrite(fd, &unhand(byteArray)->body[start], len);
	if (r < 0) {
		SignalError(NULL, "java.io.IOException", SYS_ERROR);
	}
}

/*
 * Write a byte to file.
 */
void
java_io_FileOutputStream_write(struct Hjava_io_FileOutputStream* fh, jint byte)
{
	int fd;
	int r;
	unsigned char b = byte;

	fd = unhand(unhand(fh)->fd)->fd;
	r = threadedWrite(fd, &b, 1);
	if (r < 0) {
		SignalError(NULL, "java.io.IOException", SYS_ERROR);
	}
}
