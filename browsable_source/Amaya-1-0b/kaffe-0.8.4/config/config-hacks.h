/*
 * config-hacks.h
 * Various hacks to the configuration for things that aren't
 *  automatically worked out.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>
 */

/* We force the use of blocking calls for all I/O at the moment.  This
 * means we use select to check read and writes before they're done
 * rather than 'unblocking' the relevant file descriptors which can cause
 * problems where file handles are shared between Kaffe and other programs
 * (typically this is stdio, stdout and stderr).
 */
#define	BLOCKING_CALLS

/* Hacks to configure NeXT */
#if defined(NeXT)
#undef  HAVE_SYS_UTSNAME_H
#define HAVE_DYN_UNDERSTORE 1
#endif

/* Hack to configure AmigaOS */
#if defined(__amigaos__)
#define HAVE_DYN_UNDERSTORE 1
#endif  

/* Hack for Window's */ 
#if defined(__WIN32__) || defined(WIN32) || defined(_WIN32)
#undef	__WIN32__
#define __WIN32__ 1
#endif

/* Hack for NetBSD */
#if defined(__NetBSD__)
#define	HAVE_DYN_UNDERSTORE 1
#define	DEFAULT_LIBRARYPATH "/usr/local/lib:/usr/lib"
#endif

/* Hack to configure AIX */
#if defined(AIX)
#define  HAVE_SYS_SELECT_H 1
#endif

/* The 386 can do unaligned memory accesses */
#if defined(__i386__)
#define	HAVE_UNALIGNEDACCESS
#endif
