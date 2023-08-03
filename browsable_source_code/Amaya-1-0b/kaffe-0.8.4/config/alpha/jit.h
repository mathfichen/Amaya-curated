/*
 * alpha/jit.h
 * Common Alpha JIT configuration information.
 *
 * Copyright (c) 1997 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Richard Henderson <rth@tamu.edu>, 1997
 */

#ifndef __alpha_jit_h
#define __alpha_jit_h

#include <stdarg.h>

/**/
/* Native function invocation. */
/**/
struct Hjava_lang_Object;

#define	CALL_KAFFE_FUNCTION_VARARGS(meth, obj, args, argptr, retval)	\
	(retval = alpha_call_kaffe_function_varargs(meth, obj, argptr))

#define CALL_KAFFE_FUNCTION(meth, obj)                                  \
	alpha_call_kaffe_function(meth, obj)

extern jword alpha_call_kaffe_function_varargs(Method*, struct Hjava_lang_Object*, va_list);
extern jword alpha_call_kaffe_function(Method*, struct Hjava_lang_Object*);


/**/
/* Exception handling information. */
/**/

extern struct _thread* currentThread;

/* Structure of exception frame on stack */
typedef struct _exceptionFrame {
        uintp	retpc;
        uintp	retfp;
} exceptionFrame;

/* Is this frame valid (ie. is it on the current stack) ? */
#define	FRAMEOKAY(f)							\
	((f) && (f)->retfp >= (uintp)TCTX(currentThread)->stackBase &&	\
	 (f)->retfp < (uintp)TCTX(currentThread)->stackEnd)

/* Get the next frame in the chain */
#define	NEXTFRAME(f)							\
	((f) = ((uintp)(f) + 64 < (f)->retfp ?				\
		(exceptionFrame*)((f)->retfp - 64) : NULL))

/* Extract the PC from the given frame */
#define	PCFRAME(f)		((f)->retpc)

/* Get the first exception frame from a subroutine call */
#define	FIRSTFRAME(f, o)						\
	do {								\
		exceptionFrame *_cur = TCTX(currentThread)->exceptPtr;	\
		if (_cur)						\
			(f) = *_cur;					\
		else							\
			(f).retfp = (f).retpc = 0;			\
	} while (0)

/* Extract the object argument from given frame */
/* Assuming it was spilled, this is it anyway... */
#define FRAMEOBJECT(f) 		(*(Hjava_lang_Object**)((f)->retfp - 48))

/* Call the relevant exception handler (rewinding the stack as
   necessary). */
#define CALL_KAFFE_EXCEPTION(frame, info, obj)				\
	__asm__ __volatile__(						\
		"mov %0,$15\n\t"					\
		"mov %1,$0\n\t"						\
		"mov %2,$27\n\t"					\
		"jmp (%2)"						\
		: : "r"(frame->retfp), "r"(obj), "r"(info.handler)	\
		: "$15", "$0", "$27")


/**/
/* Register management information. */
/**/

/* Define the register set */

/* The arg registers are set reserved so that they don't get tromped
   while we are setting up the outgoing arguments.  */

/* Until we have some method of determining in the prologue which
   Rnosaveoncall registers are used by a method, it is not a win to
   have any at all.  We do special things in alpha_do_call_kaffe_function
   to accomodate this when linking from C.  */

