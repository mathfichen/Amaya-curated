#include "awt.h"


/*************************************************************************
 * internal helper functions
 */

/*
  GC caching is done by means of a simple, initially empty  array of GCs
  which holds all previously allocated GC which are not currently used.
  Each time a new GC is requested, this cache is searched first. If it
  contains an already cached GC, this one is returned and the corresponding
  array  element is zeroed. If no one could be found, a new GC has to be
  allocated.
*/


/*
 * return an unused cached GC, 0 if no one is left (to indicate that
 * a new one should be allocated)
 */
GC getCachedGC ( HNativeLib lib ) {
  int i;
  GC *cache = DISPLAY_DATA(lib)->GcCache;
  GC gc;

  if ( DISPLAY_DATA(lib)->Ngc ) {
    for ( i=0; i<NGC; i++ ) {
      if ( cache[i] != 0 ){
	gc = cache[i];
	cache[i] = 0;
	DISPLAY_DATA(lib)->Ngc --;
	return gc;
      }
    }
  }

  return 0;
}


/*
 * recycle a GC which is not needed any more. If there is
 * no place to cache it, return 0 to indicate that it should be freed
 */
int putCachedGC ( HNativeLib lib, GC gc ) {
  GC *cache = DISPLAY_DATA(lib)->GcCache;
  int i;

  if ( DISPLAY_DATA(lib)->Ngc < NGC ) {
    for ( i=0; i<NGC; i++ ) {
      if ( !cache[i] ) {
	cache[i] = gc;
	DISPLAY_DATA(lib)->Ngc ++;
	return 1;
      }
    }
  }

  return 0;
}




/*************************************************************************
 * public functions
 */

void LIBFUNC( initGraphics) ( HNativeLib lib, HGraphics graphics ) {
  Display*       dsp     = XDISPLAY(lib);
  GC             gc      = XGC(graphics);
  Drawable       drw     = DRAWABLE_OF_GRAPHICS(graphics);
  HPeer          peer    = (HPeer) unhand(graphics)->Wnd;
  HComponent     target  = NULL;
  HFont          font    = NULL;

  HRectangle     jrect   = unhand(graphics)->ClipRect;
  HFont          curFont = unhand(graphics)->CurrentFont;

  XRectangle     xrect;
  XGCValues      values;
  unsigned long  mask = 0;

  LOCK;

  if ( peer != NULL ) {              /* GC used for drawing in a window */
    target  = unhand(peer)->Target;
    font    = unhand(target)->font;

    if ( unhand(target)->foreground ) {
      /* biss.awt.kernel.Graphics can't do it (just knows about ComponentPeers) */
      unhand(graphics)->CurrentColor = unhand(target)->foreground;
      values.foreground = getPixelValue( lib, unhand(target)->foreground);
      mask |= GCForeground;
    }

    if ( unhand(target)->background ) {
      values.background = getPixelValue( lib, unhand(target)->background);
      mask |= GCBackground;
    }

    values.graphics_exposures = False;
    mask |= GCGraphicsExposures;  
  }
  else {                            /* GC used for drawing in an Image */
    values.foreground = BlackPixel( dsp, DEFSCREEN(lib));
    mask |= GCForeground;

    values.background = WhitePixel( dsp, DEFSCREEN(lib));
    mask |= GCBackground;
  }

  values.function = GXcopy;
  mask |= GCFunction;

  values.plane_mask = 0xffffffff;
  mask |= GCPlaneMask;

  if ( !gc ) {
    gc = getCachedGC( lib);
    XGC(graphics) = gc;
  }

  if ( !gc ) {
    DBG( DBG_GRA, "initGraphics [(%x,%x) ", dsp, drw);
    gc = XCreateGC( dsp, drw, mask, &values);
    DBG1( DBG_GRA, "=> %x]\n", gc);

    if ( !gc ) {
      signalError( "create Graphics failed");
      UNLOCK_VOID_RETURN;
    }

    XGC(graphics) = gc;

    if ( jrect != NULL ) {
      INIT_XRECT( xrect, jrect);
      XSetClipRectangles( dsp, gc, 0, 0, &xrect, 1, Unsorted);
    }
  }
  else {
    DBG( DBG_GRA, "initGraphics [%x (%x,%x)]\n", gc, dsp, drw);

    if ( jrect == NULL ) {
      values.clip_mask = None;
      mask |= GCClipMask;
    }
    else {
      INIT_XRECT( xrect, jrect);
      XSetClipRectangles( dsp, gc, 0, 0, &xrect, 1, Unsorted);
    }

    XChangeGC(dsp, gc, mask, &values );
  }

  if ( font ) {
    LIBFUNC(setFont)( lib, graphics, font);
    unhand(graphics)->CurrentFont = font;
  }

  UNLOCK;
}


