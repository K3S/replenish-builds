﻿-- GH811


-- 1. Name this file after its corresponding GitHub issue
-- 2. Search and replace program names (shift + command + H)
-- 3. Search and replace object text (shift + command + H)
-- 4. If service programs are involved, search and replace service program name

--------------------------------------------------------------------------------
-- In Development
--------------------------------------------------------------------------------

-- Service program(s)
-- AR_PRODLTM
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AR_PRODLTM);
CL: DLTOBJ OBJ(ACS_5OBJ/AR_PRODLTM) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(ACS_5OBJ/AR_PRODLTM) OBJTYPE(*MODULE);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PRODLTM) SRCFILE(ACS_5DEV/QRPGLESRC) OBJTYPE(*MODULE) DBGVIEW(*SOURCE) TGTRLS(V7R2M0) TEXT('Web-Service Prog. 2 Insert/Delete/Update K_PRODLTM');
CL: CRTSRVPGM SRVPGM(ACS_5OBJ/AR_PRODLTM) MODULE(ACS_5OBJ/AR_PRODLTM) SRCFILE(ACS_5DEV/QSRVSRC) SRCMBR(PRODLTM_B) BNDDIR(K3SDIR) TEXT('Web-Service Prog. 2 Insert/Delete/Update K_PRODLTM');
CL: ADDBNDDIRE BNDDIR(K3SDIR) OBJ((AR_PRODLTM));

-- AR_POSTS
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AR_POSTS);
CL: DLTOBJ OBJ(ACS_5OBJ/AR_POSTS) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(ACS_5OBJ/AR_POSTS) OBJTYPE(*MODULE);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_POSTS) SRCFILE(ACS_5DEV/QRPGLESRC) OBJTYPE(*MODULE) DBGVIEW(*SOURCE) TGTRLS(V7R2M0) TEXT('Web-Service Prog. PO Status Checks');
CL: CRTSRVPGM SRVPGM(ACS_5OBJ/AR_POSTS) MODULE(ACS_5OBJ/AR_POSTS) SRCFILE(ACS_5DEV/QSRVSRC) SRCMBR(POSTS_B) BNDDIR(K3SDIR) TEXT('Web-Service Prog. PO Status Checks');
CL: ADDBNDDIRE BNDDIR(K3SDIR) OBJ((AR_POSTS));

-- AR_INTORDL
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AR_INTORDL);
CL: DLTOBJ OBJ(ACS_5OBJ/AR_INTORDL) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(ACS_5OBJ/AR_INTORDL) OBJTYPE(*MODULE);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_INTORDL) SRCFILE(ACS_5DEV/QRPGLESRC) OBJTYPE(*MODULE) DBGVIEW(*SOURCE) TGTRLS(V7R2M0) TEXT('Web-Service Prog. 2 Insert/Delete/Update K_INTORDL');
CL: CRTSRVPGM SRVPGM(ACS_5OBJ/AR_INTORDL) MODULE(ACS_5OBJ/AR_INTORDL) SRCFILE(ACS_5DEV/QSRVSRC) SRCMBR(INTORDL_B) BNDDIR(K3SDIR) TEXT('Web-Service Prog. 2 Insert/Delete/Update K_INTORDL');
CL: ADDBNDDIRE BNDDIR(K3SDIR) OBJ((AR_INTORDL));


-- API program(s)
-- AR_PUSORDR
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PUSORDR) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0) TEXT('Web - Update PO status in K_INTORDL');

-- AC_PUSORDR
CL: CRTBNDCL PGM(ACS_5OBJ/AC_PUSORDR) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Web - Update PO status in K_INTORDL');

-- TS_PUSORDR
CL: CRTBNDCL PGM(ACS_5OBJ/TS_PUSORDR) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Web - Testing AC_PUSORDR');

-- AC_LTMAPOR
CL: CRTBNDCL PGM(ACS_5OBJ/AC_LTMAPOR) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Night Job - Flag Log PO as received');

-- AC_LTMAPO2
CL: CRTBNDCL PGM(ACS_5OBJ/AC_LTMAPO2) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Web - Flag Log PO as received');

