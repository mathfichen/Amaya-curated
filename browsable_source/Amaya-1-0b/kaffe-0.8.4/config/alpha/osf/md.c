/*
 * alpha/osf/md.c
 * OSF/1 Alpha specific functions.
 *
 * Copyright (c) 1997 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Richard Henderson <rth@tamu.edu>, 1997
 */

#include <machine/fpu.h>
#include <sys/sysinfo.h>
#include <machine/hal_sysinfo.h>
#include <sys/proc.h>

#ifndef FPCR_INED
#define FPCR_INED 0
#endif
#ifndef FPCR_UNFD
#define FPCR_UNFD 0
#endif
#ifndef FPCR_OVFD
#define FPCR_OVFD 0
#endif
#ifndef FPCR_DZED
#define FPCR_DZED 0
#endif

void
init_md(void)
{
	/* Set the bits in the hw fpcr for cpu's that implement
	   all the bits.  */
	__asm__ __volatile__(
		"excb\n\t"
		"mt_fpcr %0\n\t"
		"excb"
		: : "f"(FPCR_INED | FPCR_UNFD | FPCR_DYN_NORMAL
			| FPCR_OVFD | FPCR_DZED));

	/* Set the software emulation bits in the kernel for
	   those that don't.  */
	ieee_set_fp_control(IEEE_TRAP_ENABLE_INV);
}


/* This bit turns off unaligned access fixups in favour of SIGBUS.  It
   is not called by Kaffe, but it is useful to invoke from within 
   the debugger.  */

void alpha_disable_uac()
{
  int buf[2];

  buf[0] = SSIN_UACPROC;
  buf[1] = UAC_SIGBUS;
  setsysinfo(SSI_NVPAIRS, buf, 1, 0, 0);
}

#include "alpha/threads.c"
