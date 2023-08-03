/*

  					W3C Sample Code Library libwww Hash Table Class


!
  Hash Table Class
!

Written and integrated into libwww by John Punin - thanks!

This module is implemented by HTHash.c, and is a part
of the  W3C Sample Code Library.

This HashTable class implements a simple hash table to keep objects associated
with key words.
*/

#ifndef HTHASH_H
#define HTHASH_H

#include "HTList.h"

typedef struct _HTHashtable HTHashtable;

struct _HTHashtable {
    void **table;
    int count;
    int size;
};
    
typedef struct _keynode keynode;

struct _keynode {
    char *key;
    void *object;
};

/*
.
  Creation and Deletion Methods
.

These methods create and deletes a Hash Table
*/

extern HTHashtable *	HTHashtable_new	(int size);

extern BOOL	HTHashtable_delete (HTHashtable *me);

/*
.
  Add an Element to a HashTable
.
*/

extern BOOL HTHashtable_addObject (HTHashtable *me, const char *key , void *newObject);

/*
.
  Search for an Element in a Hash Table
.
*/

extern void *	HTHashtable_object (HTHashtable * me, const char *key);

/*
.
  Size of a Hash Table
.
*/

extern int	HTHashtable_count  (HTHashtable *me);

/*
.
  Extract in a dynamic array all keys of the Hash Table
.
*/

extern HTArray * HTHashtable_keys  (HTHashtable *me);

/*
.
  Print the keys of the Hash Table
.
*/

extern void HTHashtable_print (HTHashtable *me);

/*
*/

#endif

/*

  

  @(#) $Id: HTHash.html,v 1.1 1999/04/18 20:20:35 frystyk Exp $

*/