-- TS_LTMAPOR
CL: CRTBNDCL PGM(ACS_5OBJ/TS_LTMAPOR) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Web - Testing AC_LTMAPOR');

-- TS_LTMAPO2
CL: CRTBNDCL PGM(ACS_5OBJ/TS_LTMAPO2) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Web - Testing AC_LTMAPO2');

-- AR_LTMAPOR
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_LTMAPOR) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0) TEXT('Web - Flag Log PO as received');

-- AC_ADJAPOR
CL: CRTBNDCL PGM(ACS_5OBJ/AC_ADJAPOR) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Web - Night Job to update Adjustments');

-- Authority
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_PRODLTM) OBJTYPE(*SRVPGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_POSTS) OBJTYPE(*SRVPGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_INTORDL) OBJTYPE(*SRVPGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_PUSORDR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_PUSORDR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_PUSORDR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_LTMAPOR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_LTMAPOR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_LTMAPOR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_LTMAPO2) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_LTMAPO2) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_ADJAPOR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


--------------------------------------------------------------------------------
-- Integrated Testing Environment
--------------------------------------------------------------------------------
-- AR_PRODLTM
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AR_PRODLTM);
CL: DLTOBJ OBJ(WEB_5TST/AR_PRODLTM) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(WEB_5TST/AR_PRODLTM) OBJTYPE(*MODULE);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_PRODLTM) TOMBR(AR_PRODLTM);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(PRODLTM_H) TOMBR(PRODLTM_H);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_PRODLTM) SRCFILE(WEB_5TDV/QRPGLESRC) OBJTYPE(*MODULE) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CPYSRCF FROMFILE(ACS_5DEV/QSRVSRC) TOFILE(WEB_5TDV/QSRVSRC) FROMMBR(PRODLTM_B) TOMBR(PRODLTM_B);
CL: CRTSRVPGM SRVPGM(WEB_5TST/AR_PRODLTM) MODULE(WEB_5TST/AR_PRODLTM) SRCFILE(WEB_5TDV/QSRVSRC) SRCMBR(PRODLTM_B) BNDDIR(K3SDIR) TEXT('Web-Service Prog. 2 Insert/Delete/Update K_PRODLTM');
CL: ADDBNDDIRE BNDDIR(K3SDIR) OBJ((AR_PRODLTM));

-- AR_POSTS
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AR_POSTS);
CL: DLTOBJ OBJ(WEB_5TST/AR_POSTS) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(WEB_5TST/AR_POSTS) OBJTYPE(*MODULE);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_POSTS) TOMBR(AR_POSTS);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(POSTS_H) TOMBR(POSTS_H);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_POSTS) SRCFILE(WEB_5TDV/QRPGLESRC) OBJTYPE(*MODULE) DBGVIEW(*SOURCE) TGTRLS(V7R2M0) TEXT('Web-Service Prog. PO Status Checks');
CL: CPYSRCF FROMFILE(ACS_5DEV/QSRVSRC) TOFILE(WEB_5TDV/QSRVSRC) FROMMBR(POSTS_B) TOMBR(POSTS_B);
CL: CRTSRVPGM SRVPGM(WEB_5TST/AR_POSTS) MODULE(WEB_5TST/AR_POSTS) SRCFILE(WEB_5TDV/QSRVSRC) SRCMBR(POSTS_B) BNDDIR(K3SDIR) TEXT('Web-Service Prog. PO Status Checks');
CL: ADDBNDDIRE BNDDIR(K3SDIR) OBJ((AR_POSTS));

-- AR_INTORDL
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AR_INTORDL);
CL: DLTOBJ OBJ(WEB_5TST/AR_INTORDL) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(WEB_5TST/AR_INTORDL) OBJTYPE(*MODULE);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_INTORDL) TOMBR(AR_INTORDL);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_INTORDL) SRCFILE(WEB_5TDV/QRPGLESRC) OBJTYPE(*MODULE) DBGVIEW(*SOURCE) TGTRLS(V7R2M0) TEXT('Web-Service Prog. 2 Insert/Delete/Update K_INTORDL');
CL: CRTSRVPGM SRVPGM(WEB_5TST/AR_INTORDL) MODULE(WEB_5TST/AR_INTORDL) SRCFILE(WEB_5TDV/QSRVSRC) SRCMBR(INTORDL_B) BNDDIR(K3SDIR) TEXT('Web-Service Prog. 2 Insert/Delete/Update K_INTORDL');
CL: ADDBNDDIRE BNDDIR(K3SDIR) OBJ((AR_INTORDL));

