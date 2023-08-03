/*
 * kthread.h
 * Define the threading used in the system.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#ifndef __kthread_h
#define __kthread_h

#include "md.h"

#if !defined(USE_INTERNAL_THREADS)
/*
 * If we are using internal threads, these calls should just
 * be the original calls without 'pseudo' threading attached.
 */
#define	threadedFileDescriptor(_fd)		(_fd)
#define	threadedOpen(_path, _flgs, _mode)	open((_path), (_flgs), (_mode))
#define	threadedRead(_fd, _addr, _len)		read((_fd), (_addr), (_len))
#define	threadedWrite(_fd, _addr, _len)		write((_fd), (_addr), (_len))
#define	threadedSocket(_af, _type, _prt)	socket((_af), (_type), (_prt))
#define	threadedConnect(_fd, _addr, _len)	connect((_fd), (_addr), (_len))
#define	threadedAccept(_fd, _addr, _len)	accept((_fd), (_addr), (_len))

#endif

#endif
