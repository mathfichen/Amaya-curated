/* 
 * m68k/nextstep3/md.h
 * NEXTSTEP m68k specific functions.   
 *
 * Copyright (c) 1996 Matthias Hopf <mshopf@informatik.uni-erlangen.de>
 * 
 * Permission granted for Tim Wilkinson to include this source in his
 * Kaffe system, Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES. 
 */
  
#ifndef __m68k_nextstep3_md_h
#define __m68k_nextstep3_md_h


#include "m68k/nextstep3/threads.h"

   
#if 0
#undef  THREADINFO
/* we should use StackSwap instead of native code, but that would be too compli
cated and extra overhead... */
#define THREADINFO(ee)                                               \
                 do {                                               \
                     int stacksize;                                 \
                     M68K_THREADINFO (ee);                          \
                     (ee)->stackBase = FindTask(NULL)->tc_SPLower; /* not NULL
on Amiga!!! This is the absolute minimum stack base of this task! */ \
                     stacksize = (ee)->stackEnd - (ee)->stackBase;  \
                     if (stacksize < threadStackSize)               \
                     {                                              \
                         fprintf (stderr, "stack size too low - stack left (%d)
 < stack needed (%d)\n", stacksize, threadStackSize); \
                         exit (20);                                 \
                     }                                              \
                 } while (0)

#undef  THREADSWITCH
/* we *should* surround this with Forbid()/Permit() (Task struct stack consiste
ncy), but overhead is too high. */
#define THREADSWITCH(to, from)                                       \
                 do {                                               \
                     struct Task *task;             /* perhaps this should be s
aved in ctx */                                         \
                     task = FindTask (NULL);        /* write stack information
into system structures */                              \             
                     task->tc_SPLower = (to)->stackBase;            \
                     task->tc_SPUpper = (to)->stackEnd;             \ 
DBG(                  printf ("setting task stack info from %x to %x\n", (to)->
stackBase, (to)->stackEnd); )                           \
                     M68K_THREADSWITCH(to, from);                   \
                 } while (0)
#endif                   

#if defined(TRANSLATOR)  
#include "jit-md.h"
#endif           

#endif  
