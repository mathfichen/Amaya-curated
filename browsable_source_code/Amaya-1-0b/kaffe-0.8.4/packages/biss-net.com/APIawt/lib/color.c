/*
  color.c - color conversion stuff
*/

#include "awt.h"


#ifdef DEBUG
/*
 * show the characteristics of the currently used visual. For
 * debugging purposes only
 */
void dumpVisual ( Visual *vis ) {
  if ( Debug & 2 ) {
    fprintf( stderr, "visual.id:          %d\n", vis->visualid);
    fprintf( stderr, "      .class:       %d\n", vis->class);
    fprintf( stderr, "      .red_mask     %x\n", vis->red_mask);
    fprintf( stderr, "      .green_mask   %x\n", vis->green_mask);
    fprintf( stderr, "      .blue_mask    %x\n", vis->blue_mask);
    fprintf( stderr, "      .bits_per_rgb %x\n", vis->bits_per_rgb);
    fprintf( stderr, "      .map_entries  %d\n", vis->map_entries);
  }
}
#endif

unsigned long addPseudoColor ( DisplayData* dd, XColor* xclr ) {
  int i = xclr->pixel;
  int j, k, k1;
  unsigned long sum;

  dd->Pseudo.NClrs++;
  dd->Pseudo.Clrs[i].pixel = i;
  dd->Pseudo.Clrs[i].red = xclr->red;
  dd->Pseudo.Clrs[i].green = xclr->green;
  dd->Pseudo.Clrs[i].blue = xclr->blue;

  sum = xclr->red + xclr->green + xclr->blue;

  for ( j=0; j<dd->Pseudo.NClrs; j++ ) {
    if ( dd->Pseudo.RgbSum[j] > sum ) {
      for ( k=i, k1=k+1; k>=j; k1=k, k-- ){
	dd->Pseudo.RgbSum[k1] = dd->Pseudo.RgbSum[k];
	dd->Pseudo.Idx[k1] = dd->Pseudo.Idx[k];
      }
      break;
    }
  }
  dd->Pseudo.RgbSum[j] = sum;
  dd->Pseudo.Idx[j] = i;

  return sum;
}


jint directRgbOfPixel ( HNativeLib lib, unsigned long pixel ) {
  return pixel | 0xff000000;
}

jint trueRgbOfPixel ( HNativeLib lib, unsigned long pixel ) {
  Display        *dsp = XDISPLAY(lib);
  DisplayData    *dd  = DISPLAY_DATA(lib);
  Visual         *vis = DefaultVisual( dsp, DEFSCREEN(lib));

  return (((pixel & vis->red_mask)   << dd->Rgb.RedShift  ) +
          ((pixel & vis->green_mask) << dd->Rgb.GreenShift) +
          ((pixel & vis->blue_mask)  << dd->Rgb.BlueShift)) | 0xff000000;
}

jint pseudoRgbOfPixel ( HNativeLib lib, unsigned long pixel ) {
  Display        *dsp = XDISPLAY(lib);
  DisplayData    *dd  = DISPLAY_DATA(lib);

  if ( pixel < dd->Pseudo.NClrs ){
    return ((dd->Pseudo.Clrs[pixel].red   << 8) +
            (dd->Pseudo.Clrs[pixel].green     ) +
            (dd->Pseudo.Clrs[pixel].blue  >> 8)) | 0xff000000;
  }
  return 0xff000000;
}


unsigned long directPixelOfRgb ( HNativeLib lib, unsigned long jrgb ) {
  return (jrgb & 0xffffff);
}

unsigned long truePixelOfRgb ( HNativeLib lib, unsigned long jrgb ) {
  Display        *dsp = XDISPLAY(lib);
  DisplayData    *dd = DISPLAY_DATA(lib);

  if ( jrgb == 0xff000000 )  return BlackPixel( dsp, dd->DefScreen);
  else if ( jrgb == 0xffffffff ) return WhitePixel( dsp, dd->DefScreen);

  return ((jrgb & dd->Rgb.BlueMask)  >> dd->Rgb.BlueShift)  +
         ((jrgb & dd->Rgb.GreenMask) >> dd->Rgb.GreenShift) +
         ((jrgb & dd->Rgb.RedMask)   >> dd->Rgb.RedShift);
}


#define DIST        20000
#define ALLOC_DIST  20000

