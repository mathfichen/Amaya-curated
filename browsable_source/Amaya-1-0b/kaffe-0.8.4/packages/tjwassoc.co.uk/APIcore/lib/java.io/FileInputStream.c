/*
 * java.io.FileInputStream.c
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
#include "config-mem.h"
#include "config-io.h"
#include "files.h"
#include "defs.h"
#include "java.io.stubs/FileInputStream.h"
#include "java.io.stubs/FileDescriptor.h"
#include "kthread.h"
#include "../../../../kaffe/kaffevm/threadCalls.h"

/*
 * Open a file for input.
 */
void
java_io_FileInputStream_open(struct Hjava_io_FileInputStream* this, struct Hjava_lang_String* name)
{
	char str[MAXPATHLEN];
	int fd;

	javaString2CString(name, str, sizeof(str));
	fd = threadedOpen(str, O_RDONLY|O_BINARY, 0);
	unhand(unhand(this)->fd)->fd = fd;
	if (fd < 0) {
		SignalError(0, "java.io.IOException", SYS_ERROR);
	}
}

/*
 * Close file.
 */
void
java_io_FileInputStream_close(struct Hjava_io_FileInputStream* this)
{
	int r;

	if (unhand(unhand(this)->fd)->fd >= 0) {
		r = close(unhand(unhand(this)->fd)->fd);
		unhand(unhand(this)->fd)->fd = -1;
		if (r < 0) {
			SignalError(NULL, "java.io.IOException", SYS_ERROR);
		}
	}
}

/*
 * Read in bytes.
 */
jint
java_io_FileInputStream_readBytes(struct Hjava_io_FileInputStream* fh, HArrayOfByte* bytes, jint off, jint len)
{
	jint ret;

	ret = threadedRead(unhand(unhand(fh)->fd)->fd, &unhand(bytes)->body[off], len);
	if (ret < 0) {
		SignalError(NULL, "java.io.IOException", SYS_ERROR);
	}
	return (ret > 0 ? ret : -1);
}

/*
 * Read a single byte.
 */
jint
java_io_FileInputStream_read(struct Hjava_io_FileInputStream* fh)
{
	jint ret;
	unsigned char byte;

	ret = threadedRead(unhand(unhand(fh)->fd)->fd, &byte, 1);
	if (ret < 0) {
		SignalError(NULL, "java.io.IOException", SYS_ERROR);
	}
	return (ret > 0 ? byte : -1);
}

/*
 * Skip forward in stream.
 */
jlong
java_io_FileInputStream_skip(struct Hjava_io_FileInputStream* fh, jlong off)
{
	off_t orig;
	off_t ret;
	char buffer[100];
	int count;

	orig = lseek(unhand(unhand(fh)->fd)->fd, (off_t)0, 1);
	ret = lseek(unhand(unhand(fh)->fd)->fd, jlong2off_t(off), 1);
	if (ret >= 0) {
		return (off_t2jlong(ret-orig));
	}

	/* Not seekable - try just reading. */
	ret = 0;
	while (off > 0) {
		count = threadedRead(unhand(unhand(fh)->fd)->fd, buffer, 100);
		if (count == 0) {	/* Reached EOF. */
			break;
		}
		if (count < 0) {
			SignalError(NULL, "java.io.IOException", SYS_ERROR);
		}
		ret += count;
		off -= count;
	}
	return off_t2jlong(ret);
}

/*
 * Return the number of bytes available to read without blocking.
 */
jint
java_io_FileInputStream_available(struct Hjava_io_FileInputStream* fh)
{
	int nr;
	int r;

	r = ioctl(unhand(unhand(fh)->fd)->fd, FIONREAD, &nr);
	if (r < 0) {
		nr = 0;
	}

#if 0
	/* This uses available() to work out if we can read - but what
	 * happens at the end of file?
	 */
	int fd;
	static struct timeval tm = { 0, 0 };
	fd_set rd;

	fd = unhand(unhand(fh)->fd)->fd;
	FD_ZERO(&rd);
	FD_SET(fd, &rd);
	r = select(fd+1, &rd, NULL, NULL, &tm);
	if (r == 1) {
		nr = 1;
	}
	else {
		nr = 0;
	}
#endif

	return (nr);
}
