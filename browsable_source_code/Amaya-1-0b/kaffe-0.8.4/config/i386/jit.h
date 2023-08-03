/*
 * i386/jit.h
 * Common i386 JIT configuration information.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#ifndef __i386_jit_h
#define __i386_jit_h

/**/
/* Native function invocation. */
/**/
#define	CALL_KAFFE_FUNCTION_VARARGS(meth, obj, nargs, argptr, retval)	\
	asm volatile ("							\n\
		movl %3,%%eax						\n\
1:		cmpl $0,%%eax						\n\
		je 2f							\n\
		decl %%eax						\n\
		pushl (%4,%%eax,4)					\n\
		jmp 1b							\n\
2:									\n\
		pushl %2						\n\
		call *%1						\n\
		movl %%eax,%0						\n\
		" : "=r" (retval) :					\
	    "r" (meth->ncode), "r" (obj), "r" (nargs), "r" (argptr)	\
	    : "eax", "cc" );						\
	asm volatile ("							\n\
		addl %0,%%esp" : : "r" (4*(nargs+1)) : "cc")

#define	CALL_KAFFE_FUNCTION(meth, obj)					\
	asm("	pusha							\n\
		movl %%esp,%%ebp					\n\
		pushl %1						\n\
		call *%0						\n\
		movl %%ebp,%%esp					\n\
		popa							\n\
		" : : "r" (meth->ncode), "r" (obj))

/**/
/* Exception handling information. */
/**/

extern struct _thread* currentThread;

/* Structure of exception frame on stack */
typedef struct _exceptionFrame {
        uintp	retbp;
        uintp	retpc;
} exceptionFrame;

/* Is this frame valid (ie. is it on the current stack) ? */
#define	FRAMEOKAY(f)							\
	((f)->retbp >= (int)TCTX(currentThread)->stackBase &&	\
	 (f)->retbp < (int)TCTX(currentThread)->stackEnd)

/* Get the next frame in the chain */
#define	NEXTFRAME(f)							\
	(f) = ((exceptionFrame*)(f)->retbp)

/* Extract the PC from the given frame */
#define	PCFRAME(f)							\
	((f)->retpc-1)

/* Extract a local argument from given frame */
#define	FRAMEOBJECT(f)							\
	(*(Hjava_lang_Object**)(f->retbp + 8))

/* Get the first exception frame from a subroutine call */
#define	FIRSTFRAME(f, o)						\
	(f) = *((exceptionFrame*)(((uintp)&(o))-8))

/* Call the relevant exception handler (rewinding the stack as
   necessary). */
#define CALL_KAFFE_EXCEPTION(frame, info, obj)				\
        asm("   movl %2,%%eax						\n\
		movl %0,%%ebp						\n\
		jmp *%1							\n\
		" : : "g" (frame->retbp), "r" (info.handler), "g" (obj) : "eax")

/**/
/* Register management information. */
/**/

/* Define the register set */
#define	REGISTER_SET							\
	{ /* eax */	0, 0, Rint|Rref,	0, 0, 0    },		\
	{ /* ecx */	0, 0, Rint|Rref,	0, 0, 1    },		\
	{ /* edx */	0, 0, Rint|Rref,	0, 0, 2    },		\
	{ /* ebx */	0, 0, Rint|Rref,	0, 0, 3    },		\
	{ /* esp */	0, 0, Reserved,		0, 0, 4    },		\
	{ /* ebp */	0, 0, Reserved,		0, 0, 5    },		\
	{ /* esi */	0, 0, Rint|Rref,	0, 0, 6    },		\
	{ /* edi */	0, 0, Rint|Rref,	0, 0, 7    },		\
	{ /* f0  */	0, 0, Rfloat|Rdouble,	1, 0, 8    },

/* Number of registers in the register set */
#define	NR_REGISTERS	9

/**/
/* Opcode generation. */
/**/

/* Define if generated code uses two operands rather than one */
#define	TWO_OPERAND

/**/
/* Slot management information. */
/**/

/* Size of each slot */
#define	SLOTSIZE	4

/* Generate slot offset for an argument */
#define SLOT2ARGOFFSET(_n)	(8 + SLOTSIZE * ((_n) + isStatic))

/* Generate slot offset for a local (non-argument) */
#define SLOT2LOCALOFFSET(_n)	(-SLOTSIZE * (maxTemp+maxLocal+maxStack - (_n)))

/* Wrap up a native call for the JIT */
#define KAFFEJIT_TO_NATIVE(_m)

/* We don't have to flush the code out of cache on the i386 */
#define	FLUSH_DCACHE(beg, end)	/* Do nothing */

#endif
