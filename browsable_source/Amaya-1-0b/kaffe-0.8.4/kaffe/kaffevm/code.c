/*
 * code.c
 * Process a new code attribute.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#define	DBG(s)

#include "config.h"
#include "config-std.h"
#include "config-mem.h"
#include "jtypes.h"
#include "file.h"
#include "errors.h"
#include "bytecode.h"
#include "code.h"
#include "access.h"
#include "object.h"
#include "classMethod.h"
#include "readClass.h"
#include "slots.h"
#include "exception.h"

void
addCode(methods* m, uint32 len, classFile* fp)
{
	Code c;
	int i;
	u2 i2;

	readu2(&c.max_stack, fp);
	readu2(&c.max_locals, fp);
	readu4(&c.code_length, fp);
DBG(	printf("Max stack = %d\n", c.max_stack);	)
DBG(	printf("Max locals = %d\n", c.max_locals);	)
DBG(	printf("Code length = %d\n", c.code_length);	)
	if (c.code_length > 0) {
		c.code = gc_malloc(c.code_length, &gcNormal);
		readm(c.code, c.code_length, sizeof(bytecode), fp);
	}
	else {
		c.code = 0;
	}
	readu2(&c.exception_table_length, fp);
DBG(	printf("Exception table length = %d\n", c.exception_table_length);	)
	if (c.exception_table_length > 0) {
		c.exception_table = gc_malloc(c.exception_table_length * sizeof(jexception), &gcNormal);
		for (i = 0; i < c.exception_table_length; i++) {
			readu2(&i2, fp);
			c.exception_table[i].start_pc = i2;
			readu2(&i2, fp);
			c.exception_table[i].end_pc = i2;
			readu2(&i2, fp);
			c.exception_table[i].handler_pc = i2;
			readu2(&i2, fp);
			if (i2 == 0) {
				c.exception_table[i].catch_type = NULL;
			}
			else {
				c.exception_table[i].catch_type
				  = getClass (i2, m->class);
			}
		}
	}
	else {
		c.exception_table = 0;
	}
	GC_WRITE(m, c.code);
	GC_WRITE(m, c.exception_table);
	addMethodCode(m, &c);

	readAttributes(fp, m->class, m);
}

/*
 * Read in line numbers assocated with code.
 */
void
addLineNumbers(methods* m, uint32 len, classFile* fp)
{
	lineNumbers* lines;
	int i;
	u2 nr;
	u2 data;

	readu2(&nr, fp);
	lines = gc_malloc(sizeof(lineNumbers)+sizeof(lineNumberEntry) * nr, &gcNoWalk);

	lines->length = nr;
	for (i = 0; i < nr; i++) {
		readu2(&data, fp);
		lines->entry[i].start_pc = data;
		readu2(&data, fp);
		lines->entry[i].line_nr = data;
	}

	/* Attach lines to method */
	GC_WRITE(m, lines);
	m->lines = lines;
}
