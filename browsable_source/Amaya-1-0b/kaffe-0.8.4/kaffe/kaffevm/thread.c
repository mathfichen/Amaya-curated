/*
 * thread.c
 * Thread support.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#define	DBG(s)
#define	SDBG(s)

#include "config.h"
#include "config-std.h"
#include "config-mem.h"
#include "config-io.h"
#include "config-signal.h"
#include "jtypes.h"
#include "access.h"
#include "object.h"
#include "constants.h"
#include "classMethod.h"
#include "baseClasses.h"
#include "lookup.h"
#include "thread.h"
#include "locks.h"
#include "exception.h"
#include "support.h"
#include "external.h"
#include "errors.h"
#include "lerrno.h"
#include "gc.h"
#include "md.h"

#if defined(USE_INTERNAL_THREADS)

thread* currentThread;
thread* threadQhead[MAX_THREAD_PRIO + 1];
thread* threadQtail[MAX_THREAD_PRIO + 1];

static int maxFd = -1;
static fd_set readsPending;
static fd_set writesPending;
static thread* readQ[FD_SETSIZE];
static thread* writeQ[FD_SETSIZE];
static struct timeval zerotimeout = { 0, 0 };

/* Select call is indirect so we can change if when embedding Kaffe into
 * something else.
 */
#if !defined(HAVE_DECLARED_SELECT)
extern int select();
#endif
int (*select_call)(int, fd_set*, fd_set*, fd_set*, struct timeval*) = select;

thread* garbageman;
thread* finalman;

thread* liveThreads;
thread* alarmList;
Hjava_lang_Class* ThreadClass;

int blockInts;
bool needReschedule;

static int talive;
static int tdaemon;
static bool alarmBlocked;

#define MAXTCTX         128

static int numberOfThreads;
ctx** threadContext;
#define	ALLOCTCTX(t,sz)	allocThreadCtx(t, sz);
#define	FREETCTX(t)

static void firstStartThread(void);
static thread* startDaemon(void*, char*);
static void addToAlarmQ(thread*, jlong);
static void removeFromAlarmQ(thread*);
static void alarmException(int);
static void allocThreadCtx(thread*, int);
static void checkEvents(void);

/* Select an alarm system */
#if defined(HAVE_SETITIMER) && defined(ITIMER_REAL)
#define	MALARM(_mt)							\
	{								\
		struct itimerval tm;					\
		tm.it_interval.tv_sec = 0;				\
		tm.it_interval.tv_usec = 0;				\
		tm.it_value.tv_sec = (_mt) / 1000;			\
		tm.it_value.tv_usec = ((_mt) % 1000) * 1000;		\
		setitimer(ITIMER_REAL, &tm, 0);				\
	}
#elif defined(HAVE_ALARM)
#define	MALARM(_mt)	alarm((int)(((_mt) + 999) / 1000))
#endif

void reschedule(void);
void finaliserMan(void);
void gcMan(void);

static void walkThread(gcInfo*);
static bool finalizeThread(gcInfo*);
static gcFuncs gcThread = { walkThread, finalizeThread };

int threadStackSize;

/*
 * Initialise threads.
 */
