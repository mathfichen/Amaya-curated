/* machine.c
 * Translate the Kaffe instruction set to the native one.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>
 */

#define	DBG(s)
#define	MDBG(s)

#include "config.h"
#include "config-std.h"
#include "config-mem.h"
#include "gtypes.h"
#include "bytecode.h"
#include "slots.h"
#include "registers.h"
#include "seq.h"
#include "gc.h"
#include "machine.h"
#include "basecode.h"
#include "icode.h"
#include "labels.h"
#include "constpool.h"
#include "codeproto.h"
#include "checks.h"
#include "access.h"
#include "object.h"
#include "constants.h"
#include "baseClasses.h"
#include "classMethod.h"
#include "code.h"
#include "access.h"
#include "lookup.h"
#include "exception.h"
#include "external.h"
#include "flags.h"
#include "errors.h"
#include "code-analyse.h"
#include "md.h"

/*
 * Define information about this engine.
 */
char* engine_name = "Just-in-time";
char* engine_version = KVER;

int stackno;
int maxStack;
int maxLocal;
int maxTemp;
int maxArgs;
int maxPush;
int isStatic;

int tmpslot;
int argcount = 0;		/* Function call argument count */
uint32 pc;
uint32 npc;

/* Unit in which code block is increased when overrun */
#define	ALLOCCODEBLOCKSZ	8192
/* Codeblock redzone - allows for safe overrun when generating instructions */
#define	CODEBLOCKREDZONE	256

nativecode* codeblock;
int codeblock_size;

/* Mutex to protect the translator from multiple entry */
static iMux translatorMux;

int CODEPC;

struct {
	int time;
} jitStats;

extern int enable_readonce;

static void	generateCode(methods*);

void	endBlock(sequence*);
void	startBlock(sequence*);
jlong	currentTime(void);

/*
 * Translate a method into native code.
 */
void
translate(methods* meth)
{
	int wide;
	int i;

	jint low;
	jint high;
	jlong tmpl;
	int idx;
	SlotInfo* tmp;
	SlotInfo* tmp2;
	SlotInfo* mtable;

	bytecode* base;
	int len;
	callInfo cinfo;
	Field *field;
	Class* crinfo;

	int64 tms;
	int64 tme;

	/* Only one in the translator at once. Must check the translation
	 * hasn't been done by someone else once we get it.
	 */
	_lockMutex(&translatorMux);
	if (meth->ncode != 0) {
		_unlockMutex(&translatorMux);
		return;
	}

	if (flag_jit) {
		tms = currentTime();
	}

DBG(	printf("callinfo = 0x%x\n", &cinfo);	)

	/* If this code block is native, then just set it up and return */
	if ((meth->accflags & ACC_NATIVE) != 0) {
		native(meth);
		KAFFEJIT_TO_NATIVE(meth);
		_unlockMutex(&translatorMux);
		return;
	}

	maxLocal = meth->localsz;
	maxStack = meth->stacksz;
	maxArgs = meth->ins;
	if (meth->accflags & ACC_STATIC) {
		isStatic = 1;
	}
	else {
		isStatic = 0;
		maxArgs += 1;
	}

	base = (bytecode*)meth->code;
	len = meth->codelen;

	initSeq();
	initRegisters();
	initSlots(maxLocal + maxStack);
	localinfo = &slotinfo[0];
	tempinfo = &localinfo[maxLocal+maxStack];

	/* Scan the code and determine the basic blocks */
	verifyMethod(meth);

	/* Clear various counters */
	tmpslot = maxTemp = 0;
	maxPush = 0;
	npc = 0;
	wide = 0;
	stackno = meth->localsz + meth->stacksz;

	/***************************************/
	/* Next reduce bytecode to native code */
	/***************************************/

	start_basic_block();
	start_function();
	monitor_enter();
	if (IS_STARTOFBASICBLOCK(npc)) {
		end_basic_block();
		start_basic_block();
	}

	for (pc = 0; pc < len; pc = npc) {

		assert(stackno <= maxStack+maxLocal);

		npc = pc + insnLen[base[pc]];

		/* Handle WIDEned instructions */
		if (wide) {
			switch(base[pc]) {
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
				fprintf(stderr, "Badly widened instruction %d\n", base[pc]);
				throwException(VerifyError);
				break;
			}
		}

		start_instruction();

		/* Note start of exception handling blocks */
		if (IS_STARTOFEXCEPTION(pc)) {
			stackno = meth->localsz + meth->stacksz - 1;
			start_exception_block();
		}

		switch (base[pc]) {
		default:
			fprintf(stderr, "Unknown bytecode %d\n", base[pc]);
			throwException(VerifyError);
			break;
#include "kaffe.def"
		}

		/* Note maximum number of temp slots used and reset it */
		if (tmpslot > maxTemp) {
			maxTemp = tmpslot;
		}
		tmpslot = 0;

		if (IS_STARTOFBASICBLOCK(npc)) {
			end_basic_block();
			start_basic_block();
			stackno = STACKPOINTER(npc);
		}
	}

	assert(maxTemp < MAXTEMPS);

	/* Generate and link code */
	generateCode(meth);

MDBG(	printf("Translating %s.%s%s (%s) 0x%x\n", meth->class->name->data, meth->name->data, meth->signature->data, isStatic ? "static" : "normal", meth->ncode);	)

	if (flag_jit) {
		tme = currentTime();
		jitStats.time += (tme - tms);
		printf("<JIT: %s.%s%s time %dms (%dms) @ %p>\n",
		       CLASS_CNAME(meth->class),
		       meth->name->data, meth->signature->data,
		       (int)(tme - tms), jitStats.time, meth->ncode);
	}

	_unlockMutex(&translatorMux);
}

