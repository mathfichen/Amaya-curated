/*
 * support.h
 * Various support routines.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#ifndef __support_h
#define	__support_h

/* For user defined properties */
typedef struct _userProperty {
        char*                   key; 
        char*                   value; 
        struct _userProperty*   next;
} userProperty;

typedef struct _nativeFunction {
	char*			name;
	void*			func;
} nativeFunction;

#define	NATIVE_FUNC_INCREMENT	(256)

extern nativeFunction* native_funcs;

extern userProperty* userProperties;

struct Hjava_lang_String;

extern void		setProperty(void*, char*, char*);
extern void		classname2pathname(char*, char*);
extern struct Hjava_lang_Object* makeJavaCharArray(char*, int);
extern struct Hjava_lang_String* makeJavaString(char*, int);
extern char*		javaString2CString(struct Hjava_lang_String*, char*, int);
extern char*		makeCString(struct Hjava_lang_String*);
extern struct Hjava_lang_String* makeReplaceJavaStringFromUtf8(unsigned char*, int, int, int);
extern jword		do_execute_java_method(void*, Hjava_lang_Object*, char*, char*, struct _methods*, int, ...);
extern jword		do_execute_java_class_method(char* cname, char* method_name, char* signature, ...);

extern Hjava_lang_Object* execute_java_constructor(void*, char*, struct Hjava_lang_Class*, char*, ...);
extern jlong		currentTime(void);
extern void		addNativeMethod(char*, void*);

#endif