void
initThreads(void)
{
	/* Set default thread stack size if not set */
	if (threadStackSize == 0) {
		threadStackSize = THREADSTACKSIZE;
	}

	/* Get a handle on the thread class */
	ThreadClass = lookupClass(THREADCLASS);
	assert(ThreadClass != 0);

	/* Allocate a thread to be the main thread */
	currentThread = (thread*)alloc_object(ThreadClass);
	assert(currentThread != 0);
	ALLOCTCTX(currentThread, 0);
	assert(currentThread->PrivateInfo != 0);
	liveThreads = currentThread;

	currentThread->name = makeJavaCharArray("main", strlen("main"));
	currentThread->priority = NORM_THREAD_PRIO;
	TCTX(currentThread)->priority = (uint8)currentThread->priority;
	currentThread->next = 0;
	TCTX(currentThread)->status = THREAD_SUSPENDED;
	THREADINFO(TCTX(currentThread));
DBG(	printf("main thread %x base %x end %x\n", currentThread, TCTX(currentThread)->stackBase, TCTX(currentThread)->stackEnd); )
	TCTX(currentThread)->flags = THREAD_FLAGS_NOSTACKALLOC;
	currentThread->single_step = 0;
	currentThread->daemon = 0;
	currentThread->stillborn = 0;
	currentThread->target = 0;
	currentThread->interruptRequested = 0;
	currentThread->group = (threadGroup*)execute_java_constructor(0, THREADGROUPCLASS, 0, VOID_SIGNATURE);
	assert(currentThread->group != 0);
	do_execute_java_method(0, (Hjava_lang_Object*)currentThread->group, "add", "(Ljava/lang/Thread;)V", 0, 0, currentThread);

	talive++;

	/* Add thread into runQ */
	iresumeThread(currentThread);

#if defined(GC_ENABLE)
	/* Start the GC daemons we need */
	finalman = startDaemon(&finaliserMan, "finaliser");
	garbageman = startDaemon(&gcMan, "gc");
	iresumeThread(finalman);
	iresumeThread(garbageman);

	/* Now threads are setup we can enable the GC */
	gc_mode = GC_ENABLED;
#endif

	/* Plug in the alarm handler */
#if defined(SIGALRM)
	signal(SIGALRM, (SIG_T)alarmException);
#else
#error "No alarm signal support"
#endif
}

/*
 * Start a new thread running.
 */
void
startThread(thread* tid)
{
	/* Allocate a stack context */
	assert(tid->PrivateInfo == 0);
	ALLOCTCTX(tid, threadStackSize);
	assert(tid->PrivateInfo != 0);
	TCTX(tid)->nextlive = liveThreads;
	liveThreads = tid;
	TCTX(tid)->flags = THREAD_FLAGS_GENERAL;
	TCTX(tid)->status = THREAD_SUSPENDED;
	TCTX(tid)->priority = (uint8)tid->priority;

	/* Construct the initial restore point. */
	THREADINIT(TCTX(tid), &firstStartThread);
DBG(	printf("new thread %x base %x end %x\n", tid, TCTX(tid)->stackBase, TCTX(tid)->stackEnd); )

	talive++;
	if (tid->daemon) {
		tdaemon++;
	}

	/* Add thread into runQ */
	iresumeThread(tid);
}

/*
 * All threads start here.
 */
static
void
firstStartThread(void)
{
DBG(	printf("firstStartThread %x\n", currentThread);		)
	/* Every thread starts with the interrupts off */
	intsRestore();

	/* Find the run()V method and call it */
	do_execute_java_method(0, (Hjava_lang_Object*)currentThread, "run", "()V", 0, 0);
	do_execute_java_method(0, (Hjava_lang_Object*)currentThread, "exit", "()V", 0, 0);

	/* Kill the thread.  In theory we should only need one but there's
	 * a race somewhere which means it can sometimes return.  If it does
	 * we just sleep and kill again.  Hopefully the damn thing will
	 * eventually die!
	 */
	for (;;) {
		killThread();
		sleepThread(1000);
	}
}


/*
 * Explicit request by user to resume a thread
 * The definition says that it is just legal to call this after a preceeding
 * suspend (which got through). If the thread was blocked for some other
 * reason (either sleep or IO or a muxSem), we simply can't do it
 * We use a new thread flag THREAD_FLAGS_USERSUSPEND for this purpose
 * (which is set by suspendThread(.))
 */
void
resumeThread(thread* tid)
{
	intsDisable();

        if ((TCTX(tid)->flags & THREAD_FLAGS_USERSUSPEND) != 0) {
                TCTX(tid)->flags &= ~THREAD_FLAGS_USERSUSPEND;
                iresumeThread(tid);
        }
        if ((TCTX(tid)->flags & THREAD_FLAGS_KILLED) != 0) {
		iresumeThread(tid);
        }

	intsRestore();
}

