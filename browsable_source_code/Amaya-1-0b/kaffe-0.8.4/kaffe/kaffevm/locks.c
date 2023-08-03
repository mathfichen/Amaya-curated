/*
 * locks.c
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

#define	DBG(s)

#include "config.h"
#include "config-std.h"
#include "object.h"
#include "baseClasses.h"
#include "thread.h"
#include "locks.h"
#include "errors.h"
#include "exception.h"
#include "md.h"

#if defined(USE_INTERNAL_THREADS)

/*
 * Lock a mutex.
 */
void
internalLockMutex(iMux* mux)
{
	int b = blockInts;
	intsDisable();

DBG(	printf("Lock 0x%x on 0x%x\n", currentThread, mux);		)

	if (mux->holder == 0) {
		mux->holder = currentThread;
		mux->count = 1;
	}
	else if (mux->holder == currentThread) {
		mux->count++;
	}
	else {
		while (mux->holder != 0) {
			suspendOnQThread(currentThread, &mux->muxWaiters, NOTIMEOUT);
		}
		mux->holder = currentThread;
		mux->count = 1;
	}

	intsRestore();
	assert(blockInts == b);
}

/*
 * Release a mutex.
 */
void
internalUnlockMutex(iMux* mux)
{
	thread* tid;
	int b = blockInts;

	intsDisable();

DBG(	printf("Unlock 0x%x on 0x%x\n", currentThread, mux);		)

	assert(mux->holder == currentThread);

	mux->count--;
	if (mux->count == 0) {
		mux->holder = 0;
		if (mux->muxWaiters != 0) {
			tid = mux->muxWaiters;
			mux->muxWaiters = tid->next;
			assert(TCTX(tid)->status != THREAD_RUNNING);
			iresumeThread(tid);
		}
	}

	intsRestore();
	assert(blockInts == b);
}

/*
 * Wait on a conditional variable.
 *  (timeout currently ignored)
 */
int
internalWaitCond(iMux* mux, iCv* cv, jlong timeout)
{
	int count;
	thread* tid;
	int intrp;

DBG(	printf("Wait 0x%x on 0x%x 0x%x\n", currentThread, cv, mux);	)

	if (mux->holder != currentThread) {
		throwException(IllegalMonitorStateException);
	}

	intsDisable();

	count = mux->count;
	mux->holder = 0;
	mux->count = 0;
	cv->mux = mux;

	/* If there's anyone waiting here, wake them up */
	if (mux->muxWaiters != 0) {
		tid = mux->muxWaiters;
		mux->muxWaiters = tid->next;
		assert(TCTX(tid)->status != THREAD_RUNNING);
		iresumeThread(tid);
	}

	/* Suspend, and keep suspended until I re-get the lock */
	suspendOnQThread(currentThread, &cv->cvWaiters, timeout);
	while (mux->holder != 0) {
		suspendOnQThread(currentThread, &mux->muxWaiters, NOTIMEOUT);
	}

	mux->holder = currentThread;
	mux->count = count;

	/* Get and reset interrupt state */
	intrp = currentThread->interruptRequested;
	currentThread->interruptRequested = 0;

	intsRestore();
	assert(blockInts == 0);

	return (intrp);
}

/*
 * Wake one thread on a conditional variable.
 */
void
internalSignalCond(iCv* cv)
{
	thread* tid;
	int b = blockInts;

DBG(	printf("Signal 0x%x on 0x%x 0x%x\n", currentThread, cv, cv->mux);)

	/* If 'mux' isn't set then we've never waited on this object. */
	if (cv->mux == 0) {
		return;
	}

	if (cv->mux->holder != currentThread) {
		throwException(IllegalMonitorStateException);
	}

	intsDisable();

	/* Remove one thread from cv list */
	if (cv->cvWaiters != 0) {
		tid = cv->cvWaiters;
		cv->cvWaiters = tid->next;

		/* Place it on mux list */
		tid->next = cv->mux->muxWaiters;
		cv->mux->muxWaiters = tid;
	}

	intsRestore();
	assert(blockInts == b);
}

/*
 * Wake all threads on a conditional variable.
 */
void
internalBroadcastCond(iCv* cv)
{
	thread** tidp;
	int b = blockInts;

DBG(	printf("Broadcast 0x%x on 0x%x 0x%x\n", currentThread, cv, cv->mux);)

	/* If 'mux' isn't set then we've never waited on this object. */
	if (cv->mux == 0) {
		return;
	}

	if (cv->mux->holder != currentThread) {
		throwException(IllegalMonitorStateException);
	}

	intsDisable();

	/* Find the end of the cv list */
	if (cv->cvWaiters) {
		for (tidp = &cv->cvWaiters; *tidp != 0; tidp = &(*tidp)->next)
			;

		/* Place entire cv list on mux list */
		(*tidp) = cv->mux->muxWaiters;
		cv->mux->muxWaiters = cv->cvWaiters;
		cv->cvWaiters = 0;
	}

	intsRestore();
	assert(blockInts == b);
}

#endif
