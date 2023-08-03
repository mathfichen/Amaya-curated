/*
 * Copyright (c) 1996 Cygnus Support
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Per Bothner <bothner@cygnus.com>, October 1996.
 */

#include "config.h"
#include "config-std.h"
#include "config-mem.h"
#include "jtypes.h"
#include "constants.h"
#include "object.h"
#if defined(KAFFEH)
#undef	intsDisable
#undef	intsRestore
#undef	gc_malloc
#undef	gc_free
#define intsDisable() /* nothing */
#define intsRestore() /* nothing */
#define	gc_malloc(s, t) checked_calloc(s, 1)
#define	gc_free(m)	checked_free(m)
#endif

#if INTERN_UTF8CONSTS
static Utf8Const** utf8hash = NULL;
static int utf8hash_size = 0;  /* Number of slots available in utf8hash.
		       * Assumed be power of 2! */
static int utf8hash_count = 0;  /* Number of slots used in utf8hash. */
#endif

extern void throwOutOfMemory(void);

void*
checked_malloc (size_t size)
{
	void* ptr;

	intsDisable();
	ptr = malloc (size);
	intsRestore();
	if (ptr == 0) {
		throwOutOfMemory ();
	}
	return ptr;
}

void*
checked_calloc (size_t nelem, size_t elsize)
{
	void* ptr;

	intsDisable();
	ptr = calloc (nelem, elsize);
	intsRestore();
	if (ptr == 0) {
		throwOutOfMemory ();
	}
	return ptr;
}

void*
checked_realloc (void *ptr, size_t size)
{
	intsDisable();
	if (ptr == NULL) {
		ptr = malloc (size);
	}
	else {
		ptr = realloc (ptr, size);
	}
	intsRestore();
	if (ptr == 0) {
		throwOutOfMemory ();
	}
	return ptr;
}

void
checked_free(void* mem)
{
	intsDisable();
	if (mem != NULL) {
		free(mem);
	}
	intsRestore();
}

/* Count the number of Unicode chars encoded in a given Ut8 string. */

int
strLengthUtf8 (char* str, int len)
{
  register unsigned char* ptr = (unsigned char*) str;
  register unsigned char *limit = ptr + len;
  int str_length = 0;
  for (; ptr < limit; str_length++) {
    if (UTF8_GET (ptr, limit) < 0) {
      return -1;
    }
  }
  return str_length;
}

/* Calculate a hash value for a string encoded in Utf8 format.
 * This returns the same hash value as specified or java.lang.String.hashCode.
 */

int32
hashUtf8String (char* str, int len)
{
  int str_length = strLengthUtf8 (str, len);
  register unsigned char* ptr = (unsigned char*) str;
  register unsigned char *limit = ptr + len;
  int32 hash = 0;
  if (str_length <= 15) {
    for (; ptr < limit;) {
      int ch = UTF8_GET (ptr, limit);
      hash = (37 * hash) + ch;
    }
  }
  else {
    int i = 0;
    for (; i < str_length;  i++) {
      int ch = UTF8_GET (ptr, limit);
      if ((i & 7) == 0)
	hash = (39 * hash) + ch;
    }
  }
  return hash;
}

#if INTERN_UTF8CONSTS
/* Find the correct slot in utf8hash for the given string. */

static Utf8Const**
find_utf8hash (char* s, int len)
{
	int hash = hashUtf8String (s, len);
	int start_index = hash & (utf8hash_size - 1);
	register int index = start_index;
	/* step must be non-zero, and relatively prime with utf8hash_size. */
	int step = 8 * hash + 7;
	for (;;) {
		if (utf8hash[index] == NULL
		    || (utf8hash[index]->length == len
			&& memcmp (utf8hash[index]->data, s, len) == 0))
			return &utf8hash[index];
		index = (index + step) & (utf8hash_size - 1);
		if (index == start_index)
		  abort ();
	}
}
#endif

Utf8Const*
makeUtf8Const (char* s, int len)
{
	Utf8Const* m;
#if INTERN_UTF8CONSTS
	Utf8Const** ptr;
#endif
	if (len < 0) {
		len = strlen (s);
	}
#if INTERN_UTF8CONSTS
	if (4 * utf8hash_count >= 3 * utf8hash_size) {
		if (utf8hash == NULL) {
			utf8hash_size = 1024;
			utf8hash = gc_malloc(utf8hash_size * sizeof (Utf8Const*), &gcRoot);
		}
		else  {/* Re-hash */
			register i = utf8hash_size;
			register Utf8Const** ptr = utf8hash + i;
			utf8hash_size *= 2;
			utf8hash = gc_malloc(2 * i * sizeof (Utf8Const*), &gcRoot);
			while (--i >= 0) {
				if (*--ptr != NULL) {
					*find_utf8hash ((*ptr)->data,
						       (*ptr)->length) = *ptr;
				}
			}
			gc_free (ptr);  /* Old value of utf8hash. */
		}
	}
	ptr = find_utf8hash (s, len);
	if (*ptr != 0) {
	  return *ptr;
	}
#endif
	m = (Utf8Const*)gc_malloc(sizeof(Utf8Const) + len + 1, &gcNormal);
	memcpy (m->data, s, len);
	m->data[len] = 0;
	m->length = len;
#if INTERN_UTF8CONSTS
	*ptr = m;
	utf8hash_count++;
#else
	m->hash = (uint16) hashUtf8String (s, len);
#endif
	return m;
}
