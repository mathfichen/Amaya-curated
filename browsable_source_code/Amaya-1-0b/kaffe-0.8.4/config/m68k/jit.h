/*
 * m68k/jit.h
 * Common M68000 JIT configuration information.
 *
 * Copyright (c) 1997 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Richard Henderson <rth@tamu.edu>, 1997
 */

#ifndef __m68k_jit_h
#define __m68k_jit_h

/**/
/* Native function invocation. */
/**/
#define	CALL_KAFFE_FUNCTION_VARARGS(meth, obj, nargs, argptr, retval)	\
	__asm__ __volatile__(						\
		"movem%.l %/d0-%/d7/%/a0-%/a5,%-\n\t"			\
		"fmovem %/fp0-%/fp7,%-\n\t"				\
		"move%.l %3,%/d0\n\t"					\
		"beq 2f\n\t"						\
		"lea 0(%4,%/d0:l*4),%/a0\n\t"				\
		"subq %#1,%/d0\n\t"					\
	"1:	move%.l -(%/a0),%-\n\t"					\
		"dbra %/d0, 1b\n"					\
	"2:	move%.l %2,%-\n\t"					\
		"jsr (%1)\n\t"						\
		"move%.l %5,%/d1\n\t"					\
		"addl %/d1,%/sp\n\t"					\
		"move%.l %/d0,%0\n\t"					\
		"fmovem %+,%/fp0-%/fp7\n\t"				\
		"movem%.l %+,%/d0-%/d7/%/a0-%/a5"			\
		: "=m"(retval)						\
		: "a"(meth->ncode), "g"(obj), "g"(nargs), "a"(argptr),	\
		  "m"(4*(nargs+1))					\
		: "cc", "memory")

#define CALL_KAFFE_FUNCTION(meth, obj)                                  \
	__asm__ __volatile__(						\
		"movem%.l %/d0-%/d7/%/a0-%/a5,%-\n\t"			\
		"fmovem %/fp0-%/fp7,%-\n\t"				\
		"move%.l %1,%-\n\t"					\
		"jsr (%0)\n\t"						\
		"addl %#4,%/sp\n\t"					\
		"fmovem %+,%/fp0-%/fp7\n\t"				\
		"movem%.l %+,%/d0-%/d7/%/a0-%/a5"			\
		: : "a"(meth->ncode), "g"(obj)				\
		: "cc", "memory")
		
/**/
/* Exception handling information. */
/**/

extern struct _thread* currentThread;

/* Structure of exception frame on stack */
typedef struct _exceptionFrame {
        uintp	retfp;
        uintp	retpc;
} exceptionFrame;

/* Is this frame valid (ie. is it on the current stack) ? */
#define	FRAMEOKAY(f)							\
	((f) && (f)->retfp >= (uintp)TCTX(currentThread)->stackBase &&	\
	 (f)->retfp < (uintp)TCTX(currentThread)->stackEnd)

/* Get the next frame in the chain */
#define	NEXTFRAME(f)							\
	((f) = (exceptionFrame*)(f)->retfp)

/* Extract the PC from the given frame */
#define	PCFRAME(f)		((f)->retpc)

/* Get the first exception frame from a subroutine call */
#define	FIRSTFRAME(f, o)						\
	((f) = *(exceptionFrame*)__builtin_frame_address(0))

/* Extract the object argument from given frame */
#define FRAMEOBJECT(f) 		(*(Hjava_lang_Object**)((f)->retfp + 8))

/* Call the relevant exception handler (rewinding the stack as
   necessary). */
#define CALL_KAFFE_EXCEPTION(frame, info, obj)				\
	__asm__ __volatile__(						\
		"move%.l %0,%/fp\n\t"					\
		"move%.l %1,%/d0\n\t"					\
		"jmp (%2)"						\
		: : "g"(frame->retfp), "g"(obj), "a"(info.handler)	\
		: "d0", "cc", "memory")


/**/
/* Register management information. */
/**/

/* Define the register set */

/* Until we have some method of determining in the prologue which
   Rnosaveoncall registers are used by a method, it is not a win to
   have any at all.  */

