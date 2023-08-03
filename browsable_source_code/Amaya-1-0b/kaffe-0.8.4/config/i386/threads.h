/*
 * i386/threads.h
 * i386 threading information.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#ifndef __i386_threads_h
#define __i386_threads_h

/**/
/* Thread handling */
/**/
#define	USE_INTERNAL_THREADS

#define	THREADSTACKSIZE		(32 * 1024)

#define	THREADSWITCH(to, from)					\
	asm("	pushl $1f					\n\
		pushal						\n\
		movl %%esp,%0					\n\
		movl %1,%%esp					\n\
		popal						\n\
		ret						\n\
1:		nop						\n\
		" : : "g" (from->restorePoint), "g" (to->restorePoint))

#define	THREADINIT(to, func)					\
	asm("							\n\
		movl %0,-4(%1)					\n\
		movl $0,-8(%1)   				\n\
		movl $0,-12(%1)  				\n\
		movl $0,-16(%1)  				\n\
		movl $0,-20(%1)  				\n\
		movl $0,-24(%1) 				\n\
		movl $0,-28(%1)  				\n\
		movl $0,-32(%1)  				\n\
		movl $0,-36(%1)  				\n\
		" : : "r" (func), "r" (to->stackEnd));		\
		to->restorePoint = to->stackEnd - 36

#define	THREADINFO(ee)						\
		do {						\
			void** ptr;				\
			int i;					\
			asm("movl %%ebp,%0" : "=r" (ptr));	\
			for (i = 0; i != 2; i++) {              \
				ptr = (void**)*ptr;		\
			}					\
			(ee)->restorePoint = 0;			\
			(ee)->stackEnd = (void*)ptr;		\
			(ee)->stackBase = (ee)->stackEnd - threadStackSize;\
			(ee)->flags = THREAD_FLAGS_NOSTACKALLOC;\
		} while(0)

#define	THREADFRAMES(tid, cnt)					\
		do {						\
			void** ptr;				\
			cnt = 0;				\
			if (tid == currentThread) {		\
				asm("movl %%ebp,%0" : "=r" (ptr));\
			}					\
			else {					\
				ptr = ((void***)TCTX(tid)->restorePoint)[2];\
			}					\
			while (*ptr != 0) {			\
				cnt++;				\
				ptr = (void**)*ptr;		\
			}					\
		} while (0)

#endif