/*
 * Resume a thread running.
 * This routine has to be called only from locations which ensure
 * run / block queue consistency. There is no check for illegal resume
 * conditions (like explicitly resuming an IO blocked thread). There also
 * is no update of any blocking queue. Both has to be done by the caller
 */
void
iresumeThread(thread* tid)
{
	thread** ntid;

DBG(	printf("resumeThread %x\n", tid);			)
	intsDisable();

	if (TCTX(tid)->status != THREAD_RUNNING) {

		/* Remove from alarmQ if necessary */
		if ((TCTX(tid)->flags & THREAD_FLAGS_ALARM) != 0) {
			removeFromAlarmQ(tid);
		}
		/* Remove from lockQ if necessary */
		if (TCTX(tid)->blockqueue != 0) {
			for (ntid = TCTX(tid)->blockqueue; *ntid != 0; ntid = &(*ntid)->next) {
				if (*ntid == tid) {
					*ntid = tid->next;
					break;
				}
			}
			TCTX(tid)->blockqueue = 0;
		}

		TCTX(tid)->status = THREAD_RUNNING;

		/* Place thread on the end of its queue */
		if (threadQhead[TCTX(tid)->priority] == 0) {
			threadQhead[TCTX(tid)->priority] = tid;
			threadQtail[TCTX(tid)->priority] = tid;
			if (TCTX(tid)->priority > TCTX(currentThread)->priority) {
				needReschedule = true;
			}
		}
		else {
			threadQtail[TCTX(tid)->priority]->next = tid;
			threadQtail[TCTX(tid)->priority] = tid;
		}
		tid->next = 0;
	}
SDBG(	else {
		printf("Re-resuming 0x%x\n", tid);
	}							)
	intsRestore();
}

/*
 * Yield process to another thread of equal priority.
 */
void
yieldThread()
{
	intsDisable();

	if (threadQhead[TCTX(currentThread)->priority] != threadQtail[TCTX(currentThread)->priority]) {

		/* Get the next thread and move me to the end */
		threadQhead[TCTX(currentThread)->priority] = currentThread->next;
		threadQtail[TCTX(currentThread)->priority]->next = currentThread;
		threadQtail[TCTX(currentThread)->priority] = currentThread;
		currentThread->next = 0;
		needReschedule = true;
	}

	intsRestore();
}

/*
 * Suspend a thread.
 * This is an explicit user request to suspend the thread - the counterpart
 * for resumeThreadRequest(.). It is JUST called by the java method
 * Thread.suspend()
 * What makes it distinct is the fact that the suspended thread is not contained
 * in any block queue. Without a special flag (indicating the user suspend), we
 * can't check s suspended thread for this condition afterwards (which is
 * required by resumeThreadRequest()). The new thread flag
 * THREAD_FLAGS_USERSUSPEND is used for this purpose.
 */
void
suspendThread(thread* tid)
{
	thread** ntid;

	intsDisable();

	if (TCTX(tid)->status != THREAD_SUSPENDED) {
		TCTX(tid)->status = THREAD_SUSPENDED;

		/*
                 * This is used to indicate the explicit suspend condition
                 * required by resumeThreadRequest()
                 */
                TCTX(tid)->flags |= THREAD_FLAGS_USERSUSPEND;

		for (ntid = &threadQhead[TCTX(tid)->priority]; *ntid != 0; ntid = &(*ntid)->next) {
			if (*ntid == tid) {
				*ntid = tid->next;
				tid->next = 0;
				if (tid == currentThread) {
					reschedule();
				}
				break;
			}
		}
	}
SDBG(	else {
		printf("Re-suspending 0x%x\n", tid);
	}							)

	intsRestore();
}

/*
 * Suspend a thread on a queue.
 */
