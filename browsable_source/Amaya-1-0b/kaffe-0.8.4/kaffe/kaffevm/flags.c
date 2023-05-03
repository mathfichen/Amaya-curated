/*
 * flags.c
 * Various configuration flags.
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#include "flags.h"

/*
 * Specify what and how bytecode should be verified.
 */
int flag_verify = 0;

/*
 * Specify whether the garbage collector is noisy.
 */
int flag_gc = 0;

/*
 * Specify where class loading in noisy.
 */
int flag_classload;

/*
 * Specify whether the JIT system (if in use) is noisy.
 */
int flag_jit = 0;

/*
 * Specify whether to trace method calls.
 */
int flag_trace = 0;
