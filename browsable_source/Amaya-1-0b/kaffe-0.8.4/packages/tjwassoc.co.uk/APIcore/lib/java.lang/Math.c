/*
 * java.lang.Math.c
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "lib-license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#include <native.h>
#include <math.h>
#include "config.h"
#include "config-math.h"
#include "java.lang.stubs/Math.h"

double
java_lang_Math_sin(struct Hjava_lang_Math* none, double v)
{
	return (sin(v));
}

double
java_lang_Math_cos(struct Hjava_lang_Math* none, double v)
{
	return (cos(v));
}

double
java_lang_Math_tan(struct Hjava_lang_Math* none, double v)
{
	return (tan(v));
}

double
java_lang_Math_asin(struct Hjava_lang_Math* none, double v)
{
	return (asin(v));
}

double
java_lang_Math_acos(struct Hjava_lang_Math* none, double v)
{
	return (acos(v));
}

double
java_lang_Math_atan(struct Hjava_lang_Math* none, double v)
{
	return (atan(v));
}

double
java_lang_Math_exp(struct Hjava_lang_Math* none, double v)
{
	return (exp(v));
}

double
java_lang_Math_log(struct Hjava_lang_Math* none, double v)
{
	return (log(v));
}

double
java_lang_Math_sqrt(struct Hjava_lang_Math* none, double v)
{
	return (sqrt(v));
}

double
java_lang_Math_IEEEremainder(struct Hjava_lang_Math* none, double v1, double v2)
{
	return (remainder(v1, v2));
}

double
java_lang_Math_ceil(struct Hjava_lang_Math* none, double v)
{
	return (ceil(v));
}

double
java_lang_Math_floor(struct Hjava_lang_Math* none, double v)
{
	return (floor(v));
}

double
java_lang_Math_rint(struct Hjava_lang_Math* none, double v)
{
	/* As per Java Class Libraries page 927 */
	return (floor(v+0.5));
}

double
java_lang_Math_atan2(struct Hjava_lang_Math* none, double v1, double v2)
{
	return (atan2(v1, v2));
}

double
java_lang_Math_pow(struct Hjava_lang_Math* none, double v1, double v2)
{
	return (pow(v1, v2));
}
