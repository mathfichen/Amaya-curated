/*
 *   This file was automatically generated by version 1.7 of cextract.
 *   Manual editing not recommended.
 */

#ifndef __CEXTRACT__
#ifdef __STDC__

extern void Javalong2CElementType ( jlong in,
                                    ElementType *out );
extern void Javalong2CAttributeType ( jlong in,
                                      AttributeType *out );
extern void CElementType2Javalong ( ElementType in,
                                    jlong *out );
extern void CAttributeType2Javalong ( AttributeType in,
                                      jlong *out );
extern void JavaElement2CElement ( struct Hthotlib_Element *in,
                                   Element *out );
extern void JavaElement2CElementPtr ( struct Hthotlib_Element* in,
                                      Element **out );
extern void CElementPtr2JavaElement ( Element *in,
                                      struct Hthotlib_Element** out );
extern void JavaElementType2CElementTypePtr ( struct Hthotlib_ElementType* in,
                                              ElementType **out );
extern void CElementTypePtr2JavaElementType ( ElementType *in,
                                              struct Hthotlib_ElementType** out );
extern void JavaDocument2CDocumentPtr ( struct Hthotlib_Document* in,
                                        Document **out );
extern void CDocumentPtr2JavaDocument ( Document *in,
                                        struct Hthotlib_Document** out );
extern void JavaSSchema2CSSchemaPtr ( struct Hthotlib_SSchema* in,
                                      SSchema **out );
extern void CSSchemaPtr2JavaSSchema ( SSchema *in,
                                      struct Hthotlib_SSchema** out );
extern void JavaAttribute2CAttributePtr ( struct Hthotlib_Attribute* in,
                                          Attribute **out );
extern void CAttributePtr2JavaAttribute ( Attribute *in,
                                          struct Hthotlib_Attribute** out );
extern void JavaPRule2CPRulePtr ( struct Hthotlib_PRule* in,
                                  PRule **out );
extern void CPRulePtr2JavaPRule ( PRule *in,
                                  struct Hthotlib_PRule** out );
extern void JavaAttributeType2CAttributeTypePtr ( struct Hthotlib_AttributeType* in,
                                                  AttributeType **out );
extern void CAttributeTypePtr2JavaAttributeType ( AttributeType *in,
                                                  struct Hthotlib_AttributeType** out );
extern void JavaIntPtr2CintPtr ( struct Hthotlib_IntPtr* in,
                                 int **out );
extern void CintPtr2JavaIntPtr ( int *in,
                                 struct Hthotlib_IntPtr** out );
extern void JavaLanguage2CLanguagePtr ( struct Hthotlib_Language* in,
                                        Language **out );
extern void CLanguagePtr2JavaLanguage ( Language *in,
                                        struct Hthotlib_Language** out );
extern void JavaStringBuffer2CcharPtr ( struct Hjava_lang_StringBuffer* in,
                                        char **out );
extern void CcharPtr2JavaStringBuffer ( char *in,
                                        struct Hjava_lang_StringBuffer** out );
extern void CPixmap2Javalong ( Pixmap in,
                               jlong *out );
extern void Javalong2CPixmap ( jlong in,
                               Pixmap *out );
extern void CElement2Javalong ( Element in,
                                jlong *out );
extern void Javalong2CElement ( jlong in,
                                Element *out );
extern void CSSchema2Javalong ( SSchema in,
                                jlong *out );
extern void Javalong2CSSchema ( jlong in,
                                SSchema *out );
extern void CAttribute2Javalong ( Attribute in,
                                  jlong *out );
extern void Javalong2CAttribute ( jlong in,
                                  Attribute *out );
extern void CPRule2Javalong ( PRule in,
                              jlong *out );
extern void Javalong2CPRule ( jlong in,
                              PRule *out );
extern void CThotWidget2Javalong ( ThotWidget in,
                                   jlong *out );
extern void Javalong2CThotWidget ( jlong in,
                                   ThotWidget *out );

#else /* __STDC__ */

