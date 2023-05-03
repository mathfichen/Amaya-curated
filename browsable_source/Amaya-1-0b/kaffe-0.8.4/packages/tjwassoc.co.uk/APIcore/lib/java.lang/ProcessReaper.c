/*
 * java.lang.ProcessReaper.c
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "lib-license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#include "config.h"
#include "config-std.h"
#include "../../../../kaffe/kaffevm/gtypes.h"
#include <native.h>
#include <sys/wait.h>
#include "java.lang.stubs/Thread.h"
#include "java.lang.stubs/ProcessReaper.h"
#include "../../../../kaffe/kaffevm/thread.h"

/*
 * Wait for the death of a process.
 *  Really we should be using SIGCHLD to do this but for the moment we'll
 *  just poll every second and use waitpid to get the pid and status of anyone
 *  who died.
 */
void
java_lang_ProcessReaper_waitForDeath(struct Hjava_lang_ProcessReaper* this)
{
	int status;
	int pid;

	for (;;) {
		sleepThread(1000);
		do {
#if defined(HAVE_WAITPID)
			pid = waitpid(-1, &status, WNOHANG);
#else
			abort();
#endif
			if (pid > 0) {
				do_execute_java_class_method("java.lang.UNIXProcess", "deadChild", "(II)V", pid, status);
			}
		} while (pid > 0);
	}
}
