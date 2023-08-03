
#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include <signal.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <fcntl.h>
#include <unistd.h>

#include <native.h>

#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/Xatom.h>
#include <X11/cursorfont.h>
#include <X11/keysym.h>
#include <X11/X.h>
#include <X11/Xmu/Drawing.h>

/************************************************************************/


/* #include <java_lang_String.h> */
#include <java_awt_Component.h>
#include <java_awt_peer_ComponentPeer.h>
#include <java_awt_Font.h>
#include <java_awt_FontMetrics.h>
#include <java_awt_Color.h>
#include <java_awt_Graphics.h>
#include <java_awt_Rectangle.h>
#include <java_awt_Event.h>
#include <java_awt_Frame.h>
#include <java_awt_Toolkit.h>
#include <java_awt_Insets.h>
#include <java_awt_image_ImageObserver.h>
#include <java_awt_image_IndexColorModel.h>

#include <biss_awt_MutableIndexClrModel.h>
#include <biss_awt_kernel_Toolkit.h>
#include <biss_awt_kernel_Peer.h>
#include <biss_awt_kernel_Graphics.h>
#include <biss_awt_kernel_FontMetrics.h>
#include <biss_awt_kernel_Image.h>

/*
 * java.awt.* types which are used from within biss.awt.kernel.NativeLib
 * to avoid mutual X-ref of classes NativeLib, Graphics, Peer.
 * Redefining them to their biss.awt.kernel.* counterparts is not
 * very clean, but since everything using the redefinitions is called
 * just from NativeLib, and the NativeLib methods in turn are just
 * called from biss.awt.kernel.* instances, it is save. It seems to be
 * more important to avoid the type x-ref in the Java classes than to
 * "cheat" the C-compiler (by explicit casts or the #defines below). Be
 * aware of the fact that we can get rid of the x-ref just because of
 * the memory layout of Java objects (combining all fields of a multi
 * class type as members in the mdc struct)
 */
#define Hjava_awt_Graphics              Hbiss_awt_kernel_Graphics
#define Hjava_awt_peer_ComponentPeer    Hbiss_awt_kernel_Peer
#define Hjava_awt_FontMetrics           Hbiss_awt_kernel_FontMetrics
#define Hjava_awt_Image                 Hbiss_awt_kernel_Image

#include <biss_awt_kernel_NativeLib.h>

/************************************************************************/

typedef struct Hjava_lang_Object *              HObject;
typedef struct Hjava_lang_String *              HString;

typedef struct Hjava_awt_Color *                HColor;
typedef struct Hjava_awt_Rectangle *            HRectangle;
typedef struct Hjava_awt_Font *                 HFont;
typedef struct Hjava_awt_FontMetrics *          HawtFontMetrics;
typedef struct Hjava_awt_Component *            HComponent;
typedef struct Hjava_awt_Event *                HEvent;
typedef struct Hjava_awt_peer_ComponentPeer *   HComponentPeer;
typedef struct Hjava_awt_Graphics *             HawtGraphics;
typedef struct Hjava_awt_Toolkit *              HawtToolkit;
typedef struct Hjava_awt_Frame *                HFrame;
typedef struct Hjava_awt_image_IndexColorModel * HIndexColorModel;

typedef struct Hbiss_awt_kernel_NativeLib *     HNativeLib;
typedef struct Hbiss_awt_kernel_Toolkit *       HToolkit;
typedef struct Hbiss_awt_kernel_Peer *          HPeer;
typedef struct Hbiss_awt_kernel_Graphics *      HGraphics;
typedef struct Hbiss_awt_kernel_FontMetrics *   HFontMetrics;
typedef struct Hbiss_awt_kernel_Image *         HImage;
typedef struct Hbiss_awt_MutableIndexClrModel*  HMutableIndexClrModel;


/************************************************************************/

typedef struct _Awt2RGB {
  int Direct;
  int RedShift;
  int GreenShift;
  int BlueShift;
  int RedMask;
  int GreenMask;
  int BlueMask;
} Awt2RGB;

typedef struct _Awt2Pseudo {
  int               NClrs;
  XColor            *Clrs;
  unsigned long     *RgbSum;
  unsigned char     *Idx;
} Awt2Pseudo;

#define NGC 20
#define NCURSORS 14
#define NFONTS 5

typedef struct _DisplayData {
  Display       *Dsp;
  int           DefScreen;

  jint          (*rgbOfPixel)(HNativeLib,unsigned long);
  unsigned long (*pixelOfRgb)(HNativeLib,unsigned long);
  Awt2RGB       Rgb;
  Awt2Pseudo    Pseudo;

  char*         FontSpecs[NFONTS];
  Cursor        Cursors[NCURSORS];
  int           ClickCount;
  Time          LastClick;
  GC            GcCache[NGC];
  char          *ImgBuf;
  long          ImgBufSize;
  XImage        *Img;
  int           ImgBytesPerPix;
  int           Ngc;
  short         Nwnd;
  short         Nwnd2;

  Window        PopUp;
} DisplayData;



/************************************************************************
 * kaffe scheduler stuff (borrowed from kaffevm/thread.h
 */

void reschedule(void);
extern int blockInts;
extern int needReschedule;

