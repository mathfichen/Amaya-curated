/*
 * java.io.File.c
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
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <native.h>
#include "defs.h"
#include "files.h"
#include "system.h"
#include "java.io.stubs/File.h"

/*
 * Is named item a file?
 */
jint /* bool */
java_io_File_isFile0(struct Hjava_io_File* this)
{
	struct stat buf;
	char str[MAXPATHLEN];
	int r;

	javaString2CString(unhand(this)->path, str, sizeof(str));

	r = stat(str, &buf);
	if (r == 0 && S_ISREG(buf.st_mode)) {
		return (1);
	}
	else {
		return (0);
	}
}

/*
 * Is named item a directory?
 */
jint /* bool */
java_io_File_isDirectory0(struct Hjava_io_File* this)
{
	struct stat buf;
	char str[MAXPATHLEN];
	int r;

	javaString2CString(unhand(this)->path, str, sizeof(str));

	r = stat(str, &buf);
	if (r == 0 && S_ISDIR(buf.st_mode)) {
		return (1);
	}
	else {
		return (0);
	}
}

/*
 * Does named file exist?
 */
jint /* bool */
java_io_File_exists0(struct Hjava_io_File* this)
{
	struct stat buf;
	char str[MAXPATHLEN];
	int r;

	javaString2CString(unhand(this)->path, str, sizeof(str));

	r = stat(str, &buf);
	if (r < 0) {
		return (0);
	}
	else {
		return (1);
	}
}

/*
 * Last modified time on file.
 */
jlong
java_io_File_lastModified0(struct Hjava_io_File* this)
{
	struct stat buf;
	char str[MAXPATHLEN];
	int r;

	javaString2CString(unhand(this)->path, str, sizeof(str));

	r = stat(str, &buf);
	if (r != 0) {
		return (off_t2jlong(0));
	}
	return (buf.st_mtime * (jlong)1000);
}

/*
 * Can I write to this file?
 */
jint /* bool */
java_io_File_canWrite0(struct Hjava_io_File* this)
{
	char str[MAXPATHLEN];
	int r;

	javaString2CString(unhand(this)->path, str, sizeof(str));
	r = access(str, W_OK);
	return (r < 0 ? 0 : 1);
}

/*
 * Can I read from this file.
 */
jint /* bool */
java_io_File_canRead0(struct Hjava_io_File* this)
{
	char str[MAXPATHLEN];
	int r;

	javaString2CString(unhand(this)->path, str, sizeof(str));
	r = access(str, R_OK);
	return (r < 0 ? 0 : 1);
}

/*
 * Return length of file.
 */
jlong
java_io_File_length0(struct Hjava_io_File* this)
{
	struct stat buf;
	char str[MAXPATHLEN];
	int r;

	javaString2CString(unhand(this)->path, str, sizeof(str));

	r = stat(str, &buf);
	return (off_t2jlong(r == 0 ? buf.st_size : 0));
}

/*
 * Create a directory.
 */
jint /* bool */
java_io_File_mkdir0(struct Hjava_io_File* this)
{
	char str[MAXPATHLEN];
	int r;

	javaString2CString(unhand(this)->path, str, sizeof(str));
#if defined(__BORLANDC__)
	r = mkdir(str);
#else
	r = mkdir(str, 0777);
#endif
	return (r < 0 ? 0 : 1);
}

/*
 * Rename a file.
 */
jint /* bool */
java_io_File_renameTo0(struct Hjava_io_File* this, struct Hjava_io_File* that)
{
	char str[MAXPATHLEN];
	char str2[MAXPATHLEN];
	int r;

	javaString2CString(unhand(this)->path, str, sizeof(str));
	javaString2CString(unhand(that)->path, str2, sizeof(str2));

	r = rename(str, str2);
	return (r < 0 ? 0 : 1);
}

/*
 * Delete a file.
 */
jint /* bool */
java_io_File_delete0(struct Hjava_io_File* this)
{
	char str[MAXPATHLEN];
	int r;

	javaString2CString(unhand(this)->path, str, sizeof(str));
	r = remove(str);
	return(r < 0 ? 0 : 1);
}

/*
 * Get a directory listing.
 */
HArrayOfObject* /* [Ljava.lang.String; */
java_io_File_list0(struct Hjava_io_File* this)
{
	char path[MAXPATHLEN];
	DIR* dir;
	struct dirent* entry;
	struct dentry {
		struct dentry* next;
		struct Hjava_lang_String* name;
	};
	struct dentry* dirlist;
	struct dentry* mentry;
	HArrayOfObject* array;
	int count;
	int i;

	javaString2CString(unhand(this)->path, path, sizeof(path));

	dir = opendir(path);
	if (dir == 0) {
		return (0);
	}

	dirlist = 0;
	count = 0;
	while ((entry = readdir(dir)) != 0) {
		/* We skip '.' and '..' */
		if (strcmp(".", entry->d_name) == 0 ||
		    strcmp("..", entry->d_name) == 0) {
			continue;
		}
		mentry = checked_malloc(sizeof(struct dentry));
		assert(mentry != 0);
		mentry->name = makeJavaString(entry->d_name, NAMLEN(entry));
		mentry->next = dirlist;
		dirlist = mentry;
		count++;
	}
	closedir(dir);

	array = (HArrayOfObject*)AllocObjectArray(count, "Ljava/lang/String");
	assert(array != 0);
	for (i = 0; i < count; i++) {
		mentry = dirlist;
		dirlist = mentry->next;
		unhand(array)->body[i] = (Hjava_lang_Object*)mentry->name;
		checked_free(mentry);
	}

	return (array);
}

/*
 * Is this filename absolute?
 */
jint /* bool */
java_io_File_isAbsolute(struct Hjava_io_File* this)
{
	char str[2];

	javaString2CString(unhand(this)->path, str, sizeof(str));

	if (str[0] == file_seperator[0]) {
		return (1);
	}
	else {
		return (0);
	}
}
