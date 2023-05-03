
/*
 * powerpc/threads.h
 * Sparc threading information.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 * Ported  by Attila Molnar <gusthy@hu.bonus.com>, July 1996.
 */

#ifndef __powerpc_threads_h
#define __powerpc_threads_h

/**/
/* Thread handling */
/**/
#define	USE_INTERNAL_THREADS

#ifndef THREADSTACKSIZE
#define	THREADSTACKSIZE		(32 * 1024)
#endif

#ifndef THREADFUNCTION
#define THREADFUNCTION(f) (int)(f)
#endif

#define	THREADSWITCH(to, from) {					      \
    int regstore[64];							      \
/*									      \
printf("switch from %x to %x\n",((from)->restorePoint),((to)->restorePoint)); \
printf("&regstore = %x\n", regstore);					      \
if((to)->restorePoint) printf("cim: %x\n", *((int *)((to)->restorePoint)+1)); \
*/									      \
    { int aa = 0; thread_dummy("%d\n", aa); }				      \
    asm("								    \n\
		stw 1, 4+%2						    \n\
		stw 2, 8+%2						    \n\
		stw 3, 12+%2						    \n\
		stw 4, 16+%2						    \n\
		stw 5, 20+%2						    \n\
		stw 6, 24+%2						    \n\
		stw 7, 28+%2						    \n\
		stw 8, 32+%2						    \n\
		stw 9, 36+%2						    \n\
		stw 10, 40+%2						    \n\
		stw 11, 44+%2						    \n\
		stw 12, 48+%2						    \n\
		stw 13, 52+%2						    \n\
		stw 14, 56+%2						    \n\
		stw 15, 60+%2						    \n\
		stw 16, 64+%2						    \n\
		stw 17, 68+%2						    \n\
		stw 18, 72+%2						    \n\
		stw 19, 76+%2						    \n\
		stw 20, 80+%2						    \n\
		stw 21, 84+%2						    \n\
		stw 22, 88+%2						    \n\
		stw 23, 92+%2						    \n\
		stw 24, 96+%2						    \n\
		stw 25, 100+%2						    \n\
		stw 26, 104+%2						    \n\
		stw 27, 108+%2						    \n\
		stw 28, 112+%2						    \n\
		stw 29, 116+%2						    \n\
		stw 30, 120+%2						    \n\
		stw 0, 124+%2						    \n\
		stw 31, 128+%2						    \n\
		lwz 27, %3						    \n\
		stw 27, %0 						    \n\
		bl L..1000						    \n\
		nop							    \n\
		nop							    \n\
		nop							    \n\
		nop							    \n\
L..1000:	nop							    \n\
		nop							    \n\
		nop							    \n\
		nop							    \n\
		mflr 27							    \n\
		addi 27, 27, L..1001-L..1000				    \n\
		stw 27, %2						    \n\
		lwz 31, %1						    \n\
		lwz 27, 0(31)						    \n\
		mtlr 27							    \n\
		lwz 1, 4(31)						    \n\
		lwz 2, 8(31)						    \n\
		lwz 3, 12(31)						    \n\
		lwz 4, 16(31)						    \n\
		lwz 5, 20(31)						    \n\
		lwz 6, 24(31)						    \n\
		lwz 7, 28(31)						    \n\
		lwz 8, 32(31)						    \n\
		lwz 9, 36(31)						    \n\
		lwz 10, 40(31)						    \n\
		lwz 11, 44(31)						    \n\
		lwz 12, 48(31)						    \n\
		lwz 13, 52(31)						    \n\
		lwz 14, 56(31)						    \n\
		lwz 15, 60(31)						    \n\
		lwz 16, 64(31)						    \n\
		lwz 17, 68(31)						    \n\
		lwz 18, 72(31)						    \n\
		lwz 19, 76(31)						    \n\
		lwz 20, 80(31)						    \n\
		lwz 21, 84(31)						    \n\
		lwz 22, 88(31)						    \n\
		lwz 23, 92(31)						    \n\
		lwz 24, 96(31)						    \n\
		lwz 25, 100(31)						    \n\
		lwz 26, 104(31)						    \n\
		lwz 27, 108(31)						    \n\
		lwz 28, 112(31)						    \n\
		lwz 29, 116(31)						    \n\
		lwz 30, 120(31)						    \n\
		lwz 0, 124(31)						    \n\
		lwz 31, 128(31)						    \n\
		blr							    \n\
		nop							    \n\
		nop							    \n\
		nop							    \n\
		nop							    \n\
L..1001:	nop							    \n\
		nop							    \n\
		nop							    \n\
		nop							    \n\
	" : "=m" ((from)->restorePoint), "=m" ((to)->restorePoint),	      \
					 "=m" (regstore)	      	      \
	  : "m"((int)(&regstore))					      \
	  :  "0",  "1", "2",     "3",  "4",  "5",    "6",  "7",		      \
	     "8",  "9", "10", /*"11", "12", "13",*/ "14", "15",		      \
	    "16", "17", "18",   "19", "20", "21",   "22", "23",		      \
	    "24", "25", "26",   "27", "28", "29",   "30", "31");	      \
}

#define THREADINIT(to, func) {	                                  	      \
    int* regstore = (int*)((to)->stackEnd - (64 * 4));			      \
/*									      \
printf("Init restore point %x\n", regstore);				      \
*/									      \
    (to)->restorePoint = (void*)regstore;				      \
    regstore[0] = THREADFUNCTION(func);					      \
    regstore[1] = ((int)regstore)-80*4;					      \
}

#define	THREADINFO(ee) do {						      \
    static int main_reg_store[64];					      \
    register void** ptr;						      \
    int i;								      \
    asm("mr %0, 1" : "=r" (ptr) : ); 					      \
    for (i = 0; i != 2; i++) {              				      \
	ptr = (void**)*ptr;						      \
    }									      \
    (ee)->restorePoint = (void *)main_reg_store;			      \
    (ee)->stackEnd = (void*)ptr;					      \
    (ee)->stackBase = (ee)->stackEnd - threadStackSize;			      \
    (ee)->flags = THREAD_FLAGS_NOSTACKALLOC;				      \
} while(0)

#define	THREADFRAMES(tid, cnt) do {					      \
    void** ptr;								      \
    cnt = 0;								      \
/*									      \
printf("threadframes tid = %x ct = %x cnt = %d\n",tid,currentThread,cnt);     \
*/									      \
    if (tid == currentThread) {						      \
	asm("stw 1, %0" : :"m" (&ptr));					      \
    } else {								      \
	ptr = ((void***)TCTX(tid)->restorePoint)[2];			      \
    }									      \
    while (*ptr != 0) {							      \
	cnt++;								      \
	ptr = (void**)ptr[14];						      \
    }									      \
} while (0)

#endif
