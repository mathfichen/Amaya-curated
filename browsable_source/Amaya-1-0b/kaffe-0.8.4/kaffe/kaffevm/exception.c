/*
 * exception.c
 * Handle exceptions for the interpreter or translator.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>
 */

#define	DBG(s)

#include "config.h"
#include "config-std.h"
#include "config-signal.h"
#include "config-mem.h"
#include <setjmp.h>
#include "jtypes.h"
#include "access.h"
#include "object.h"
#include "constants.h"
#include "classMethod.h"
#include "code.h"
#include "exception.h"
#include "baseClasses.h"
#include "lookup.h"
#include "thread.h"
#include "errors.h"
#include "itypes.h"
#include "external.h"
#include "soft.h"
#include "md.h"

#if defined(INTERPRETER)
#define	DEFINEFRAME()		/* Does nothing */
#define	FIRSTFRAME(f, e)	/* Does nothing */
#define	DISPATCHFRAME(e)	dispatchException((throwable*)(e), 0)
#define	EXCEPTIONPROTO		int sig
#define	EXCEPTIONFRAME(f, c)	/* Does nothing */
#define	EXCEPTIONFRAMEPTR	0
#elif defined(TRANSLATOR)
#define	DEFINEFRAME()		exceptionFrame frame
#define	DISPATCHFRAME(e)	dispatchException((throwable*)(e), &frame)
#define	EXCEPTIONFRAMEPTR	&frame
#endif

static void dispatchException(throwable*, struct _exceptionFrame*);
Hjava_lang_Object* buildStackTrace(struct _exceptionFrame*);

extern Hjava_lang_Object* exceptionObject;


/*
 * Throw an internal exception.
 */
void
throwException(Hjava_lang_Object* eobj)
{
	if (eobj != 0) {
		((throwable*)eobj)->backtrace = buildStackTrace(0);
	}
	throwExternalException(eobj);
}

/*
 * Throw an exception.
 */
void
throwExternalException(Hjava_lang_Object* eobj)
{
	DEFINEFRAME();
	if (eobj == 0) {
		fprintf(stderr, "Exception thrown on null object ... aborting\n");
		abort();
		exit(1);
	}
	FIRSTFRAME(frame, eobj);
	DISPATCHFRAME(eobj);
}

static
void
dispatchException(throwable* eobj, struct _exceptionFrame* baseframe)
{
	char* cname;
	Hjava_lang_Class* class;
	Hjava_lang_Object* obj;

	/* Release the interrupts (in case they were held when this
	 * happened - and hope this doesn't break anything).
	 */
	blockInts = 1;
	intsRestore();

	class = OBJECT_CLASS(&eobj->head);
	/* Search down exception stack for a match */
#if defined(INTERPRETER)
	{
		exceptionInfo info;
		vmException* frame;
		bool res;

		for (frame = (vmException*)TCTX(currentThread)->exceptPtr; frame != 0; frame = frame->prev) {
			exceptionObject = (Hjava_lang_Object*)eobj;

			/* Look for handler */
			res = findExceptionBlockInMethod(frame->pc, exceptionObject->dtable->class, frame->meth, &info);

			/* Find the sync. object */
			if ((info.method->accflags & ACC_SYNCHRONISED) == 0) {
				obj = 0;
			}
			else if (info.method->accflags & ACC_STATIC) {
				obj = &info.class->head;
			}
			else {
				obj = frame->mobj;
			}

			/* If handler found, call it */
			if (res == true) {
				TCTX(currentThread)->exceptPtr = frame;
				frame->pc = info.handler;
				longjmp(frame->jbuf, 1);
			}


			/* If not here, exit monitor if synchronised. */
			if (obj != 0 && obj->mux.holder == currentThread) {
				soft_monitorexit(obj);
			}
		}
	}
#elif defined(TRANSLATOR)
	{
		exceptionFrame* frame;
		exceptionInfo einfo;

		for (frame = baseframe; FRAMEOKAY(frame); NEXTFRAME(frame)) {
			findExceptionInMethod(PCFRAME(frame), class, &einfo);

			/* Find the sync. object */
			if (einfo.method == 0 || (einfo.method->accflags & ACC_SYNCHRONISED) == 0) {
				obj = 0;
			}
			else if (einfo.method->accflags & ACC_STATIC) {
				obj = &einfo.class->head;
			}
			else {
				obj = FRAMEOBJECT(frame);
			}

			/* Handler found */
			if (einfo.handler != 0) {
				CALL_KAFFE_EXCEPTION(frame, einfo, eobj);
			}

			/* If method found and synchronised, unlock the lock */
			if (obj != 0 && obj->mux.holder == currentThread) {
				soft_monitorexit(obj);
			}
		}
	}
#endif

	/* We must catch 'java.lang.ThreadDeath' exceptions now and
	 * kill the thread rather than the machine.
	 */
	cname = CLASS_CNAME(class);
	if (strcmp(cname, THREADDEATHCLASS) == 0) {
		killThread();
		assert("Can't kill myself!" == 0);
	}

	/* If all else fails we call the the uncaught exception method
	 * on this thread's group.
	 */
	do_execute_java_method(0, (Hjava_lang_Object*)currentThread->group, "uncaughtException", "(Ljava/lang/Thread;Ljava/lang/Throwable;)V", 0, 0, currentThread, eobj);
	exit(1);
}