unsigned long pseudoPixelOfRgb ( HNativeLib lib, unsigned long jrgb ) {
  Display        *dsp = XDISPLAY(lib);
  DisplayData    *dd = DISPLAY_DATA(lib);
  Visual         *vis = DefaultVisual( dsp, DEFSCREEN(lib));
  XColor         xcolor;
  register       i;
  int            j, k, d, i0, i1;
  unsigned long  dist, minDist, sum, sum1, sum2;
  Colormap       cmap;

  if ( jrgb == 0xff000000 )  return BlackPixel( dsp, dd->DefScreen);
  else if ( jrgb == 0xffffffff ) return WhitePixel( dsp, dd->DefScreen);

  xcolor.red   = (jrgb & 0xff0000) >> 8;
  xcolor.green = (jrgb & 0x00ff00);
  xcolor.blue  = (jrgb & 0x0000ff) << 8;
  sum = xcolor.red + xcolor.green + xcolor.blue;
  sum2 = sum + DIST;

  if ( sum > DIST ) {
    sum1 = sum - DIST;
    for( i0 = 0, i1 = dd->Pseudo.NClrs; (d = i1 - i0) > 1; ){
      i = i0 + (d >> 1);
      if ( dd->Pseudo.RgbSum[i] < sum1 )
	i0 = i;
      else if ( dd->Pseudo.RgbSum[i] == sum1 )
	break;
      else
	i1 = i;
    }
    for ( j=i-1; (j >= 0) && (dd->Pseudo.RgbSum[j] == dd->Pseudo.RgbSum[i]); i=j, j--);
  }
  else {
    sum1 = 0;
    i = 0;
  }

  for ( minDist=0xffffffff; i<dd->Pseudo.NClrs; i++ ){
    if ( dd->Pseudo.RgbSum[i] > sum2 ) break;

    j = dd->Pseudo.Idx[i];

    dist = ABS_DELTA( xcolor.red, dd->Pseudo.Clrs[j].red) +
	       ABS_DELTA( xcolor.green, dd->Pseudo.Clrs[j].green) +
           ABS_DELTA( xcolor.blue, dd->Pseudo.Clrs[j].blue);

    if ( dist == 0 ){
      minDist = 0;
      xcolor.pixel = j;
      break;
    }
    else if ( dist < minDist ){
      minDist = dist;
      xcolor.pixel = j;
    }
  }

  if ( (minDist > ALLOC_DIST) && (dd->Pseudo.NClrs < vis->map_entries) ) {
    cmap = DefaultColormap( dsp, dd->DefScreen);
    LOCK;
    if ( XAllocColor( dsp, cmap, &xcolor ) ) {
      addPseudoColor( dd, &xcolor);
    }
    UNLOCK;
  }

  return xcolor.pixel;
}

/*
 * initialize all data which is used to convert java color objects to 
 * pixel values. This is done on the basis of the active visual
 */
void initColorModel ( HNativeLib lib ) {
  Display      *dsp = XDISPLAY(lib);
  Visual       *vis = DefaultVisual( dsp, DEFSCREEN(lib));
  Colormap     cmap;
  DisplayData  *dd  = DISPLAY_DATA(lib);
  unsigned long n;
  int          i, j, k, k1;
  XColor       xclr;
  unsigned long sum;
  int          blackSeen;


#ifdef DEBUG
  dumpVisual( vis);
#endif

  unhand(lib)->VisualClass = vis->class;

  if ( vis->class == TrueColor || vis->class == DirectColor ) {
    if ( vis->blue_mask  == 0x0000ff &&
	 vis->green_mask == 0x00ff00 &&
	 vis->red_mask   == 0xff0000 ) {
      dd->Rgb.Direct = 1;
      dd->pixelOfRgb = &directPixelOfRgb;
      dd->rgbOfPixel = &directRgbOfPixel;
      return;
    }
    else {
      /* the Rgb.xxMask and Rgb.xxShift members are used to compute X rgbs from jrgbs */
      for ( i=8, n=1; i>=0 && (vis->blue_mask & n); n*=2, i-- );
      dd->Rgb.BlueMask = (0xff >> i) << i;
      dd->Rgb.BlueShift = i;

      for ( i=0, n=1; i<16 && !(vis->green_mask & n); n*=2, i++ );
      dd->Rgb.GreenShift = 8 - i;
      for ( i=8; i>=0 && (vis->green_mask & n); n*=2, i-- );
      dd->Rgb.GreenMask = (0xff >> i) << (8 +i);
      dd->Rgb.GreenShift += i;

      for ( i=0, n=1; i<16 && !(vis->red_mask & n); n*=2, i++ );
      dd->Rgb.RedShift = 16 - i;
      for ( i=8; i>=0 && (vis->red_mask & n); n*=2, i-- );
      dd->Rgb.RedMask = (0xff >> i) << (16+i);
      dd->Rgb.RedShift += i;

      dd->pixelOfRgb = &truePixelOfRgb;
      dd->rgbOfPixel = &trueRgbOfPixel;
    }
  }
  else {
    cmap = DefaultColormap( dsp, dd->DefScreen);

    dd->Pseudo.Clrs   = (XColor*) malloc( vis->map_entries * sizeof( XColor));
    dd->Pseudo.RgbSum = (unsigned long*) malloc( vis->map_entries * sizeof(long));
    dd->Pseudo.Idx    = (unsigned char*) malloc( vis->map_entries * sizeof(char));

    blackSeen = 0;
    dd->Pseudo.NClrs = 0;
    for ( i=0; i<vis->map_entries; i++ ) {
      dd->Pseudo.Clrs[i].pixel = i;
      XQueryColor( dsp, cmap, &dd->Pseudo.Clrs[i]);
      if ( !(dd->Pseudo.Clrs[i].red | dd->Pseudo.Clrs[i].green
                                    | dd->Pseudo.Clrs[i].blue) ){
	if ( blackSeen )
	  break;
        else
	  blackSeen = 1;
      }
      addPseudoColor( dd, &dd->Pseudo.Clrs[i]);
    }

    dd->pixelOfRgb = &pseudoPixelOfRgb;
    dd->rgbOfPixel = &pseudoRgbOfPixel;

    /*
    for ( i=0; i<dd->Pseudo.NClrs; i++ )
      printf( "%3d:  %d  %d\n", i, dd->Pseudo.RgbSum[i], dd->Pseudo.Idx[i]);
    */
  }
}


