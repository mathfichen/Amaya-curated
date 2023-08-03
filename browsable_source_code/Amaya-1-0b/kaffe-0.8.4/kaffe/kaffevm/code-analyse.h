/* code-analyse.h
 * Analyse a method's bytecodes.
 *
 * Copyright (c) 1997 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.co.uk>
 */

#ifndef __code_analyse_h
#define __code_analyse_h

typedef struct {
	int16			flags;
	int16			stackPointer;
	uintp			pc;
} perPCInfo;

typedef struct codeinfo {
	int32			codelen;
	perPCInfo*		perPC;
} codeinfo;

#define	FLAG_STARTOFBASICBLOCK		0x0001
#define	FLAG_STARTOFEXCEPTION		0x0002
#define	FLAG_STACKPOINTERSET		0x0004
#define	FLAG_NORMALFLOW			0x0008
#define	FLAG_FLOW			0x0010
#define	FLAG_JUMP			0x0020

#define	FLAGS(pc)			codeInfo.perPC[pc].flags
#define	STACKPOINTER(pc)		codeInfo.perPC[pc].stackPointer
#define	INSNPC(_pc)			codeInfo.perPC[_pc].pc
#define	INSN(pc)			meth->code[(pc)]
#define	INSNLEN(pc)			insnLen[INSN(pc)]
#define	BYTE(pc)			(int8)(meth->code[(pc)+0])
#define	WORD(pc)			(int16)((meth->code[(pc)+0] << 8) + \
						(meth->code[(pc)+1]))
#define	DWORD(pc)			(int32)((meth->code[(pc)+0] << 24) + \
						(meth->code[(pc)+1] << 16) + \
						(meth->code[(pc)+2] << 8) + \
						(meth->code[(pc)+3]))
#define	INCPC(v)			pc += (v)

#define	SET_STARTOFBASICBLOCK(pc)	FLAGS(pc) |= FLAG_STARTOFBASICBLOCK
#define	SET_STACKPOINTER(pc, sp)	STACKPOINTER(pc) = (sp); \
					FLAGS(pc) |= FLAG_STACKPOINTERSET
#define	SET_INSNPC(pc, v)		INSNPC(pc) = (v)
#if defined(INTERPRETER)
#define	SET_INSN(pc, v)			INSN(pc) = (v)
#else
#define	SET_INSN(pc, v)
#endif
#define	SET_NORMALFLOW(pc)		FLAGS(pc) |= FLAG_NORMALFLOW
#define	SET_JUMPFLOW(from, to)		FLAGS(to) |= FLAG_FLOW; \
					FLAGS(from) |= FLAG_JUMP
#define	SET_STARTOFEXCEPTION(pc)	FLAGS(pc) |= FLAG_STARTOFEXCEPTION

#define	IS_STARTOFBASICBLOCK(pc)	(FLAGS(pc) & FLAG_STARTOFBASICBLOCK)
#define	IS_STACKPOINTERSET(pc)		(FLAGS(pc) & FLAG_STACKPOINTERSET)
#define	IS_NORMALFLOW(pc)		(FLAGS(pc) & FLAG_NORMALFLOW)
#define	IS_STARTOFEXCEPTION(pc)		(FLAGS(pc) & FLAG_STARTOFEXCEPTION)

#define	STKPUSH(l)			sp -= (l)
#define	STKPOP(l)			sp += (l)

#define	STACKINIT(s, i)
#define	STACKIN(s, i)
#define	STACKOUT(s, i)
#define	STACKOUT_LOCAL(s, i, l)
#define	STACKOUT_CONST(s, i, v)
#define	LOCALINIT(l, i);
#define	LOCALIN(l, i)
#define	LOCALOUT(l, i)
#define LOCALOUT_STACK(l, i, s)

struct _methods;
void verifyMethod(struct _methods*);

extern codeinfo codeInfo;
extern uint8 insnLen[];

#endif