#define intsDisable()   blockInts++
#define intsRestore()   if (blockInts == 1 && needReschedule == 1 ) { \
                                reschedule();                         \
                        }                                             \
                        blockInts--

#define LOCK    intsDisable()
#define UNLOCK  intsRestore()

#define UNLOCK_VOID_RETURN      { UNLOCK; return; }
#define UNLOCK_RETURN(val)      { UNLOCK; return val; }


#define EE() NULL


/************************************************************************
 * debugging stuff
 */

#ifdef DEBUG
#define DBG(level,fmt,a...) \
  { if ( Debug & level ) fprintf( stderr, "%2d "fmt, level, ##a); }
#define DBG1(level,fmt,a...) \
  { if ( Debug & level ) fprintf( stderr, fmt, ##a); }
#else
#define DBG(level,fmt,a...)
#define DBG1(level,fmt,a...)
#endif

#define DBG_DSP     1
#define DBG_WND     2
#define DBG_GRA     4
#define DBG_EVT     8
#define DBG_IMG    32


/************************************************************************
 * commonly used defines and field access macros
 */

#define LIBFUNC(name) biss_awt_kernel_NativeLib_##name

#define EMPTY    (void*) 0
#define RECYCLED (void*) 1

#define TYPE_WINDOW 1
#define TYPE_FRAME  2
#define TYPE_PANEL  4
#define TYPE_MODAL  8
#define TYPE_POPUP 16

#define DISPLAY_DATA(lib) \
  ((DisplayData*) ((long)unhand(lib)->PData))

#define XDISPLAY(lib) \
  DISPLAY_DATA(lib)->Dsp

#define DEFSCREEN(lib) \
  DISPLAY_DATA(lib)->DefScreen

#define PEERS(lib) \
  ((HPeer*) unhand(unhand(lib)->PeerTable)->body)

#define ROOT(lib) \
  RootWindow( DISPLAY_DATA(lib)->Dsp, DISPLAY_DATA(lib)->DefScreen)

#define XWINDOW(peer) \
  ((Window)((long)unhand(peer)->PData))

#define XWINDOW_OF_GRAPHICS(graphics) \
  unhand(graphics)->Wnd ? \
    (Window)((long)unhand( (HPeer)unhand(graphics)->Wnd)->PData) : 0

#define DRAWABLE_OF_GRAPHICS(graphics) \
  (Drawable) (unhand(graphics)->Wnd ? \
    (long)unhand( (HPeer)unhand(graphics)->Wnd)->PData : \
      unhand(graphics)->Img ? \
        unhand( (HImage)unhand(graphics)->Img)->PDataPix : 0)

#define XGC(graphics) \
  ((GC) (long)unhand(graphics)->PData)

#define XORG(graphics) \
  unhand(graphics)->XOrigin

#define YORG(graphics) \
  unhand(graphics)->YOrigin

#define PIXMAP(image) \
  ((Pixmap) (long)unhand(image)->PDataPix)

#define XIMAGE(image) \
  ((XImage*) (long)unhand(image)->PDataImg)

#define XFONTSTRUCT(metrics) \
  ((XFontStruct*) (long)unhand(metrics)->PData)

#define EVENT(lib) \
  unhand(unhand(lib)->NextEvent)


/*** misc utility macros ************************************************/

#define TRANSLATE(x,y) \
  x += XORG(graphics); y += YORG(graphics)

#define ABS_DELTA(a,b) \
  ((a > b) ? a - b : b - a)

#define INIT_XRECT(xrect,jrect)          \
  xrect.x = unhand(jrect)->x;            \
  xrect.y = unhand(jrect)->y;            \
  xrect.width = unhand(jrect)->width;    \
  xrect.height = unhand(jrect)->height


/*
 * The following macro is copied from javaString2CString
 * It is included just for the sake of efficiency because the func
 * would be called for EVERY single char drawing (e.g. when moving the cursor)
 */
#define INIT_C_STRING(js,cs,len)                                               \
{                                                                              \
    int l = len;                                                               \
    if (l > 0) {                                                               \
        char*  c = cs;                                                         \
        jchar* chrs = ((jchar*) (unhand(js)->value))+1 + unhand(js)->offset;   \
		if ( --l > unhand(js)->count )                                         \
            l = unhand(js)->count;                                             \
		while ( --l >= 0 )                                                     \
		    *c++ = (char)*chrs++;                                              \
		*c = 0;                                                                \
	}                                                                          \
}


/************************************************************************
 * global data decls and function prototypes
 */

extern int Debug;

extern Atom WM_PROTOCOLS;
extern Atom WM_DELETE_WINDOW;
extern Atom WM_TAKE_FOCUS;


void signalError ( char* fmt,  ... );
void initColorModel ( HNativeLib );
void initFontSpecs ( HNativeLib );
unsigned long getPixelValue ( HNativeLib, HColor );
int registerPeer ( HNativeLib, HPeer );
Cursor loadCursor ( HNativeLib, jint );
Font loadFont ( HNativeLib, HFont );
GC getCachedGC ( HNativeLib );
int putCachedGC ( HNativeLib, GC);
void initImage ( HNativeLib);
void setXImage( HNativeLib,HImage,int,int,HColor);