/*
 * Generate the code.
 */
static
void
generateCode(methods* meth)
{
	sequence* t;
	uint32 constlen;
	nativecode* methblock, *codebase;
	jexception* e;
	int i;

DBG(	printf("codeblock = 0x%x\n", codeblock);	)
DBG(	printf("slotinfo = 0x%x\n", slotinfo);		)

	CODEPC = 0;
	for (t = firstSeq; t != currSeq; t = t->next) {

		/* If we overrun the codeblock, reallocate and continue.  */
		if (CODEPC >= codeblock_size) {
			codeblock_size += ALLOCCODEBLOCKSZ;
			codeblock = checked_realloc(codeblock, codeblock_size + CODEBLOCKREDZONE);
		}

		/* Generate sequences which are actually referenced */
		if (t->ref > 0) {
			(*(t->func))(t);
		}
	}

	/* Okay, put this into malloc'ed memory */
	constlen = nConst * sizeof(union _constpoolval);
	methblock = gc_malloc(constlen + CODEPC, &gcNormal);
	codebase = methblock + constlen;
	memcpy(codebase, codeblock, CODEPC);

	/* Establish any code constants */
	establishConstants(methblock);

	/* Link it */
	linkLabels((uintp)codebase);

	/* Note where it all is */
	GC_WRITE(meth, methblock);
	meth->ncode_start = methblock;
	meth->ncode = codebase;
	meth->ncode_end = codebase + CODEPC;

	/* Flush code out of cache */
	FLUSH_DCACHE(meth->ncode, meth->ncode_end);

	/* Translate exception table and make it available */
	if (meth->exception_table != 0) {
		for (i = 0; i < meth->exception_table_len; i++) {
			e = &meth->exception_table[i];
			e->start_pc = INSNPC(e->start_pc) + (uintp)codebase;
			e->end_pc = INSNPC(e->end_pc) + (uintp)codebase;
			e->handler_pc = INSNPC(e->handler_pc) + (uintp)codebase;
		}
	}

	/* Translate line numbers table */
	if (meth->lines != 0) {
		for (i = 0; i < meth->lines->length; i++) {
			meth->lines->entry[i].start_pc = INSNPC(meth->lines->entry[i].start_pc) + (uintp)codebase;
		}
	}
}

/*
 * Start a new instruction.
 */
void
startInsn(sequence* s)
{
	SET_INSNPC(const_int(2), CODEPC);
}

/*
 * Mark slot not to be written back.
 */
void
nowritebackSlot(sequence* s)
{
	seq_slot(s, 0)->modified |= rnowriteback;
}

/*
 * Start a new basic block.
 */
void
startBlock(sequence* s)
{
	int i;

	startInsn(s);

	/* Invalidate all slots - don't use clobberRegister which will
	 * flush them - we do not want to do that even if they are dirty.
	 */
	for (i = maxslot - 1; i >= 0; i--) {
		if (slotinfo[i].regno != NOREG) {
			register_invalidate(slotinfo[i].regno);
			slot_invalidate(&slotinfo[i]);
		}
	}
}

/*
 * Fixup after a function call.
 */
