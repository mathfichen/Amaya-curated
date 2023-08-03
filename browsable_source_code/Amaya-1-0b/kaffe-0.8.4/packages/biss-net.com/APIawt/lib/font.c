#include "awt.h"

#define PLAIN  0
#define BOLD   1
#define ITALIC 2

void initFontSpecs ( HNativeLib lib ) {
  DisplayData  *dd = DISPLAY_DATA(lib);

  dd->FontSpecs[0] = "-adobe-courier-";
  dd->FontSpecs[1] = "-adobe-helvetica-";
  dd->FontSpecs[2] = "-adobe-times-";
  dd->FontSpecs[3] = "-b&h-lucida-";
  dd->FontSpecs[4] = "-misc-fixed-";
}

Font loadFont ( HNativeLib lib, HFont font ) {
  Display *dsp = XDISPLAY(lib);
  DisplayData  *dd = DISPLAY_DATA(lib);
  char    fname[256];
  char    *c;
  HString jname = unhand(font)->name;
  char    name[64];
  int     len = javaStringLength( unhand(font)->name);
  Font    fid;
  int     idx = -1;

  javaString2CString( jname, name, sizeof(name));
  fname[0] = 0;

  switch ( name[0] ) {
  case 'C':
    if ( !strncmp( name, "Courier", len) )  idx = 0;
    break;
  case 'H':
    if ( !strncmp( name, "Helvetica", len) ) idx = 1;
    break;
  case 'T':
    if ( !strncmp( name, "TimesRoman", len) ) idx = 2;
    break;
  case 'D':
    if ( !strncmp( name, "Dialog", len) ) idx = 3;
    break;
  case 'S':
    if ( !strncmp( name, "Symbol", len) ) idx = 4;
    break;
  }

  if ( idx < 0 )
    javaString2CString( jname, fname, sizeof(fname));
  else
    strcpy( fname, dd->FontSpecs[idx]);

  if ( unhand(font)->style == BOLD )
    strcat( fname, "bold");
  else
    strcat( fname, "medium");


  if ( unhand(font)->style == ITALIC )
    strcat (fname, "-i-*-*-");
  else
    strcat (fname, "-r-*-*-");

  for ( c=fname; *c ; c++ );
  sprintf( c, "%d", unhand(font)->size);

  if ( unhand(lib)->Resolution > 87 )
    strcat( fname, "-*-100-100-");
  else
    strcat( fname, "-*-75-75-");

  
  strcat( fname, "*-*-iso8859-*");

  LOCK;

  DBG( DBG_GRA, "loadFont [ (%x) %s", dsp, fname);
  fid = XLoadFont( dsp, fname);
  DBG1( DBG_GRA, " => %x]\n", fid);

  if ( !fid )
    signalError( "can't load font: %s (%s)", name, fname);

  UNLOCK;

  return fid;
}


void LIBFUNC( initFontMetrics ) ( HNativeLib lib, HFontMetrics metrics) {
  Display       *dsp = XDISPLAY(lib);
  HFont         font = unhand(metrics)->font;
  Font          fid = (Font) unhand(font)->pData;
  jint          *widths = unhand(unhand(metrics)->Widths)->body;
  XFontStruct   *fs;
  int           i, j;

  LOCK;
  if ( !fid ){
    fid = loadFont( lib, font);
    unhand(font)->pData = (jint) fid;
  }

  DBG( DBG_GRA, "initFontMetrics [ (%x) %x", dsp, fid);
  fs = XQueryFont( dsp, fid);
  DBG1( DBG_GRA, " => %x]\n", fs);
  UNLOCK;

  if ( !fs ) return;

  XFONTSTRUCT(metrics)        = (long) fs;
  unhand(metrics)->Descent    = fs->descent;
  unhand(metrics)->MaxDescent = fs->max_bounds.descent;
  unhand(metrics)->Ascent     = fs->ascent;
  unhand(metrics)->MaxAscent  = fs->max_bounds.ascent;
  unhand(metrics)->Height     = fs->max_bounds.ascent + fs->max_bounds.descent; 

  if ( fs->min_byte1 == 0 && fs->max_byte1 == 0 ) {
    unhand(metrics)->IsWideFont = 0;

    if ( fs->per_char ) {
      unhand(metrics)->IsFixed = 0;
      for ( i=fs->min_char_or_byte2, j=0; i <= fs->max_char_or_byte2; i++,j++ )
	widths[i] = fs->per_char[j].width;
    }
    else {
      unhand(metrics)->IsFixed = 1;
      for ( i=0; i<256; i++ )
	widths[i] = fs->max_bounds.width;
    }
  }
  else {
    unhand(metrics)->IsWideFont = 1;
  }
}

void LIBFUNC( releaseFontMetrics ) ( HNativeLib lib, HFontMetrics metrics) {
  Display       *dsp = XDISPLAY(lib);
  XFontStruct   *fs = XFONTSTRUCT(metrics);

  LOCK;
  DBG( DBG_GRA, "releaseFontMetrics [%x (%x)]\n", fs, dsp);

  if ( fs ) {
    XFONTSTRUCT(metrics) = 0;
    XFreeFontInfo( NULL, fs, 1);
  }
  UNLOCK;
}


jint LIBFUNC( stringWidth ) ( HNativeLib lib,
			      HFontMetrics metrics, HString jstr ){
  Display       *dsp = XDISPLAY(lib);
  XFontStruct   *fs = XFONTSTRUCT(metrics);
  int           len, i, w;
  jint          *widths = unhand(unhand(metrics)->Widths)->body;
  char          buf[256];
  char          *s = buf;

  if ( jstr == 0 ) return 0;

 javaString2CString( jstr, buf, sizeof(buf));

  LOCK;
  DBG( DBG_GRA, "stringWidth [%x]\n", fs);
  len = javaStringLength(jstr);

  if ( !unhand(metrics)->IsWideFont ) {
    if ( unhand(metrics)->IsFixed )
      w = unhand(metrics)->Width * len;
    else {
      for ( i=0, w=0; i<len; i++, s++ )
	w += widths[(unsigned char)*s];
    }
  }
  else {
      w = XTextWidth16( fs, (XChar2b*) s, len);
  }

  UNLOCK;
  return w;
}

void LIBFUNC( setStdFontSpec ) ( HNativeLib lib, jint idx, HString spec ) {
  DisplayData  *dd = DISPLAY_DATA(lib);  

  if ( idx >= NFONTS || !spec )
    return;

  dd->FontSpecs[idx] = makeCString( spec);
}













