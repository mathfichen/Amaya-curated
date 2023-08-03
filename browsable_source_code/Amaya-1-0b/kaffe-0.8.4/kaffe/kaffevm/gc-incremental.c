/* gc-incremental.c
 * The incremental garbage collector.
 *
 * Copyright (c) 1997 T. J. Wilkinson & Associates, London, UK.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * Written by Tim Wilkinson <tim@tjwassoc.demon.co.uk>
 */

#define	DBG(s)
#define	FDBG(s)
#define	FTDBG(s)
#define	ADBG(s)

#include "config.h"
#include "config-std.h"
#include "config-mem.h"
#include "gtypes.h"
#include "gc.h"
#include "flags.h"
#include "classMethod.h"
#include "locks.h"
#include "thread.h"
#include "errors.h"
#include "exception.h"
#include "external.h"
#include "lookup.h"
#include "md.h"

static gcList white;
static gcList grey;
static gcList black;
static gcList root;
static gcList finalise;

#if defined(GC_INCREMENTAL)
int32 gcAmount;
#else
static uint32 allocCount;
#endif

/*
 * Define the malloc we're using under the heap
 * Eventually this will be combined with the GC.
 */
extern void gcheap_initialise(size_t);
extern void* gcheap_malloc(size_t);
extern void gcheap_free(void*);

/* Default heapsize 16M */
#define	DEFAULT_HEAPSIZE	(16*1024*1024)

int gcHeapsize;

#define	GCHEAP_INIT()		gcheap_initialise(gcHeapsize == 0 ? DEFAULT_HEAPSIZE : gcHeapsize)
#define	GCHEAP_MALLOC(S)	gcheap_malloc(S)
#define	GCHEAP_FREE(S)		gcheap_free(S)

extern char* gcHeapbase;
extern char* gcHeaptop;

static struct {
	jword			free;
	jword			nextWidth;
	jword*			width[REF_MAXH];
} refTable;


/* We run the GC after allocating 1Mbyte of memory.  If we are
 * doing this incrementally, then we will have GC our entire heap
 * by the time we've allocated this much new space.
 */
#define	ALLOCCOUNTGC	(1024*1024)

static struct {
	iMux	mux;
	iCv	cv;
} finalman;
static struct {
	iMux	mux;
	iCv	cv;
} gcman;

int gc_mode = GC_DISABLED;	/* GC will be enabled after the first
				 * thread is setup.
				 */

/* Two standard GC function sets */
gcFuncs gcNormal = { walkConservative, 0 };
gcFuncs gcNoWalk = { walkNull, 0 };
gcFuncs gcRoot = { walkConservative, (void*)1 };

struct _gcStats gcStats;

static void startGC(void);
static void finishGC(void);

/*
 * Initalise the Garbage Collection system.
 */
void
initGc(void)
{
	GCHEAP_INIT();

	RESETLIST(white);
	RESETLIST(grey);
	RESETLIST(black);
	RESETLIST(root);
	RESETLIST(finalise);

DBG(	printf("root 0x%x\n", &root);
	printf("white 0x%x\n", &white);
	printf("grey 0x%x\n", &grey);
	printf("black 0x%x\n", &black);
	printf("final 0x%x\n", &finalise);		)
}

/*
 * A reference from one object to another is being created.  Handle
 * the write barrier necessary for incremental collection.
 */
void
soft_addreference(void* f, void* t)
{
	gcInfo* from;
	gcInfo* to;

	/* Quit now for null objects */
	if (t == 0) {
		return;
	}
	from = MEM2GC(f);
	to = MEM2GC(t);

	if (from->colour == GC_BLACK && to->colour == GC_WHITE) {
		LOCK();
		to->colour = GC_GREY;
		REMOVELIST(to);
		APPENDLIST(grey, to);
		UNLOCK();
	}
}

void
markObject(gcInfo* obj)
{
	/* If object's been traced before, don't do it again */
	if (obj->colour != GC_WHITE) {
		return;
	}
	assert(obj->final != GC_ROOT);

	/* If we found a new white object, mark it as grey and
	 * move it into the grey list.
	 */
	LOCK();
	obj->colour = GC_GREY;
	REMOVELIST(obj);
	APPENDLIST(grey, obj);
	UNLOCK();
}

void
scanConservative(void* base, size_t size)
{
	gcInfo* obj;
	void** mem;
	int32 i;

	gcStats.markedmem += size;

	mem = base;
	for (i = (size / sizeof(void*)) - 1; i >= 0; i--) {
		obj = MEM2GC(mem[i]);

		/* Check we've got a valid object */
		if (((char*)obj < gcHeapbase || (char*)obj > gcHeaptop) ||
		    (((uintp)obj % sizeof(void*)) != 0) ||
		    (!VALIDREF(obj->ref)) ||
		    (GETREF(obj->ref) != (uintp)obj)) {
			continue;
		}
		markObject(obj);
	}
}