extern void Javalong2CElementType (/* jlong in,
                                      ElementType *out */);
extern void Javalong2CAttributeType (/* jlong in,
                                        AttributeType *out */);
extern void CElementType2Javalong (/* ElementType in,
                                      jlong *out */);
extern void CAttributeType2Javalong (/* AttributeType in,
                                        jlong *out */);
extern void JavaElement2CElement (/* struct Hthotlib_Element *in,
                                     Element *out */);
extern void JavaElement2CElementPtr (/* struct Hthotlib_Element* in,
                                        Element **out */);
extern void CElementPtr2JavaElement (/* Element *in,
                                        struct Hthotlib_Element** out */);
extern void JavaElementType2CElementTypePtr (/* struct Hthotlib_ElementType* in,
                                                ElementType **out */);
extern void CElementTypePtr2JavaElementType (/* ElementType *in,
                                                struct Hthotlib_ElementType** out */);
extern void JavaDocument2CDocumentPtr (/* struct Hthotlib_Document* in,
                                          Document **out */);
extern void CDocumentPtr2JavaDocument (/* Document *in,
                                          struct Hthotlib_Document** out */);
extern void JavaSSchema2CSSchemaPtr (/* struct Hthotlib_SSchema* in,
                                        SSchema **out */);
extern void CSSchemaPtr2JavaSSchema (/* SSchema *in,
                                        struct Hthotlib_SSchema** out */);
extern void JavaAttribute2CAttributePtr (/* struct Hthotlib_Attribute* in,
                                            Attribute **out */);
extern void CAttributePtr2JavaAttribute (/* Attribute *in,
                                            struct Hthotlib_Attribute** out */);
extern void JavaPRule2CPRulePtr (/* struct Hthotlib_PRule* in,
                                    PRule **out */);
extern void CPRulePtr2JavaPRule (/* PRule *in,
                                    struct Hthotlib_PRule** out */);
extern void JavaAttributeType2CAttributeTypePtr (/* struct Hthotlib_AttributeType* in,
                                                    AttributeType **out */);
extern void CAttributeTypePtr2JavaAttributeType (/* AttributeType *in,
                                                    struct Hthotlib_AttributeType** out */);
extern void JavaIntPtr2CintPtr (/* struct Hthotlib_IntPtr* in,
                                   int **out */);
extern void CintPtr2JavaIntPtr (/* int *in,
                                   struct Hthotlib_IntPtr** out */);
extern void JavaLanguage2CLanguagePtr (/* struct Hthotlib_Language* in,
                                          Language **out */);
extern void CLanguagePtr2JavaLanguage (/* Language *in,
                                          struct Hthotlib_Language** out */);
extern void JavaStringBuffer2CcharPtr (/* struct Hjava_lang_StringBuffer* in,
                                          char **out */);
extern void CcharPtr2JavaStringBuffer (/* char *in,
                                          struct Hjava_lang_StringBuffer** out */);
extern void CPixmap2Javalong (/* Pixmap in,
                                 jlong *out */);
extern void Javalong2CPixmap (/* jlong in,
                                 Pixmap *out */);
extern void CElement2Javalong (/* Element in,
                                  jlong *out */);
extern void Javalong2CElement (/* jlong in,
                                  Element *out */);
extern void CSSchema2Javalong (/* SSchema in,
                                  jlong *out */);
extern void Javalong2CSSchema (/* jlong in,
                                  SSchema *out */);
extern void CAttribute2Javalong (/* Attribute in,
                                    jlong *out */);
extern void Javalong2CAttribute (/* jlong in,
                                    Attribute *out */);
extern void CPRule2Javalong (/* PRule in,
                                jlong *out */);
extern void Javalong2CPRule (/* jlong in,
                                PRule *out */);
extern void CThotWidget2Javalong (/* ThotWidget in,
                                     jlong *out */);
extern void Javalong2CThotWidget (/* jlong in,
                                     ThotWidget *out */);

#endif /* __STDC__ */
#endif /* __CEXTRACT__ */