void
suspendOnQThread(thread* tid, thread** queue, jlong timeout)
{
	thread** ntid;
	thread* last;

DBG(	printf("suspendOnQThread %x %x (%d)\n", tid, queue, (int)timeout); )

	assert(blockInts > 0);

	if (TCTX(tid)->status != THREAD_SUSPENDED) {
		TCTX(tid)->status = THREAD_SUSPENDED;

		last = 0;
		for (ntid = &threadQhead[TCTX(tid)->priority]; *ntid != 0; ntid = &(*ntid)->next) {
			if (*ntid == tid) {

				/* Remove thread from runq */
				*ntid = tid->next;
				if (*ntid == 0) {
					threadQtail[TCTX(tid)->priority] = last;
				}

				/* Insert onto head of lock wait Q */
				if (queue != 0) {
					tid->next = *queue;
					*queue = tid;
					TCTX(tid)->blockqueue = queue;
				}

				/* If I have a timeout, insert into alarmq */
				if (timeout > NOTIMEOUT) {
					addToAlarmQ(tid, timeout);
				}

				/* If I was running, reschedule */
				if (tid == currentThread) {
					reschedule();
				}
				break;
			}
			last = *ntid;
		}
	}
SDBG(	else {
		printf("Re-suspending 0x%x on %x\n", tid, *queue);
	}							)
}

/*
 * Kill thread.
 */
void
killThread(void)
{
	thread** ntid;

	intsDisable();

	/* Notify on the object just in case anyone is waiting */
	lockMutex(&currentThread->obj);
	broadcastCond(&currentThread->obj);
	unlockMutex(&currentThread->obj);

DBG(	printf("killThread %x\n", currentThread);			)

	if (TCTX(currentThread)->status != THREAD_DEAD) {

		/* Get thread off runq (if it needs it) */
		if (TCTX(currentThread)->status == THREAD_RUNNING) {
			for (ntid = &threadQhead[TCTX(currentThread)->priority]; *ntid != 0; ntid = &(*ntid)->next) {
				if (*ntid == currentThread) {
					*ntid = currentThread->next;
					break;
				}
			}
		}

		talive--;
		if (currentThread->daemon) {
			tdaemon--;
		}

		/* If we only have daemons left, then everyone is dead. */
		if (talive == tdaemon) {
			/* Am I suppose to close things down nicely ?? */
			exit(0);
		}

		/* Remove thread from live list so it can be garbaged */
		for (ntid = &liveThreads; *ntid != 0; ntid = &TCTX(*ntid)->nextlive) {
			if (currentThread == (*ntid)) {
				(*ntid) = TCTX(currentThread)->nextlive;
				break;
			}
		}

		/* Remove thread from thread group */
		if (currentThread->group != NULL) {
			do_execute_java_method(0, &currentThread->group->obj, "remove", "(Ljava/lang/Thread;)V", 0, 0, currentThread);
		}
		FREETCTX(currentThread);
		
		/* Run something else */
		needReschedule = true;
		blockInts = 1;

		/* Dead Jim */
		TCTX(currentThread)->status = THREAD_DEAD;
	}

	intsRestore();
}

/*
 * Change thread priority.
 */
void
setPriorityThread(thread* tid, int prio)
{
	thread** ntid;
	thread* last;

	if (tid->PrivateInfo == 0) {
		tid->priority = prio;
		return;
	}

	if (TCTX(tid)->status == THREAD_SUSPENDED) {
		TCTX(tid)->priority = (uint8)prio;
		return;
	}

	intsDisable();

	/* Remove from current thread list */
	last = 0;
	for (ntid = &threadQhead[TCTX(tid)->priority]; *ntid != 0; ntid = &(*ntid)->next) {
		if (*ntid == tid) {
			*ntid = tid->next;
			if (*ntid == 0) {
				threadQtail[TCTX(tid)->priority] = last;
			}
			break;
		}
		last = *ntid;
	}

	/* Insert onto a new one */
	tid->priority = prio;
	TCTX(tid)->priority = (uint8)tid->priority;
	if (threadQhead[prio] == 0) {
		threadQhead[prio] = tid;
		threadQtail[prio] = tid;
		if (prio > TCTX(currentThread)->priority) {
			needReschedule = true;
		}
	}
	else {
		threadQtail[prio]->next = tid;
		threadQtail[prio] = tid;
	}
	tid->next = 0;

	intsRestore();
}