void LIBFUNC( initPaintGraphics ) ( HNativeLib lib, HGraphics graphics ) {
  LIBFUNC(initGraphics)( lib, graphics);
}


void LIBFUNC( releasePaintGraphics ) ( HNativeLib lib, HGraphics graphics ) {

}


void LIBFUNC( releaseGraphics ) ( HNativeLib lib, HGraphics graphics ) {
  Display     *dsp     = XDISPLAY(lib);
  GC          gc       = XGC(graphics);
  Window      wnd      = XWINDOW_OF_GRAPHICS(graphics);

  DBG( DBG_GRA, "releaseGraphics [%x (%x,%x)]\n", gc,dsp,wnd);
  if ( !gc ) return;

  LOCK;
  if ( !putCachedGC( lib, gc) ) {
    XFreeGC( dsp, gc);
  }

  XGC(graphics) = 0;
  UNLOCK;
}


void LIBFUNC( setColor ) ( HNativeLib lib, HGraphics graphics, HColor jclr ) {
  Display     *dsp     = XDISPLAY(lib);
  GC          gc       = XGC(graphics);
  Window      wnd      = XWINDOW_OF_GRAPHICS(graphics);
  unsigned long clr;

  if ( !jclr ) return;
  clr  = unhand(jclr)->pData;

  DBG( DBG_GRA, "setColor [%x (%x,%x) %x]\n", gc,dsp,wnd, unhand(jclr)->value);
  if ( !gc ) return;

  LOCK;
  if ( !clr)
    clr = getPixelValue( lib, jclr);

  if ( unhand(graphics)->XorColor != 0 ) {
    clr ^= getPixelValue( lib, unhand(graphics)->XorColor);
  }

  XSetForeground( dsp, gc, clr);
  UNLOCK;
}

void LIBFUNC( setFont ) ( HNativeLib lib, HGraphics graphics, HFont font ) {
  Display     *dsp     = XDISPLAY(lib);
  GC          gc       = XGC(graphics);
  Window      wnd      = XWINDOW_OF_GRAPHICS(graphics);
  Font        fid;

  if ( !font ) return;
  fid  = (Font) unhand(font)->pData;

  DBG( DBG_GRA, "setFont [%x (%x,%x) %x]\n", gc, dsp,wnd, fid);
  if ( !gc ) return;
    
  LOCK;
  if ( !fid ) {
    fid = loadFont( lib, font);
    unhand(font)->pData = fid;
  }

  XSetFont( dsp, gc, fid);
  UNLOCK;
}

void LIBFUNC( setPaintMode ) ( HNativeLib lib, HGraphics graphics ) {
  Display  *dsp = XDISPLAY(lib);
  GC       gc   = XGC(graphics);
  Window   wnd  = XWINDOW_OF_GRAPHICS(graphics);
  unsigned long clr;

  DBG( DBG_GRA, "setPaintMode [%x (%x,%x)]\n", gc, dsp,wnd);
  if ( !gc ) return;

  LOCK;

  if ( unhand(graphics)->XorColor != 0 ) {
    if ( unhand(graphics)->CurrentColor != 0 )
      clr  = getPixelValue( lib, unhand(graphics)->CurrentColor);
    else
      clr = BlackPixel( dsp, ROOT(lib));

    XSetForeground( dsp, gc, clr);
  }

  XSetFunction( dsp, gc, GXcopy);
  UNLOCK;
}

