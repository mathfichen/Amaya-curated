/*
 * m68k/threads.h  
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

#ifndef __m68k_threads_h
#define __m68k_threads_h

/**/
/* Thread handling */
/**/

/* NOTE! a6 is asumed to be the frame pointer (only for frame counting). */
 
/* 
 * Stack of waiting thread:
 *       + 64... Thread stack
 *       + 60    pc  (return address)
 *       + 56    a6  (frame pointer) (56=14*4)
 *       + 52    a5
 *        ...    
 *       + 32    a0
 *        ...
 *       +  4    d0
 * SPReg +  0    d0
 */

#define USE_INTERNAL_THREADS

#define THREADSTACKSIZE         (32 * 1024)

#define M68K_THREADSWITCH(to, from)                       \
                   asm("                                 \
                   pea _1:l                            \n\
                   movml d0-d7/a0-a6, a7@-             \n\
                   movel a7, %0@                       \n\
                   movel %1, a7                        \n\
                   movml a7@+,d0-d7/a0-a6              \n\
                   rts                                 \n\
                _1:                                     "\
                   : : "a" (&from->restorePoint), "a" (to->restorePoint))
 
#define M68K_THREADINIT(to, func)                        \
                 asm("                                  \
                 moveq #0, d0                           \n\
                 movel %2, %0@-                         \n\
                 movel d0, %0@-                         \n\
                 movel d0, %0@-                         \n\
                 movel d0, %0@-                         \n\
                 movel d0, %0@-                         \n\
                 movel d0, %0@-                         \n\
                 movel d0, %0@-                         \n\
                 movel d0, %0@-                         \n\
                 movel d0, %0@-                         \n\
                 movel d0, %0@-                         \n\
                 movel d0, %0@-                         \n\
                 movel d0, %0@-                         \n\
                 movel d0, %0@-                         \n\
                 movel d0, %0@-                         \n\
                 movel d0, %0@-                         \n\
                 movel d0, %0@-                          "\
                 : "=a" (to->restorePoint) : "0" (to->stackEnd), "g" (func) : "d0", "d1")

#define M68K_THREADINFO(ee)                                     \
               do {                                            \
                       void** ptr;                             \
                       int i;                                  \
                       asm("movel a6, %0" : "=r" (ptr));       \
                       for (i = 0; i != 2; i++) {              \
                               ptr = (void**)*ptr;             \
                       }                                       \
                       (ee)->restorePoint = 0;                 \
                       (ee)->stackEnd = (void*)ptr;            \
                       (ee)->stackBase = (ee)->stackEnd - threadStackSize; \
               } while(0)
   
#define M68K_THREADFRAMES(tid, cnt)                            \
               do {                                            \
                       void** ptr;                             \
                       cnt = 0;                                \
                       if (tid == currentThread) {             \
                               asm("movel a6,%0" : "=r" (ptr));\
                       }                                       \
                       else {                                  \
                               ptr = ((void***)TCTX(tid)->restorePoint)[13];\
                       }                                       \
                       while (*ptr != 0) {                     \
                               cnt++;                          \
                               ptr = (void**)*ptr;             \
                       }                                       \
               } while (0)

#define THREADSWITCH(to, from)    M68K_THREADSWITCH(to, from)  
#define THREADINIT(to, func)      M68K_THREADINIT(to, func)    
#define THREADINFO(ee)            M68K_THREADINFO(ee)
#define THREADFRAMES(tid,cnt)     M68K_THREADFRAMES(tid, cnt)
   
#endif
