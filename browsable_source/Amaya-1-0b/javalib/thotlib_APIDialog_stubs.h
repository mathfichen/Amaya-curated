/*
 * DO NOT EDIT
 * Generated by the following command from /users/veillard/opera/javalib directory
 * ../LINUX-ELF/bin/javastub -T JavaTypes.def -M thotlib_APIDialog -J ../classes/thotlib/APIDialog.java ../thotlib/include/dialog.h 
 */
/*
 * External definitions needed for class thotlib_APIDialog stubs
 */

#ifndef _Included_thotlib_APIDialog_stub_h
#define _Included_thotlib_APIDialog_stub_h
#include "../thotlib/include/dialog.h"


extern void TtaNewPulldown(int ref, ThotWidget parent, char *title, int number, char *text, char *equiv);
extern void TtaSetPulldownOff(int ref, ThotWidget parent);
extern void TtaSetPulldownOn(int ref, ThotWidget parent);
extern void TtaNewPopup(int ref, ThotWidget parent, char *title, int number, char *text, char *equiv, char button);
extern void TtaNewSubmenu(int ref, int ref_parent, int entry, char *title, int number, char *text, char *equiv, boolean react);
extern void TtaSetMenuForm(int ref, int val);
extern void TtaNewToggleMenu(int ref, int ref_parent, char *title, int number, char *text, char *equiv, boolean react);
extern void TtaSetToggleMenu(int ref, int val, boolean on);
extern void TtaChangeMenuEntry(int ref, int entry, char *texte);
extern void TtaRedrawMenuEntry(int ref, int entry, char *fontname, Pixel color, int activate);
extern void TtaDestroyDialogue(int ref);
extern void TtaNewForm(int ref, ThotWidget parent, char *title, boolean horizontal, int packet, char button, int dbutton);
extern void TtaNewSheet(int ref, ThotWidget parent, char *title, int number, char *text, boolean horizontal, int packet, char button, int dbutton);
extern void TtaNewDialogSheet(int ref, ThotWidget parent, char *title, int number, char *text, boolean horizontal, int packet, char button);
extern void TtaChangeFormTitle(int ref, char *title);
extern void TtaAttachForm(int ref);
extern void TtaDetachForm(int ref);
extern void TtaNewSelector(int ref, int ref_parent, char *title, int number, char *text, int height, char *label, boolean withText, boolean react);
extern void TtaSetSelector(int ref, int entry, char *text);
extern void TtaNewLabel(int ref, int ref_parent, char *text);
extern void TtaNewTextForm(int ref, int ref_parent, char *title, int width, int height, boolean react);
extern void TtaSetTextForm(int ref, char *text);
extern void TtaNewNumberForm(int ref, int ref_parent, char *title, int min, int max, boolean react);
extern void TtaSetNumberForm(int ref, int val);
extern void TtaSetDialoguePosition(void);
extern void TtaShowDialogue(int ref, boolean remanent);
extern void TtaWaitShowDialogue(void);
extern boolean TtaTestWaitShowDialogue(void);
extern void TtaAbortShowDialogue(void);
extern void TtaUnmapDialogue(int ref);
extern void register_thotlib_APIDialog_stubs(void);

#endif /* _Included_thotlib_APIDialog_stub_h */