/*
 * Put a thread to sleep.
 */
void
sleepThread(jlong time)
{
	/* Sleep for no time */
	if (time == 0) {
		return;
	}

	intsDisable();

	/* Suspend thread on it */
	suspendOnQThread(currentThread, 0, time);

	intsRestore();
}

static
void
addToAlarmQ(thread* tid, jlong timeout)
{
	thread** tidp;

	assert(blockInts > 0);

	TCTX(tid)->flags |= THREAD_FLAGS_ALARM;

	/* Get absolute time */
	TCTX(tid)->time = timeout + currentTime();

	/* Find place in alarm list and insert it */
	for (tidp = &alarmList; (*tidp) != 0; tidp = &TCTX(*tidp)->nextalarm) {
		if (TCTX(*tidp)->time > TCTX(tid)->time) {
			break;
		}
	}
	TCTX(tid)->nextalarm = *tidp;
	*tidp = tid;

	/* If I'm head of alarm list, restart alarm */
	if (tidp == &alarmList) {
		MALARM(timeout);
	}
}

static
void
removeFromAlarmQ(thread* tid)
{
	thread** tidp;

	assert(blockInts >= 1);

	TCTX(tid)->flags &= ~THREAD_FLAGS_ALARM;

	/* Find thread in alarm list and remove it */
	for (tidp = &alarmList; (*tidp) != 0; tidp = &TCTX(*tidp)->nextalarm) {
		if ((*tidp) == tid) {
			(*tidp) = TCTX(tid)->nextalarm;
			TCTX(tid)->nextalarm = 0;
			break;
		}
	}
}

/*
 * Handle alarm.
 * This routine uses a different meaning of "blockInts". Formerly, it was just
 * "don't reschedule if you don't have to". Now it is "don't do ANY
 * rescheduling actions due to an expired timer". An alternative would be to
 * block SIGALARM during critical sections (by means of sigprocmask). But
 * this would be required quite often (for every outmost intsDisable(),
 * intsRestore()) and therefore would be much more expensive than just
 * setting an int flag which - sometimes - might cause an additional
 * setitimer call.
 */
static
void
alarmException(int sig)
{
	thread* tid;
	thread** ntid;
	jlong time;

	/* Re-enable signal - necessary for SysV */
	signal(sig, (SIG_T)alarmException);

	intsDisable();

	/*
	 * If ints are blocked, this might indicate an inconsistent state of
	 * one of the thread queues (either alarmList or threadQhead/tail).
	 * We better don't touch one of them in this case and come back later.
	 */
	if (blockInts > 1) {
		MALARM(50);
		intsRestore();
		return;
	}

	/* Wake all the threads which need waking */
	time = currentTime();
	while (alarmList != 0 && TCTX(alarmList)->time <= time) {
		/* Restart thread - this will tidy up the alarm and blocked
		 * queues.
		 */
		tid = alarmList;
		alarmList = TCTX(alarmList)->nextalarm;
		iresumeThread(tid);
	}

	/* Restart alarm */
	if (alarmList != 0) {
		MALARM(TCTX(alarmList)->time - time);
	}

	/*
	 * The next bit is rather tricky.  If we don't reschedule then things
	 * are fine, we exit this handler and everything continues correctly.
	 * On the otherhand, if we do reschedule, we will schedule the new
	 * thread with alarms blocked which is wrong.  However, we cannot
	 * unblock them here incase we have just set an alarm which goes
	 * off before the reschedule takes place (and we enter this routine
	 * recusively which isn't good).  So, we set a flag indicating alarms
	 * are blocked, and allow the rescheduler to unblock the alarm signal
	 * after the context switch has been made.  At this point it's safe.
	 */
	alarmBlocked = true;
	intsRestore();
	alarmBlocked = false;
}