/********************** exported functions *******************************/

/*
 * return the pixel value for a given java color object. First check
 * if the color object already has been converted (nonzero "pData" field).
 * If not, compute the pixel value by means of the color conversion
 * info stored in the DisplayData structure of the lib.
 */
unsigned long getPixelValue ( HNativeLib lib, HColor jcolor ) {
  Display        *dsp = XDISPLAY(lib);
  unsigned long  jrgb = unhand(jcolor)->value;
  DisplayData    *dd = DISPLAY_DATA(lib);
  unsigned long  pixel;

  if ( unhand(jcolor)->pData != 0 )
    return unhand(jcolor)->pData;
  else if ( jrgb == 0xff000000 )            /* black shortcut */
    return BlackPixel( dsp, dd->DefScreen);

  pixel = dd->pixelOfRgb( lib, jrgb);
  unhand(jcolor)->pData = pixel;

  return pixel;
}


/*
 * Set/Cache the pixel value of standard Java color objects (which are
 * identified by their rgb values but ?should? be treated as named colors). 
 * This routine should be called on all standard Java colors to make
 * sure we don't get surprises when standard colors are used for the first
 * time *after* a lot of non-standard Color objects have been created (and
 * have eaten up all available colorcells of a PseudoColor visual)
 */
void LIBFUNC( initStdColor ) ( HNativeLib lib, HColor jcolor ) {
  Display        *dsp = XDISPLAY(lib);
  unsigned long  jrgb = unhand(jcolor)->value;
  Colormap       xmap = DefaultColormap( dsp, DEFSCREEN(lib));
  char           *clrName;
  XColor         xcolor, xcolor1;

  DBG( DBG_GRA, "initStdColor [%x, %x =>", dsp, jrgb);

  /*
   * I guess using named colors for the standard Java Colo objects would be
   * the right way to ensure max color portability.
   * However, the standard JDK implementation uses the rgb values instead
   * of the color names (-> rgb.txt default color database) and the
   * results are pretty different. To be JDK compatible, we do the same
   * thing here
   **********
  switch ( jrgb ) { 
  case 0xffffffff: clrName = "white";     break;
  case 0xffc0c0c0: clrName = "LightGray"; break;
  case 0xff808080: clrName = "gray";      break;
  case 0xff404040: clrName = "DarkGray";  break;
  case 0xff000000: clrName = "black";     break;
  case 0xffff0000: clrName = "red";       break;
  case 0xffffafaf: clrName = "pink";      break;
  case 0xffffc800: clrName = "orange";    break;
  case 0xffffff00: clrName = "yellow";    break;
  case 0xff00ff00: clrName = "green";     break;
  case 0xffff00ff: clrName = "magenta";   break;
  case 0xff00ffff: clrName = "cyan";      break;
  case 0xff0000ff: clrName = "blue";      break;
  default:       return;
  }
  if ( XAllocNamedColor( dsp, xmap, clrName, &xcolor1, &xcolor) )
    unhand(jcolor)->pData = xcolor.pixel;
  ***********/

  getPixelValue( lib, jcolor);

  DBG1( DBG_GRA, " %d]\n", unhand(jcolor)->pData);
}