-- AR_PUSORDR
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_PUSORDR) TOMBR(AR_PUSORDR);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_PUSORDR) SRCFILE(WEB_5TDV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0) TEXT('Web - Update PO status in K_INTORDL');

-- AC_PUSORDR
CL: CPYSRCF FROMFILE(ACS_5DEV/QCLLESRC) TOFILE(WEB_5TDV/QCLLESRC) FROMMBR(AC_PUSORDR) TOMBR(AC_PUSORDR);
CL: CRTBNDCL PGM(WEB_5TST/AC_LTMAPOR) SRCFILE(WEB_5TDV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Web - Update PO status in K_INTORDL');

-- TS_PUSORDR
CL: CPYSRCF FROMFILE(ACS_5DEV/QCLLESRC) TOFILE(WEB_5TDV/QCLLESRC) FROMMBR(TS_PUSORDR) TOMBR(TS_PUSORDR);
CL: CRTBNDCL PGM(WEB_5TST/AC_LTMAPOR) SRCFILE(WEB_5TDV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Web - Testing AC_PUSORDR');


-- AR_LTMAPOR
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_LTMAPOR) TOMBR(AR_LTMAPOR);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_LTMAPOR) SRCFILE(WEB_5TDV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0) TEXT('Web - Flag Log PO as received');