/*
 * Is this thread alive?
 */
bool
aliveThread(thread* tid)
{
	bool status;

DBG(	printf("aliveThread: tid 0x%x ctx 0x%x\n", tid, TCTX(tid));	)

	intsDisable();
	if (tid->PrivateInfo != 0 && TCTX(tid)->status != THREAD_DEAD) {
		status = true;
	}
	else {
		status = false;
	}
	intsRestore();

	return (status);
}

/*
 * How many stack frames have I invoked?
 */
long
framesThread(thread* tid)
{
	long count;
	THREADFRAMES(tid, count);
	return (count);
}

/*
 * Reschedule the thread.
 * Called whenever a change in the running thread is required.
 */
void
reschedule(void)
{
	int i;
	thread* lastThread;
	int b;
	sigset_t nsig;

	/* A reschedule in a non-blocked context is half way to hell */
	assert(blockInts > 0);
	b = blockInts;

	for (;;) {
	        for (i = MAX_THREAD_PRIO; i >= MIN_THREAD_PRIO; i--) {
			if (threadQhead[i] != 0) {
				if (threadQhead[i] != currentThread) {
					lastThread = currentThread;
					currentThread = threadQhead[i];

					THREADSWITCH(TCTX(currentThread), TCTX(lastThread));
					/* Alarm signal may be blocked - if so
					 * unblock it.
					 */
					if (alarmBlocked == true) {
						alarmBlocked = false;
						sigemptyset(&nsig);
						sigaddset(&nsig, SIGALRM);
						sigprocmask(SIG_UNBLOCK, &nsig, 0);
					}

					/* Restore ints */
					blockInts = b;

					/* I might be dying */
					if ((TCTX(lastThread)->flags & THREAD_FLAGS_KILLED) != 0 && blockInts == 1) {
						TCTX(lastThread)->flags &= ~THREAD_FLAGS_KILLED;
						blockInts = 0;
						throwException(ThreadDeath);
						assert("Rescheduling dead thread" == 0);
					}
				}
				/* Now kill the schedule */
				needReschedule = false;
				return;
			}
		}
		/* Nothing to run - wait for external event */
		checkEvents();
	}
}

/*
 * Wait for some file descriptor or other event to become ready.
 */
static
void
checkEvents(void)
{
	int r;
	fd_set rd;
	fd_set wr;
	thread* tid;
	thread* ntid;
	int i;
	int b;

DBG(	printf("checkEvents\n");					)

	FD_COPY(&readsPending, &rd);
	FD_COPY(&writesPending, &wr);

	/*
	 * Select() is called with indefinite wait, but we have to make sure
	 * we can get interrupted by timer events.  However, we should *NOT*
	 * reschedule.
	 */
	needReschedule = false;
	b = blockInts;
	blockInts = 0;
	r = (*select_call)(maxFd+1, &rd, &wr, 0, 0);
	blockInts = b;

	/* If select get's interrupted, just return now */
	if (r < 0 && errno == EINTR) {
		return;
	}

	/* We must be holding off interrupts before we start playing with
	 * the read and write queues.  This should be already done but a
	 * quick check never hurt anyone.
	 */
	assert(blockInts > 0);

	/* On a select error, mark all threads in error and release
	 * them all.  They should try to re-select and pick up their
	 * own individual errors.
	 */
	if (r < 0) {
		for (i = 0; i <= maxFd; i++) {
			for (tid = readQ[i]; tid != 0; tid = ntid) {
				ntid = tid->next;
				TCTX(tid)->flags |= THREAD_FLAGS_ERROR;
				iresumeThread(tid);
			}
			for (tid = writeQ[i]; tid != 0; tid = ntid) {
				ntid = tid->next;
				TCTX(tid)->flags |= THREAD_FLAGS_ERROR;
				iresumeThread(tid);
			}
			writeQ[i] = 0;
			readQ[i] = 0;
		}
		return;
	}

DBG(	printf("Select returns %d\n", r);				)

	for (i = 0; r > 0 && i <= maxFd; i++) {
		if (readQ[i] != 0 && FD_ISSET(i, &rd)) {
			for (tid = readQ[i]; tid != 0; tid = ntid) {
				ntid = tid->next;
				iresumeThread(tid);
			}
			readQ[i] = 0;
			r--;
		}
		if (writeQ[i] != 0 && FD_ISSET(i, &wr)) {
			for (tid = writeQ[i]; tid != 0; tid = ntid) {
				ntid = tid->next;
				iresumeThread(tid);
			}
			writeQ[i] = 0;
			r--;
		}
	}
}

