/*
 *   This file was automatically generated by version 1.7 of cextract.
 *   Manual editing not recommended.
 */

#ifndef __CEXTRACT__
#ifdef __STDC__

extern unsigned char *ReadPng ( FILE* infile,
                                int* width,
                                int* height,
                                int* ncolors,
                                int* cpp,
                                ThotColorStruct colrs[256],
                                int* bg );
extern unsigned char* ReadPngToData ( STRING datafile,
                                      int* w,
                                      int* h,
                                      int* ncolors,
                                      int* cpp,
                                      ThotColorStruct colrs[256],
                                      int* bg );
extern ThotBitmap PngCreate ( STRING fn,
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
extern void PngPrint ( STRING fn,
                       PictureScaling pres,
                       int xif,
                       int yif,
                       int wif,
                       int hif,
                       int PicXArea,
                       int PicYArea,
                       int PicWArea,
                       int PicHArea,
                       int fd,
                       unsigned long BackGroundPixel );
extern ThotBool IsPngFormat ( char* fn );

#else /* __STDC__ */

extern unsigned char *ReadPng (/* FILE* infile,
                                  int* width,
                                  int* height,
                                  int* ncolors,
                                  int* cpp,
                                  ThotColorStruct colrs[256],
                                  int* bg */);
extern unsigned char* ReadPngToData (/* STRING datafile,
                                        int* w,
                                        int* h,
                                        int* ncolors,
                                        int* cpp,
                                        ThotColorStruct colrs[256],
                                        int* bg */);
extern ThotBitmap PngCreate (/* STRING fn,
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
extern void PngPrint (/* STRING fn,
                         PictureScaling pres,
                         int xif,
                         int yif,
                         int wif,
                         int hif,
                         int PicXArea,
                         int PicYArea,
                         int PicWArea,
                         int PicHArea,
                         int fd,
                         unsigned long BackGroundPixel */);
extern ThotBool IsPngFormat (/* char* fn */);

#endif /* __STDC__ */
#endif /* __CEXTRACT__ */