/*
 *   This file was automatically generated by version 1.7 of cextract.
 *   Manual editing not recommended.
 */

#ifndef __CEXTRACT__
#ifdef __STDC__

extern void ChangeElementType ( Element element,
                                int typeNum );
extern Element TtaNewElement ( Document document,
                               ElementType elementType );
extern Element TtaNewTree ( Document document,
                            ElementType elementType,
                            STRING label );
extern Element TtaCopyTree ( Element sourceElement,
                             Document sourceDocument,
                             Document destinationDocument,
                             Element parent );
extern Element TtaCreateDescent ( Document document,
                                  Element element,
                                  ElementType elementType );
extern Element TtaCreateDescentWithContent ( Document document,
                                             Element element,
                                             ElementType elementType );
extern void TtaDeleteTree ( Element element,
                            Document document );
extern void TtaAttachNewTree ( Element tree,
                               Document document );
extern void TtaExportTree ( Element element,
                            Document document,
                            STRING fileName,
                            STRING TSchemaName );
extern void TtaInsertSibling ( Element newElement,
                               Element sibling,
                               ThotBool before,
                               Document document );
extern void TtaAskFirstCreation ( void );
extern void TtaInsertFirstChild ( Element * newElement,
                                  Element parent,
                                  Document document );
extern void TtaInsertElement ( ElementType elementType,
                               Document document );
extern void TtaRemoveTree ( Element element,
                            Document document );
extern void TtaSetElementLineNumber ( Element element,
                                      int nb );
extern void TtaSetAccessRight ( Element element,
                                AccessRight right,
                                Document document );
extern void TtaHolophrastElement ( Element element,
                                   ThotBool holophrast,
                                   Document document );
extern void TtaSetMandatoryInsertion ( ThotBool on,
                                       Document document );
extern void TtaSetStructureChecking ( ThotBool on,
                                      Document document );
extern int TtaGetStructureChecking ( Document document );
extern void TtaSetCheckingMode ( ThotBool strict );
extern void TtaNextAssociatedRoot ( Document document,
                                    Element * root );
extern Element TtaGetFirstChild ( Element parent );
extern Element TtaGetLastChild ( Element parent );
extern Element TtaGetFirstLeaf ( Element parent );
extern Element TtaGetLastLeaf ( Element parent );
extern void TtaPreviousSibling ( Element * element );
extern void TtaNextSibling ( Element * element );
extern Element TtaGetSuccessor ( Element element );
extern Element TtaGetPredecessor ( Element element );
extern Element TtaGetCommonAncestor ( Element element1,
                                      Element element2 );
extern Element TtaGetTypedAncestor ( Element element,
                                     ElementType ancestorType );
extern ThotBool TtaIsExtensionElement ( Element element );
extern STRING TtaGetElementTypeName ( ElementType elementType );
extern STRING TtaGetElementTypeOriginalName ( ElementType elementType );
extern void TtaGiveTypeFromName ( ElementType * elementType,
                                  STRING name );
extern void TtaGiveTypeFromOriginalName ( ElementType * elementType,
                                          STRING name );
extern int TtaSameTypes ( ElementType type1,
                          ElementType type2 );
extern STRING TtaGetElementLabel ( Element element );
extern int TtaGetElementLineNumber ( Element element );
extern int TtaIsConstant ( ElementType elementType );
extern int TtaIsLeaf ( ElementType elementType );
extern Construct TtaGetConstructOfType ( ElementType elementType );
extern int TtaGetCardinalOfType ( ElementType elementType );
extern void TtaGiveConstructorsOfType ( ElementType **typesArray,
                                        int *size,
                                        ElementType elementType );
extern int TtaGetRankInAggregate ( ElementType componentType,
                                   ElementType aggregateType );
extern ThotBool TtaIsOptionalInAggregate ( int rank,
                                           ElementType elementType );
extern Construct TtaGetConstruct ( Element element );
extern AccessRight TtaGetAccessRight ( Element element );
extern int TtaIsHolophrasted ( Element element );
extern int TtaIsReadOnly ( Element element );
extern int TtaIsHidden ( Element element );
extern int TtaIsInAnInclusion ( Element element );
extern int TtaIsAncestor ( Element element,
                           Element ancestor );
extern int TtaIsBefore ( Element element1,
                         Element element2 );
extern int TtaIsFirstPairedElement ( Element element );
extern ThotBool TtaCanInsertSibling ( ElementType elementType,
                                      Element sibling,
                                      ThotBool before,
                                      Document document );
extern ThotBool TtaCanInsertFirstChild ( ElementType elementType,
                                         Element parent,
                                         Document document );
extern void TtaNextCopiedElement ( Element * element );
extern Document TtaGetCopiedDocument ( void );
extern Element TtaSearchElementByLabel ( STRING searchedLabel,
                                         Element element );
extern Element TtaSearchEmptyElement ( SearchDomain scope,
                                       Element element );
extern Element TtaSearchOtherPairedElement ( Element element );
extern Element TtaSearchNoPageBreak ( Element element,
                                      ThotBool forward );

#else /* __STDC__ */

extern void ChangeElementType (/* Element element,
                                  int typeNum */);