/*
 * An attempt to access a file would block, so suspend the thread until
 * it will happen.
 */
int
blockOnFile(int fd, int op)
{
	fd_set fset;
	int r;

DBG(	printf("blockOnFile()\n");					)

	/* Trap obviously invalid file descriptors */
	if (fd < 0) {
		errno = EBADF;
		return (-1);
	}

	intsDisable();

	retry:

	/* First a quick check to see if the file handle is usable.
	 * This saves going through all that queuing stuff.
	 */
	FD_ZERO(&fset);
	FD_SET(fd, &fset);
	r = (*select_call)(fd+1, (op == TH_READ ? &fset : 0), (op == TH_WRITE ? &fset : 0), 0, &zerotimeout);

	/* Select got interrupted - do it again */
	if (r < 0 && errno == EINTR) {
		goto retry;
	}
	/* If r != 0 then either its and error and we should return it, or the
	 * file is okay to use so we should use it.  Either way, return now.
	 */
	if (r != 0) {
		intsRestore();
		assert(blockInts == 0);
		return (r);
	}

	if (fd > maxFd) {
		maxFd = fd;
	}
	if (op == TH_READ) {
		FD_SET(fd, &readsPending);
		suspendOnQThread(currentThread, &readQ[fd], NOTIMEOUT);
		FD_CLR(fd, &readsPending);
	}
	else {
		FD_SET(fd, &writesPending);
		suspendOnQThread(currentThread, &writeQ[fd], NOTIMEOUT);
		FD_CLR(fd, &writesPending);
	}

	/* If we have an error flagged, retry the whole thing. */
	if ((TCTX(currentThread)->flags & THREAD_FLAGS_ERROR) != 0) {
		TCTX(currentThread)->flags &= ~THREAD_FLAGS_ERROR;
		goto retry;
	}

	intsRestore();
	assert(blockInts == 0);

	return (1);
}

/*
 * Start a daemon thread.
 */
static
thread*
startDaemon(void* func, char* nm)
{
	thread* tid;

DBG(	printf("startDaemon %s\n", nm);				)

	/* Keep daemon threads as root objects */
	tid = (thread*)alloc_object(ThreadClass);
	assert(tid != 0);
	ALLOCTCTX(tid, threadStackSize);
	assert(tid->PrivateInfo != 0);

	tid->name = makeJavaCharArray(nm, strlen(nm));
	tid->priority = MAX_THREAD_PRIO;
	TCTX(tid)->priority = (uint8)tid->priority;
	tid->next = 0;
	TCTX(tid)->status = THREAD_SUSPENDED;
	TCTX(tid)->nextlive = liveThreads;
	liveThreads = tid;

	tid->single_step = 0;
	tid->daemon = 1;
	tid->stillborn = 0;
	tid->target = 0;
	tid->interruptRequested = 0;
	tid->group = 0;

	/* Construct the initial restore point. */
	THREADINIT(TCTX(tid), func);

	talive++;
	tdaemon++;

	return (tid);
}

