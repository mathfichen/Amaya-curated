/*
 * mips/mips.c
 * MIPS specific functions.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#ifndef inline
# define inline
#endif

inline int
mipsCountFrames (void** pc, void** sp)
{
  printf ("Count frames from $pc=%p $sp=%p\n", pc, sp);
  return 2;
}
