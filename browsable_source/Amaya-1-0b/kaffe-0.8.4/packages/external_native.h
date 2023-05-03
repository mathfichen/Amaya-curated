/*
 * external_native.h
 * Wrap up the calls between Kaffe and native method calls for systems
 *  which don't support shared libraries.
 *
 * Copyright (c) 1997 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Modified by Tim Wilkinson <tim@tjwassoc.demon.co.uk>
 */

#ifndef __external_native_h
#define __external_native_h

#if defined(NO_SHARED_LIBRARIES)

#if defined(TRANSLATOR)
#define	KAFFE_NATIVE_PROTOTYPE(_f)	extern void _f();
#define	KAFFE_NATIVE_METHOD(_n)		{ #_n, _n },
#elif defined(INTERPRETER)
#define	KAFFE_NATIVE_PROTOTYPE(_f)	extern void Kaffe_##_f##_stub();
#define	KAFFE_NATIVE_METHOD(_n)		{ #_n, Kaffe_##_n##_stub },
#endif

#define	KAFFE_NATIVE(_f)	KAFFE_NATIVE_PROTOTYPE(_f)

#if defined(HAVE_PACKAGE_TJWASSOC_CO_UK)
#include "tjwassoc.co.uk/external_wrappers.h"
#endif
#if defined(HAVE_PACKAGE_JAVASOFT_COM)
#include "javasoft.com/external_wrappers.h"
#endif
#if defined(HAVE_PACKAGE_BISS_NET_COM)
#include "biss-net.com/external_wrappers.h"
#endif
#if defined(HAVE_PACKAGE_EPFL_CH)
#include "epfl.ch/external_wrappers.h"
#endif

#undef	KAFFE_NATIVE
#define	KAFFE_NATIVE(_f)	KAFFE_NATIVE_METHOD(_f)

nativeFunction default_natives[] = {

#if defined(HAVE_PACKAGE_TJWASSOC_CO_UK)
#include "tjwassoc.co.uk/external_wrappers.h"
#endif
#if defined(HAVE_PACKAGE_JAVASOFT_COM)
#include "javasoft.com/external_wrappers.h"
#endif
#if defined(HAVE_PACKAGE_BISS_NET_COM)
#include "biss-net.com/external_wrappers.h"
#endif
#if defined(HAVE_PACKAGE_EPFL_CH)
#include "epfl.ch/external_wrappers.h"
#endif

	{ 0, 0 }
};

#undef	KAFFE_NATIVE

#endif

#endif
