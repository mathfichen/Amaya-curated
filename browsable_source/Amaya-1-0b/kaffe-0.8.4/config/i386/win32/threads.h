/*
 * i386/win95/threads.h
 * i386 threading information.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#ifndef __i386_win95_threads_h
#define __i386_win95_threads_h

/**/
/* Thread handling */
/**/
#define	USE_INTERNAL_THREADS

struct _ctx;
struct _thread;

void threadSwitch(struct _ctx*, struct _ctx*);
void threadInit(struct _ctx*, void*);
void threadInfo(struct _ctx*);
int threadFrames(struct _thread*);

#define	THREADSTACKSIZE		(32 * 1024)

#define	THREADSWITCH(to, from)	threadSwitch(to, from)
#define	THREADINIT(to, func)	threadInit(to, func)
#define	THREADINFO(ee)		threadInfo(ee)
#define	THREADFRAMES(tid, cnt)	cnt = threadFrames(tid)

#endif
