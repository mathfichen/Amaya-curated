/*
 *   This file was automatically generated by version 1.7 of cextract.
 *   Manual editing not recommended.
 */

#ifndef __CEXTRACT__
#ifdef __STDC__

extern Drawable XbmCreate ( STRING fn,
                            PictInfo *imageDesc,
                            int* xif,
                            int* yif,
                            int* wif,
                            int* hif,
                            unsigned long BackGroundPixel,
                            ThotBitmap *mask1,
                            int *width,
                            int *height,
                            int zoom );
extern void XbmPrint ( STRING fn,
                       PictureScaling pres,
                       int xif,
                       int yif,
                       int wif,
                       int hif,
                       int PicXArea,
                       int PicYArea,
                       int PicWArea,
                       int PicHArea,
                       FILE *fd,
                       unsigned int BackGroundPixel );
extern ThotBool IsXbmFormat ( CHAR_T* fn );

#else /* __STDC__ */

extern Drawable XbmCreate (/* STRING fn,
                              PictInfo *imageDesc,
                              int* xif,
                              int* yif,
                              int* wif,
                              int* hif,
                              unsigned long BackGroundPixel,
                              ThotBitmap *mask1,
                              int *width,
                              int *height,
                              int zoom */);
extern void XbmPrint (/* STRING fn,
                         PictureScaling pres,
                         int xif,
                         int yif,
                         int wif,
                         int hif,
                         int PicXArea,
                         int PicYArea,
                         int PicWArea,
                         int PicHArea,
                         FILE *fd,
                         unsigned int BackGroundPixel */);
extern ThotBool IsXbmFormat (/* CHAR_T* fn */);

#endif /* __STDC__ */
#endif /* __CEXTRACT__ */