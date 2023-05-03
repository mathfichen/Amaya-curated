/*
 * alpha/threads.c
 * Alpha threading information.
 *
 * Copyright (c) 1997 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Richard Henderson <rth@tamu.edu>, 1997,
 */



   asm(".text
	.align 3
	.globl alpha_threadswitch
	.ent alpha_threadswitch
alpha_threadswitch:
	.frame	$30,16*8,$26,0
	subq	$30,16*8,$30
	.prologue 0
	stq	$9,0*8($30)
	stq	$10,1*8($30)
	stq	$11,2*8($30)
	stq	$12,3*8($30)
	stq	$13,4*8($30)
	stq	$14,5*8($30)
	stq	$15,6*8($30)
	stq	$26,7*8($30)
	stt	$f2,8*8($30)
	stt	$f3,9*8($30)
	stt	$f4,10*8($30)
	stt	$f5,11*8($30)
	stt	$f6,12*8($30)
	stt	$f7,13*8($30)
	stt	$f8,14*8($30)
	stt	$f9,15*8($30)
	stq	$30,0($16)
	ldq	$30,0($17)
	ldt	$f9,15*8($30)
	ldt	$f8,14*8($30)
	ldt	$f7,13*8($30)
	ldt	$f6,12*8($30)
	ldt	$f5,11*8($30)
	ldt	$f4,10*8($30)
	ldt	$f3,9*8($30)
	ldt	$f2,8*8($30)
	ldq	$26,7*8($30)
	ldq	$15,6*8($30)
	ldq	$14,5*8($30)
	ldq	$13,4*8($30)
	ldq	$12,3*8($30)
	ldq	$11,2*8($30)
	ldq	$10,1*8($30)
	ldq	$9,0*8($30)
	mov	$26,$27
	addq	$30,16*8,$30
	ret
	.end alpha_threadswitch");
