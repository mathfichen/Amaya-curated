/*
 * parisc/hpux/threads.h
 * HP-UX threading information.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 * 
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Laura Dickey <ljd@hpeoposk.cup.hp.com>
 *        and Bernie Solomon <bernard@edsug.com>
 *
 */

#ifndef __parisc_hpux_threads_h
#define __parisc_hpux_threads_h

/* Stacks go up on the PARISC */
#define	STACK_GROWS_UP	1
 
/**/
/* Thread handling */
/**/ 
#define USE_INTERNAL_THREADS  
  
/* Not sure on this... */
#define THREADSTACKSIZE		(32 * 1024)
  
#define THREADSWITCH(to, from) \
	parisc_threadswitch(&(from)->restorePoint, &(to)->restorePoint)

#define THREADINIT(to, func)						\
	do {								\
		int i;							\
		void ** regstore = (void **)(to)->stackBase + 64;	\
		regstore[-45] = 0;					\
		regstore[-44] = func;					\
		(to)->restorePoint = (void *)regstore;			\
	} while (0)

#define THREADINFO(ee)
        do {                                                            \
                register uint8 *sp __asm__("%r30");                     \
                (ee)->restorePoint = NULL;                              \
                (ee)->stackBase = sp;                                   \
                (ee)->stackEnd = sp + threadStackSize;                  \
                (ee)->flags = THREAD_FLAGS_NOSTACKALLOC;                \
        } while (0)

#define THREADFRAMES(tid, cnt)                                          \
        do {                                                            \
                /* This information is not available on the HP */       \
                cnt = 0;                                                \
        } while (0)

#endif