#define	REGISTER_SET							\
	{ /* d0 */	0, 0, Rint, 		0, 0, 0  },		\
	{ /* d1 */	0, 0, Rint, 		0, 0, 1  },		\
	{ /* d2 */	0, 0, Rint, 		/*Rnosaveoncall*/0, 0, 2  }, \
	{ /* d3 */	0, 0, Rint, 		/*Rnosaveoncall*/0, 0, 3  }, \
	{ /* d4 */	0, 0, Rint, 		/*Rnosaveoncall*/0, 0, 4  }, \
	{ /* d5 */	0, 0, Rint, 		/*Rnosaveoncall*/0, 0, 5  }, \
	{ /* d6 */	0, 0, Rint, 		/*Rnosaveoncall*/0, 0, 6  }, \
	{ /* d7 */	0, 0, Rint, 		/*Rnosaveoncall*/0, 0, 7  }, \
	{ /* a0 */	0, 0, Rref,		0, 0, 8  },		\
	{ /* a1 */	0, 0, Rref,		0, 0, 9  },		\
	{ /* a2 */	0, 0, Rref,		/*Rnosaveoncall*/0, 0, 10 }, \
	{ /* a3 */	0, 0, Rref,		/*Rnosaveoncall*/0, 0, 11 }, \
	{ /* a4 */	0, 0, Rref,		/*Rnosaveoncall*/0, 0, 12 }, \
	{ /* a5 */	0, 0, Rref,		/*Rnosaveoncall*/0, 0, 13 }, \
	{ /* fp */	0, 0, Reserved,		0, 0, 14 },		\
	{ /* sp */	0, 0, Reserved,		0, 0, 15 },		\
	{ /* fp0 */	0, 0, Rfloat|Rdouble,	0, 0, 16 },		\
	{ /* fp1 */	0, 0, Rfloat|Rdouble,	0, 0, 17 },		\
	{ /* fp2 */	0, 0, Rfloat|Rdouble,	/*Rnosaveoncall*/0, 0, 18 }, \
	{ /* fp3 */	0, 0, Rfloat|Rdouble,	/*Rnosaveoncall*/0, 0, 19 }, \
	{ /* fp4 */	0, 0, Rfloat|Rdouble,	/*Rnosaveoncall*/0, 0, 20 }, \
	{ /* fp5 */	0, 0, Rfloat|Rdouble,	/*Rnosaveoncall*/0, 0, 21 }, \
	{ /* fp6 */	0, 0, Rfloat|Rdouble,	/*Rnosaveoncall*/0, 0, 22 }, \
	{ /* fp7 */	0, 0, Rfloat|Rdouble,	/*Rnosaveoncall*/0, 0, 23 }, 

/* Number of registers in the register set */
#define	NR_REGISTERS	24

/* Define which registers are used for which return values as seen
 * by the the callee */
#define	RETURN_INT		0	/* d0 */
#define	RETURN_REF		M68K_RETURN_REF
#define	RETURN_LONG_LOW		1	/* d1 */
#define	RETURN_LONG_HIGH	0	/* d0 */
#define	RETURN_FLOAT		32	/* f0 */
#define	RETURN_DOUBLE_LOW	32	/* f0 */
#define	RETURN_DOUBLE_HIGH	32	/* Not used in this configuration */

/**/
/* Opcode generation. */
/**/

/* Define if generated code uses two operands rather than one */
#define	TWO_OPERAND

/**/
/* Slot management information. */
/**/

/* Size of each slot */
#define	SLOTSIZE		4

/*
 * A stack frame looks like:
 *
 *      |				|
 *	|  Arguments			|
 *      |-------------------------------|
 *	|  Return address		|
 *      |-------------------------------|
 *      |  Saved fp			|
 * fp-> |-------------------------------|
 *      |  Temporaries			|
 * sp-> |-------------------------------|
 */

/* Generate slot offset for an argument (relative to fp) */
#define SLOT2ARGOFFSET(_n)    (8 + SLOTSIZE*((_n) + isStatic))

/* Generate slot offset for a local (non-argument) (relative to fp) */
#define SLOT2LOCALOFFSET(_n)  (-SLOTSIZE * (maxTemp+maxLocal+maxStack - (_n)))

/* Wrap up a native call for the JIT */
#define	KAFFEJIT_TO_NATIVE(_m)

/* On the 68040 (and 060 I presume) we need to flush the instruction
   cache before running new code.  Stupidly, Motorola made cpush a
   privledged instruction, so we have to get operating system help
   for this.  Naturally, there is no standard there. 

   We are partially rescued by gcc, which must be taught how to do this
   in order to build bound-function trampolines.  This works at least
   for A/UX, Linux and NeXT.  The rest of you with 040's should
   consider fixing gcc, as you are broken there too.  

   For those with 020's and 030's, this is effectively a no-op.  */

#define FLUSH_DCACHE(beg,end)	__clear_cache((beg), (end))


#endif
