/*
 * java.util.Date.c
 *
 * Copyright (c) 1996 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "lib-license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>, 1996.
 */

#include <time.h>
#include <string.h>
#include <native.h>
#include "config.h"
#include "java.util.stubs/Date.h"

#if defined(HAVE_STRFTIME)
#define	SIMPLETIME(str, tm)	strftime(str, sizeof(str), "%a %h %d %H:%M:%S %Z %Y", tm)
#define	LOCALETIME(str, tm)	strftime(str, sizeof(str), "%a %h %d %H:%M:%S %Y", tm)
#define	GMTTIME(str, tm)	strftime(str, sizeof(str), "%d %h %Y %H:%M:%S GMT", tm)
#else
#define	SIMPLETIME(str, tm)	strcpy(str, asctime(tm)); str[strlen(str)-1] = 0
#define	LOCALETIME(str, tm)	strcpy(str, asctime(tm)); str[strlen(str)-1] = 0
#define	GMTTIME(str, tm)	strcpy(str, asctime(tm)); str[strlen(str)-1] = 0
#endif

/*
 * Convert a date to a string.
 */
struct Hjava_lang_String*
java_util_Date_toString(struct Hjava_util_Date* this)
{
	time_t date;
	char str[64];

	if (unhand(this)->valueValid == 0) {
		java_util_Date_computeValue(this);
	}
	date = unhand(this)->value / 1000;
	SIMPLETIME(str, localtime(&date));
	return(makeJavaString(str, strlen(str)));
}

/*
 * Convert a date to a string in the local timezone.
 */
struct Hjava_lang_String*
java_util_Date_toLocaleString(struct Hjava_util_Date* this)
{
	time_t date;
	char str[64];

	if (unhand(this)->valueValid == 0) {
		java_util_Date_computeValue(this);
	}
	date = unhand(this)->value / 1000;
	LOCALETIME(str, localtime(&date));
	return(makeJavaString(str, strlen(str)));
}

/*
 * Covert a date to a string in GMT timezone.
 */
struct Hjava_lang_String*
java_util_Date_toGMTString(struct Hjava_util_Date* this)
{
	time_t date;
	char str[64];

	if (unhand(this)->valueValid == 0) {
		java_util_Date_computeValue(this);
	}
	date = unhand(this)->value / 1000;
	GMTTIME(str, gmtime(&date));
	return(makeJavaString(str, strlen(str)));
}

/*
 * Expand the single value into a split date.
 */
void
java_util_Date_expand(struct Hjava_util_Date* this)
{
	struct tm* time;
	time_t date;

	date = unhand(this)->value / 1000;
	time = localtime(&date);

	unhand(this)->tm_millis = 0;
	unhand(this)->tm_sec = time->tm_sec;
	unhand(this)->tm_min = time->tm_min;
	unhand(this)->tm_hour = time->tm_hour;
	unhand(this)->tm_mday = time->tm_mday;
	unhand(this)->tm_mon = time->tm_mon;
	unhand(this)->tm_year = time->tm_year;
	unhand(this)->tm_wday = time->tm_wday;
	unhand(this)->tm_yday = time->tm_yday;
	unhand(this)->tm_isdst = time->tm_isdst;

	unhand(this)->expanded = 1;
}

/*
 * Convert the split date into a single value.
 */
void
java_util_Date_computeValue(struct Hjava_util_Date* this)
{
	struct tm time;
	time_t basetime = 0;

	time.tm_sec = unhand(this)->tm_sec;
	time.tm_min = unhand(this)->tm_min;
	time.tm_hour = unhand(this)->tm_hour;
	time.tm_mday = unhand(this)->tm_mday;
	time.tm_mon = unhand(this)->tm_mon;
	time.tm_year = unhand(this)->tm_year;
	time.tm_wday = unhand(this)->tm_wday;
	time.tm_yday = unhand(this)->tm_yday;
	time.tm_isdst = -1 /* unhand(this)->tm_isdst */ ;
#if defined(HAVE_TM_ZONE)
	time.tm_gmtoff = (localtime(&basetime))->tm_gmtoff;
	time.tm_zone = 0;
#endif

	unhand(this)->valueValid = 1;
	unhand(this)->value = (jlong)1000 * (jlong)mktime(&time);
}