#define	REGISTER_SET							\
	{ /* v0  */	0, 0, Rint|Rlong|Rref,	0, 0, 0  },		\
	{ /* t0  */	0, 0, Rint|Rlong|Rref,	0, 0, 1  },		\
	{ /* t1  */	0, 0, Rint|Rlong|Rref,	0, 0, 2  },		\
	{ /* t2  */	0, 0, Rint|Rlong|Rref,	0, 0, 3  },		\
	{ /* t3  */	0, 0, Rint|Rlong|Rref,	0, 0, 4  },		\
	{ /* t4  */	0, 0, Rint|Rlong|Rref,	0, 0, 5  },		\
	{ /* t5  */	0, 0, Rint|Rlong|Rref,	0, 0, 6  },		\
	{ /* t6  */	0, 0, Rint|Rlong|Rref,	0, 0, 7  },		\
	{ /* t7  */	0, 0, Rint|Rlong|Rref,	0, 0, 8  },		\
	{ /* s0  */	0, 0, Rint|Rlong|Rref,	/*Rnosaveoncall*/0, 0, 9  }, \
	{ /* s1  */	0, 0, Rint|Rlong|Rref,	/*Rnosaveoncall*/0, 0, 10 }, \
	{ /* s2  */	0, 0, Rint|Rlong|Rref,	/*Rnosaveoncall*/0, 0, 11 }, \
	{ /* s3  */	0, 0, Rint|Rlong|Rref,	/*Rnosaveoncall*/0, 0, 12 }, \
	{ /* s4  */	0, 0, Rint|Rlong|Rref,	/*Rnosaveoncall*/0, 0, 13 }, \
	{ /* s5  */	0, 0, Rint|Rlong|Rref,	/*Rnosaveoncall*/0, 0, 14 }, \
	{ /* fp  */	0, 0, Reserved,		0, 0, 15 },		\
	{ /* a0  */	0, 0, Reserved|Rint|Rlong|Rref,	0, 0, 16 },	\
	{ /* a1  */	0, 0, Reserved|Rint|Rlong|Rref,	0, 0, 17 },	\
	{ /* a2  */	0, 0, Reserved|Rint|Rlong|Rref,	0, 0, 18 },	\
	{ /* a3  */	0, 0, Reserved|Rint|Rlong|Rref,	0, 0, 19 },	\
	{ /* a4  */	0, 0, Reserved|Rint|Rlong|Rref,	0, 0, 20 },	\
	{ /* a5  */	0, 0, Reserved|Rint|Rlong|Rref,	0, 0, 21 },	\
	{ /* t8  */	0, 0, Rint|Rlong|Rref,	0, 0, 22 },		\
	{ /* t9  */	0, 0, Rint|Rlong|Rref,	0, 0, 23 },		\
	{ /* t10 */	0, 0, Rint|Rlong|Rref,	0, 0, 24 },		\
	{ /* t11 */	0, 0, Rint|Rlong|Rref,	0, 0, 25 },		\
	{ /* ra  */	0, 0, Rint|Rlong|Rref,	0, 0, 26 },		\
	{ /* t12/pv */	0, 0, Rint|Rlong|Rref,	0, 0, 27 },		\
	{ /* at  */	0, 0, Reserved,		0, 0, 28 },		\
	{ /* gp  */	0, 0, Reserved,		0, 0, 29 },		\
	{ /* sp  */	0, 0, Reserved,		0, 0, 30 },		\
	{ /* zero */	0, 0, Reserved,		0, 0, 31 },		\
	{ /* f0  */	0, 0, Rfloat|Rdouble,	0, 0, 32 },		\
	{ /* f1  */	0, 0, Rfloat|Rdouble,	0, 0, 33 },		\
	{ /* f2  */	0, 0, Rfloat|Rdouble,	/*Rnosaveoncall*/0, 0, 34 }, \
	{ /* f3  */	0, 0, Rfloat|Rdouble,	/*Rnosaveoncall*/0, 0, 35 }, \
	{ /* f4  */	0, 0, Rfloat|Rdouble,	/*Rnosaveoncall*/0, 0, 36 }, \
	{ /* f5  */	0, 0, Rfloat|Rdouble,	/*Rnosaveoncall*/0, 0, 37 }, \
	{ /* f6  */	0, 0, Rfloat|Rdouble,	/*Rnosaveoncall*/0, 0, 38 }, \
	{ /* f7  */	0, 0, Rfloat|Rdouble,	/*Rnosaveoncall*/0, 0, 39 }, \
	{ /* f8  */	0, 0, Rfloat|Rdouble,	/*Rnosaveoncall*/0, 0, 40 }, \
	{ /* f9  */	0, 0, Rfloat|Rdouble,	/*Rnosaveoncall*/0, 0, 41 }, \
	{ /* f10 */	0, 0, Rfloat|Rdouble,	0, 0, 42 },		\
	{ /* f11 */	0, 0, Rfloat|Rdouble,	0, 0, 43 },		\
	{ /* f12 */	0, 0, Rfloat|Rdouble,	0, 0, 44 },		\
	{ /* f13 */	0, 0, Rfloat|Rdouble,	0, 0, 45 },		\
	{ /* f14 */	0, 0, Rfloat|Rdouble,	0, 0, 46 },		\
	{ /* f15 */	0, 0, Rfloat|Rdouble,	0, 0, 47 },		\
	{ /* f16 */	0, 0, Reserved|Rfloat|Rdouble,	0, 0, 48 },	\
	{ /* f17 */	0, 0, Reserved|Rfloat|Rdouble,	0, 0, 49 },	\
	{ /* f18 */	0, 0, Reserved|Rfloat|Rdouble,	0, 0, 50 },	\
	{ /* f19 */	0, 0, Reserved|Rfloat|Rdouble,	0, 0, 51 },	\
	{ /* f20 */	0, 0, Reserved|Rfloat|Rdouble,	0, 0, 52 },	\
	{ /* f21 */	0, 0, Reserved|Rfloat|Rdouble,	0, 0, 53 },	\
	{ /* f22 */	0, 0, Rfloat|Rdouble,	0, 0, 54 },		\
	{ /* f23 */	0, 0, Rfloat|Rdouble,	0, 0, 55 },		\
	{ /* f24 */	0, 0, Rfloat|Rdouble,	0, 0, 56 },		\
	{ /* f25 */	0, 0, Rfloat|Rdouble,	0, 0, 57 },		\
	{ /* f26 */	0, 0, Rfloat|Rdouble,	0, 0, 58 },		\
	{ /* f27 */	0, 0, Rfloat|Rdouble,	0, 0, 59 },		\
	{ /* f28 */	0, 0, Rfloat|Rdouble,	0, 0, 60 },		\
	{ /* f29 */	0, 0, Rfloat|Rdouble,	0, 0, 61 },		\
	{ /* f30 */	0, 0, Rfloat|Rdouble,	0, 0, 62 },		\
	{ /* fzero */	0, 0, Reserved,		0, 0, 63 },


