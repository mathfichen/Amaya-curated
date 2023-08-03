#include "awt.h"

/* ColorModel types, have to be kept in sync with biss.awt.kernel.Image */
#define MT_NONE          0
#define MT_INDEX         1
#define MT_MUTABLE_INDEX 2


void initImage ( HNativeLib lib ) {
  Display      *dsp  = XDISPLAY(lib);
  Visual       *vis  = DefaultVisual( dsp, DEFSCREEN(lib));
  int          depth = DefaultDepth( dsp, DEFSCREEN(lib));
  DisplayData  *dd   = DISPLAY_DATA(lib);

  if ( depth <= 8 )        dd->ImgBytesPerPix = 1;
  else if ( depth <= 16 )  dd->ImgBytesPerPix = 2;
  else                     dd->ImgBytesPerPix = 4;

  dd->ImgBufSize = 2048;
  dd->ImgBuf = (char*) malloc( dd->ImgBufSize);

  dd->Img = XCreateImage( dsp, vis, depth, ZPixmap, 0,
			  dd->ImgBuf, 1, 1,
			  dd->ImgBytesPerPix * 8,
			  dd->ImgBytesPerPix);
}


void writeImgBufFromIdx ( DisplayData *dd,
			  unsigned char* iPix, int nPix,
			  unsigned long* cmap ) {
  register i;

  if ( dd->ImgBytesPerPix == 1 ) {
    unsigned char* d = (unsigned char*) dd->ImgBuf;
    for ( i=0; i<nPix; i++, d++, iPix++ )
      *d = cmap[*iPix];
  }
  else if ( dd->ImgBytesPerPix == 2 ) {
    unsigned short* d = (unsigned short*) dd->ImgBuf;
    for ( i=0; i<nPix; i++, d++, iPix++ )
      *d = cmap[*iPix];
  }
  else {
    unsigned long *d = ( unsigned long*) dd->ImgBuf;
    for ( i=0; i<nPix; i++, d++, iPix++ )
      *d = cmap[*iPix];
  }
}


void writeImgBufFromRgb ( HNativeLib lib, jint* rgbPix, int nPix,
			  jint rgbTransp, jint rgbBack ) {
  DisplayData *dd = DISPLAY_DATA(lib);
  unsigned long backPixel;
  register i;

  if ( rgbTransp != rgbBack )
    backPixel = dd->pixelOfRgb( lib, rgbBack);

  if ( dd->ImgBytesPerPix == 1 ) {
    unsigned char* d = (unsigned char*) dd->ImgBuf;
    for ( i=0; i<nPix; i++, d++, rgbPix++ ){
      if ( (rgbTransp != rgbBack) && (*rgbPix == rgbTransp) )
	*d = backPixel;
      else
	*d = dd->pixelOfRgb( lib, *rgbPix);
    }
  }
  else if ( dd->ImgBytesPerPix == 2 ) {
    unsigned short* d = (unsigned short*) dd->ImgBuf;
    for ( i=0; i<nPix; i++, d++, rgbPix++ ) {
      if ( (rgbTransp != rgbBack) && (*rgbPix == rgbTransp) )
	*d = backPixel;
      else
	*d = dd->pixelOfRgb( lib, *rgbPix);
    }
  }
  else {
    unsigned long *d = ( unsigned long*) dd->ImgBuf;
    for ( i=0; i<nPix; i++, d++, rgbPix++ ) {
      if ( (rgbTransp != rgbBack) && (*rgbPix == rgbTransp) )
	*d = backPixel;
      else
	*d = dd->pixelOfRgb( lib, *rgbPix);
    }
  }
}