extern Element TtaNewElement (/* Document document,
                                 ElementType elementType */);
extern Element TtaNewTree (/* Document document,
                              ElementType elementType,
                              STRING label */);
extern Element TtaCopyTree (/* Element sourceElement,
                               Document sourceDocument,
                               Document destinationDocument,
                               Element parent */);
extern Element TtaCreateDescent (/* Document document,
                                    Element element,
                                    ElementType elementType */);
extern Element TtaCreateDescentWithContent (/* Document document,
                                               Element element,
                                               ElementType elementType */);
extern void TtaDeleteTree (/* Element element,
                              Document document */);
extern void TtaAttachNewTree (/* Element tree,
                                 Document document */);
extern void TtaExportTree (/* Element element,
                              Document document,
                              STRING fileName,
                              STRING TSchemaName */);
extern void TtaInsertSibling (/* Element newElement,
                                 Element sibling,
                                 ThotBool before,
                                 Document document */);
extern void TtaAskFirstCreation (/* void */);
extern void TtaInsertFirstChild (/* Element * newElement,
                                    Element parent,
                                    Document document */);
extern void TtaInsertElement (/* ElementType elementType,
                                 Document document */);
extern void TtaRemoveTree (/* Element element,
                              Document document */);
extern void TtaSetElementLineNumber (/* Element element,
                                        int nb */);
extern void TtaSetAccessRight (/* Element element,
                                  AccessRight right,
                                  Document document */);
extern void TtaHolophrastElement (/* Element element,
                                     ThotBool holophrast,
                                     Document document */);
extern void TtaSetMandatoryInsertion (/* ThotBool on,
                                         Document document */);
extern void TtaSetStructureChecking (/* ThotBool on,
                                        Document document */);
extern int TtaGetStructureChecking (/* Document document */);
extern void TtaSetCheckingMode (/* ThotBool strict */);
extern void TtaNextAssociatedRoot (/* Document document,
                                      Element * root */);
extern Element TtaGetFirstChild (/* Element parent */);
extern Element TtaGetLastChild (/* Element parent */);
extern Element TtaGetFirstLeaf (/* Element parent */);
extern Element TtaGetLastLeaf (/* Element parent */);
extern void TtaPreviousSibling (/* Element * element */);
extern void TtaNextSibling (/* Element * element */);
extern Element TtaGetSuccessor (/* Element element */);
extern Element TtaGetPredecessor (/* Element element */);
extern Element TtaGetCommonAncestor (/* Element element1,
                                        Element element2 */);
extern Element TtaGetTypedAncestor (/* Element element,
                                       ElementType ancestorType */);
extern ThotBool TtaIsExtensionElement (/* Element element */);
extern STRING TtaGetElementTypeName (/* ElementType elementType */);
extern STRING TtaGetElementTypeOriginalName (/* ElementType elementType */);
extern void TtaGiveTypeFromName (/* ElementType * elementType,
                                    STRING name */);
extern void TtaGiveTypeFromOriginalName (/* ElementType * elementType,
                                            STRING name */);
extern int TtaSameTypes (/* ElementType type1,
                            ElementType type2 */);
extern STRING TtaGetElementLabel (/* Element element */);
extern int TtaGetElementLineNumber (/* Element element */);
extern int TtaIsConstant (/* ElementType elementType */);
extern int TtaIsLeaf (/* ElementType elementType */);
extern Construct TtaGetConstructOfType (/* ElementType elementType */);
extern int TtaGetCardinalOfType (/* ElementType elementType */);
extern void TtaGiveConstructorsOfType (/* ElementType **typesArray,
                                          int *size,
                                          ElementType elementType */);
extern int TtaGetRankInAggregate (/* ElementType componentType,
                                     ElementType aggregateType */);
extern ThotBool TtaIsOptionalInAggregate (/* int rank,
                                             ElementType elementType */);
extern Construct TtaGetConstruct (/* Element element */);
extern AccessRight TtaGetAccessRight (/* Element element */);
extern int TtaIsHolophrasted (/* Element element */);
extern int TtaIsReadOnly (/* Element element */);
extern int TtaIsHidden (/* Element element */);
extern int TtaIsInAnInclusion (/* Element element */);
extern int TtaIsAncestor (/* Element element,
                             Element ancestor */);
extern int TtaIsBefore (/* Element element1,
                           Element element2 */);
extern int TtaIsFirstPairedElement (/* Element element */);
extern ThotBool TtaCanInsertSibling (/* ElementType elementType,
                                        Element sibling,
                                        ThotBool before,
                                        Document document */);
extern ThotBool TtaCanInsertFirstChild (/* ElementType elementType,
                                           Element parent,
                                           Document document */);
extern void TtaNextCopiedElement (/* Element * element */);
extern Document TtaGetCopiedDocument (/* void */);
extern Element TtaSearchElementByLabel (/* STRING searchedLabel,
                                           Element element */);
extern Element TtaSearchEmptyElement (/* SearchDomain scope,
                                         Element element */);
extern Element TtaSearchOtherPairedElement (/* Element element */);
extern Element TtaSearchNoPageBreak (/* Element element,
                                        ThotBool forward */);

#endif /* __STDC__ */
#endif /* __CEXTRACT__ */