void LIBFUNC( setXORMode ) ( HNativeLib lib, HGraphics graphics ){
  Display  *dsp = XDISPLAY(lib);
  GC       gc   = XGC(graphics);
  Window   wnd  = XWINDOW_OF_GRAPHICS(graphics);
  unsigned long clr1, clr2;

  if ( !unhand(graphics)->XorColor ) return;

  DBG( DBG_GRA, "setXORMode [%x (%x,%x) %x]\n",
       gc, dsp, wnd, unhand(unhand(graphics)->XorColor)->value);
  if ( !gc ) return;

  clr1 = getPixelValue( lib, unhand(graphics)->XorColor);
  clr2 = getPixelValue( lib, unhand(graphics)->CurrentColor);

  LOCK;
    XSetForeground( dsp, gc, clr1 ^ clr2);
  XSetFunction( dsp, gc, GXxor);
  UNLOCK;
}

void LIBFUNC( clearRect ) ( HNativeLib lib, HGraphics graphics,
			    jint x, jint y, jint width, jint height ) {
  Display  *dsp = XDISPLAY(lib);
  GC       gc   = XGC(graphics);
  Window   wnd  = XWINDOW_OF_GRAPHICS(graphics);

  DBG( DBG_GRA, "clearRect [%x (%x,%x) %d,%d,%d,%d]\n",
       gc,dsp,wnd,x,y,width,height);
  if ( !gc || !wnd ) return;

  TRANSLATE( x, y);

  LOCK;
  XClearArea( dsp, wnd, x, y, width, height, True);
  UNLOCK;
}

void LIBFUNC( clipGraphics ) ( HNativeLib lib, HGraphics graphics ) {
  Display     *dsp = XDISPLAY(lib);
  GC          gc   = XGC(graphics);
  Window      wnd  = XWINDOW_OF_GRAPHICS(graphics);

  XRectangle  xrect;
  HRectangle  jrect = unhand(graphics)->ClipRect;

  LOCK;
  if ( jrect ) {
	INIT_XRECT(xrect,jrect);

    DBG( DBG_GRA, "clipGraphics [%x (%x,%x) %d,%d,%d,%d]\n",
	    gc,dsp,wnd, unhand(jrect)->x, unhand(jrect)->y,
	    unhand(jrect)->width, unhand(jrect)->height);
    if ( !gc ) UNLOCK_VOID_RETURN;

    XSetClipRectangles( dsp, gc, 0, 0, &xrect, 1, Unsorted);
  }
  else {
    DBG( DBG_GRA, "clipGraphics [%x (%x,%x) -]\n", gc,dsp,wnd);
    if ( !gc ) UNLOCK_VOID_RETURN;

    XSetClipMask( dsp, gc, None);
  }

  UNLOCK;
}

void LIBFUNC( copyArea ) ( HNativeLib lib, HGraphics graphics,
			   jint x, jint y, jint width, jint height,
			   jint dx, jint dy ) {
  Display   *dsp = XDISPLAY(lib);
  GC        gc   = XGC(graphics);
  Drawable  drw  = DRAWABLE_OF_GRAPHICS(graphics);

  DBG( DBG_GRA, "copyArea [%x (%x,%x)  %d,%d,%d,%d, %d,%d]\n",
			      gc,dsp,drw,x,y,width,height, dx, dy);

  if ( !gc ) return;

  TRANSLATE( x, y);

  LOCK;
  /* pitfall: Javas dx, dy are deltas, X assumes dest_x, dest_y */
  XCopyArea( dsp, drw, drw, gc, x, y, width, height, x+dx, y+dy);
  UNLOCK;
}

