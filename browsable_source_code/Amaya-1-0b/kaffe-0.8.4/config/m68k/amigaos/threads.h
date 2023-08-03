/*
 * m68k/amigaos/threads.h
 * m68k thread handling.
 *
 * Copyright (c) 1996 Matthias Hopf <mshopf@informatik.uni-erlangen.de>
 *
 * Permission granted for Tim Wilkinson to include this source in his
 * Kaffe system, Copyright (c) 1996 Systems Architecture Research Centre,
 *               City University, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 */

#ifndef __m68k_threads_h
#define __m68k_threads_h

#ifndef __thread_h
/* Grmbl. Need this for prototypes. */
struct _ctx;
#endif

/**/
/* Thread handling */
/**/

/* NOTE! a5 is asumed to be the frame pointer (only for frame counting and saving). */

/*
 * Stack of waiting thread:
 *       +  4   pc  (return address)
 *       +  0   a5  (frame pointer)
 * remaining registers are scratched.
 */

#define USE_INTERNAL_THREADS

#define THREADSTACKSIZE         (32 * 1024)

#ifdef __HAVE_68881__
#  define MD_FPUREGS ,"fp0","fp1","fp2","fp3","fp4","fp5","fp6","fp7"
#else
#  define MD_FPUREGS
#endif


/* This thread switching macro may only be used in a *short* function,
 * because it clobbers all registers and gcc will complain
 * "fixed or forbidden register was spilled." when used in a more complex
 * environment.
 * Thus in md.c a function md_threadswitch() must be defined that may use
 * this macro. */
#define MD_THREADSWITCH(to, from)                        \
		    asm("                                \
		    pea 1f                               \n\
		    move.l a5, -(a7)                     \n\
		    move.l a7, %0                        \n\
		    move.l %1, a7                        \n\
		    move.l (a7)+,a5                      \n\
		    rts                                  \n\
		 1: nop                                " \
	    : "=m" ((from)->restorePoint), "=m" ((to)->restorePoint) : : "cc","memory", \
	   "d0","d1","d2","d3","d4","d5","d6","d7",/*"a0","a1",*/"a2","a3","a4","a5","a6" \
	   MD_FPUREGS);

#define MD_THREADINIT(to, func)                          \
		  asm("                                  \
		  moveq #0, d0                           \n\
		  move.l %2, -(%0)                       \n\
		  move.l d0, -(%0)                     " \
		  : "=a" (to->restorePoint) : "0" (to->stackEnd), "g" (func) : "d0", "cc")

#define MD_THREADINFO(ee)                                       \
		do {                                            \
			void** ptr;                             \
			int i;                                  \
			asm("move.l a5, %0" : "=r" (ptr));      \
			for (i = 0; i != 2; i++) {              \
				ptr = (void**)*ptr;             \
			}                                       \
			(ee)->restorePoint = 0;                 \
			(ee)->stackEnd = (void*)ptr;            \
			(ee)->stackBase = (ee)->stackEnd - threadStackSize;\
			(ee)->flags = THREAD_FLAGS_NOSTACKALLOC;\
		} while(0)

#define MD_THREADFRAMES(tid, cnt)                               \
		do {                                            \
			void** ptr;                             \
			cnt = 0;                                \
			if (tid == currentThread) {             \
				asm("move.l a5,%0" : "=r" (ptr));\
			}                                       \
			else {                                  \
				ptr = ((void***)TCTX(tid)->restorePoint)[0];\
			}                                       \
			while (*ptr != 0) {                     \
				cnt++;                          \
				ptr = (void**)*ptr;             \
			}                                       \
		} while (0)

void md_threadswitch (struct _ctx *to, struct _ctx *from);

#define THREADSWITCH(to,from)     md_threadswitch (to,from)
#define THREADINIT(to,func)       MD_THREADINIT(to,func)
#define THREADINFO(ee)            MD_THREADINFO(ee)
#define THREADFRAMES(tid,cnt)     MD_THREADFRAMES(tid, cnt)

#endif
