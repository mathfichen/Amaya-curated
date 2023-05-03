/*
 * errors.h
 * Error return codes.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#ifndef __errors_h
#define __errors_h

#include "classMethod.h"
#include "support.h"

#define NEW_LANG_EXCEPTION(NAME) \
  execute_java_constructor(0, "java.lang." #NAME, 0, VOID_SIGNATURE)

#define NEW_LANG_EXCEPTION_MESSAGE(NAME, MESS) \
  execute_java_constructor(0, "java.lang." #NAME, 0, "(Ljava/lang/String;)V", \
	makeJavaString(MESS, strlen(MESS)))

#define NoSuchMethodError NEW_LANG_EXCEPTION(NoSuchMethodError)
#define ClassFormatError NEW_LANG_EXCEPTION(ClassFormatError)
#define LinkageError NEW_LANG_EXCEPTION(LinkageError)
#define ClassNotFoundException(M) NEW_LANG_EXCEPTION_MESSAGE(ClassNotFoundException, M)
#define NoSuchFieldError NEW_LANG_EXCEPTION(NoSuchFieldError)
#define OutOfMemoryError NEW_LANG_EXCEPTION(OutOfMemoryError)
#define UnsatisfiedLinkError NEW_LANG_EXCEPTION(UnsatisfiedLinkError)
#define VirtualMachineError NEW_LANG_EXCEPTION(VirtualMachineError)
#define ClassCircularityError NEW_LANG_EXCEPTION(ClassCircularityError)
#define NegativeArraySizeException NEW_LANG_EXCEPTION(NegativeArraySizeException)
#define ClassCastException NEW_LANG_EXCEPTION(ClassCastException)
#define IllegalMonitorStateException NEW_LANG_EXCEPTION(IllegalMonitorStateException)
#define NullPointerException NEW_LANG_EXCEPTION(NullPointerException)
#define ArrayIndexOutOfBoundsException NEW_LANG_EXCEPTION(ArrayIndexOutOfBoundsException)
#define ArrayStoreException NEW_LANG_EXCEPTION(ArrayStoreException)
#define ArithmeticException NEW_LANG_EXCEPTION(ArithmeticException)
#define AbstractMethodError NEW_LANG_EXCEPTION(AbstractMethodError)
#define VerifyError NEW_LANG_EXCEPTION(VerifyError)
#define ThreadDeath NEW_LANG_EXCEPTION(ThreadDeath)
#define	InstantiationException(M) NEW_LANG_EXCEPTION_MESSAGE(InstantiationException, M)

#endif
