/*
 * locks.h
 * Manage locking system
 * This include the mutex's and cv's.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#ifndef __locks_h
#define __locks_h

#include "md.h"

#define	lockMutex(_obj)		_lockMutex(&(_obj)->mux)
#define	unlockMutex(_obj)	_unlockMutex(&(_obj)->mux)
#define	waitCond(_obj, _tm)	_waitCond(&(_obj)->mux, &(_obj)->cv, _tm)
#define	signalCond(_obj)	_signalCond(&(_obj)->cv)
#define	broadcastCond(_obj)	_broadcastCond(&(_obj)->cv)

#if defined(USE_INTERNAL_THREADS)

struct _thread;

typedef struct _iMux {
	struct _thread*		holder;
	int			count;
	struct _thread*		muxWaiters;
} iMux;

typedef struct _iCv {
	struct _thread*		cvWaiters;
	struct _iMux*		mux;
} iCv;

extern void internalLockMutex(iMux*);
extern void internalUnlockMutex(iMux*);
extern int internalWaitCond(iMux*, iCv*, jlong);
extern void internalSignalCond(iCv*);
extern void internalBroadcastCond(iCv*);

#define	_lockMutex(_mx)		internalLockMutex(_mx)
#define	_unlockMutex(_mx)	internalUnlockMutex(_mx)
#define	_waitCond(_mx,_cv,_tm)	internalWaitCond(_mx, _cv, _tm)
#define	_signalCond(_cv)	internalSignalCond(_cv)
#define	_broadcastCond(_cv)	internalBroadcastCond(_cv)

extern int blockInts;
extern bool needReschedule;

#define	intsDisable()	blockInts++
#define	intsRestore()	if (blockInts == 1 && needReschedule == true) {	\
				reschedule();				\
			}						\
			blockInts--     

#else
/*
 * Don't know what we'll do for native threading yet.
 */
#define	_lockMutex(_mx)		???
#define	_unlockMutex(_mx)	???
#define	_waitCond(_mx,_cv,_tm)	???
#define	_signalCond(_cv)	???
#define	_broadcastCond(_cv)	???

#define	intsDisable()		???
#define	intsRestore()		???

#endif

#endif