void
walkConservative(gcInfo* base)
{
DBG(	printf("walkConservative: %d %x-%x\n", base->ref, GC2MEM(base),
		GC2MEM(base)+base->size);fflush(stdout);		)

	scanConservative (GC2MEM(base), base->size);
}

/*      
 * Walk an object which cannot reference anything.
 */     
void
walkNull(gcInfo* base)
{       
        gcStats.markedmem += base->size;
}

/*
 * Walk a GC'able object.  Mark the object as black then for each pointer
 * in the object which refers to another GC object, grey the object
 * and insert into the grey list.
 */
void
walkObject(gcInfo* base)
{
	assert(base->colour == GC_GREY);
	base->colour = GC_BLACK;
	if (base->final != GC_ROOT) {
		REMOVELIST(base);
		APPENDLIST(black, base);
	}

	gcStats.markedobj += 1;
	(*base->funcs->walk)(base);
}

/*
 * The Garbage Collector sits in a loop starting a collection, waiting
 * until it's finished incrementally, then tidying up before starting
 * another one.
 */
void
gcMan(void)
{
	gcInfo* obj;

	/* All threads start with interrupts disabled */
	intsRestore();

	_lockMutex(&gcman.mux);

	for(;;) {
#if defined(GC_INCREMENTAL)
		startGC();
		_waitCond(&gcman.mux, &gcman.cv, 0);

		LOCK();

		/* Walk the threads.  Although we do this initially it is
		 * possible that there's an object on the thread stack which
		 * isn't referenced anywhere else but is live.
		 */
		walkLiveThreads();

		/* Walk any remaining grey objects - shouldn't be necessary
		 * unless GC has been activated explicitly.
		 */
		for (obj = grey.next; obj != &grey; obj = grey.next) {
			walkObject(obj);
		}

		/* Now walk any white objects which will be finalied.  They
		 * may get reattached, so anything they reference must also
		 * be live just in case.
		 */
		for (obj = white.next; obj != &white; obj = obj->next) {
			if (obj->final == GC_NEEDFINALIZE) {  
				gcStats.markedobj += 1;
				(*obj->funcs->walk)(obj);
			}
		}

		finishGC();

		UNLOCK();
#else
		_waitCond(&gcman.mux, &gcman.cv, 0);

		LOCK();

		startGC();
		for (obj = grey.next; obj != &grey; obj = grey.next) {
			walkObject(obj);
		}
		finishGC();

		UNLOCK();

#endif

		if (flag_gc) {
			fprintf(stderr, "<GC: total %dK, alloc %dK, marked %dK, freeing %dK>\n", gcStats.totalmem/1024, gcStats.allocmem/1024, gcStats.markedmem/1024, (gcStats.totalmem - gcStats.markedmem)/1024);
		}
		gcStats.allocobj = 0;
		gcStats.allocmem = 0;
	}
}

/*
 * Start the GC process by scanning the root and thread stack objects.
 */
static
void
startGC(void)
{
	gcInfo* obj;

	gcStats.freedmem = 0;
	gcStats.freedobj = 0;
	gcStats.markedobj = 0;
	gcStats.markedmem = 0;

	/* Walk the root objects */
	for (obj = root.next; obj != &root; obj = obj->next) {
		obj->colour = GC_GREY;
		walkObject(obj);
	}

	/* Walk the thread objects */
	walkLiveThreads();
}

/*
 * Finish off the GC process.  Any unreached (white) objects are moved
 * for finalising and the finaliser woken.
 * The reached (black) objects are moved onto the now empty white list
 * and recoloured white.
 */
static
void
finishGC(void)
{
	gcInfo* obj;

	/* There shouldn't be any grey objects at this point */
	assert(grey.next == &grey);

	/* Any white objects should now be finalised */
	if (white.next != &white) {
		do {
			obj = white.next;
			assert(GETREF(obj->ref) == (uintp)obj);
			REMOVELIST(obj);
			APPENDLIST(finalise, obj);
		} while (white.next != &white);

		_lockMutex(&finalman.mux);
		_signalCond(&finalman.cv);
		_unlockMutex(&finalman.mux);
	}

	/* Now move the black objects back to the white queue for next time.
	 */
	while (black.next != &black) {
		obj = black.next;
		assert(obj->colour == GC_BLACK);
		obj->colour = GC_WHITE;
		REMOVELIST(obj);
		APPENDLIST(white, obj);
	}
}

/*
 * The finaliser sits in a loop waiting to finalise objects.  When a
 * new finalised list is available, it is woken by the GC and finalises
 * the objects in turn.  An object is only finalised once after which
 * it is deleted.
 */
