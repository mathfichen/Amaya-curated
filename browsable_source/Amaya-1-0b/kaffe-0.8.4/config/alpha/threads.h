/*
 * alpha/threads.h
 * Alpha threading information.
 *
 * Copyright (c) 1997 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Richard Henderson <rth@tamu.edu>, 1997,
 */

#ifndef __alpha_threads_h
#define __alpha_threads_h

/**/
/* Thread handling */
/**/
#define	USE_INTERNAL_THREADS

#define	THREADSTACKSIZE		(32 * 1024)

#define	THREADSWITCH(to, from) 						\
	alpha_threadswitch(&(from)->restorePoint, &(to)->restorePoint)

extern void alpha_threadswitch(unsigned char **, unsigned char **);

#define THREADINIT(to, func)						\
	do {								\
		void ** regstore = (void **)(to)->stackEnd - 16;	\
		regstore[7] = func;					\
		(to)->restorePoint = (void *)regstore;			\
	} while (0)

#define	THREADINFO(ee)							\
	do {								\
		register uint8 *sp __asm__("$30");			\
		(ee)->restorePoint = NULL;				\
		(ee)->stackEnd = sp;					\
		(ee)->stackBase = sp - threadStackSize;			\
		(ee)->flags = THREAD_FLAGS_NOSTACKALLOC;		\
	} while (0)

#define	THREADFRAMES(tid, cnt)						\
	do {								\
		/* This information is not available on the Alpha */	\
		cnt = 0;						\
	} while (0)

#endif