/*
 * Build an array of char[] for the current stack backtrace.
 */
Hjava_lang_Object*
buildStackTrace(struct _exceptionFrame* base)
{
	char buf[100];
	Hjava_lang_Object* str;
	Hjava_lang_Object* strarray;
	int cnt;
	int len;
	int i;
	methods* meth;
	uintp pc;
	int32 linenr;
	uintp linepc;

#if defined(INTERPRETER)
	vmException* frame;

	cnt = 0;
	/* First count the stack frames */
	for (frame = (vmException*)TCTX(currentThread)->exceptPtr; frame != 0; frame = frame->prev) {
		cnt++;
	}
#elif defined(TRANSLATOR)
	exceptionFrame nframe;
	exceptionFrame* frame;

	if (base == 0) {
		FIRSTFRAME(nframe, base);
		base = &nframe;
	}
	/* First count the stack frames */
	cnt = 0;
	for (frame = base; FRAMEOKAY(frame); NEXTFRAME(frame)) {
		cnt++;
	}
#endif

	/* Build an array of strings */
	strarray = alloc_objectarray(cnt, "[[B");
	assert(strarray != 0);

	cnt = 0;
#if defined(INTERPRETER)
	for (frame = TCTX(currentThread)->exceptPtr; frame; frame = frame->prev) {
		meth = frame->meth;
		pc = frame->pc;
#elif defined(TRANSLATOR)
	for (frame = base; FRAMEOKAY(frame); NEXTFRAME(frame)) {
		meth = findMethodFromPC(PCFRAME(frame));
		pc = PCFRAME(frame);
#endif
		if (meth != 0) {
			linepc = 0;
			linenr = -1;
			if (meth->lines != 0) {
				for (i = 0; i < meth->lines->length; i++) {
					if (pc >= meth->lines->entry[i].start_pc && linepc < meth->lines->entry[i].start_pc) {
						linenr = meth->lines->entry[i].line_nr;
						linepc = meth->lines->entry[i].start_pc;
					}
				}
			}
			if (linenr == -1) {
				sprintf(buf, "\tat %s.%s(line unknown, pc %p)",
					CLASS_CNAME(meth->class),
					meth->name->data, (void*)pc);
			}
			else {
				sprintf(buf, "\tat %s.%s(%d)",
					CLASS_CNAME(meth->class),
					meth->name->data,
					linenr);
			}
			len = strlen(buf);
			str = alloc_array(len, TYPE_Byte);
			assert(str != 0);
			memcpy ((char*)OBJARRAY_DATA(str), buf, len);
		}
		else {
			str = 0;
		}
		OBJARRAY_DATA(strarray)[cnt] = str;

		cnt++;
	}
	return (strarray);
}

/*
 * Null exception - catches bad memory accesses.
 */

void
nullException(EXCEPTIONPROTO)
{
	throwable* npe;
	sigset_t nsig;

	DEFINEFRAME();

#if !defined(DEBUG)
	/* Reset signal handler */
	signal(sig, (SIG_T)nullException);
	sigemptyset(&nsig);
	sigaddset(&nsig, sig);
	sigprocmask(SIG_UNBLOCK, &nsig, 0);
#endif

	EXCEPTIONFRAME(frame, ctx);
	npe = (throwable*)NullPointerException;
	npe->backtrace = buildStackTrace(EXCEPTIONFRAMEPTR);
	DISPATCHFRAME(npe);
}

/*
 * Division by zero.
 */
void
arithmeticException(EXCEPTIONPROTO)
{
	throwable* ae;
	sigset_t nsig;
	DEFINEFRAME();

#if !defined(DEBUG)
        /* Reset signal handler - necessary for SysV, does no harm for BSD */
        signal(sig, (SIG_T)arithmeticException);
	sigemptyset(&nsig);
	sigaddset(&nsig, sig);
	sigprocmask(SIG_UNBLOCK, &nsig, 0);
#endif
	EXCEPTIONFRAME(frame, ctx);
	ae = (throwable*)ArithmeticException;
	ae->backtrace = buildStackTrace(EXCEPTIONFRAMEPTR);
	DISPATCHFRAME(ae);
}
