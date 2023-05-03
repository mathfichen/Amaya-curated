/*
 * slots.h
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>
 */

#ifndef __slots_h
#define	__slots_h

#define	push(_n)	sp -= (_n)
#define	pop(_n)		sp += (_n)
#define	stack(_n)	(&sp[(_n)])
#define	rstack(_n)	stack(_n)
#define	wstack(_n)	stack(_n)
#define	local(_n)	(&lcl[(_n)])
#define local_long(_n)	(&lcl[(_n)+1])
#define local_float	local
#define local_double	local_long

#define	slot_alloctmp(s) /* Does nothing for interpreter */
#define	slot_nowriteback(s) /* Does nothing for interpreter */

#endif