-- AC_LTMAPOR
CL: CPYSRCF FROMFILE(ACS_5DEV/QCLLESRC) TOFILE(WEB_5TDV/QCLLESRC) FROMMBR(AC_LTMAPOR) TOMBR(AC_LTMAPOR);
CL: CRTBNDCL PGM(WEB_5TST/AC_LTMAPOR) SRCFILE(WEB_5TDV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Night Job - Flag Log PO as received');

-- TS_LTMAPOR
CL: CPYSRCF FROMFILE(ACS_5DEV/QCLLESRC) TOFILE(WEB_5TDV/QCLLESRC) FROMMBR(TS_LTMAPOR) TOMBR(TS_LTMAPOR);
CL: CRTBNDCL PGM(WEB_5TST/TS_LTMAPOR) SRCFILE(WEB_5TDV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Web - Testing AC_LTMAPOR');

-- AC_LTMAPO2
CL: CPYSRCF FROMFILE(ACS_5DEV/QCLLESRC) TOFILE(WEB_5TDV/QCLLESRC) FROMMBR(AC_LTMAPO2) TOMBR(AC_LTMAPO2);
CL: CRTBNDCL PGM(WEB_5TST/AC_LTMAPO2) SRCFILE(WEB_5TDV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Web - Flag Log PO as received');

-- TS_LTMAPO2
CL: CPYSRCF FROMFILE(ACS_5DEV/QCLLESRC) TOFILE(WEB_5TDV/QCLLESRC) FROMMBR(TS_LTMAPO2) TOMBR(TS_LTMAPO2);
CL: CRTBNDCL PGM(WEB_5TST/TS_LTMAPO2) SRCFILE(WEB_5TDV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Web - Testing AC_LTMAPO2');

-- AC_ADJAPOR
CL: CPYSRCF FROMFILE(ACS_5DEV/QCLLESRC) TOFILE(WEB_5TDV/QCLLESRC) FROMMBR(AC_ADJAPOR) TOMBR(AC_ADJAPOR);
CL: CRTBNDCL PGM(WEB_5TST/AC_ADJAPOR) SRCFILE(WEB_5TDV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Web - Night Job to update Adjustments');

CL: GRTOBJAUT OBJ(WEB_5TST/AR_PRODLTM) OBJTYPE(*SRVPGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5TST/AR_POSTS) OBJTYPE(*SRVPGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5TST/AR_INTORDL) OBJTYPE(*SRVPGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5TST/AR_PUSORDR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5TST/AC_PUSORDR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5TST/TS_PUSORDR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5TST/AR_LTMAPOR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5TST/AC_LTMAPOR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5TST/TS_LTMAPOR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5TST/AC_LTMAPO2) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5TST/TS_LTMAPO2) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5TST/AC_ADJAPOR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


--------------------------------------------------------------------------------
-- Deployment
--------------------------------------------------------------------------------

-- Service Program(s)
-- AR_PRODLTM
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AR_PRODLTM);
CL: DLTOBJ OBJ(WEB_5OBJ/AR_PRODLTM) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(WEB_5OBJ/AR_PRODLTM) OBJTYPE(*MODULE);
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(AR_PRODLTM) TOMBR(AR_PRODLTM);
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(PRODLTM_H) TOMBR(PRODLTM_H);
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_PRODLTM) SRCFILE(WEB_5DEV/QRPGLESRC) OBJTYPE(*MODULE) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CPYSRCF FROMFILE(WEB_5TDV/QSRVSRC) TOFILE(WEB_5DEV/QSRVSRC) FROMMBR(PRODLTM_B) TOMBR(PRODLTM_B);
CL: CRTSRVPGM SRVPGM(WEB_5OBJ/AR_PRODLTM) MODULE(WEB_5OBJ/AR_PRODLTM) SRCFILE(WEB_5TDV/QSRVSRC) SRCMBR(PRODLTM_B) BNDDIR(K3SDIR) TEXT('Web-Service Prog. 2 Insert/Delete/Update K_PRODLTM');
CL: ADDBNDDIRE BNDDIR(K3SDIR) OBJ((AR_PRODLTM));

-- AR_POSTS
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AR_POSTS);
CL: DLTOBJ OBJ(WEB_5OBJ/AR_POSTS) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(WEB_5OBJ/AR_POSTS) OBJTYPE(*MODULE);
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(AR_POSTS) TOMBR(AR_POSTS);
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(POSTS_H) TOMBR(POSTS_H);
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_POSTS) SRCFILE(WEB_5DEV/QRPGLESRC) OBJTYPE(*MODULE) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CPYSRCF FROMFILE(WEB_5TDV/QSRVSRC) TOFILE(WEB_5DEV/QSRVSRC) FROMMBR(POSTS_B) TOMBR(POSTS_B);
CL: CRTSRVPGM SRVPGM(WEB_5OBJ/AR_POSTS) MODULE(WEB_5OBJ/AR_POSTS) SRCFILE(WEB_5TDV/QSRVSRC) SRCMBR(POSTS_B) BNDDIR(K3SDIR) TEXT('Web-Service Prog. PO Status Checks');
CL: ADDBNDDIRE BNDDIR(K3SDIR) OBJ((AR_POSTS));

-- AR_INTORDL
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AR_INTORDL);
CL: DLTOBJ OBJ(WEB_5OBJ/AR_INTORDL) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(WEB_5OBJ/AR_INTORDL) OBJTYPE(*MODULE);
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(AR_INTORDL) TOMBR(AR_INTORDL);
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(POSTS_H) TOMBR(POSTS_H);
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_INTORDL) SRCFILE(WEB_5DEV/QRPGLESRC) OBJTYPE(*MODULE) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CPYSRCF FROMFILE(WEB_5TDV/QSRVSRC) TOFILE(WEB_5DEV/QSRVSRC) FROMMBR(POSTS_B) TOMBR(POSTS_B);
CL: CRTSRVPGM SRVPGM(WEB_5OBJ/AR_INTORDL) MODULE(WEB_5OBJ/AR_INTORDL) SRCFILE(WEB_5TDV/QSRVSRC) SRCMBR(POSTS_B) BNDDIR(K3SDIR) TEXT('Web-Service Prog. PO Status Checks');
CL: ADDBNDDIRE BNDDIR(K3SDIR) OBJ((AR_INTORDL));

