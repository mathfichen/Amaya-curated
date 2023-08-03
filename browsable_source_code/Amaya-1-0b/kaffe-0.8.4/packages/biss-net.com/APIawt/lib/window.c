#include "awt.h"

/****************************************************************************
 * internal functions
 */

void setWMHints ( HNativeLib lib, HPeer peer,
				  int x, int y, int width, int height ) {
  Display    *dsp  = XDISPLAY(lib);
  Window     wnd   = XWINDOW(peer);
  HFrame     frame = (HFrame) unhand(peer)->Target;
  HString    jtitle = unhand(frame)->title;
  char       title[256];
  Atom       protocols[2];

  XSizeHints  sizehints;
  XWMHints    wmhints;

  LOCK;

  javaString2CString( jtitle, title, sizeof(title));
  XStoreName( dsp, wnd, title);

  wmhints.flags		= InputHint | StateHint;
  wmhints.input		= True;
  wmhints.initial_state	= NormalState;
  XSetWMHints (dsp, wnd, &wmhints);

  sizehints.flags = PPosition;
  sizehints.x = x;
  sizehints.y = y;
  sizehints.flags |= PSize;
  sizehints.width = width;
  sizehints.height = height;

  if ( !unhand(frame)->resizable ) {
    sizehints.min_width = sizehints.max_width = width;
    sizehints.min_height = sizehints.max_height = height;
    sizehints.flags |= PMinSize;
    sizehints.flags |= PMaxSize;
  }

  sizehints.win_gravity = SouthEastGravity;
  sizehints.flags |= PWinGravity;

  XSetWMNormalHints( dsp, wnd, &sizehints);

  protocols[0] = WM_DELETE_WINDOW;
  XSetWMProtocols( dsp, wnd, protocols, 1);

  UNLOCK;
}


/****************************************************************************
 * exported functions
 */

void LIBFUNC( createWindow ) ( HNativeLib lib, HPeer peer ){
  Display         *dsp   = XDISPLAY(lib);
  DisplayData     *dd    = DISPLAY_DATA(lib);
  HPeer           parent = unhand(peer)->Parent;
  HComponent      target = unhand(peer)->Target;
  HColor          background = unhand(peer)->Background;
  Window          wnd, parentWnd;
  int             x, y, width, height;
  unsigned long   attrMask = 0;
  XSetWindowAttributes attrs;

  LOCK;

  parentWnd = (parent == NULL) ? ROOT(lib) : XWINDOW(parent);
  x = unhand(target)->x;
  y = unhand(target)->y;
  width = (unhand(target)->width == 0) ? 1 : unhand(target)->width;
  height = (unhand(target)->height == 0) ? 1 : unhand(target)->height;

  DBG( DBG_WND, "createWindow [(%x) %x  %d,%d,%d,%d",
                        dsp, parentWnd, x, y, width, height);

  attrs.event_mask = ExposureMask | KeyPressMask | KeyReleaseMask |
                     PointerMotionMask | PointerMotionHintMask |
                     ButtonPressMask | ButtonReleaseMask | ButtonMotionMask |
	                 EnterWindowMask | LeaveWindowMask |
                     FocusChangeMask | StructureNotifyMask;
  attrMask |= CWEventMask;

  attrs.background_pixel = getPixelValue( lib, background);
  attrMask |= CWBackPixel;

  attrs.bit_gravity = ForgetGravity;
  attrMask |= CWBitGravity;

  if ( unhand(peer)->Type & TYPE_WINDOW ) {
    attrs.override_redirect = True;
    attrMask |= CWOverrideRedirect;

    attrs.cursor = loadCursor( lib, 12);
    attrMask |= CWCursor;

	if ( !unhand(lib)->UseBackingStore ) {
	  attrs.save_under = True;
	  attrMask |= CWSaveUnder;
	}

    parentWnd = ROOT(lib);
  }
  else {
	if ( unhand(lib)->UseBackingStore ) {
	  attrs.backing_store = WhenMapped;
	  attrMask |= CWBackingStore;
	}

	if ( (unhand(peer)->Type & TYPE_FRAME) && unhand(lib)->ShrinkFrame ) {
	  width  -= unhand(unhand(peer)->Inset)->right;
	  height -= unhand(unhand(peer)->Inset)->bottom;
	  x      -= unhand(unhand(peer)->Inset)->bottom;
	  y      -= unhand(unhand(peer)->Inset)->right / 2;
	}
  }

  wnd = XCreateWindow( dsp, parentWnd, x, y, width, height, 0,
		       CopyFromParent, InputOutput, CopyFromParent,
		       attrMask, &attrs);
  DBG1( DBG_WND, " => %x]\n", wnd);
  if ( !wnd ) {
    signalError( "can't create peer of: %x", target);
    UNLOCK_VOID_RETURN;
  }

  XWINDOW(peer) = wnd;
  registerPeer( lib, peer);

  if ( !(unhand(peer)->Type & (TYPE_WINDOW | TYPE_FRAME)) ){
    XMapWindow( dsp, wnd);
  }
  else if ( unhand(peer)->Type & TYPE_FRAME ) {
    setWMHints( lib, peer, x, y, width, height);
  }

  UNLOCK;
}