/* Number of registers in the register set */
#define	NR_REGISTERS	64

/* Define which registers are used for which return values as seen
 * by the the callee */
#define	RETURN_INT		0	/* v0 */
#define	RETURN_REF		0	/* v0 */
#define	RETURN_LONG_LOW		0	/* v0 */
#define	RETURN_LONG_HIGH	0	/* Not used in this configuration */
#define	RETURN_FLOAT		32	/* f0 */
#define	RETURN_DOUBLE_LOW	32	/* f0 */
#define	RETURN_DOUBLE_HIGH	32	/* Not used in this configuration */

/**/
/* Opcode generation. */
/**/

/**/
/* Slot management information. */
/**/

/* Size of each slot */
#define	SLOTSIZE		8

/*
 * A stack frame looks like:
 *
 * fp-> |-------------------------------|
 *	|  6 words to dump arguments    |
 *      |-------------------------------|
 *      |  Saved fp, ra                 |
 *      |-------------------------------|
 *      |  Locals, temps                |
 *      |-------------------------------|
 *      |  outgoing parameters past 6   |
 * sp-> |-------------------------------|
 */

#define	FRAMEALIGN		16
#define	STACKALIGN(v)		(((v) + FRAMEALIGN - 1) & -FRAMEALIGN)


/* Generate slot offset for an argument (relative to fp) */
#define SLOT2ARGOFFSET(_n)	alpha_slot2argoffset[_n]
extern int *alpha_slot2argoffset;

/* Generate slot offset for a local (non-argument) (relative to fp) */
#define SLOT2LOCALOFFSET(_n)	(-SLOTSIZE * ((_n) - maxArgs + 9))

/* Generate slot offset for an push (relative to sp) */
#define SLOT2PUSHOFFSET(_n)	(SLOTSIZE * ((_n) - 6))

/* Wrap up a native call for the JIT */
#define	KAFFEJIT_TO_NATIVE(_m)					\
	{							\
		extern void alpha_do_call_c(void);		\
		long *wrapper = checked_malloc(4*8);		\
		/* ldq $0,0x10($27); ldq $27,0x18($27) */	\
		wrapper[0] = 0xa77b0018a41b0010;		\
		/* jmp $31,($27),0; nop */			\
		wrapper[1] = 0x47ff041f6bfb0000;		\
		wrapper[2] = (long)(_m)->ncode;			\
		wrapper[3] = (long)alpha_do_call_c;		\
		FLUSH_DCACHE(wrapper, wrapper+4);		\
		(_m)->ncode = (nativecode*)wrapper;		\
	}


/* On the Alpha we need to execute an instruction memory barrier before
   running new code. 

   For all the jillions of macros the OSF/1 assembler knows, you'd think
   "imb" would be one of them.  It isn't worth tracking down some pal.h
   that's at different spots on different systems just for this, so we
   hardcode the number.  It's not like _that_ is ever going to change.  */

#define FLUSH_DCACHE(beg, end) \
	__asm__ __volatile__("call_pal 134" : : : "memory")


#endif