void
fixupFunctionCall(sequence* s)
{
	int i;

	startInsn(s);

	/* Invalidate all slots - don't use clobberRegister which will
	 * flush them - we do not want to do that even if they are dirty.
	 */
	for (i = maxslot - 1; i >= 0; i--) {
		if (slotinfo[i].regno != NOREG && (reginfo[slotinfo[i].regno].flags & Rnosaveoncall) == 0) {
			register_invalidate(slotinfo[i].regno);
			slot_invalidate(&slotinfo[i]);
		}
	}
}

/*
 * End a basic block.
 */
void
endBlock(sequence* s)
{
	int stkno;
	int i;

	/* Spill locals */
	for (i = 0; i < maxLocal; i++) {
		if ((localinfo[i].modified & rwrite) != 0 && localinfo[i].regno != NOREG) {
			if ((localinfo[i].modified & rnowriteback) == 0) {
				spill(&localinfo[i]);
				localinfo[i].modified = 0;
			}
			else {
				localinfo[i].modified &= ~rnowriteback;
			}
		}
	}

	/* Spill stack */
	stkno = const_int(1);
	for (i = stkno; i < maxStack+maxLocal; i++) {
		if ((localinfo[i].modified & rwrite) != 0 && localinfo[i].regno != NOREG) {
			if ((localinfo[i].modified & rnowriteback) == 0) {
				spill(&localinfo[i]);
				localinfo[i].modified = 0;
			}
			else {
				localinfo[i].modified &= ~rnowriteback;
			}
		}
	}

	/* Spill temps currently in use */
	tmpslot = const_int(2);
	for (i = 0; i < tmpslot; i++) {
		if ((tempinfo[i].modified & rwrite) != 0 && tempinfo[i].regno != NOREG) {
			if ((tempinfo[i].modified & rnowriteback) == 0) {
				spill(&tempinfo[i]);
				tempinfo[i].modified = 0;
			}
			else {
				tempinfo[i].modified &= ~rnowriteback;
			}
		}
	}
}

/*
 * Prepare register state for function call.
 */
void
prepareFunctionCall(sequence* s)
{
	int stkno;
	int i;

	/* Spill locals */
	for (i = 0; i < maxLocal; i++) {
		if ((localinfo[i].modified & rwrite) != 0 && localinfo[i].regno != NOREG && (reginfo[localinfo[i].regno].flags & Rnosaveoncall) == 0) {
			spill(&localinfo[i]);
			localinfo[i].modified = 0;
		}
	}

	/* Spill stack */
	stkno = const_int(1);
	for (i = stkno; i < maxStack+maxLocal; i++) {
		if ((localinfo[i].modified & rwrite) != 0 && localinfo[i].regno != NOREG && (reginfo[localinfo[i].regno].flags & Rnosaveoncall) == 0) {
			spill(&localinfo[i]);
			localinfo[i].modified = 0;
		}
	}

	/* Spill temps currently in use */
	tmpslot = const_int(2);
	for (i = 0; i < tmpslot; i++) {
		if ((tempinfo[i].modified & rwrite) != 0 && tempinfo[i].regno != NOREG && (reginfo[tempinfo[i].regno].flags & Rnosaveoncall) == 0) {
			spill(&tempinfo[i]);
			tempinfo[i].modified = 0;
		}
	}
}

/*
 * Sync register state back to memory (but don't clean anything).
 */
void
syncRegisters(sequence* s)
{
	int stkno;
	int i;
	int old_ro;

	old_ro = enable_readonce;
	enable_readonce = 0;

	/* Spill locals */
	for (i = 0; i < maxLocal; i++) {
		if ((localinfo[i].modified & rwrite) != 0 && localinfo[i].regno != NOREG && (reginfo[localinfo[i].regno].flags & Rnosaveoncall) == 0) {
			spill(&localinfo[i]);
		}
	}

	/* Spill stack */
	stkno = const_int(1);
	for (i = stkno; i < maxLocal+maxStack; i++) {
		if ((localinfo[i].modified & rwrite) != 0 && localinfo[i].regno != NOREG && (reginfo[localinfo[i].regno].flags & Rnosaveoncall) == 0) {
			spill(&localinfo[i]);
		}
	}

	/* Spill temps currently in use */
	tmpslot = const_int(2);
	for (i = 0; i < tmpslot; i++) {
		if ((tempinfo[i].modified & rwrite) != 0 && tempinfo[i].regno != NOREG && (reginfo[tempinfo[i].regno].flags & Rnosaveoncall) == 0) {
			spill(&tempinfo[i]);
		}
	}

	enable_readonce = old_ro;
}