void LIBFUNC( destroyWindow ) ( HNativeLib lib, HPeer peer ){
  Display  *dsp = XDISPLAY(lib);
  Window   wnd  = XWINDOW(peer);

  LOCK;
  DBG( DBG_WND, "destroyWindow [%x (%x)]\n", wnd, dsp);
  XDestroyWindow( dsp, wnd);
  UNLOCK;
}

void LIBFUNC( lowerWindow ) ( HNativeLib lib, HPeer peer ){
  Display  *dsp = XDISPLAY(lib);
  Window   wnd  = XWINDOW(peer);

  LOCK;
  DBG( DBG_WND, "lowerWindow [%x (%x)]\n", wnd, dsp);
  XLowerWindow( dsp, wnd);
  UNLOCK;
}

void LIBFUNC( raiseWindow ) ( HNativeLib lib, HPeer peer ){
  Display  *dsp = XDISPLAY(lib);
  Window   wnd  = XWINDOW(peer);

  LOCK;
  DBG( DBG_WND, "raiseWindow [%x (%x)]\n", wnd, dsp);
  XRaiseWindow( dsp, wnd);
  UNLOCK;
}

void LIBFUNC( hideWindow ) ( HNativeLib lib, HPeer peer ){
  Display  *dsp = XDISPLAY(lib);
  Window   wnd  = XWINDOW(peer);

  LOCK;
  DBG( DBG_WND, "hideWindow [%x (%x)]\n", wnd, dsp);
  XUnmapWindow( dsp, wnd);
  UNLOCK;
}

void LIBFUNC( repaintWindow ) ( HNativeLib lib,
			        HPeer peer, jlong timeout,
			        jint x, jint y, jint width, jint height) {
  Display  *dsp = XDISPLAY(lib);
  Window   wnd  = XWINDOW(peer);

  LOCK;
  DBG( DBG_WND, "repaintWindow [%x (%x)  %l, %d,%d,%d,%d]\n",
                          wnd, dsp, timeout, x, y, width, height);

  XClearArea( dsp, wnd, x, y, width, height, True);
  UNLOCK;
}

void LIBFUNC( reshapeWindow ) ( HNativeLib lib, HPeer peer,
			        jint x, jint y, jint width, jint height) {
  Display  *dsp = XDISPLAY(lib);
  Window   wnd  = XWINDOW(peer);

  LOCK;
  DBG( DBG_WND, "reshapeWindow [%x (%x) %d,%d,%d,%d]\n",
       wnd, dsp, x, y, width, height);

  if ( (unhand(peer)->Type & TYPE_FRAME) && unhand(lib)->ShrinkFrame ) {
	width  -= unhand(unhand(peer)->Inset)->right;
	height -= unhand(unhand(peer)->Inset)->bottom;
	x      -= unhand(unhand(peer)->Inset)->bottom;
	y      -= unhand(unhand(peer)->Inset)->right / 2;
  }

  if ( width == 0 )  width = 1;
  if ( height == 0 ) height = 1;

  XMoveResizeWindow( dsp, wnd, x, y, width, height);
  UNLOCK;
}

