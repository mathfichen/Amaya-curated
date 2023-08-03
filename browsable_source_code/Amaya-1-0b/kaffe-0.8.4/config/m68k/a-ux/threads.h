/*
 * m68k/aux/threads.h  
 * m68k thread handling.
 *
 * Copyright (c) 1996 Matthias Hopf <mshopf@informatik.uni-erlangen.de>
 * netbsd/m68k version  Erik Johannessen <erjohann@sn.no>
 *
 * Permission granted for Tim Wilkinson to include this source in his
 * Kaffe system, Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 */

#ifndef __m68k_aux_threads_h
#define __m68k_aux_threads_h

/**/
/* Thread handling */
/**/

#define USE_INTERNAL_THREADS

#define THREADSTACKSIZE         (32 * 1024)

#define M68K_THREADSWITCH(to, from)					\
	do {								\
		__asm__ __volatile__(					\
		"pea 1f\n\t"						\
		"movem%.l %/d0-%/d7/%/a0-%/a6, %-\n\t"			\
		"move%.l %/a7, %0\n\t"					\
		"move%.l %1, %/a7\n\t"					\
		"movem%.l %+, %/d0-%/d7/%/a0-%/a6\n\t"			\
		"rts\n"                                                 \
		"1:"							\
		: : "m"(from->restorePoint), "m"(to->restorePoint)	\
		: "memory", "cc", "fp0", "fp1", "fp2", "fp3", "fp4",	\
		"fp5", "fp6", "fp7");					\
	} while (0)

#define M68K_THREADINIT(to, func)					\
	do {								\
		void **ptr = (void **)to->stackEnd;			\
		*--ptr = func; *--ptr = NULL; ptr -= 14;		\
		to->restorePoint = (void*)ptr;				\
	} while (0)

#define M68K_THREADINFO(ee)						\
	do {								\
		void* ptr = __builtin_frame_address(2);			\
		(ee)->restorePoint = 0;					\
		(ee)->stackEnd = ptr;					\
		(ee)->stackBase = ptr - threadStackSize;		\
	} while(0)

#define M68K_THREADFRAMES(tid, cnt)					\
	do {								\
		void** ptr;						\
		if (tid == currentThread)				\
		ptr = (void **)__builtin_frame_address(0);		\
		else							\
		ptr = ((void***)TCTX(tid)->restorePoint)[14];		\
		for (cnt = 0; *ptr != 0 ; ++cnt)			\
		ptr = (void**)*ptr;					\
	} while (0)
	 
#define THREADSWITCH(to, from)    M68K_THREADSWITCH(to, from)  
#define THREADINIT(to, func)      M68K_THREADINIT(to, func)    
#define THREADINFO(ee)            M68K_THREADINFO(ee)
#define THREADFRAMES(tid,cnt)     M68K_THREADFRAMES(tid, cnt)
   
#endif
