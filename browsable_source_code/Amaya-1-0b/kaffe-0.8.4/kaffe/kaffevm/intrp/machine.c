/*
 * machine.c
 * Java virtual machine interpreter.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>
 */

#define	DBG(s)
#define	RDBG(s)
#define	NDBG(s)
#define	IDBG(s)
#define	CHDBG(s)

#include "config.h"
#include "config-std.h"
#include "config-math.h"
#include "config-mem.h"
#include <setjmp.h>
#include "gtypes.h"
#include "bytecode.h"
#include "slots.h"
#include "icode.h"
#include "access.h"
#include "object.h"
#include "constants.h"
#include "gc.h"
#include "machine.h"
#include "classMethod.h"
#include "lookup.h"
#include "soft.h"
#include "exception.h"
#include "external.h"
#include "baseClasses.h"
#include "thread.h"
#include "checks.h"
#include "errors.h"

/*
 * Define information about this engine.
 */
char* engine_name = "Interpreter";
char* engine_version = KVER;

extern uint8 insnLen[];

#define	define_insn(code)	break;					\
				case code:				\
				IDBG( printf("%03d: %s\n", pc, #code); )

void unimp(void);

/* Misc stuff */
Hjava_lang_Object* exceptionObject;

void
virtualMachine(methods* meth, slots* arg, slots* retval)
{
	Hjava_lang_Object* mobj;
	vmException mjbuf;
	void* pjbuf;
	accessFlags methaccflags;

	/* If these can be kept in registers then things will go much
	 * better.
	 */
	register bytecode* code;
	register slots* lcl;
	register slots* sp;
	register uintp pc;
	register uintp npc;

	/* Misc machine variables */
	jint cc;
	jlong lcc;
	jlong tmpl;
	slots tmp[1];
	slots tmp2[1];
	slots mtable[1];

	/* Variables used directly in the machine */
	int wide;
	int32 idx;
	jint low;
	jint high;

	/* Call, field and creation information */
	callInfo cinfo;
	Field* field;
	Class* crinfo;
	exceptionInfo info;

	/* If this is native, then call the real function */
	methaccflags = meth->accflags;
	if (methaccflags & ACC_NATIVE) {
NDBG(		printf("Call to native %s.%s%s.\n", meth->class->name->data, meth->name->data, meth->signature->data); fflush(stdout); )
		if (meth->ncode == 0) {
			native(meth);
		}
		(*(void(*)(void*, void*))meth->ncode)(arg, retval);
		return;
	}

	/* Verify method if required */
	if (!(methaccflags & ACC_VERIFIED)) {
		verifyMethod(meth);
	}

	/* Allocate stack space and locals. */
	lcl = alloca(sizeof(slots) * (meth->localsz + meth->stacksz));

	mobj = 0;
	pc = 0;
	npc = 0;

	/* If we have any exception handlers we must prepare to catch them.
	 * We also need to catch if we are synchronised (so we can release it).
	 */
	pjbuf = TCTX(currentThread)->exceptPtr;
	mjbuf.pc = 0;
	mjbuf.mobj = mobj;
	mjbuf.meth = meth;
	mjbuf.prev = pjbuf;
	TCTX(currentThread)->exceptPtr = &mjbuf;
	if (meth->exception_table_len > 0 || (methaccflags & ACC_SYNCHRONISED)) {
		if (setjmp(mjbuf.jbuf) != 0) {
			assert(TCTX(currentThread)->exceptPtr == &mjbuf);
			npc = mjbuf.pc;
			sp = &lcl[meth->localsz + meth->stacksz - 1];
			sp->v.taddr = (void*)exceptionObject;
			goto restart;
		}
	}

	/* Calculate number of arguments */
	idx = meth->ins + (methaccflags & ACC_STATIC ? 0 : 1);

DBG(	printf("Call to method %s.%s%s.\n", meth->class->name->data, meth->name->data, meth->signature->data); fflush(stdout); )

	/* Copy in the arguments */
	sp = lcl;
	arg = &arg[idx-1];
	for (low = 0; low < idx; low++) {
		*(sp++) = *(arg--);
	}

	/* Sync. if required */
	if (methaccflags & ACC_SYNCHRONISED) { 
		if (methaccflags & ACC_STATIC) {
			mobj = &meth->class->head;
		}
		else {
			mobj = (Hjava_lang_Object*)lcl[0].v.taddr;
		}
		soft_monitorenter(mobj);
	}       

	sp = &lcl[meth->localsz + meth->stacksz];

	restart:
	wide = 0;
	code = (bytecode*)meth->code;

	/* Finally we get to actually execute the machine */
	for (;;) {
		assert(npc < meth->codelen);
		pc = npc;
		mjbuf.pc = pc;
		npc = pc + insnLen[code[pc]];

		/* Handle WIDEned instructions */
		if (wide) {
			switch(code[pc]) {
			case ILOAD:
			case FLOAD:
			case ALOAD:
			case LLOAD:
			case DLOAD:
			case ISTORE:
			case FSTORE:
			case ASTORE:
			case LSTORE:
			case DSTORE:
				npc += 1;
				break;
			case IINC:
				npc += 2;
				break;
			default:
				fprintf(stderr, "Badly widened instruction");
				throwException(VerifyError);
				break;
			}
		}

		switch (code[pc]) {
		default:
			fprintf(stderr, "Unknown bytecode %d\n", code[pc]);
			throwException(VerifyError);
			break;
#include "kaffe.def"
		}
	}
	end:

	/* Unsync. if required */
	if (mobj != 0) {
		soft_monitorexit(mobj);
	}       
	TCTX(currentThread)->exceptPtr = pjbuf;

RDBG(	printf("Returning from method %s%s.\n", meth->name->data, meth->signature->data); )
}

void
unimp(void)
{
	assert("Unimplemented VM function" == 0);
}
