/*
 * readClassConfig.h
 * Various bits of information in a Java class file.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#ifndef __readclassconfig_h
#define __readclassconfig_h

#include <stdio.h>

typedef FILE classFile;
typedef struct Hjava_lang_Class Hjava_lang_Class;
typedef struct _methods methods;

#define	ADDCLASS(t, s, a, c)	addClass(t, s, a, c)
#define	READFIELD(f, t)		readField(f, t, constant_pool)
#define	READFIELD_ATTRIBUTE(f,t)
#define	READFIELD_END(c)	readFieldEnd()
#define	READMETHOD(f, t)	readMethod(f, t, constant_pool)

extern constants* constant_pool;

#endif