-- API Program(s)
-- AR_PUSORDR
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(AR_PUSORDR) TOMBR(AR_PUSORDR);
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_PUSORDR) SRCFILE(WEB_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) TGTRLS(V7R2M0) TEXT('Web - Update PO status in K_INTORDL');

-- AR_LTMAPOR
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(AR_LTMAPOR) TOMBR(AR_LTMAPOR);
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_LTMAPOR) SRCFILE(WEB_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) TGTRLS(V7R2M0) TEXT('Web - Flag Log PO as received');

-- AC_LTMAPOR
CL: CPYSRCF FROMFILE(WEB_5TDV/QCLLESRC) TOFILE(WEB_5DEV/QCLLESRC) FROMMBR(AC_LTMAPOR) TOMBR(AC_LTMAPOR);
CL: CRTBNDCL PGM(WEB_5OBJ/AC_LTMAPOR) SRCFILE(WEB_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Night Job - Flag Log PO as received');

-- TS_LTMAPOR
CL: CPYSRCF FROMFILE(WEB_5TDV/QCLLESRC) TOFILE(WEB_5DEV/QCLLESRC) FROMMBR(TS_LTMAPOR) TOMBR(TS_LTMAPOR);
CL: CRTBNDCL PGM(WEB_5OBJ/TS_LTMAPOR) SRCFILE(WEB_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Web - Testing AC_LTMAPOR');

-- AC_LTMAPO2
CL: CPYSRCF FROMFILE(WEB_5TDV/QCLLESRC) TOFILE(WEB_5DEV/QCLLESRC) FROMMBR(AC_LTMAPO2) TOMBR(AC_LTMAPO2);
CL: CRTBNDCL PGM(WEB_5OBJ/AC_LTMAPO2) SRCFILE(WEB_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Web - Flag Log PO as received');

-- TS_LTMAPO2
CL: CPYSRCF FROMFILE(WEB_5TDV/QCLLESRC) TOFILE(WEB_5DEV/QCLLESRC) FROMMBR(TS_LTMAPO2) TOMBR(TS_LTMAPO2);
CL: CRTBNDCL PGM(WEB_5OBJ/TS_LTMAPO2) SRCFILE(WEB_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Web - Testing AC_LTMAPO2');

-- AC_ADJAPOR
CL: CPYSRCF FROMFILE(WEB_5TDV/QCLLESRC) TOFILE(WEB_5DEV/QCLLESRC) FROMMBR(AC_ADJAPOR) TOMBR(AC_ADJAPOR);
CL: CRTBNDCL PGM(WEB_5OBJ/AC_ADJAPOR) SRCFILE(WEB_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Web - Night Job to update Adjustments');

CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_PRODLTM) OBJTYPE(*SRVPGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_POSTS) OBJTYPE(*SRVPGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_INTORDL) OBJTYPE(*SRVPGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_PUSORDR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AC_PUSORDR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5OBJ/TS_PUSORDR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_LTMAPOR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AC_LTMAPO2) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5OBJ/TS_LTMAPO2) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AC_LTMAPOR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5OBJ/TS_LTMAPOR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AC_ADJAPOR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

--------------------------------------------------------------------------------
-- Hotfix to self-hosted
--------------------------------------------------------------------------------

-- Clear save file
CL: CLRSAVF FILE(QGPL/r6objects);

-- Add objects to save file
CL: SAVOBJ OBJ(AR_PUSORDR) LIB(ACS_5OBJ) DEV(*SAVF) SAVF(QGPL/r6objects);

-- Upload savefile to Smartfile FTP site
--  (on Conan Dev)
FTP RMTSYS(K3S.SMARTFILE.COM)
> cd /R6_Deployment/Customer_Access
  250 "/R6_Deployment/Customer_Access" is the current directory.
> bin
  200 Type set to: Binary.
> put r6objects                                                        
229 Entering extended passive mode (|||21344|).                            
125 Data connection already open. Transfer starting.                       
226 Transfer complete.                                                     
2356992 bytes transferred in 0.721 seconds. Transfer rate 3270.406 KB/sec. 
