#include "awt.h"

#ifdef DEBUG
#include "eventNames.h"
#endif

/*************************************************************************
 * global data
 */

int Debug;

Atom WM_PROTOCOLS;
Atom WM_DELETE_WINDOW;
Atom WM_TAKE_FOCUS;

int DoubleClickTime = 250;  /* ms between consecutive pointer clicks */

unsigned long PtrModifier[] = { 
  0,  /* Button0                 */
  0,  /* Button1 -> no modifier  */
  8,  /* Button2 -> Java alt     */
  4   /* Button3 -> Java meta    */
};


#define NJMODS 64
unsigned long JavaModifier[NJMODS];

/*
 *  JavaModifier maps an XKeyEvent.state value to a Java modifier value.
 *  Only the least 6 bits must be used as index (i.e. the X "Mod5" is
 *  sacrificed in favor of space, but this only matters if Mod5
 *  should be mapped to the Java "meta" modifier - which is rather unusual).
 *  Mapping scheme:
 *                                         altGr   : PC
 *         shift       -    ctrl     alt    meta   : Java
 *         Shift    Lock    Ctrl    Mod1    Mod3   : X
 *  Java       1      (1)      2       8       4
 *  X          1       2       4       8      32 
 */

static int J2XCursor[NCURSORS] = {
  XC_top_left_arrow,       /* DEFAULT_CURSOR     */
  XC_crosshair,            /* CROSSHAIR_CURSOR   */
  XC_xterm,                /* TEXT_CURSOR        */
  XC_watch,                /* WAIT_CURSOR        */
  XC_bottom_left_corner,   /* SW_RESIZE_CURSOR   */
  XC_bottom_right_corner,  /* SE_RESIZE_CURSOR   */
  XC_top_left_corner,      /* NW_RESIZE_CURSOR   */
  XC_top_right_corner,     /* NE_RESIZE_CURSOR   */
  XC_top_side,             /* N_RESIZE_CURSOR    */
  XC_bottom_side,          /* S_RESIZE_CURSOR    */
  XC_left_side,            /* W_RESIZE_CURSOR    */
  XC_right_side,           /* E_RESIZE_CURSOR    */
  XC_hand2,                /* HAND_CURSOR        */
  XC_fleur                 /* MOVE_CURSOR        */
};


/*************************************************************************
 * internal functions
 */

void signalError ( char* fmt,  ... ) {
  char msg[256];
  va_list ap;

  va_start( ap, fmt);
  vsprintf( msg, fmt, ap);
  va_end( ap);

  printf( "AWTError: %s\n", msg);

  SignalError( EE(), "java/awt/AWTError", msg);
}

void initJavaModifier () {
  int i;

  for ( i=0; i < NJMODS; i++ ) {
    if ( i & 3 ) JavaModifier[i] |= 1;     /* Shift: 1, Lock: 2 -> shift */
    if ( i & 4 ) JavaModifier[i] |= 2;     /* Ctrl -> shift              */
    if ( i & 8 ) JavaModifier[i] |= 12;    /* Mod1 -> alt                */
    /*if ( i & 32) JavaModifier[i] |= 4;*/ /* Mod3 -> meta               */
  }
}

Cursor loadCursor ( HNativeLib lib, jint ctype ) {
  Display      *dsp = XDISPLAY(lib);
  DisplayData  *dd = DISPLAY_DATA(lib);

  ctype = (ctype >= NCURSORS || ctype < 0) ? 0 : ctype;

  if ( ! dd->Cursors[ctype] )
    dd->Cursors[ctype] = XCreateFontCursor( dsp, J2XCursor[ctype]);

  return dd->Cursors[ctype];
}


#define LS 3

