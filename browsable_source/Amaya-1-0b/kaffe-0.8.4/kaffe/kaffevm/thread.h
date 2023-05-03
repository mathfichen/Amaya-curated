/*
 * thread.h
 * Thread support.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#ifndef __thread_h
#define __thread_h

#define	THREADCLASS			"java/lang/Thread"
#define	THREADGROUPCLASS		"java/lang/ThreadGroup"
#define	THREADDEATHCLASS		"java/lang/ThreadDeath"

#define	MIN_THREAD_PRIO			1
#define	NORM_THREAD_PRIO		5
#define	MAX_THREAD_PRIO			10

#define	THREAD_SUSPENDED		0
#define	THREAD_RUNNING			1
#define	THREAD_DEAD			2

#define	THREAD_FLAGS_GENERAL		0
#define	THREAD_FLAGS_NOSTACKALLOC	1
#define	THREAD_FLAGS_KILLED		2
#define	THREAD_FLAGS_ALARM		4
#define	THREAD_FLAGS_USERSUSPEND	8
#define	THREAD_FLAGS_ERROR		16

#define	NOTIMEOUT			0

struct _thread;

typedef struct _ctx {
	uint8			status;
	uint8			priority;
	uint8*			restorePoint;
	uint8*			stackBase;
	uint8*			stackEnd;
	jlong			time;
	struct _thread*		nextlive;
	struct _thread*		nextalarm;
	struct _thread**	blockqueue;
	uint8			flags;
	void*			exceptPtr;
	double			align[0];  /* for alignment (Gcc extension) */
} ctx;

extern ctx** threadContext;
#define TCTX(t)         (threadContext[(t)->PrivateInfo])

struct Hjava_lang_Object;

/* This structure mirrors java.lang.ThreadGroup.h */
typedef struct _threadGroup {
	struct Hjava_lang_Object	obj;
	struct _threadGroup*		parent;
	struct Hjava_lang_Object*	name;
	jint				maxPrio;
	jint				destroyed;
	jint				daemon;
	jint				nthreads;
	struct Hjava_lang_Object*	threads;
	jint				ngroups;
	struct Hjava_lang_Object*	groups;
} threadGroup;

/* This structure mirrors java.lang.Thread.h */
typedef struct _thread {
	struct Hjava_lang_Object	obj;
	struct Hjava_lang_Object*	name;
	jint				priority;
	struct _thread*			next;
	jint				PrivateInfo;
	jint				eetop;
	jint				single_step;
	jint				daemon;
	jint				stillborn;
	struct Hjava_lang_Object*	target;
	jint				interruptRequested;
	threadGroup*			group;
} thread;

void initThreads(void);
void startThread(thread*);
void resumeThread(thread*);
void iresumeThread(thread*);
void suspendThread(thread*);
void suspendOnQThread(thread*, thread**, jlong);
void yieldThread(void);
void killThread(void);
void setPriorityThread(thread*, int);
int blockOnFile(int, int);

void sleepThread(jlong);
bool aliveThread(thread*);
long framesThread(thread*);

void reschedule(void);
void freeThreadCtx(int);

extern int threadStackSize;
extern thread* currentThread;

/* Flags used for threading I/O calls */
#define	TH_READ		0
#define	TH_WRITE	1
#define	TH_ACCEPT	TH_READ
#define	TH_CONNECT	TH_WRITE

#endif