void writeScaledImgBuf( HNativeLib lib, void* pixArray, int isIndexClr,	int w, int h,
			jint* rgbMap, int width, int height,
			unsigned long rgbTransp, unsigned long rgbBack ) {
  DisplayData *dd = DISPLAY_DATA(lib);
  float fx = (float) w / (float) width;
  float fy = (float) h / (float) height;
  float fxy = fx * fy;
  float bx, ex, by, ey;
  float fUpper, fLower, fLeft, fRight, remX, remY, weight;
  float red, green, blue, r, g, b;
  int row, col, i, j, bxi, byi, exi, eyi;
  int iSrcLine, srcIdx, iDestLine, idx;
  unsigned long srcRgb, destRgb, pixel, lastRgb;

  idx = 0;

  for ( row=0; row<height; row++ ) {
    by = fy * row;      byi = (int) by;
    ey = fy * (row+1);  eyi = (int) ey;
    if ( ey == eyi ) eyi--;

    if ( height < h ) {
      fLower = (float) (1+byi) - by;
      fUpper = ey - (float)eyi;
    }
    else {
      remY = (float)eyi / fy;
      fLower = remY - row;
      fUpper = (float) (row+1) - remY;
    }

    for ( col=0; col<width; col++ ) {
      red = 0; green = 0; blue = 0;

      bx = fx * col;      bxi = (int) bx;
      ex = fx * (col+1);  exi = (int) ex;
      if ( ex == exi )  exi--;

      if ( width < w ) {
	fLeft  = (bxi+1) - bx;
	fRight = ex - exi; 
      }
      else {
	remX = (float)exi / fx;
	fLeft  = remX - col;
	fRight = (float) (col+1) - remX;
      }

      iSrcLine = (byi -1) * w;

      for ( i=byi; i <= eyi; i++ ) {
	iSrcLine += w;

	for ( j=bxi; j<=exi; j++ ) {
	  if ( isIndexClr ) {
	    srcIdx = ((unsigned char*)pixArray)[iSrcLine + j];
	    srcRgb = rgbMap[srcIdx];
	  }
	  else {
	    srcRgb = ((jint*)pixArray)[iSrcLine + j];
	  }

	  if ( (rgbTransp != rgbBack) && (srcRgb == rgbTransp) )
	    srcRgb = rgbBack;

	  r = (srcRgb & 0xff0000) >> 16;
	  g = (srcRgb & 0x00ff00) >> 8;
	  b = (srcRgb & 0x0000ff);

	  if ( fxy > 1.0 ) {
	    r /= fxy; g /= fxy; b /= fxy;
	  }

	  weight = 1.0;
	  if ( (width < w) || (bxi != exi) ) {
	    if ( j == bxi )	      weight *= fLeft;
	    else if ( j == exi )      weight *= fRight;
	  }
	  if ( (height < h) || (byi != eyi) ) {
	    if ( i == byi )	      weight *= fLower;
	    else if ( i == eyi )      weight *= fUpper;
          }

	  if ( weight != 1.0 ) {
	    r *= weight; g *= weight; b *= weight;
	  }

	  red += r; green += g; blue += b;
	}
      }

      if ( red   > 255 ) red = 255;
      if ( green > 255 ) green = 255;
      if ( blue  > 255 ) blue = 255;

      destRgb = ((int)(red +0.5)<<16) + ((int)(green +0.5)<<8) + ((int)(blue +0.5));

      if ( destRgb != lastRgb ) {
	pixel = dd->pixelOfRgb( lib, destRgb);
	lastRgb = destRgb;
      }

      switch ( dd->ImgBytesPerPix ) {
      case 1:	((unsigned char*)  dd->ImgBuf)[idx++] = pixel;	break;
      case 2:	((unsigned short*) dd->ImgBuf)[idx++] = pixel;	break;
      case 4:	((unsigned long*)  dd->ImgBuf)[idx++] = pixel;	break;
      }
    }
  }
}

