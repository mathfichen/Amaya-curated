/*
 *   This file was automatically generated by version 1.7 of cextract.
 *   Manual editing not recommended.
 */

#ifndef __CEXTRACT__
#ifdef __STDC__

extern jint thotlib_APILanguage_TtaNewLanguage ( struct Hthotlib_APILanguage* none,
                                                 struct Hjava_lang_String* jlanguageName,
                                                 int languageAlphabet,
                                                 struct Hjava_lang_String* jprincipalDictionary,
                                                 struct Hjava_lang_String* jsecondDictionary );
extern void thotlib_APILanguage_TtaRemoveLanguage ( struct Hthotlib_APILanguage* none,
                                                    jint language );
extern jint thotlib_APILanguage_TtaGetLanguageIdFromName ( struct Hthotlib_APILanguage* none,
                                                           struct Hjava_lang_String* jlanguageName );
extern struct Hjava_lang_String* thotlib_APILanguage_TtaGetVarLANG ( struct Hthotlib_APILanguage* none );
extern jint thotlib_APILanguage_TtaGetDefaultLanguage ( struct Hthotlib_APILanguage* none );
extern jint thotlib_APILanguage_TtaGetLanguageIdFromAlphabet ( struct Hthotlib_APILanguage* none,
                                                               int languageAlphabet );
extern int thotlib_APILanguage_TtaGetAlphabet ( struct Hthotlib_APILanguage* none,
                                                jint languageId );
extern struct Hjava_lang_String* thotlib_APILanguage_TtaGetLanguageName ( struct Hthotlib_APILanguage* none,
                                                                          jint languageId );
extern struct Hjava_lang_String* thotlib_APILanguage_TtaGetLanguageCode ( struct Hthotlib_APILanguage* none,
                                                                          jint languageId );
extern jint thotlib_APILanguage_TtaGetNumberOfLanguages ( struct Hthotlib_APILanguage* none );
extern jint thotlib_APILanguage_TtaLoadLanguageDictionaries ( struct Hthotlib_APILanguage* none,
                                                              jint languageId );
extern void thotlib_APILanguage_TtaUnLoadLanguageDictionaries ( struct Hthotlib_APILanguage* none,
                                                                jint languageId );
extern void register_thotlib_APILanguage_stubs ( void );

#else /* __STDC__ */

extern jint thotlib_APILanguage_TtaNewLanguage (/* struct Hthotlib_APILanguage* none,
                                                   struct Hjava_lang_String* jlanguageName,
                                                   int languageAlphabet,
                                                   struct Hjava_lang_String* jprincipalDictionary,
                                                   struct Hjava_lang_String* jsecondDictionary */);
extern void thotlib_APILanguage_TtaRemoveLanguage (/* struct Hthotlib_APILanguage* none,
                                                      jint language */);
extern jint thotlib_APILanguage_TtaGetLanguageIdFromName (/* struct Hthotlib_APILanguage* none,
                                                             struct Hjava_lang_String* jlanguageName */);
extern struct Hjava_lang_String* thotlib_APILanguage_TtaGetVarLANG (/* struct Hthotlib_APILanguage* none */);
extern jint thotlib_APILanguage_TtaGetDefaultLanguage (/* struct Hthotlib_APILanguage* none */);
extern jint thotlib_APILanguage_TtaGetLanguageIdFromAlphabet (/* struct Hthotlib_APILanguage* none,
                                                                 int languageAlphabet */);
extern int thotlib_APILanguage_TtaGetAlphabet (/* struct Hthotlib_APILanguage* none,
                                                  jint languageId */);
extern struct Hjava_lang_String* thotlib_APILanguage_TtaGetLanguageName (/* struct Hthotlib_APILanguage* none,
                                                                            jint languageId */);
extern struct Hjava_lang_String* thotlib_APILanguage_TtaGetLanguageCode (/* struct Hthotlib_APILanguage* none,
                                                                            jint languageId */);
extern jint thotlib_APILanguage_TtaGetNumberOfLanguages (/* struct Hthotlib_APILanguage* none */);
extern jint thotlib_APILanguage_TtaLoadLanguageDictionaries (/* struct Hthotlib_APILanguage* none,
                                                                jint languageId */);
extern void thotlib_APILanguage_TtaUnLoadLanguageDictionaries (/* struct Hthotlib_APILanguage* none,
                                                                  jint languageId */);
extern void register_thotlib_APILanguage_stubs (/* void */);

#endif /* __STDC__ */
#endif /* __CEXTRACT__ */