int registerPeer ( HNativeLib lib, HPeer peer ) {
  HPeer    *peers = PEERS(lib);
  short    m = DISPLAY_DATA(lib)->Nwnd;
  short    m2 = DISPLAY_DATA(lib)->Nwnd2;
  int      i= ((unsigned long) XWINDOW(peer) << LS) % m;
  int      j=0, d=1;

  do {
    if ( peers[i] == NULL ||
	 (HObject) peers[i] == (HObject) unhand(lib)->RecycledPeer ){
      peers[i] = peer;
      return i;
    }

    i += d;   d += 2;
    if ( i >= m )
      i %= m;
  }
  while ( ++j <= m2 );

  return -1;
}

int lookupPeer ( HNativeLib lib, Window wnd ) {
  HPeer    *peers = PEERS(lib);
  short    m = DISPLAY_DATA(lib)->Nwnd;
  short    m2 = DISPLAY_DATA(lib)->Nwnd2;
  int      i= ((unsigned long) wnd << LS) % m;
  int      j=0, d=1;

  do {
    if ( peers[i] == NULL ){
      return -1;
    }
    if ( (HObject) peers[i] == (HObject) unhand(lib)->RecycledPeer )
      continue;
    if ( XWINDOW(peers[i]) == wnd )
      return i;

    i += d;   d += 2;
    if ( i >= m )
      i %= m;
  }
  while ( ++j <= m2 );
  return -1;
}


/*************************************************************************
 * public functions
 */

void LIBFUNC( setDebugLevel ) ( HNativeLib lib, jint dbgLevel) {
  Debug = dbgLevel;
  DBG( DBG_DSP, "setDebugLevel: %d\n", dbgLevel);
}

int xErrorHandler ( Display *dsp, XErrorEvent *err ) {
  char msg[512];

  /*
   * we are very lax here because BadDrawable errors are not considered as
   * harmful (it seems to costly to check for already disposed Drawables
   * in every graphics output). These errors may be caused by PaneDrawers which
   * already made (async) graphics output when their associated windows get
   * closed.
   */

  if ( Debug ) {
	XGetErrorText( dsp, err->error_code, msg, sizeof(msg));
	fprintf( stderr, "X error: %s\n", msg);
	fprintf( stderr, "  resource id: %X\n", err->resourceid);
	fprintf( stderr, "  serial no. of failed request: %d\n", err->serial);
	fprintf( stderr, "  error code: %d (%X)\n", err->error_code);
	fprintf( stderr, "  opcode of failed request: %d,%d (%X,%X)\n",
			 err->request_code, err->minor_code, err->request_code, err->minor_code);
  }

  /* exit(1); */
  return 0;
}

int xIOErrorHandler ( Display *dsp ) {
  fprintf( stderr, "\n++++ IO Error\n");
  exit(1);
  return 0;
}

void LIBFUNC( initialize ) ( HNativeLib lib ) {
  Display          *dsp;
  char             buf[128];
  char             *dspName;
  HString          jname = unhand(lib)->Name;
  DisplayData      *ddata;
  int              dpi;
  Screen           *scr;

  LOCK;

  
  /*  XSetIOErrorHandler( xIOErrorHandler); */
  XSetErrorHandler( xErrorHandler);
  

  ddata = (DisplayData*) calloc( 1, sizeof(DisplayData));
  DISPLAY_DATA(lib) = ddata;

  if ( jname ) {
    javaString2CString( jname, buf, sizeof( buf));
    dspName = buf;
  }
  else {
    if ( ! (dspName = getenv( "DISPLAY")) )
      dspName = ":0.0";
  }

  dsp = XOpenDisplay( dspName);
  if ( dsp == NULL ){
    signalError( "can't open display: %s", dspName);
    UNLOCK_VOID_RETURN;
  }
  ddata->Dsp = dsp;
  DBG( DBG_DSP, "initialize [%s %x]\n", dspName, dsp);

#ifdef DEBUG
  if ( Debug ) {
    DBG( DBG_DSP, "synchronizing\n");
    XSynchronize( dsp, True);
  }
#endif

  ddata->DefScreen = DefaultScreen( dsp);
  unhand(lib)->Width  = DisplayWidth( dsp, DefaultScreen(dsp));
  unhand(lib)->Height = DisplayHeight( dsp, DefaultScreen(dsp));

  scr = ScreenOfDisplay( dsp, DefaultScreen(dsp));
  dpi = ((WidthOfScreen( scr) * 254) + 5) / (WidthMMOfScreen( scr) *10);
  unhand(lib)->Resolution = dpi;

  unhand(lib)->HasKernelThreads = 0;

  if ( unhand(lib)->UseBackingStore )
	unhand(lib)->UseBackingStore = DoesBackingStore( scr);

  ddata->Nwnd  = obj_length( unhand(lib)->PeerTable);
  ddata->Nwnd2 = ddata->Nwnd / 2;

  initFontSpecs( lib);
  initColorModel( lib);
  initJavaModifier();
  initImage( lib);

  WM_PROTOCOLS = XInternAtom( dsp, "WM_PROTOCOLS", True);
  WM_DELETE_WINDOW = XInternAtom( dsp, "WM_DELETE_WINDOW", True);

  UNLOCK;
}


