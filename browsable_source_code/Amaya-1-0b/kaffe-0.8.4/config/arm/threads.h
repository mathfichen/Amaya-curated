/*
 * arm/threads.h
 * ARM threading information.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Antonio Lombrano <antonio@aloha.iet.unipi.it>
 */

#ifndef __arm_threads_h
#define __arm_threads_h

/**/
/* Thread handling */
/**/
#define	USE_INTERNAL_THREADS

#define	THREADSTACKSIZE		(32 * 1024)

struct _ctx;
struct _thread;

void	threadSwitch(struct _ctx*, struct _ctx*);
void	threadInit(struct _ctx*, void*);
void	threadInfo(struct _ctx*);
int	threadFrames(struct _thread*);

#define	THREADSWITCH(to, from)	threadSwitch(to, from)
#define	THREADINIT(to, func)	threadInit(to, func)
#define	THREADINFO(ee)		threadInfo(ee)
#define	THREADFRAMES(tid)	threadFrames(tid)

#endif