void LIBFUNC( draw3DRect ) ( HNativeLib lib, HGraphics graphics,
			     jint x, jint y, jint width, jint height, jint isRaised,
			     jint borderWidth, HColor jclrBright, HColor jclrDark ) {
  Display  *dsp = XDISPLAY(lib);
  GC       gc   = XGC(graphics);
  Drawable drw  = DRAWABLE_OF_GRAPHICS(graphics);

  unsigned long clr1, clr2;
  int      x1, y1, x2, y2;
  int      x1d, y1d, x2d, y2d, x3d, y3d;
  int	   i;

  TRANSLATE( x, y);
  x1 = x; y1 = y; x2 = x+width; y2 = y+height;

  DBG( DBG_GRA, "draw3DRect [%x (%x,%x) %d,%d,%d,%d, %d,%d, %x,%x\n",
			      gc,dsp,drw, x,y,width,height, isRaised, borderWidth,
			      unhand(jclrBright)->value, unhand(jclrDark)->value);
  if ( !gc ) return;

  LOCK;

  if ( isRaised ) {
    clr1 = getPixelValue( lib, jclrBright);
    clr2 = getPixelValue( lib, jclrDark);
  }
  else {
    clr2 = getPixelValue( lib, jclrBright);
    clr1 = getPixelValue( lib, jclrDark);
  }

  /* upper left edge */
  XSetForeground( dsp, gc, clr1);

  x1d = x1;   	  y1d = y1;
  x2d = x1d;   	  y2d = y2 - 1;
  x3d = x2 - 1;   y3d = y2d;

  for ( i=0; i<borderWidth; i++ ) {
    XDrawLine( dsp, drw, gc, x1d, y1d, x1d, y3d);
    XDrawLine( dsp, drw, gc, x1d, y1d, x3d, y1d);

    x1d++;  y1d++;
    x2d++;  y2d--;
    x3d--;  y3d--;
  }

  /*  lower right edge */
  XSetForeground( dsp, gc, clr2);

  x1d = x1;   	  y1d = y1;
  x2d = x2 -1;    y2d = y1d;
  x3d = x2d;   	  y3d = y2 -1;

  for ( i=0; i<borderWidth; i++ ) {
    XDrawLine( dsp, drw, gc, x1d, y3d, x2d, y3d);
    XDrawLine( dsp, drw, gc, x2d, y1d, x2d, y3d);

    x1d++;  y1d++;
    x2d--;  y2d++;
    x3d--;  y3d--;
  }
  UNLOCK;
}

void LIBFUNC( drawImage ) ( HNativeLib lib, HGraphics graphics, HImage image,
			    jint x, jint y, jint width, jint height, HColor bgColor ) {
  Display      *dsp = XDISPLAY(lib);
  DisplayData  *dd  = DISPLAY_DATA(lib);
  GC           gc   = XGC(graphics);
  Drawable     drw  = DRAWABLE_OF_GRAPHICS(graphics);
  Pixmap       pix  = PIXMAP(image);
  int          w    = unhand(image)->Width;
  int          h    = unhand(image)->Height;

  static HImage lastImage;
  static jint   lastWidth, lastHeight, lastRgb;

  DBG( DBG_GRA, "drawImage [%x (%x,%x) %x, %d,%d]\n",
       gc,dsp,drw, pix, x, y);
  if ( !gc  ) return;

  TRANSLATE( x, y);

  LOCK;
  if ( pix ) {
    XCopyArea( dsp, pix, drw, gc, 0, 0, w, h, x, y);
  }
  else {
	if ( !bgColor && unhand(graphics)->Wnd ) {
	  bgColor = unhand((HPeer)(unhand(graphics)->Wnd))->Background;
	}

    if ( lastImage != image || lastWidth != width || lastHeight != height ||
		 (bgColor && lastRgb != unhand(bgColor)->value) ) {
      lastImage = image;
      lastWidth = width; lastHeight = height;
      lastRgb = (bgColor) ? unhand(bgColor)->value : 0;

      setXImage( lib, image, width, height, bgColor);
    }
    if ( dd->Img )
      XPutImage( dsp, drw, gc, dd->Img, 0, 0, x, y, dd->Img->width, dd->Img->height);
  }
  UNLOCK;
}


void LIBFUNC( drawLine ) ( HNativeLib lib, HGraphics graphics,
			   jint x1, jint y1, jint x2, jint y2 ) {
  Display  *dsp = XDISPLAY(lib);
  GC       gc   = XGC(graphics);
  Drawable drw  = DRAWABLE_OF_GRAPHICS(graphics);

  DBG( DBG_GRA, "drawLine [%x (%x,%x)  %d,%d,%d,%d]\n",
       gc,dsp,drw,x1,y1,x2,y2);
  if ( !gc ) return;

  TRANSLATE( x1, y1);
  TRANSLATE( x2, y2);

  LOCK;
  XDrawLine( dsp, drw, gc, x1, y1, x2, y2);
  UNLOCK;
}