void LIBFUNC( setFocusWindow ) ( HNativeLib lib, HPeer peer ){
  Display  *dsp = XDISPLAY(lib);
  Window   wnd  = XWINDOW(peer);
  XEvent   msg;

  LOCK;
  DBG( DBG_WND, "setFocusWindow [%x (%x)]\n", wnd, dsp);

  XSetInputFocus( dsp, wnd, RevertToNone, CurrentTime);

  UNLOCK;
}

void LIBFUNC( setWindowBackground ) ( HNativeLib lib, HPeer peer, HColor jclr) {
  Display  *dsp = XDISPLAY(lib);
  Window   wnd  = XWINDOW(peer);
  unsigned long clr = getPixelValue( lib, jclr);

  LOCK;
  DBG( DBG_WND, "setWindowBackground [%x (%x) %x]\n",
       wnd, dsp, unhand(jclr)->value);

  XSetWindowBackground( dsp, wnd, clr);
  XClearArea( dsp, wnd, 0, 0, 0, 0, True);
  UNLOCK;
}

void LIBFUNC( setWindowCursor ) ( HNativeLib lib, HPeer peer, jint jcursor) {
  Display  *dsp = XDISPLAY(lib);
  Window   wnd  = XWINDOW(peer);
  Cursor  cursor = loadCursor( lib, jcursor);

  LOCK;
  DBG( DBG_WND, "setWindowCursor [%x (%x) %d]\n", wnd, dsp, jcursor);
  XDefineCursor( dsp, wnd, cursor);
  UNLOCK;
}

void LIBFUNC( setWindowTitle ) ( HNativeLib lib, HPeer peer, HString jstr) {
  Display  *dsp = XDISPLAY(lib);
  Window   wnd  = XWINDOW(peer);
  char     title[256];

  LOCK;
  DBG( DBG_WND, "setWindowTitle [%x (%x)]\n", wnd, dsp);

  javaString2CString( jstr, title, sizeof(title));
  XStoreName( dsp, wnd, title);
  UNLOCK;
}

void LIBFUNC( showWindow ) ( HNativeLib lib,  HPeer peer ) {
  Display  *dsp = XDISPLAY(lib);
  Window   wnd  = XWINDOW(peer);
  DisplayData      *dd = DISPLAY_DATA(lib);

  LOCK;
  DBG( DBG_WND, "showWindow [%x (%x)]\n", wnd, dsp);
  XMapWindow( dsp, wnd);

  /*
   * This is a helper for transients like MenuWindows and ChoiceWindows.
   * Without some help from the native lib, they would be just ordinary
   * toplevels: This is a bit confusing if multiple different apps are used
   * simultaneously (popups stay open etc.). Java doesn't have any matching
   * construct to implement this, so its just a hint by the biss.awt.kernel.Toolkit
   */
  if ( unhand(peer)->Type & TYPE_POPUP ) {
    Cursor curs = XCreateFontCursor( dsp, XC_arrow);

    /* alternating bewteen popups (e.g. menus) should be allowed (undef event order) */
    if ( dd->PopUp )
      XUngrabPointer( dsp, CurrentTime);

    dd->PopUp = wnd;
    XGrabPointer( dsp, wnd, True, ButtonPressMask, GrabModeAsync, GrabModeAsync,
		  None, curs, CurrentTime);
  }

  UNLOCK;
}

HColor LIBFUNC( getTargetForeground ) ( HNativeLib lib, HComponent target ) {
    return unhand(target)->foreground;
}

HColor LIBFUNC( getTargetBackground ) ( HNativeLib lib, HComponent target ) {
    return unhand(target)->background;
}

HFont LIBFUNC( getTargetFont ) ( HNativeLib lib, HComponent target ) {
  return  unhand(target)->font;
}







