/* gc-incremental.h
 * The incremental garbage collector.
 *
 * Copyright (c) 1997 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>
 */

#ifndef __gc_incremental_h
#define __gc_incremental_h

struct _gcInfo;
typedef struct _gcFuncs {
	void		(*walk)(struct _gcInfo*);
	bool		(*final)(struct _gcInfo*);
} gcFuncs;

extern int gc_mode;

#define	GC_DISABLED		0
#define	GC_ENABLED		1

#define	GC_WHITE		0		/* Unmarked */
#define	GC_GREY			1		/* Marked but not traversed */
#define	GC_BLACK		2		/* Marked and traversed */

#define	GC_NORMAL		0		/* Has no finalise method */
#define	GC_FINALIZED		GC_NORMAL	/* Has been finalised */
#define	GC_ROOT			1		/* A root object */
#define	GC_NEEDFINALIZE		2		/* Needs finalising */

typedef struct _gcInfo {
	unsigned int		size;
	unsigned int		ref;
	struct _gcInfo*		prev;
	struct _gcInfo*		next;
	gcFuncs*		funcs;
	char			colour;
	char			final;
	char			__align__[2];
} gcInfo;

typedef gcInfo gcList;

#define	REF_MAXH		1024
#define	REF_MAXW		1024

#define	MAKEREF(_h, _w)		(((_h) * REF_MAXW) + (_w))
#define	GETREF(_r)		refTable.width[(_r) / REF_MAXW][(_r) % REF_MAXW]
#define	SETREF(_r, _v)		refTable.width[(_r) / REF_MAXW][(_r) % REF_MAXW] = (jword)(_v)
#define	VALIDREF(_r)		((_r) / REF_MAXW < REF_MAXH && refTable.width[(_r) / REF_MAXW] != 0)

#define	MEM2GC(_m)		((gcInfo*)(((uint8*)(_m)) - sizeof(gcInfo)))
#define	GC2MEM(_g)		((void*)((_g)+1))
#define	LOCK()			intsDisable()
#define	UNLOCK()		intsRestore()

#define	RESETLIST(_l)		(_l).next = &(_l); \
				(_l).prev = &(_l)

#define	APPENDLIST(_l, _o)	(_o)->prev = (_l).prev; \
				(_o)->next = (_l).prev->next; \
				(_l).prev->next = (_o); \
				(_l).prev = (_o)

#define	REMOVELIST(_o)		(_o)->prev->next = (_o)->next; \
				(_o)->next->prev = (_o)->prev; \
				(_o)->prev = 0; \
				(_o)->next = 0

void* gc_malloc(size_t, gcFuncs*);

#define	gc_calloc(_a, _b, _c)	gc_malloc((_a) * (_b), (_c))
#define	gc_free(_m)		/* Does nothing */

void initGc(void);
void invokeGC(void);

extern struct _gcStats {
        uint32  totalmem;
        uint32  totalobj;
        uint32  freedmem;
        uint32  freedobj;
        uint32  markedobj;
        uint32  markedmem;
        uint32  allocobj;
        uint32  allocmem;
} gcStats;

void walkConservative(gcInfo*);
void walkNull(gcInfo*);

extern gcFuncs gcNormal;
extern gcFuncs gcNoWalk;
extern gcFuncs gcRoot;

#define	MARK_REFERENCE(R)	if (R != 0) markObject(MEM2GC(R))

#if defined(GC_INCREMENTAL)
#define	GC_WRITE(_o, _p)	soft_addreference(_o, _p)
#else
#define	GC_WRITE(_o, _p)
#endif

#endif