void LIBFUNC( drawString ) ( HNativeLib lib,
			     HGraphics graphics,
			     HString jstr, jint x, jint y ){
  Display  *dsp = XDISPLAY(lib);
  GC       gc   = XGC(graphics);
  Drawable drw  = DRAWABLE_OF_GRAPHICS(graphics);
  char     buf[256];

  DBG( DBG_GRA, "drawString [%x (%x,%x) %x %d,%d]\n", gc,dsp,drw, jstr, x, y);
  if ( !gc ) return;

  if ( !jstr ) return;
  javaString2CString( jstr, buf, sizeof(buf));

  TRANSLATE( x, y);

  LOCK;
  XDrawString( dsp, drw, gc, x, y, buf, javaStringLength(jstr));

  UNLOCK;
}

void LIBFUNC( drawChars ) ( HNativeLib lib, HGraphics graphics,
			    HArrayOfChar *array, jint offset, jint length,
			    jint x, jint y ) {
  Display  *dsp = XDISPLAY(lib);
  GC       gc   = XGC(graphics);
  Drawable drw  = DRAWABLE_OF_GRAPHICS(graphics);
  char     buf[256];
  char     *lbuf = NULL;
  jchar    *jc = unhand(array)->body + offset;
  char     *c, *p;
  int      i;

  DBG( DBG_GRA, "drawChars [%x (%x,%x) %x %d,%d]\n", gc,dsp,drw, array, x, y);
  if ( !gc ) return;

  LOCK;

  p = (length > sizeof(buf)) ? lbuf = malloc(length) : buf;
  for ( c=p, i=0; i<length; i++, c++, jc++ )
    *c = (char) *jc;

  TRANSLATE( x, y);

  XDrawString( dsp, drw, gc, x, y, p, i);

  if ( lbuf )
    free( lbuf);

  UNLOCK;
}

void LIBFUNC( drawArc ) ( HNativeLib lib,
			  HGraphics graphics,
			  jint x, jint y, jint width, jint height,
			  jint startAngle, jint arcAngle ) {
  Display  *dsp = XDISPLAY(lib);
  GC       gc   = XGC(graphics);
  Drawable drw  = DRAWABLE_OF_GRAPHICS(graphics);

  DBG( DBG_GRA, "drawArc [%x (%x,%x)  %d,%d,%d,%d %d,%d]\n",
       gc, dsp, drw, x, y, width, height, startAngle, arcAngle);
  if ( !gc ) return;

  TRANSLATE( x, y);

  LOCK;
  XDrawArc( dsp, drw, gc, x, y, width, height, startAngle*64, arcAngle*64);
  UNLOCK;
}

void LIBFUNC( fillArc ) ( HNativeLib lib,
			  HGraphics graphics,
			  jint x, jint y, jint width, jint height,
			  jint startAngle, jint arcAngle ){
  Display  *dsp = XDISPLAY(lib);
  GC       gc   = XGC(graphics);
  Drawable drw  = DRAWABLE_OF_GRAPHICS(graphics);

  DBG( DBG_GRA, "fillArc [%x (%x,%x)  %d,%d,%d,%d %d,%d]\n",
       gc, dsp, drw, x, y, width, height, startAngle, arcAngle);
  if ( !gc ) return;

  TRANSLATE( x, y);

  LOCK;
  XFillArc( dsp, drw, gc, x, y, width, height, startAngle*64, arcAngle*64);
  UNLOCK;
}

void LIBFUNC( drawRect ) ( HNativeLib lib,
			   HGraphics graphics,
			   jint x, jint y, jint width, jint height ){
  Display  *dsp = XDISPLAY(lib);
  GC       gc   = XGC(graphics);
  Drawable drw  = DRAWABLE_OF_GRAPHICS(graphics);

  DBG( DBG_GRA, "drawRect [%x (%x,%x)  %d,%d,%d,%d]\n",
       gc,dsp,drw,x,y,width,height);
  if ( !gc ) return;

  TRANSLATE( x, y);

  LOCK;
  XDrawRectangle( dsp, drw, gc, x, y, width, height);
  UNLOCK;
}