void setXImage ( HNativeLib lib, HImage image, int width, int height, HColor backClr ) {
  Display      *dsp = XDISPLAY(lib);
  DisplayData  *dd = DISPLAY_DATA(lib);
  int          w = unhand(image)->Width;
  int          h = unhand(image)->Height;
  int          n = w * h;
  int          nBytes;
  int          modelType = unhand(image)->ModelType;

  unsigned char *iPix;
  jint         iTransp, *rgbPix, *rgbMap;
  int          i, nClr;
  unsigned long cmap[256];
  unsigned long rgbTransp, rgbBack;

  if ( width  && height )
    nBytes = (width*height) * dd->ImgBytesPerPix;
  else
    nBytes = n * dd->ImgBytesPerPix;

  if ( nBytes > dd->ImgBufSize ) {
    free( dd->ImgBuf);
    dd->ImgBufSize = nBytes;
    dd->ImgBuf = malloc( dd->ImgBufSize);
  }

  if ( modelType == MT_MUTABLE_INDEX ) {
	HMutableIndexClrModel mIdxModel = (HMutableIndexClrModel) unhand(image)->Model;
	nClr   = obj_length(unhand(mIdxModel)->Rgb);
	rgbMap = unhand(unhand(mIdxModel)->Rgb)->body;
	iTransp = unhand(mIdxModel)->Transparent;
  }
  else if (modelType == MT_INDEX ) {
	HIndexColorModel idxModel = (HIndexColorModel) unhand(image)->Model;
	nClr   = unhand(idxModel)->map_size;
	rgbMap = unhand(unhand(idxModel)->rgb)->body;
	iTransp = unhand(idxModel)->transparent_index;
  }
  else
	rgbMap = 0;


  if ( rgbMap ) { /* java image stored as indices of index based colormodel */
	iPix   = (unsigned char*) unhand((HArrayOfByte*)(unhand(image)->Pixels))->body;

    if ( (width == 0 && height == 0) || (width == w && height == h) ) {
      for ( i=0; i<nClr; i++, rgbMap++ )
	cmap[i] = dd->pixelOfRgb( lib, *rgbMap);
      if ( backClr && ((i = iTransp) >= 0) )
	cmap[i] = getPixelValue( lib, backClr);

      writeImgBufFromIdx( dd, iPix, n, cmap);
    }
    else {
      if ( backClr && ((i = iTransp) >= 0) ){
        rgbTransp = rgbMap[i] | 0xff000000;
        rgbBack = unhand(backClr)->value;
      }
      else {
        rgbTransp = rgbBack = 0;
      }
      writeScaledImgBuf( lib, iPix, 1, w, h, rgbMap, width, height,
			 rgbTransp, rgbBack);
    }
  }
  else {  /* java image stored as RGBa array of jints */
    rgbPix = (jint*) unhand((HArrayOfInt*)(unhand(image)->Pixels))->body;

    if ( backClr && ((rgbTransp = unhand(image)->Background) >= 0) ){
      rgbBack = unhand(backClr)->value;
    }
    else {
      rgbTransp = rgbBack = 0;
    }

    if ( (width == 0 && height == 0) || (width == w && height == h) )
      writeImgBufFromRgb( lib, rgbPix, n, rgbTransp, rgbBack);
    else
      writeScaledImgBuf( lib, rgbPix, 0, w, h, rgbMap, width, height,
			 rgbTransp, rgbBack);
  }

  dd->Img->data   = dd->ImgBuf;

  if ( width && height ) {
    dd->Img->width  = width;
    dd->Img->height = height;
    dd->Img->bytes_per_line = dd->ImgBytesPerPix * width;
  }
  else {
    dd->Img->width  = w;
    dd->Img->height = h;
    dd->Img->bytes_per_line = dd->ImgBytesPerPix * w;
  }
}

void LIBFUNC( initBlankImage ) ( HNativeLib lib,
				 HImage image, jint width, jint height ) {
  Display      *dsp = XDISPLAY(lib);
  int          depth = DefaultDepth( dsp, DEFSCREEN(lib));
  Pixmap       pix;

  LOCK;
  pix = XCreatePixmap( dsp, ROOT(lib), width, height, depth);
  PIXMAP(image) = pix;
  UNLOCK;
}

void LIBFUNC( releaseImage ) ( HNativeLib lib, HImage image ) {
  Display      *dsp = XDISPLAY(lib);
  Pixmap       pix = PIXMAP(image);

  LOCK;
  XFreePixmap( dsp, pix);
  PIXMAP(image) = 0;
  UNLOCK;
}









