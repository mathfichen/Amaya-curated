/*
 * java.lang.Thread.c
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "lib-license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#include "../../../../kaffe/kaffevm/gtypes.h"
#include <native.h>
#include "java.lang.stubs/Thread.h"
#include "../../../../kaffe/kaffevm/thread.h"

struct Hjava_lang_Thread*
java_lang_Thread_currentThread(struct Hjava_lang_Thread* none)
{
	return ((struct Hjava_lang_Thread*)currentThread);
}

/*
 * Yield processor to another thread of the same priority.
 */
void
java_lang_Thread_yield(struct Hjava_lang_Thread* none)
{
	yieldThread();
}

/*
 * Put current thread to sleep for a time.
 */
void
java_lang_Thread_sleep(struct Hjava_lang_Thread* none, jlong time)
{
	sleepThread(time);
}

/*
 * Start this thread running.
 */
void
java_lang_Thread_start(struct Hjava_lang_Thread* this)
{
	startThread((thread*)this);
}

/*
 * Is this thread alive?
 */
jint /* bool */
java_lang_Thread_isAlive(struct Hjava_lang_Thread* this)
{
	return (aliveThread((thread*)this));
}

/*
 * Number of stack.  One for the moment.
 */
jint
java_lang_Thread_countStackFrames(struct Hjava_lang_Thread* this)
{
	return (framesThread((thread*)this));
}

/*
 * Change thread priority.
 */
void
java_lang_Thread_setPriority0(struct Hjava_lang_Thread* this, jint prio)
{
	setPriorityThread((thread*)this, prio);
}

/*
 * Stop a thread in its tracks.
 */
void
java_lang_Thread_stop0(struct Hjava_lang_Thread* this, struct Hjava_lang_Object* obj)
{
	if (currentThread == (thread*)this) {
		SignalError(0, "java.lang.ThreadDeath", "");
	}
	else {
		TCTX(unhand(this))->flags |= THREAD_FLAGS_KILLED;
		resumeThread((thread*)this);
	}
}

void
java_lang_Thread_suspend0(struct Hjava_lang_Thread* this)
{
	suspendThread((thread*)this);
}

void
java_lang_Thread_resume0(struct Hjava_lang_Thread* this)
{
	resumeThread((thread*)this);
}