void
finaliserMan(void)
{
	gcInfo* obj;

	/* All threads start with interrupts disabled */
	intsRestore();

	_lockMutex(&finalman.mux);

	for (;;) {
		_waitCond(&finalman.mux, &finalman.cv, 0);
		while (finalise.next != &finalise) {
			LOCK();
			obj = finalise.next;
			REMOVELIST(obj);
			if (obj->final == GC_NEEDFINALIZE) {
				/* Objects are only finalised once */
				obj->final = GC_FINALIZED;
				obj->colour = GC_WHITE;
				/* Re-attach to the white list - it may
				 * still be live after finalizing.
				 */
				APPENDLIST(white, obj);
				UNLOCK();
				/* Call finaliser - it we return true then
				 * the object can be junked immediately.
				 */
				if ((*obj->funcs->final)(obj) == true) {
					LOCK();
					REMOVELIST(obj);
					goto gcfree;
				}
			}
			else {
				gcfree:;
				UNLOCK();
FDBG(				printf("freeObject %x ref %d size %d\n", obj,
					obj->ref, obj->size);
					fflush(stdout);			)
				SETREF(obj->ref, refTable.free);
				refTable.free = obj->ref;
				obj->ref = 0;
				gcStats.totalmem -= obj->size;
				gcStats.totalobj -= 1;
				gcStats.freedmem += obj->size;
				gcStats.freedobj += 1;
				GCHEAP_FREE(obj);
			}
		}
FTDBG(		printf("Freed %d objects of %dK\n", gcStats.freedobj, gcStats.freedmem/1024);	)
	}
}

/*
 * Explicity invoke the garbage collector.
 */
void
invokeGC(void)
{
	_lockMutex(&gcman.mux);
	_signalCond(&gcman.cv);
	_unlockMutex(&gcman.mux);
}

/*
 * Allocate a new object.  The object is attached to the white queue.
 * After allocation, if incremental collection is active we peform
 * a little garbage collection.  If we finish it, we wakeup the garbage
 * collector.
 */
void*
gc_malloc(size_t size, gcFuncs* funcs)
{
	gcInfo* obj;
	void* mem;
	int i;

	LOCK();

	obj = GCHEAP_MALLOC(size + sizeof(gcInfo));
	if (obj == 0) {
		throwOutOfMemory();  
	}
ADBG(	printf("gc_malloc: 0x%x (%d)\n", obj, size);			)
	obj->size = size;

	gcStats.totalmem += size;
	gcStats.totalobj += 1;
	gcStats.allocmem += size;
	gcStats.allocobj += 1;

	obj->funcs = funcs;
	/* Determine whether we need to finalise or not */
	if (funcs->final == 0) {
		obj->final = GC_NORMAL;
	}
	else if (funcs->final == (void*)1) {
		obj->final = GC_ROOT;
	}
	else {
		obj->final = GC_NEEDFINALIZE;
	}
	mem = GC2MEM(obj);

	/* Allocate reference table as necessary */
	if (refTable.free == 0) {
		assert(refTable.nextWidth < REF_MAXH);
		refTable.width[refTable.nextWidth] = checked_calloc(REF_MAXW, sizeof(uintp));
		for (i = 0; i < REF_MAXW - 1; i++) {
			refTable.width[refTable.nextWidth][i] = MAKEREF(refTable.nextWidth, i+1);
		}
		refTable.width[refTable.nextWidth][i] = MAKEREF(0,0);
		refTable.free = MAKEREF(refTable.nextWidth, 0);
		refTable.nextWidth++;
	}
	/* Attach to reference table */
	obj->ref = refTable.free;
	refTable.free = GETREF(refTable.free);
	SETREF(obj->ref, obj);

	/* Insert new object into white list */
	if (obj->final == GC_ROOT) {
		obj->colour = GC_BLACK;
		APPENDLIST(root, obj);
	}
	else {
#if defined(GC_INCREMENTAL)
		obj->colour = GC_GREY;
		APPENDLIST(grey, obj);
#else
		obj->colour = GC_WHITE;
		APPENDLIST(white, obj);
#endif
	}

#if defined(GC_INCREMENTAL)
	/* Perform a little GC as we go */
	if (grey.next != &grey) {
		gcAmount += (gcStats.totalmem * size) / ALLOCCOUNTGC;
		while (gcAmount > 0) {
			gcAmount -= grey.next->size;
			walkObject(grey.next);
			if (grey.next == &grey) {
				UNLOCK();
				invokeGC();
				goto out;
			}
		}
		UNLOCK();
		out:;
	}
	else {
		UNLOCK();
	}
#else
	UNLOCK();
	allocCount += size;
	if (allocCount >= ALLOCCOUNTGC && gc_mode == GC_ENABLED) {
		allocCount = 0;
		invokeGC();
	}
#endif
	return (mem);
}