static
void
allocThreadCtx(thread* tid, int stackSize)
{
	static int maxNumberOfThreads = 0;
	static int ntid = 0;
	void* mem;

	/* If we run out of context slots, allocate some more */
	if (numberOfThreads >= maxNumberOfThreads-1) {
		mem = checked_calloc(maxNumberOfThreads+MAXTCTX, sizeof(ctx*));
		memcpy(mem, threadContext, maxNumberOfThreads * sizeof(ctx*));
		checked_free(threadContext);
		threadContext = mem;
		maxNumberOfThreads += MAXTCTX;
	}

	for (;;) {
		ntid++;
		if (ntid == maxNumberOfThreads) {
			ntid = 1;
		}
		if (threadContext[ntid] == 0) {
			mem = newThreadCtx(stackSize);
			GC_WRITE(threadContext, mem);
			threadContext[ntid] = mem;
			threadContext[ntid]->status = THREAD_SUSPENDED;
			numberOfThreads++;
			tid->PrivateInfo = ntid;
			MEM2GC(tid)->funcs = &gcThread;
			MEM2GC(tid)->final = GC_NEEDFINALIZE;
			return;
		}
	}
}

/*
 * Allocate a new thread context and stack.
 */
ctx*
newThreadCtx(int stackSize)
{
	ctx *ct;

	ct = checked_malloc(sizeof(ctx) + stackSize);
	ct->stackBase = (uint8*)(ct + 1);
	ct->stackEnd = ct->stackBase + stackSize;
	ct->restorePoint = ct->stackEnd;
	ct->exceptPtr = NULL;
        ct->blockqueue = NULL;
        ct->nextlive = NULL;
        ct->nextalarm = NULL;
	return (ct);
}

/*
 * Walk a thread, context and stack.
 */
static
void
walkThread(gcInfo* base)
{
	thread* tid;
	ctx* ct;

	tid = (thread*)GC2MEM(base);

#ifdef notyet
        markObject (.. class ..);
#endif

	MARK_REFERENCE(tid->name);
	MARK_REFERENCE(tid->next);
	MARK_REFERENCE(tid->target);
	MARK_REFERENCE(tid->group);

	/* Since this thread my be extended by another class, walk any
	 * remaining data.
	 */
	scanConservative(tid+1, base->size - sizeof(thread));

	if (tid->PrivateInfo != 0) {
		ct = TCTX(tid);
		/* Nothing in context worth looking at except the stack */
#if defined(STACK_GROWS_UP)
		scanConservative(ct->stackBase, ct->restorePoint - ct->stackBase);
#else
		scanConservative(ct->restorePoint, ct->stackEnd - ct->restorePoint);
#endif
	}
}

/*
 * Finalize a thread.
 *  This is chiefly to free the thread context.
 */
static
bool
finalizeThread(gcInfo* mem)
{
	thread* tid;
	ctx* ct;
        Method* final;

	tid = (thread*)GC2MEM(mem);

	if (tid->PrivateInfo != 0) {
		ct = threadContext[tid->PrivateInfo];
		threadContext[tid->PrivateInfo] = NULL;
		numberOfThreads--;
		tid->PrivateInfo = 0;
		checked_free(ct);
	}

	/* Call thread finalizer if it has one (can it have one?) */
	final = findMethod(OBJECT_CLASS(&tid->obj), final_name, void_signature);
	if (final != NULL) {
		CALL_KAFFE_FUNCTION(final, &tid->obj);
		return (false);
	}
	return (true);
}

void
walkLiveThreads(void)
{
	thread* tid;
	gcInfo* base;

	for (tid = liveThreads; tid != NULL; tid = TCTX(tid)->nextlive) {
		base = MEM2GC(tid);
		base->colour = GC_GREY;
		walkObject(base);
	}
}

#endif
