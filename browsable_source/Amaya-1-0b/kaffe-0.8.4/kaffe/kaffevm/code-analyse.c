/* code-analyse.c
 * Analyse a method's bytecodes.
 *
 * Copyright (c) 1997 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.co.uk>
 */

#define	DBG(s)
#define	FDBG(s)

#include "config.h"
#include "config-std.h"
#include "gtypes.h"
#include "code-analyse.h"
#include "bytecode.h"
#include "object.h"
#include "constants.h"
#include "access.h"
#include "classMethod.h"
#include "lookup.h"
#include "exception.h"
#include "icode.h"
#include "md.h"

codeinfo codeInfo;

uint8 insnLen[256] = {
	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
	2, 3, 2, 3, 3, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 0, 0, 1, 1, 1, 1, 
	1, 1, 3, 3, 3, 3, 3, 3, 3, 5, 1, 3, 2, 3, 1, 1, 
	3, 3, 1, 1, 1, 4, 3, 3, 5, 5, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 3, 
};

extern void* checked_calloc(size_t, size_t);

void
verifyMethod(methods* meth)
{
	int32 pc;
	int32 oldpc;
	int32 tabpc;
	int32 restartpc;
	int32 idx;
	int32 sp;
	int32 lcl;
	int32 lclw;
	int32 lclww;
	int ri;
	Field* field;
	Hjava_lang_Class* class;
	callInfo call;
	bool wide;
	bool unreached;

	/* We don't need to do this twice */
	meth->accflags |= ACC_VERIFIED;

	checked_free(codeInfo.perPC);

	/* Allocate code info. block */
	codeInfo.codelen = meth->codelen;
	codeInfo.perPC = checked_calloc(codeInfo.codelen+1, sizeof(perPCInfo));
	assert(codeInfo.perPC != 0);

	/* Scan the code and mark the beginning of basic blocks */
	for (pc = 0; pc < codeInfo.codelen;) {
		switch (INSN(pc)) {
		case IFEQ:	case IFNE:	case IFLT:
		case IFGE:	case IFGT:	case IFLE:
		case IF_ICMPEQ: case IF_ICMPNE:
		case IF_ICMPLT: case IF_ICMPGE:
		case IF_ICMPGT: case IF_ICMPLE:
		case IF_ACMPEQ: case IF_ACMPNE:
		case IFNULL:	case IFNONNULL:
			tabpc = pc + WORD(pc+1);
			SET_STARTOFBASICBLOCK(tabpc);
			SET_JUMPFLOW(pc, tabpc);
			pc = pc + INSNLEN(pc);
			SET_STARTOFBASICBLOCK(pc);
			SET_NORMALFLOW(pc);
			break;
		case GOTO:
			tabpc = pc + WORD(pc+1);
			SET_STARTOFBASICBLOCK(tabpc);
			SET_JUMPFLOW(pc, tabpc);
			pc = pc + INSNLEN(pc);
			break;
		case GOTO_W:
			tabpc = pc + DWORD(pc+1);
			SET_STARTOFBASICBLOCK(tabpc);
			SET_JUMPFLOW(pc, tabpc);
			pc = pc + INSNLEN(pc);
			break;
		case JSR:
			tabpc = pc + WORD(pc+1);
			SET_STARTOFBASICBLOCK(tabpc);
			SET_JUMPFLOW(pc, tabpc);
			pc = pc + INSNLEN(pc);
			SET_STARTOFBASICBLOCK(pc);
			SET_NORMALFLOW(pc);
			break;
		case JSR_W:
			tabpc = pc + DWORD(pc+1);
			SET_STARTOFBASICBLOCK(tabpc);
			SET_JUMPFLOW(pc, tabpc);
			pc = pc + INSNLEN(pc);
			SET_STARTOFBASICBLOCK(pc);
			SET_NORMALFLOW(pc);
			break;
		case TABLESWITCH:
			tabpc = (pc + 4) & -4;
			idx = DWORD(tabpc+8)-DWORD(tabpc+4)+1;
			for (; idx > 0; idx--) {
				SET_STARTOFBASICBLOCK(pc+DWORD(tabpc+idx*4+8));
				SET_JUMPFLOW(pc, pc+DWORD(tabpc+idx*4+8));
			}
			SET_STARTOFBASICBLOCK(pc+DWORD(tabpc));
			SET_JUMPFLOW(pc, pc+DWORD(tabpc));
			pc = tabpc + (DWORD(tabpc+8)-DWORD(tabpc+4)+1+3) * 4;
			break;
		case LOOKUPSWITCH:
			tabpc = (pc + 4) & -4;
			idx = DWORD(tabpc+4);
			for (; idx > 0; idx--) {
				SET_STARTOFBASICBLOCK(pc+DWORD(tabpc+idx*8+4));
				SET_JUMPFLOW(pc, pc+DWORD(tabpc+idx*8+4));
			}
			SET_STARTOFBASICBLOCK(pc+DWORD(tabpc));
			SET_JUMPFLOW(pc, pc+DWORD(tabpc));
			pc = tabpc + (DWORD(tabpc+4)+1) * 8;
			break;
		case IRETURN:	case LRETURN:	case ARETURN:
		case FRETURN:	case DRETURN:	case RETURN:
		case ATHROW:
			pc = pc + INSNLEN(pc);
			break;
		default:
			/* The default */
			pc = pc + INSNLEN(pc);
			SET_NORMALFLOW(pc);
			break;
		}
	}

DBG(	printf("%s.%s%s\n", meth->class->name, meth->pair->s1, meth->pair->s2);)

	/* Mark the various starting states.  These include the main
	 * entry point plus all the exception entry points, their arguments
	 * and stack values.
	 */
	SET_STACKPOINTER(0, meth->localsz + meth->stacksz);
	lcl = meth->ins + (meth->accflags & ACC_STATIC) ? 0 : 1;
	for (; lcl > 0; lcl--) {
		LOCALINIT(lcl, TANY);
	}

	for (lcl = 0; lcl < meth->exception_table_len; lcl++) {
		pc = meth->exception_table[lcl].handler_pc;
		sp = meth->localsz + meth->stacksz - 1;
		SET_STARTOFEXCEPTION(pc);
		SET_STACKPOINTER(pc, sp);
		STACKINIT(0, TOBJ);
	}

	/* Now evaluate the code itself, optimising as we go */
	wide = false;
	restartpc = 0;
	do {
		pc = restartpc;
		restartpc = -1;
		unreached = false;

		while (pc < codeInfo.codelen) {

			/* We can only proceed if we know what the stack pointer
			 * is.  We either know this because we got here through
			 * the normal sequential execution of things, or this
			 * is the beginning of a basic block and the stack
			 * pointer has been marked.
			 */
			if (IS_STARTOFBASICBLOCK(pc) && !IS_NORMALFLOW(pc) && !IS_STACKPOINTERSET(pc)) {
				/* Save first restart point */
				if (restartpc == -1) {
					restartpc = pc;
				}
				/* Advance to next set stack pointer */
				for (pc++; !IS_STACKPOINTERSET(pc) && pc < codeInfo.codelen; pc++);
				if (pc >= codeInfo.codelen) {
					break;
				}
			}

			/* If indicated, retrieve a new stack pointer */
			if (IS_STACKPOINTERSET(pc)) {
				sp = STACKPOINTER(pc);
				unreached = false;
			}
			else {
				SET_STACKPOINTER(pc, sp);
			}

			/* If code is unreachable then we don't have to check				 * the sp since it's bound to be wrong.
			 */
			assert(unreached == true || (sp >= meth->localsz && sp <= meth->localsz + meth->stacksz));

			/* Retrieve a potential local slot */
			lcl = BYTE(pc+1);
			lclw = WORD(pc+1);
			lclww = DWORD(pc+1);

DBG(			printf("%d: %d\n", pc, INSN(pc));		)

			oldpc = pc;
			switch (INSN(pc)) {
			case NOP:
				INCPC(1);
				break;

			case ACONST_NULL:
				STKPUSH(1);
				STACKOUT_CONST(0, TOBJ, 0);
				INCPC(1);
				break;

			case ICONST_M1:
			case ICONST_0:
			case ICONST_1:
			case ICONST_2:
			case ICONST_3:
			case ICONST_4:
			case ICONST_5:
				STKPUSH(1);
				lcl = INSN(pc) - ICONST_0;
				STACKOUT_CONST(0, TINT, lcl);
				INCPC(1);
				break;

			case BIPUSH:
				STKPUSH(1);
				STACKOUT_CONST(0, TINT, lcl);
				INCPC(2);
				break;

			case SIPUSH:
				STKPUSH(1);
				STACKOUT_CONST(0, TINT, lclw);
				INCPC(3);
				break;

			case LCONST_0:
			case LCONST_1:
				STKPUSH(2);
				lcl = INSN(pc) - LCONST_0;
				STACKOUT_CONST(0, TLONG, lcl);
				STACKOUT_CONST(1, TVOID, 0);
				INCPC(1);
				break;

			case FCONST_0:
			case FCONST_1:
			case FCONST_2:
				STKPUSH(1);
				STACKOUT(0, TFLOAT);
				INCPC(1);
				break;

			case DCONST_0:
			case DCONST_1:
				STKPUSH(2);
				STACKOUT(0, TDOUBLE);
				STACKOUT(1, TVOID);
				INCPC(1);
				break;

			case LDC1:
				STKPUSH(1);
				STACKOUT(0, constantType(lcl));
				INCPC(2);
				break;

			case LDC2:
				STKPUSH(1);
				STACKOUT(0, constantType(lclw));
				INCPC(3);
				break;

			case LDC2W:
				STKPUSH(2);
				STACKOUT(0, constantType(lclw));
				STACKOUT(1, TVOID);
				INCPC(3);
				break;

			case ILOAD_0:
			case ILOAD_1:
			case ILOAD_2:
			case ILOAD_3:
				lcl = INSN(pc) - ILOAD_0;
				LOCALIN(lcl, TINT);
				STKPUSH(1);
				STACKOUT_LOCAL(0, TINT, lcl);
				/* LOCALOUT(lcl, TINT); */
				INCPC(1);
				break;

			case ILOAD:
				if (wide) {
					LOCALIN(lclw, TINT);
					INCPC(1);
					wide = false;
				}
				else {
					LOCALIN(lcl, TINT);
				}
				STKPUSH(1);
				STACKOUT_LOCAL(0, TINT, lcl);
				/* LOCALOUT(lcl, TINT); */
				INCPC(2);
				break;

			case LLOAD_0:
			case LLOAD_1:
			case LLOAD_2:
			case LLOAD_3:
				lcl = INSN(pc) - LLOAD_0;
				LOCALIN(lcl, TLONG);
				LOCALIN(lcl+1, TVOID);
				STKPUSH(2);
				STACKOUT_LOCAL(0, TLONG, lcl);
				STACKOUT_LOCAL(1, TVOID, lcl+1);
				/* LOCALOUT(lcl, TLONG); */
				/* LOCALOUT(lcl+1, TVOID); */
				INCPC(1);
				break;

			case LLOAD:
				if (wide) {
					LOCALIN(lclw, TLONG);
					LOCALIN(lclw+1, TVOID);
					INCPC(1);
					wide = false;
				}
				else {
					LOCALIN(lcl, TLONG);
					LOCALIN(lcl+1, TVOID);
				}
				STKPUSH(2);
				STACKOUT_LOCAL(0, TLONG, lcl);
				STACKOUT_LOCAL(1, TVOID, lcl+1);
				/* LOCALOUT(lcl, TLONG); */
				/* LOCALOUT(lcl+1, TVOID); */
				INCPC(2);
				break;

			case FLOAD_0:
			case FLOAD_1:
			case FLOAD_2:
			case FLOAD_3:
				lcl = INSN(pc) - FLOAD_0;
				LOCALIN(lcl, TFLOAT);
				STKPUSH(1);
				STACKOUT(0, TFLOAT);
				/* LOCALOUT(lcl, TFLOAT); */
				INCPC(1);
				break;

			case FLOAD:
				if (wide) {
					LOCALIN(lclw, TFLOAT);
					INCPC(1);
					wide = false;
				}
				else {
					LOCALIN(lcl, TFLOAT);
				}
				STKPUSH(1);
				STACKOUT(0, TFLOAT);
				/* LOCALOUT(lcl, TFLOAT); */
				INCPC(2);
				break;

			case DLOAD_0:
			case DLOAD_1:
			case DLOAD_2:
			case DLOAD_3:
				lcl = INSN(pc) - DLOAD_0;
				LOCALIN(lcl, TDOUBLE);
				LOCALIN(lcl+1, TVOID);
				STKPUSH(2);
				STACKOUT(0, TDOUBLE);
				STACKOUT(1, TVOID);
				/* LOCALOUT(lcl, TDOUBLE); */
				/* LOCALOUT(lcl+1, TVOID); */
				INCPC(1);
				break;

			case DLOAD:
				if (wide) {
					LOCALIN(lclw, TDOUBLE);
					LOCALIN(lclw+1, TVOID);
					INCPC(1);
					wide = false;
				}
				else {
					LOCALIN(lcl, TDOUBLE);
					LOCALIN(lcl+1, TVOID);
				}
				STKPUSH(2);
				STACKOUT(0, TDOUBLE);
				STACKOUT(1, TVOID);
				/* LOCALOUT(lcl, TDOUBLE); */
				/* LOCALOUT(lcl+1, TVOID); */
				INCPC(2);
				break;

			case ALOAD_0:
			case ALOAD_1:
			case ALOAD_2:
			case ALOAD_3:
				lcl = INSN(pc) - ALOAD_0;
				LOCALIN(lcl, TOBJ);
				STKPUSH(1);
				STACKOUT_LOCAL(0, TOBJ, lcl);
				/* LOCALOUT(lcl, TOBJ); */
				INCPC(1);
				break;

			case ALOAD:
				if (wide) {
					LOCALIN(lclw, TOBJ);
					INCPC(1);
					wide = false;
				}
				else {
					LOCALIN(lcl, TOBJ);
				}
				STKPUSH(1);
				STACKOUT_LOCAL(0, TOBJ, lcl);
				/* LOCALOUT(lcl, TOBJ); */
				INCPC(2);
				break;

			case IALOAD:
			case BALOAD:
			case CALOAD:
			case SALOAD:
				STACKIN(1, TOBJ);
				STACKIN(0, TINT);
				STKPOP(1);
				STACKOUT(0, TINT);
				INCPC(1);
				break;

			case LALOAD:
				STACKIN(1, TOBJ);
				STACKIN(0, TINT);
				STACKOUT(0, TLONG);
				STACKOUT(1, TVOID);
				INCPC(1);
				break;

			case FALOAD:
				STACKIN(1, TOBJ);
				STACKIN(0, TINT);
				STKPOP(1);
				STACKOUT(0, TFLOAT);
				INCPC(1);
				break;

			case DALOAD:
				STACKIN(1, TOBJ);
				STACKIN(0, TINT);
				STACKOUT(0, TDOUBLE);
				STACKOUT(1, TVOID);
				INCPC(1);
				break;

			case AALOAD:
				STACKIN(1, TOBJ);
				STACKIN(0, TINT);
				STKPOP(1);
				STACKOUT(0, TOBJ);
				INCPC(1);
				break;

			case ISTORE_0:
			case ISTORE_1:
			case ISTORE_2:
			case ISTORE_3:
				lcl = INSN(pc) - ISTORE_0;
				STACKIN(0, TINT);
				LOCALOUT_STACK(lcl, TINT, 0);
				STKPOP(1);
				INCPC(1);
				break;

			case ISTORE:
				STACKIN(0, TINT);
				if (wide) {
					LOCALOUT_STACK(lclw, TINT, 0);
					INCPC(1);
					wide = false;
				}
				else {
					LOCALOUT_STACK(lcl, TINT, 0);
				}
				STKPOP(1);
				INCPC(2);
				break;

			case LSTORE_0:
			case LSTORE_1:
			case LSTORE_2:
			case LSTORE_3:
				lcl = INSN(pc) - LSTORE_0;
				STACKIN(0, TLONG);
				STACKIN(1, TVOID);
				LOCALOUT_STACK(lcl, TLONG, 0);
				LOCALOUT_STACK(lcl+1, TVOID, 1);
				STKPOP(2);
				INCPC(1);
				break;

			case LSTORE:
				STACKIN(0, TLONG);
				STACKIN(1, TVOID);
				if (wide) {
					LOCALOUT_STACK(lclw, TLONG, 0);
					LOCALOUT_STACK(lclw+1, TVOID, 1);
					INCPC(1);
					wide = false;
				}
				else {
					LOCALOUT_STACK(lcl, TLONG, 0);
					LOCALOUT_STACK(lcl+1, TVOID, 1);
				}
				STKPOP(2);
				INCPC(2);
				break;

			case FSTORE_0:
			case FSTORE_1:
			case FSTORE_2:
			case FSTORE_3:
				lcl = INSN(pc) - FSTORE_0;
				STACKIN(0, TFLOAT);
				LOCALOUT(lcl, TFLOAT);
				STKPOP(1);
				INCPC(1);
				break;

			case FSTORE:
				STACKIN(0, TFLOAT);
				if (wide) {
					LOCALOUT(lclw, TFLOAT);
					INCPC(1);
					wide = false;
				}
				else {
					LOCALOUT(lcl, TFLOAT);
				}
				STKPOP(1);
				INCPC(2);
				break;

			case DSTORE_0:
			case DSTORE_1:
			case DSTORE_2:
			case DSTORE_3:
				lcl = INSN(pc) - DSTORE_0;
				STACKIN(0, TDOUBLE);
				STACKIN(1, TVOID);
				LOCALOUT(lcl, TDOUBLE);
				LOCALOUT(lcl+1, TVOID);
				STKPOP(2);
				INCPC(1);
				break;

			case DSTORE:
				STACKIN(0, TDOUBLE);
				STACKIN(1, TVOID);
				if (wide) {
					LOCALOUT(lclw, TDOUBLE);
					LOCALOUT(lclw+1, TVOID);
					INCPC(1);
					wide = false;
				}
				else {
					LOCALOUT(lcl, TDOUBLE);
					LOCALOUT(lcl+1, TVOID);
				}
				STKPOP(2);
				INCPC(2);
				break;

			case ASTORE_0:
			case ASTORE_1:
			case ASTORE_2:
			case ASTORE_3:
				lcl = INSN(pc) - ASTORE_0;
				STACKIN(0, TOBJ);
				LOCALOUT_STACK(lcl, TOBJ, 0);
				STKPOP(1);
				INCPC(1);
				break;

			case ASTORE:
				STACKIN(0, TOBJ);
				if (wide) {
					LOCALOUT_STACK(lclw, TOBJ, 0);
					INCPC(1);
					wide = false;
				}
				else {
					LOCALOUT_STACK(lcl, TOBJ, 0);
				}
				STKPOP(1);
				INCPC(2);
				break;

			case BASTORE:
				STACKIN(0, TINT);
				STACKIN(1, TINT);
				STACKIN(2, TOBJ);
				STKPOP(3);
				INCPC(1);
				break;

			case IASTORE:
			case CASTORE:
			case SASTORE:
				STACKIN(2, TOBJ);
				STACKIN(1, TINT);
				STACKIN(0, TINT);
				STKPOP(3);
				INCPC(1);
				break;

			case LASTORE:
				STACKIN(3, TOBJ);
				STACKIN(2, TINT);
				STACKIN(0, TLONG);
				STACKIN(1, TVOID);
				STKPOP(4);
				INCPC(1);
				break;

			case FASTORE:
				STACKIN(2, TOBJ);
				STACKIN(1, TINT);
				STACKIN(0, TFLOAT);
				STKPOP(3);
				INCPC(1);
				break;

			case DASTORE:
				STACKIN(3, TOBJ);
				STACKIN(2, TINT);
				STACKIN(0, TDOUBLE);
				STACKIN(1, TVOID);
				STKPOP(4);
				INCPC(1);
				break;

			case AASTORE:
				STACKIN(2, TOBJ);
				STACKIN(1, TINT);
				STACKIN(0, TOBJ);
				STKPOP(3);
				INCPC(1);
				break;

			case POP:
				STKPOP(1);
				INCPC(1);
				break;

			case POP2:
				STKPOP(2);
				INCPC(1);
				break;

			case DUP:
				STACKIN(0, TANY);
				STKPUSH(1);
				STACKOUT(1, TANY);
				STACKOUT(0, TANY);
				INCPC(1);
				break;

			case DUP_X1:
				STACKIN(1, TANY);
				STACKIN(0, TANY);
				STKPUSH(1);
				STACKOUT(2, TANY);
				STACKOUT(1, TANY);
				STACKOUT(0, TANY);
				INCPC(1);
				break;

			case DUP_X2:
				STACKIN(2, TANY);
				STACKIN(1, TANY);
				STACKIN(0, TANY);
				STKPUSH(1);
				STACKOUT(3, TANY);
				STACKOUT(2, TANY);
				STACKOUT(1, TANY);
				STACKOUT(0, TANY);
				INCPC(1);
				break;

			case DUP2:
				STACKIN(1, TANY);
				STACKIN(0, TANY);
				STKPUSH(2);
				STACKOUT(3, TANY);
				STACKOUT(2, TANY);
				STACKOUT(1, TANY);
				STACKOUT(0, TANY);
				INCPC(1);
				break;

			case DUP2_X1:
				STACKIN(2, TANY);
				STACKIN(1, TANY);
				STACKIN(0, TANY);
				STKPUSH(2);
				STACKOUT(4, TANY);
				STACKOUT(3, TANY);
				STACKOUT(2, TANY);
				STACKOUT(1, TANY);
				STACKOUT(0, TANY);
				INCPC(1);
				break;

			case DUP2_X2:
				STACKIN(3, TANY);
				STACKIN(2, TANY);
				STACKIN(1, TANY);
				STACKIN(0, TANY);
				STKPUSH(2);
				STACKOUT(5, TANY);
				STACKOUT(4, TANY);
				STACKOUT(3, TANY);
				STACKOUT(2, TANY);
				STACKOUT(1, TANY);
				STACKOUT(0, TANY);
				INCPC(1);
				break;

			case SWAP:
				STACKIN(1, TANY);
				STACKIN(0, TANY);
				STACKOUT(1, TANY);
				STACKOUT(0, TANY);
				INCPC(1);
				break;

			case IAND:
				STACKIN(0, TINT);
				STACKIN(1, TINT);
				STKPOP(1);
				STACKOUT(0, TINT);
				INCPC(1);
				break;

			case IOR:
				STACKIN(0, TINT);
				STACKIN(1, TINT);
				STKPOP(1);
				STACKOUT(0, TINT);
				INCPC(1);
				break;

			case IXOR:
				STACKIN(0, TINT);
				STACKIN(1, TINT);
				STKPOP(1);
				STACKOUT(0, TINT);
				INCPC(1);
				break;

			case IADD:
				STACKIN(0, TINT);
				STACKIN(1, TINT);
				STKPOP(1);
				STACKOUT(0, TINT);
				INCPC(1);
				break;

			case IMUL:
				STACKIN(0, TINT);
				STACKIN(1, TINT);
				STKPOP(1);
				STACKOUT(0, TINT);
				INCPC(1);
				break;

			case ISUB:
				STACKIN(0, TINT);
				STACKIN(1, TINT);
				STKPOP(1);
				STACKOUT(0, TINT);
				INCPC(1);
				break;

			case IDIV:
				STACKIN(0, TINT);
				STACKIN(1, TINT);
				STKPOP(1);
				STACKOUT(0, TINT);
				INCPC(1);
				break;

			case IREM:
				STACKIN(0, TINT);
				STACKIN(1, TINT);
				STKPOP(1);
				STACKOUT(0, TINT);
				INCPC(1);
				break;

			case LADD:
				STACKIN(0, TLONG);
				STACKIN(1, TVOID);
				STACKIN(2, TLONG);
				STACKIN(3, TVOID);
				STKPOP(2);
				STACKOUT(0, TLONG);
				STACKOUT(1, TVOID);
				INCPC(1);
				break;

			case LSUB:
			case LMUL:
			case LDIV:
			case LREM:
			case LAND:
			case LOR:
			case LXOR:
				STACKIN(2, TLONG);
				STACKIN(3, TVOID);
				STACKIN(0, TLONG);
				STACKIN(1, TVOID);
				STKPOP(2);
				STACKOUT(0, TLONG);
				STACKOUT(1, TVOID);
				INCPC(1);
				break;

			case FADD:
			case FSUB:
			case FMUL:
			case FDIV:
			case FREM:
				STACKIN(1, TFLOAT);
				STACKIN(0, TFLOAT);
				STKPOP(1);
				STACKOUT(0, TFLOAT);
				INCPC(1);
				break;

			case DADD:
			case DSUB:
			case DMUL:
			case DDIV:
			case DREM:
				STACKIN(2, TDOUBLE);
				STACKIN(3, TVOID);
				STACKIN(0, TDOUBLE);
				STACKIN(1, TVOID);
				STKPOP(2);
				STACKOUT(0, TDOUBLE);
				STACKOUT(1, TVOID);
				INCPC(1);
				break;

			case INEG:
				STACKIN(0, TINT);
				STACKOUT(0, TINT);
				INCPC(1);
				break;

			case LNEG:
				STACKIN(0, TLONG);
				STACKIN(1, TVOID);
				STACKOUT(0, TLONG);
				STACKOUT(1, TVOID);
				INCPC(1);
				break;

			case FNEG:
				STACKIN(0, TFLOAT);
				STACKOUT(0, TFLOAT);
				INCPC(1);
				break;

			case DNEG:
				STACKIN(0, TDOUBLE);
				STACKIN(1, TVOID);
				STACKOUT(0, TDOUBLE);
				STACKOUT(1, TVOID);
				INCPC(1);
				break;

			case ISHL:
				STACKIN(0, TINT);
				STACKIN(1, TINT);
				STKPOP(1);
				STACKOUT(0, TINT);
				INCPC(1);
				break;

			case ISHR:
				STACKIN(0, TINT);
				STACKIN(1, TINT);
				STKPOP(1);
				STACKOUT(0, TINT);
				INCPC(1);
				break;

			case IUSHR:
				STACKIN(0, TINT);
				STACKIN(1, TINT);
				STKPOP(1);
				STACKOUT(0, TINT);
				INCPC(1);
				break;

			case LSHL:
			case LSHR:
			case LUSHR:
				STACKIN(0, TINT);
				STACKIN(1, TLONG);
				STACKIN(2, TVOID);
				STKPOP(1);
				STACKOUT(0, TLONG);
				STACKOUT(1, TVOID);
				INCPC(1);
				break;

			case IINC:
				if (wide) {
					LOCALIN(lclw, TINT);
					LOCALOUT(lclw, TINT);
					INCPC(2);
					wide = false;
				}
				else {
					LOCALIN(lcl, TINT);
					LOCALOUT(lcl, TINT);
				}
				INCPC(3);
				break;

			case I2L:
				STACKIN(0, TINT);
				STKPUSH(1);
				STACKOUT(0, TLONG);
				STACKOUT(1, TVOID);
				INCPC(1);
				break;

			case I2F:
				STACKIN(0, TINT);
				STACKOUT(0, TFLOAT);
				INCPC(1);
				break;

			case I2D:
				STACKIN(0, TINT);
				STKPUSH(1);
				STACKOUT(0, TDOUBLE);
				STACKOUT(1, TVOID);
				INCPC(1);
				break;

			case L2I:
				STACKIN(0, TLONG);
				STACKIN(1, TVOID);
				STKPOP(1);
				STACKOUT(0, TINT);
				INCPC(1);
				break;

			case L2F:
				STACKIN(0, TLONG);
				STACKIN(1, TVOID);
				STKPOP(1);
				STACKOUT(0, TFLOAT);
				INCPC(1);
				break;

			case L2D:
				STACKIN(0, TLONG);
				STACKIN(1, TVOID);
				STACKOUT(0, TDOUBLE);
				STACKOUT(1, TVOID);
				INCPC(1);
				break;

			case F2I:
				STACKIN(0, TFLOAT);
				STACKOUT(0, TINT);
				INCPC(1);
				break;

			case F2L:
				STACKIN(0, TFLOAT);
				STKPUSH(1);
				STACKOUT(0, TLONG);
				STACKOUT(1, TVOID);
				INCPC(1);
				break;

			case F2D:
				STACKIN(0, TFLOAT);
				STKPUSH(1);
				STACKOUT(0, TDOUBLE);
				STACKOUT(1, TVOID);
				INCPC(1);
				break;

			case D2I:
				STACKIN(0, TDOUBLE);
				STACKIN(1, TVOID);
				STKPOP(1);
				STACKOUT(0, TINT);
				INCPC(1);
				break;

			case D2L:
				STACKIN(0, TDOUBLE);
				STACKIN(1, TVOID);
				STACKOUT(0, TLONG);
				STACKOUT(1, TVOID);
				INCPC(1);
				break;

			case D2F:
				STACKIN(0, TDOUBLE);
				STACKIN(1, TVOID);
				STKPOP(1);
				STACKOUT(0, TFLOAT);
				INCPC(1);
				break;

			case INT2BYTE:
			case INT2CHAR:
			case INT2SHORT:
				STACKIN(0, TINT);
				STACKOUT(0, TINT);
				INCPC(1);
				break;

			case LCMP:
				STACKIN(2, TLONG);
				STACKIN(3, TVOID);
				STACKIN(0, TLONG);
				STACKIN(1, TVOID);
				STKPOP(3);
				STACKOUT(0, TINT);
				INCPC(1);
				break;

			case FCMPL:
			case FCMPG:
				STACKIN(1, TFLOAT);
				STACKIN(0, TFLOAT);
				STKPOP(1);
				STACKOUT(0, TINT);
				INCPC(1);
				break;

			case DCMPL:
			case DCMPG:
				STACKIN(2, TDOUBLE);
				STACKIN(3, TVOID);
				STACKIN(0, TDOUBLE);
				STACKIN(1, TVOID);
				STKPOP(3);
				STACKOUT(0, TINT);
				INCPC(1);
				break;

			case IFEQ:
			case IFNE:
			case IFLT:
			case IFGE:
			case IFGT:
			case IFLE:
				STACKIN(0, TINT);
				STKPOP(1);
				SET_STACKPOINTER(pc + lclw, sp);
				SET_STACKPOINTER(pc + 3, sp);
				INCPC(3);
				break;

			case IF_ICMPEQ:
			case IF_ICMPNE:
			case IF_ICMPLT:
			case IF_ICMPGT:
			case IF_ICMPGE:
			case IF_ICMPLE:
				STACKIN(0, TINT);
				STACKIN(1, TINT);
				STKPOP(2);
				SET_STACKPOINTER(pc + lclw, sp);
				SET_STACKPOINTER(pc + 3, sp);
				INCPC(3);
				break;

			case IF_ACMPEQ:
			case IF_ACMPNE:
				STACKIN(0, TOBJ);
				STACKIN(1, TOBJ);
				STKPOP(2);
				SET_STACKPOINTER(pc + lclw, sp);
				SET_STACKPOINTER(pc + 3, sp);
				INCPC(3);
				break;

			case GOTO:
				SET_STACKPOINTER(pc + lclw, sp);
				INCPC(3);
				unreached = true;
				break;

			case GOTO_W:
				SET_STACKPOINTER(pc + lclww, sp);
				INCPC(5);
				unreached = true;
				break;

			case JSR:
				STKPUSH(1);
				STACKOUT(0, TADDR);
				SET_STACKPOINTER(pc + lclw, sp);
				STKPOP(1);
				SET_STACKPOINTER(pc + 3, sp);
				INCPC(3);
				break;

			case JSR_W:
				STKPUSH(1);
				STACKOUT(0, TADDR);
				SET_STACKPOINTER(pc + lclww, sp);
				STKPOP(1);
				SET_STACKPOINTER(pc + 5, sp);
				INCPC(5);
				break;

			case RET:
				LOCALIN(lcl, TADDR);
				INCPC(2);
				break;

			case LOOKUPSWITCH:
				STACKIN(0, TINT);
				STKPOP(1);
				tabpc = (pc + 4) & -4;
				idx = DWORD(tabpc+4);
				for (; idx > 0; idx--) {
					SET_STACKPOINTER(pc+DWORD(tabpc+idx*8+4), sp);
				}
				SET_STACKPOINTER(pc + DWORD(tabpc), sp);
				pc = tabpc + (DWORD(tabpc+4)+1) * 8;
				break;

			case TABLESWITCH:
				STACKIN(0, TINT);
				STKPOP(1);
				tabpc = (pc + 4) & -4;
				idx = DWORD(tabpc+8)-DWORD(tabpc+4)+1;
				for (; idx > 0; idx--) {
					SET_STACKPOINTER(pc+DWORD(tabpc+idx*4+8), sp);
				}
				SET_STACKPOINTER(pc + DWORD(tabpc), sp);
				pc = tabpc + (DWORD(tabpc+8)-DWORD(tabpc+4)+1+3) * 4;
				break;

			case IRETURN:
				STACKIN(0, TINT);
				STKPOP(1);
				INCPC(1);
				unreached = true;
				break;

			case LRETURN:
				STACKIN(0, TLONG);
				STACKIN(1, TVOID);
				STKPOP(2);
				INCPC(1);
				unreached = true;
				break;

			case FRETURN:
				STACKIN(0, TFLOAT);
				STKPOP(1);
				INCPC(1);
				unreached = true;
				break;

			case DRETURN:
				STACKIN(0, TDOUBLE);
				STACKIN(1, TVOID);
				STKPOP(2);
				INCPC(1);
				unreached = true;
				break;

			case ARETURN:
				STACKIN(0, TOBJ);
				STKPOP(1);
				INCPC(1);
				unreached = true;
				break;

			case RETURN:
				INCPC(1);
				unreached = true;
				break;

			case GETSTATIC:
				field = getField(lclw, true, meth, &class);
				if (FIELD_ISREF(field)) {
					STKPUSH(1);
					STACKOUT(1, TOBJ);
				}
				else switch (CLASS_PRIM_SIG(FIELD_TYPE(field))){
				case 'I':
				case 'Z':
				case 'S':
				case 'B':
				case 'C':
					STKPUSH(1);
					STACKOUT(0, TINT);
					break;
				case 'F':
					STKPUSH(1);
					STACKOUT(0, TFLOAT);
					break;
				case 'J':
					STKPUSH(2);
					STACKOUT(0, TLONG);
					STACKOUT(1, TVOID);
					break;
				case 'D':
					STKPUSH(2);
					STACKOUT(0, TDOUBLE);
					STACKOUT(1, TVOID);
					break;
				default:
					abort();
					break;
				}
				INCPC(3);
				break;

			case PUTSTATIC:
				field = getField(lclw, true, meth, &class);
				if (FIELD_ISREF(field)) {
					STACKIN(0, TOBJ);
					STKPOP(1);
				}
				else switch (CLASS_PRIM_SIG(FIELD_TYPE(field))){
				case 'I':
				case 'Z':
				case 'S':
				case 'B':
				case 'C':
					STACKIN(0, TINT);
					STKPOP(1);
					break;
				case 'F':
					STACKIN(0, TFLOAT);
					STKPOP(1);
					break;
				case 'J':
					STACKIN(0, TLONG);
					STACKIN(1, TVOID);
					STKPOP(2);
					break;
				case 'D':
					STACKIN(0, TDOUBLE);
					STACKIN(1, TVOID);
					STKPOP(2);
					break;
				default:
					abort();
					break;
				}
				INCPC(3);
				break;

			case GETFIELD:
				field = getField(lclw, false, meth, &class);
				STACKIN(0, TOBJ);
				if (FIELD_ISREF(field)) {
					STACKOUT(1, TOBJ);
				}
				else switch (CLASS_PRIM_SIG(FIELD_TYPE(field))){
				case 'I':
				case 'Z':
				case 'S':
				case 'B':
				case 'C':
					STACKOUT(0, TINT);
					break;
				case 'F':
					STACKOUT(0, TFLOAT);
					break;
				case 'J':
					STKPUSH(1);
					STACKOUT(0, TLONG);
					STACKOUT(1, TVOID);
					break;
				case 'D':
					STKPUSH(1);
					STACKOUT(0, TDOUBLE);
					STACKOUT(1, TVOID);
					break;
				default:
					abort();
					break;
				}
				INCPC(3);
				break;

			case PUTFIELD:
				field = getField(lclw, false, meth, &class);
				STACKIN(0, TANY);
				if (FIELD_ISREF(field)) {
					STACKIN(0, TOBJ);
					STKPOP(2);
				}
				else switch (CLASS_PRIM_SIG(FIELD_TYPE(field))){
				case 'I':
				case 'Z':
				case 'S':
				case 'B':
				case 'C':
					STACKIN(0, TINT);
					STKPOP(2);
					break;
				case 'F':
					STACKIN(0, TFLOAT);
					STKPOP(2);
					break;
				case 'J':
					STACKIN(0, TLONG);
					STACKIN(1, TVOID);
					STKPOP(3);
					break;
				case 'D':
					STACKIN(0, TDOUBLE);
					STACKIN(1, TVOID);
					STKPOP(3);
					break;
				default:
					abort();
					break;
				}
				INCPC(3);
				break;

			case INVOKEVIRTUAL:
			case INVOKESPECIAL:
				getMethodArguments(lclw, meth, &call);

				for (idx = 0; idx < call.in; idx++) {
					STACKIN(0, TANY);
					STKPOP(1);
				}
				STACKIN(0, TOBJ);
				STKPOP(1);
				STKPUSH(call.out);
				if (call.out > 0) {
					STACKOUT(0, TANY);
					if (call.out == 2) {
						STACKOUT(1, TVOID);
					}
				}
				INCPC(3);
				break;

			case INVOKEINTERFACE:
				getMethodArguments(lclw, meth, &call);
				for (idx = 0; idx < call.in; idx++) {
					STACKIN(0, TANY);
					STKPOP(1);
				}
				STACKIN(0, TOBJ);
				STKPOP(1);
				STKPUSH(call.out);
				if (call.out > 0) {
					STACKOUT(0, TANY);
					if (call.out == 2) {
						STACKOUT(1, TVOID);
					}
				}
				INCPC(5);
				break;

			case INVOKESTATIC:
				getMethodArguments(lclw, meth, &call);
				for (idx = 0; idx < call.in; idx++) {
					STACKIN(0, TANY);
					STKPOP(1);
				}
				STKPUSH(call.out);
				if (call.out > 0) {
					STACKOUT(0, TANY);
					if (call.out == 2) {
						STACKOUT(1, TVOID);
					}
				}
				INCPC(3);
				break;

			case NEW:
				STKPUSH(1);
				STACKOUT(0, TOBJ);
				INCPC(3);
				break;

			case NEWARRAY:
				STACKIN(0, TINT);
				STACKOUT(0, TOBJ);
				INCPC(2);
				break;

			case ANEWARRAY:
				STACKIN(0, TINT);
				STACKOUT(0, TOBJ);
				INCPC(3);
				break;

			case MULTIANEWARRAY:
				for (idx = INSN(pc+3) - 1; idx >= 0; idx--) {
					STACKIN(idx, TINT);
				}
				STKPOP(INSN(pc+3) - 1);
				STACKOUT(0, TOBJ);
				INCPC(4);
				break;

			case ARRAYLENGTH:
				STACKIN(0, TOBJ);
				STACKOUT(0, TINT);
				INCPC(1);
				break;

			case ATHROW:
				STACKIN(0, TOBJ);
				STKPOP(1);
				INCPC(1);
				break;

			case CHECKCAST:
				class = getClass(lclw, meth->class);
				SET_INSN(pc, CHECKCAST_FAST);
				STACKIN(0, TOBJ);
				STACKOUT(0, TOBJ);
				INCPC(3);
				break;

			case INSTANCEOF:
				class = getClass(lclw, meth->class);
				SET_INSN(pc, INSTANCEOF_FAST);
				STACKIN(0, TOBJ);
				STACKOUT(0, TINT);
				INCPC(3);
				break;

			case MONITORENTER:
			case MONITOREXIT:
				STACKIN(0, TOBJ);
				STKPOP(1);
				INCPC(1);
				break;

			case IFNULL:
			case IFNONNULL:
				STACKIN(0, TOBJ);
				STKPOP(1);
				SET_STACKPOINTER(pc + lclw, sp);
				SET_STACKPOINTER(pc + 3, sp);
				INCPC(3);
				break;

			case WIDE:
				wide = true;
				INCPC(1);
				break;

			case BREAKPOINT:
				INCPC(1);
				break;

			/* Fast instruction don't need any analysis */
			case CHECKCAST_FAST:
			case INSTANCEOF_FAST:
				INCPC(INSNLEN(pc));
				break;
			}
		}
	} while (restartpc != -1);
}