void LIBFUNC( fillRect ) ( HNativeLib lib,
			   HGraphics graphics,
			   jint x, jint y, jint width, jint height ){
  Display  *dsp = XDISPLAY(lib);
  GC       gc   = XGC(graphics);
  Drawable drw  = DRAWABLE_OF_GRAPHICS(graphics);

  DBG( DBG_GRA, "fillRect [%x (%x,%x)  %d,%d,%d,%d]\n",
       gc,dsp,drw,x,y,width,height);
  if ( !gc ) return;

  TRANSLATE( x, y);

  LOCK;
  XFillRectangle( dsp, drw, gc, x, y, width, height);
  UNLOCK;
}

void LIBFUNC( drawOval ) ( HNativeLib lib,
			   HGraphics graphics,
			   jint x, jint y, jint width, jint height) {
  Display  *dsp = XDISPLAY(lib);
  GC       gc   = XGC(graphics);
  Drawable drw  = DRAWABLE_OF_GRAPHICS(graphics);

  DBG( DBG_GRA, "drawOval [%x (%x,%x)  %d,%d,%d,%d]\n",
       gc,dsp,drw,x,y,width,height);
  if ( !gc ) return;

  TRANSLATE( x, y);

  LOCK;
  XDrawArc( dsp, drw, gc, x, y, width, height, 0, 23040);  /* 360*64 */
  UNLOCK;
}

void LIBFUNC( fillOval ) ( HNativeLib lib,
			   HGraphics graphics,
			   jint x, jint y, jint width, jint height ){
  Display  *dsp = XDISPLAY(lib);
  GC       gc   = XGC(graphics);
  Drawable drw  = DRAWABLE_OF_GRAPHICS(graphics);

  DBG( DBG_GRA, "fillOval [%x (%x,%x)  %d,%d,%d,%d]\n",
       gc,dsp,drw,x,y,width,height);
  if ( !gc ) return;

  TRANSLATE( x, y);

  LOCK;
  XFillArc( dsp, drw, gc, x, y, width, height, 0, 23040);  /* 360*64 */
  UNLOCK;
}

void LIBFUNC( drawPolygon ) ( HNativeLib lib,
			      HGraphics graphics,
			      HArrayOfInt* x, HArrayOfInt* y, jint nPoints ) {
  Display  *dsp = XDISPLAY(lib);
  GC       gc   = XGC(graphics);
  Drawable drw  = DRAWABLE_OF_GRAPHICS(graphics);

  XPoint   buf[50];
  XPoint   *points, *p;
  int      i;

  DBG( DBG_GRA, "drawPolygon [%x (%x,%x)  %x,%x, %d]\n",
       gc,dsp,drw,x,y,nPoints);
  if ( !gc ) return;
  if ( !x || !y ) return;

  LOCK;
  points = (nPoints <= (sizeof(buf)/sizeof(buf[0]))) ?
		          buf :  (XPoint*)malloc( nPoints * sizeof(XPoint));

  for ( i=0, p=points; i<nPoints; i++, p++ ) {
    p->x = unhand(x)->body[i] + XORG(graphics);
    p->y = unhand(y)->body[i] + YORG(graphics);
  }

  XDrawLines( dsp, drw, gc, points, nPoints, CoordModeOrigin);

  if ( points != buf )
    free( points);

  UNLOCK;
}

void LIBFUNC( fillPolygon ) ( HNativeLib lib,
			      HGraphics graphics,
			      HArrayOfInt* x, HArrayOfInt* y, jint nPoints ){
  Display  *dsp = XDISPLAY(lib);
  GC       gc   = XGC(graphics);
  Drawable drw  = DRAWABLE_OF_GRAPHICS(graphics);

  XPoint   buf[50];
  XPoint   *points, *p;
  int      i;

  DBG( DBG_GRA, "fillPolygon [%x (%x,%x)  %x,%x, %d]\n",
       gc,dsp,drw,x,y,nPoints);
  if ( !gc ) return;
  if ( !x || !y ) return;

  LOCK;
  points = (nPoints <= (sizeof(buf)/sizeof(buf[0]))) ?
		          buf :  (XPoint*)malloc( nPoints * sizeof(XPoint));

  for ( i=0, p=points; i<nPoints; i++, p++ ) {
    p->x = unhand(x)->body[i] + XORG(graphics);
    p->y = unhand(y)->body[i] + YORG(graphics);
  }

  XFillPolygon( dsp, drw, gc, points, nPoints, Nonconvex, CoordModeOrigin);

  if ( points != buf )
    free( points);

  UNLOCK;
}

