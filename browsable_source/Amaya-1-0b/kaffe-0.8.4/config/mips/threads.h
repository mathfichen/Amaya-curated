/*
 * sparc/threads.h
 * Sparc threading information.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 */

#ifndef __mips_threads_h
#define __mips_threads_h

/**/
/* Thread handling */
/**/
#define	USE_INTERNAL_THREADS

#define	THREADSTACKSIZE		(32 * 1024)

#define	THREADSWITCH(to, from) {				\
	asm("							\n\
		subu	$sp,$sp,32*4				\n\
		sw	$2,  2*4($sp)				\n\
		sw	$3,  3*4($sp)				\n\
		sw	$4,  4*4($sp)				\n\
		sw	$5,  5*4($sp)				\n\
		sw	$6,  6*4($sp)				\n\
		sw	$7,  7*4($sp)				\n\
		sw	$8,  8*4($sp)				\n\
		sw	$9,  9*4($sp)				\n\
		sw	$10,10*4($sp)				\n\
		sw	$11,11*4($sp)				\n\
		sw	$12,12*4($sp)				\n\
		sw	$13,13*4($sp)				\n\
		sw	$14,14*4($sp)				\n\
		sw	$15,15*4($sp)				\n\
		sw	$16,16*4($sp)				\n\
		sw	$17,17*4($sp)				\n\
		sw	$18,18*4($sp)				\n\
		sw	$19,19*4($sp)				\n\
		sw	$20,20*4($sp)				\n\
		sw	$21,21*4($sp)				\n\
		sw	$22,22*4($sp)				\n\
		sw	$23,23*4($sp)				\n\
		sw	$24,24*4($sp)				\n\
		sw	$25,25*4($sp)				\n\
		sw	$26,26*4($sp)				\n\
		sw	$27,27*4($sp)				\n\
		sw	$28,28*4($sp)				\n\
		sw	$30,30*4($sp)				\n\
		la	$16, 1f					\n\
		sw	$16,31*4($sp)				\n\
		sw	$sp, 0(%0)				\n\
		lw	$sp, 0(%1)				\n\
		lw	$2,  2*4($sp)				\n\
		lw	$3,  3*4($sp)				\n\
		lw	$4,  4*4($sp)				\n\
		lw	$5,  5*4($sp)				\n\
		lw	$6,  6*4($sp)				\n\
		lw	$7,  7*4($sp)				\n\
		lw	$8,  8*4($sp)				\n\
		lw	$9,  9*4($sp)				\n\
		lw	$10,10*4($sp)				\n\
		lw	$11,11*4($sp)				\n\
		lw	$12,12*4($sp)				\n\
		lw	$13,13*4($sp)				\n\
		lw	$14,14*4($sp)				\n\
		lw	$15,15*4($sp)				\n\
		lw	$16,16*4($sp)				\n\
		lw	$17,17*4($sp)				\n\
		lw	$18,18*4($sp)				\n\
		lw	$19,19*4($sp)				\n\
		lw	$20,20*4($sp)				\n\
		lw	$21,21*4($sp)				\n\
		lw	$22,22*4($sp)				\n\
		lw	$23,23*4($sp)				\n\
		lw	$24,24*4($sp)				\n\
		lw	$25,25*4($sp)				\n\
		lw	$26,26*4($sp)				\n\
		lw	$27,27*4($sp)				\n\
		lw	$28,28*4($sp)				\n\
		lw	$30,30*4($sp)				\n\
		lw	$31,31*4($sp)				\n\
		addu	$sp,$sp,32*4				\n\
		j	$31					\n\
1:		nop						\n\
		" : : "r" (&((from)->restorePoint)),		\
		      "r" (&((to)->restorePoint))		\
		);						\
	}

#define THREADINIT(to, func) {                                  \
                int* regstore = (int*)((to)->stackEnd - (32 * 4));\
                (to)->restorePoint = (void*)regstore;		\
		regstore[29] = ((int)regstore) - (32 * 4);	\
                regstore[31] = func;				\
		regstore[25] = func;				\
        }

#define	THREADINFO(ee)						\
		do {						\
			void** ptr;				\
			int i;					\
			asm("move %0, $sp" : "=r" (ptr));	\
			/*					\
			for (i = 0; i != 2; i++) {              \
				ptr = (void**)ptr[2];		\
			}					\
			*/					\
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
				asm("move $sp, %0" : "=r" (ptr));\
			}					\
			else {					\
				ptr = ((void***)TCTX(tid)->restorePoint)[2];\
			}					\
			while (*ptr != 0) {			\
				cnt++;				\
				ptr = (void**)ptr[2];		\
			}					\
		} while (0)

#endif