jint LIBFUNC( getNextEvent ) ( HNativeLib lib ) {
  Display          *dsp = XDISPLAY(lib);
  HPeer            *peers = PEERS(lib);
  HPeer            peer;
  int              peerIdx;
  DisplayData      *dd = DISPLAY_DATA(lib);
  int              nEvents = unhand(lib)->EventsAvailable;
  XEvent           evt;
  char             buf[20];
  int              i;
  KeySym           keysym;
  XComposeStatus   compose;
  Window           child;

  LOCK;

  while ( 1 ) {
    if ( nEvents == 0 ) {
      if ( !(nEvents = XEventsQueued( dsp, QueuedAfterFlush)) ){
	unhand(lib)->EventsAvailable = 0;
	UNLOCK_RETURN( -1);
      }
    }

    XNextEvent( dsp, &evt);
    unhand(lib)->EventsAvailable = --nEvents;

    if ( (peerIdx = lookupPeer( lib, evt.xany.window)) < 0 ) {
      continue;
    }

    peer = peers[peerIdx];
    if ( unhand(unhand(peer)->Target)->peer == NULL ) {
      /*
       * even if disposed (->XDestroyWindow), a window could still receive
       * XEvents which should not be mapped to Java Events (because the
       * peer field in the target is already zeroed). Standard JDK seems to
       * skip everything except of WINDOW_DESTROY for Frames. We also propagate
       * this for Window instances
       */
      if ( evt.xany.type != DestroyNotify )
	continue;
    }

    EVENT(lib)->x = 0;
    EVENT(lib)->y = 0;
    EVENT(lib)->key = 0;
    EVENT(lib)->modifiers = 0;
    EVENT(lib)->clickCount = 0;
    EVENT(lib)->target = (HObject) unhand(peer)->Target;

    DBG( DBG_EVT, "getNextEvent [%x (%x)  %s (%d), %x]\n",
	evt.xany.window, dsp, event_names[evt.xany.type], evt.xany.type, peer);

    switch ( evt.xany.type ) {

    case MotionNotify:
      /* while ( XCheckMaskEvent( dsp, (PointerMotionMask|ButtonMotionMask), &evt) ); */
      if ( !XQueryPointer( dsp, evt.xmotion.window,
			   &evt.xmotion.root, &evt.xmotion.subwindow,
			   &evt.xmotion.x_root, &evt.xmotion.y_root,
			   &evt.xmotion.x, &evt.xmotion.y, &evt.xmotion.state) )
		break;

      if ( evt.xmotion.state & (Button1Mask|Button2Mask|Button3Mask) ) {
		unhand(lib)->AttentionHint = 1;

		EVENT(lib)->id = 506;  /* MOUSE_DRAG */
		EVENT(lib)->modifiers = PtrModifier[(evt.xmotion.state >> 8) & 0x3]
		                         | JavaModifier[evt.xmotion.state & 0x7];
      }
      else {
		EVENT(lib)->id = 503;  /* MOUSE_MOVE */
        EVENT(lib)->modifiers = JavaModifier[evt.xmotion.state & 0x7];
      }

      EVENT(lib)->when = evt.xmotion.time;
      EVENT(lib)->x    = evt.xmotion.x;
      EVENT(lib)->y    = evt.xmotion.y;
      UNLOCK_RETURN( peerIdx);

    case KeyPress:
    case KeyRelease:
      if ( unhand(peer)->IsDisabled )
		break;

      i = XLookupString( &evt.xkey, buf, sizeof(buf), &keysym, &compose);
      if ( i == 1 ){              /* printable char */
        switch ( buf[0] ) {
		case 3:
		  UNLOCK;
#if defined(sparc) && !defined(__SVR4)
		  signal( getpid(), SIGINT);
#else
		  raise( SIGINT);         /* Ctrl-C ->terminate */
#endif
		  break;
		case 13:
		  EVENT(lib)->key = 10;   /* make sure \r and \n are mapped equally */
		  break;
		default:
		  EVENT(lib)->key = buf[0];
		}
      }
      else if ( i == 0 ) {    /* function key */
		switch ( keysym ) {
		case XK_Home:      EVENT(lib)->key = 1000; break;
		case XK_End:       EVENT(lib)->key = 1001; break;
		case XK_Prior:     EVENT(lib)->key = 1002; break;
		case XK_Next:      EVENT(lib)->key = 1003; break;
		case XK_Up:        EVENT(lib)->key = 1004; break;
		case XK_Down:      EVENT(lib)->key = 1005; break;
		case XK_Left:      EVENT(lib)->key = 1006; break;
		case XK_Right:     EVENT(lib)->key = 1007; break;

		case XK_F1:        EVENT(lib)->key = 1008; break;
		case XK_F2:        EVENT(lib)->key = 1009; break;
		case XK_F3:        EVENT(lib)->key = 1010; break;
		case XK_F4:        EVENT(lib)->key = 1011; break;
		case XK_F5:        EVENT(lib)->key = 1012; break;
		case XK_F6:        EVENT(lib)->key = 1013; break;
		case XK_F7:        EVENT(lib)->key = 1014; break;
		case XK_F8:        EVENT(lib)->key = 1015; break;
		case XK_F9:        EVENT(lib)->key = 1016; break;
		case XK_F10:       EVENT(lib)->key = 1017; break;
		case XK_F11:       EVENT(lib)->key = 1018; break;
		case XK_F12:       EVENT(lib)->key = 1019; break;

		case XK_BackSpace: EVENT(lib)->key = 8;    break;
		case XK_Delete:    EVENT(lib)->key = 127;  break;
		case XK_Tab:       EVENT(lib)->key = 9;    break;
		case XK_Escape:    EVENT(lib)->key = 27;   break;
		case XK_Linefeed:  EVENT(lib)->key = 10;   break;
		case XK_Return:    EVENT(lib)->key = 10;   break;
		case XK_space:     EVENT(lib)->key = 32;   break;
		default: continue;
		}
      }
      else
		break;

      unhand(lib)->AttentionHint = (evt.xkey.type == KeyPress);

      if ( EVENT(lib)->key > 1000 )
		EVENT(lib)->id = (evt.xkey.type == KeyPress) ? 403 : 404;
      else
		EVENT(lib)->id = (evt.xkey.type == KeyPress) ? 401 : 402;

      EVENT(lib)->modifiers = JavaModifier[evt.xkey.state & 0x2F];
      EVENT(lib)->when = evt.xkey.time;
      EVENT(lib)->x    = evt.xkey.x;
      EVENT(lib)->y    = evt.xkey.y;
      UNLOCK_RETURN( peerIdx);

    case Expose:
      if ( evt.xexpose.count > 0 )
	break;

      if ( XPending(dsp) ) {  /* shouldn't be necessary if count works ?? */
		XEvent nextEvt;
		XPeekEvent( dsp, &nextEvt);
		if ( nextEvt.xany.type == Expose && nextEvt.xany.window == evt.xany.window )
		  break;
      }

      unhand(peer)->IsExposed = 1;
      EVENT(lib)->id = 202;                           /* WINDOW_EXPOSED */
      UNLOCK_RETURN( peerIdx);

    case ButtonPress :
      /*
       * check if this was a grabbed event. If it is, and the window under the
       * pointer is not a Java window, set the PopDownHint to indicate that
       * the current Java transient should be closed. We can't do that here
       * because Java keeps track of the 'SingleInstWnd' by itself (and might
       * rely on closing it in a specialized context).
       * Beware of mis-interpreted Java Events (MOUSE_EVENT should be safe)
       */
      if ( evt.xany.window == dd->PopUp ) {
        if ( evt.xbutton.x < 0 || evt.xbutton.y < 0 ||
			 evt.xbutton.x > unhand(unhand(peer)->Target)->width ||
			 evt.xbutton.y > unhand(unhand(peer)->Target)->height ) {
		  XUngrabPointer( dsp, CurrentTime);
		  dd->PopUp = 0;
		  unhand(lib)->PopDownHint = 1;
		  EVENT(lib)->id = 500;  /* MOUSE_EVENT: dummy, should not be handled */
		  UNLOCK_RETURN(peerIdx);
		}
      }

      if ( (evt.xbutton.time - dd->LastClick) < DoubleClickTime )
		dd->ClickCount++;
      else
		dd->ClickCount = 1;

      if ( unhand(peer)->IsDisabled )
		break;

      EVENT(lib)->id   = 501;
      EVENT(lib)->modifiers = PtrModifier[evt.xbutton.button]
                                   | JavaModifier[evt.xbutton.state & 0x7];
      EVENT(lib)->clickCount = dd->ClickCount;
      EVENT(lib)->when = evt.xkey.time;
      EVENT(lib)->x    = evt.xkey.x;
      EVENT(lib)->y    = evt.xkey.y;
      UNLOCK_RETURN( peerIdx);
	  break;

    case ButtonRelease :
	  dd->LastClick = evt.xbutton.time;
	  unhand(lib)->AttentionHint = 0;

      if ( unhand(peer)->IsDisabled )
		break;

      EVENT(lib)->id   = 502;
      EVENT(lib)->modifiers = PtrModifier[evt.xbutton.button]
                                   | JavaModifier[evt.xbutton.state & 0x7];
      EVENT(lib)->clickCount = dd->ClickCount;
      EVENT(lib)->when = evt.xkey.time;
      EVENT(lib)->x    = evt.xkey.x;
      EVENT(lib)->y    = evt.xkey.y;
      UNLOCK_RETURN( peerIdx);
	  break;

    case ConfigureNotify:
      /*
       * we are only interested in Frame resize because this might be the only
       * case of a move/resize without explicit reshape() (which would set
       * the coordinates within Java)
       */
      if ( unhand(peer)->Type & TYPE_FRAME ) {
		/*
		 * check for move events of reparented window -> map to desktop
		 */
        if ( (evt.xconfigure.x == 0) && (evt.xconfigure.y == 0) ) {
		  XTranslateCoordinates( dsp, evt.xconfigure.window, ROOT(lib),
								 evt.xconfigure.x, evt.xconfigure.y,
								 &evt.xconfigure.x, &evt.xconfigure.y, &child);
		}

		/*
		 * correct for exterior deco insets (just to right and bottom)
		 */
		if ( unhand(lib)->ShrinkFrame ) {
		  evt.xconfigure.width  += unhand(unhand(peer)->Inset)->right;
		  evt.xconfigure.height += unhand(unhand(peer)->Inset)->bottom;
		}

		if ( unhand(peer)->IsExposed ) {
		  /*
		   * check if Frame must be layouted again
		   */
		  if ( (unhand(unhand(peer)->Target)->width != evt.xconfigure.width) ||
			   (unhand(unhand(peer)->Target)->height != evt.xconfigure.height) ){
			unhand(unhand(peer)->Target)->valid = 0;
		  }
		}
		unhand(unhand(peer)->Target)->x = evt.xconfigure.x;
		unhand(unhand(peer)->Target)->y = evt.xconfigure.y;
		unhand(unhand(peer)->Target)->width  = evt.xconfigure.width;
		unhand(unhand(peer)->Target)->height = evt.xconfigure.height;

		EVENT(lib)->id = 205;
		EVENT(lib)->x  = evt.xconfigure.x;
		EVENT(lib)->y  = evt.xconfigure.y;
		UNLOCK_RETURN( peerIdx);
      }
      break;

    case FocusIn:
	  if ( (evt.xfocus.detail != NotifyAncestor) &&
		   (evt.xfocus.detail != NotifyInferior) &&
		   (evt.xfocus.detail != NotifyNonlinear) )
		continue;

      EVENT(lib)->id = 1004;
      UNLOCK_RETURN( peerIdx);

    case FocusOut:
	  if ( (evt.xfocus.detail != NotifyAncestor) &&
		   (evt.xfocus.detail != NotifyInferior) &&
		   (evt.xfocus.detail != NotifyNonlinear) )
		continue;

      EVENT(lib)->id = 1005;
      UNLOCK_RETURN( peerIdx);

    case EnterNotify :
    case LeaveNotify :
      EVENT(lib)->id   = (evt.xcrossing.type == EnterNotify) ? 504 : 505;
      EVENT(lib)->modifiers = PtrModifier[(evt.xcrossing.state >> 8) & 0x3]
                                   | JavaModifier[evt.xcrossing.state & 0x7];
      EVENT(lib)->when = evt.xcrossing.time;
      EVENT(lib)->x    = evt.xcrossing.x;
      EVENT(lib)->y    = evt.xcrossing.y;
      UNLOCK_RETURN( peerIdx);

    case ClientMessage :
      if ( evt.xclient.message_type == WM_PROTOCOLS ) {
		if ( evt.xclient.data.l[0] == WM_DELETE_WINDOW ) {
		  EVENT(lib)->id = 201;                         /* WINDOW_DESTROY */
		  UNLOCK_RETURN( peerIdx);
		}
      }
      break;

	case ReparentNotify:
	  /*
	   * this is a workaround for a strange fvwm95 behavior: somtimes the WM 
	   * drags the toplevel which was active BEFORE the current window came up
	   * to front AFTER the current one has been mapped and reparented.
	   * This just happens when a toplevel does not forward the focus to one of its
	   * childs when receiving a FocusIn
	   */
	  XSetInputFocus( dsp, evt.xreparent.window, RevertToParent, CurrentTime);
	  break;


    case DestroyNotify:
      /*
       * we have to keep track of the PopUp by ourselves since Java doesn't now
       * about it (other than the biss.awt.kernel.Toolkit, which just gives a hint
       * by setting the POPUP peer type)
       */
      if ( evt.xany.window == dd->PopUp ) {
		XUngrabPointer( dsp, CurrentTime);
		dd->PopUp = 0;
      }

      unhand(peer)->IsExposed = 0;
      unhand(unhand(peer)->Target)->visible = 0;
      unhand(unhand(peer)->Target)->peer = 0;

      peers[peerIdx] = (HPeer) unhand(lib)->RecycledPeer;
      break;

    }
  }
}


void LIBFUNC( sync ) ( HNativeLib lib ) {
  Display *dsp = XDISPLAY(lib);

  LOCK;
  DBG( DBG_DSP, "sync [%x]\n", dsp);
  XSync( dsp, False);
  UNLOCK;
}