void LIBFUNC( drawRoundRect ) ( HNativeLib lib,
			        HGraphics graphics,
			        jint x, jint y, jint width, jint height,
			        jint arcWidth, jint arcHeight ){
  Display  *dsp = XDISPLAY(lib);
  GC       gc   = XGC(graphics);
  Drawable drw  = DRAWABLE_OF_GRAPHICS(graphics);

  int aw2 = arcWidth  / 2;
  int ah2 = arcHeight / 2;
  int w = width - arcWidth;
  int h = height - arcHeight;
  int x0, y0, x1, y1;


  DBG( DBG_GRA, "drawRoundRect [%x (%x,%x)  %d,%d,%d,%d, %d,%d]\n",
       gc,dsp,drw,x,y,width,height, arcWidth,arcHeight);
  if ( !gc ) return;

  TRANSLATE( x, y);

  LOCK;
  /*
   * The Xmu routine: 
   *  XmuDrawRoundedRectangle( dsp,drw,gc,x,y,width,height,arcWidth,arcHeight);
   * seems not to  work reliably on XFree 3.1.2 (G). Lets do it the hard way
   * and backup to pure Xlib
   */

  if ( w ) {
    x0 = x + aw2;
    x1 = x0 + w;
    y1 = y + height;
    XDrawLine( dsp, drw, gc, x0,  y, x1, y);
    XDrawLine( dsp, drw, gc, x0, y1, x1, y1);
  }

  if ( h ) {
    y0 = y + ah2;
    y1 = y0 + h;
    x1 = x + width;
    XDrawLine( dsp, drw, gc,  x, y0,  x, y1);
    XDrawLine( dsp, drw, gc, x1, y0, x1, y1);
  }

  x1 = x + w;
  y1 = y + h;
  XDrawArc( dsp, drw, gc,  x,  y, arcWidth, arcHeight,  90*64, 90*64);
  XDrawArc( dsp, drw, gc,  x, y1, arcWidth, arcHeight, 180*64, 90*64);
  XDrawArc( dsp, drw, gc, x1,  y, arcWidth, arcHeight,      0, 90*64);
  XDrawArc( dsp, drw, gc, x1, y1, arcWidth, arcHeight, 270*64, 90*64);

  UNLOCK;
}

void LIBFUNC( fillRoundRect ) ( HNativeLib lib,
			        HGraphics graphics,
			        jint x, jint y, jint width, jint height,
			        jint arcWidth, jint arcHeight){
  Display  *dsp = XDISPLAY(lib);
  GC       gc   = XGC(graphics);
  Drawable drw  = DRAWABLE_OF_GRAPHICS(graphics);

  int aw2 = arcWidth  / 2;
  int ah2 = arcHeight / 2;
  int w = width - arcWidth;
  int h = height - arcHeight;
  int x0, y0, x1, y1;


  DBG( DBG_GRA, "fillRoundRect [%x (%x,%x)  %d,%d,%d,%d, %d,%d]\n",
       gc,dsp,drw,x,y,width,height, arcWidth,arcHeight);
  if ( !gc ) return;

  TRANSLATE( x, y);

  LOCK;
  /*
   * The Xmu routine: 
   *  XmuFillRoundedRectangle( dsp,drw,gc,x,y,width,height,arcWidth,arcHeight);
   * seems not to  work reliably on XFree 3.1.2 (G). Lets do it the hard way
   * and backup to pure Xlib
   */
  if ( w ) {
    x0 = x + aw2;
    XFillRectangle( dsp, drw, gc,  x0, y, w, height);
  }

  if ( h ) {
    y0 = y + ah2;
    XFillRectangle( dsp, drw, gc,  x, y0, aw2, h);
  }

  x1 = x + w;
  y1 = y + h;
  XFillArc( dsp, drw, gc,  x,  y, arcWidth, arcHeight,  90*64, 90*64);
  XFillArc( dsp, drw, gc,  x, y1, arcWidth, arcHeight, 180*64, 90*64);
  XFillArc( dsp, drw, gc, x1,  y, arcWidth, arcHeight,      0, 90*64);
  XFillArc( dsp, drw, gc, x1, y1, arcWidth, arcHeight, 270*64, 90*64);

  UNLOCK;
}
