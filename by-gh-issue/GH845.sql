-- GH811

-- 1. Name this file after its corresponding GitHub issue
-- 2. Search for <api_name> and replace with API program name (shift + command + H)
-- 3. Remove service program compile commands if not used
-- 4. Search for <api_text> and replace with API text
-- 5. Search for <api_test_text> and replace with API test text
-- 6. If service programs are involved...
--    A. Search for <srvpgm_name> and replace with service program name
--    B. Search for <srvpgm_text> and replace with service program text

--------------------------------------------------------------------------------
-- Set Up
--------------------------------------------------------------------------------

CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(K3S_APIPRO) TOMBR(K3S_APIPRO);
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_DAYPROR) TOMBR(AR_DAYPROR);
CL: CPYSRCF FROMFILE(WEB_5TDV/QCLLESRC) TOFILE(ACS_5DEV/QCLLESRC) FROMMBR(AC_DAYPROR) TOMBR(AC_DAYPROR);
CL: CPYSRCF FROMFILE(WEB_5TDV/QCLLESRC) TOFILE(ACS_5DEV/QCLLESRC) FROMMBR(TS_DAYPROR) TOMBR(TS_DAYPROR);


--------------------------------------------------------------------------------
-- In Development
--------------------------------------------------------------------------------

-- API Program(s)
-- AR_DAYPROR
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_DAYPROR) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);

-- AC_DAYPROR
CL: CRTBNDCL PGM(ACS_5OBJ/AC_DAYPROR) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- TS_DAYPROR
CL: CRTBNDCL PGM(ACS_5OBJ/TS_DAYPROR) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);


-- Authority
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_DAYPROR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_DAYPROR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_DAYPROR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


--------------------------------------------------------------------------------
-- Integrated Testing Environment
--------------------------------------------------------------------------------

CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(K3S_APIPRO) TOMBR(K3S_APIPRO);

-- API Program(s)
-- AR_DAYPROR
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_DAYPROR) TOMBR(AR_DAYPROR);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_DAYPROR) SRCFILE(WEB_5TDV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);

-- AC_DAYPROR
CL: CPYSRCF FROMFILE(ACS_5DEV/QCLLESRC) TOFILE(WEB_5TDV/QCLLESRC) FROMMBR(AC_DAYPROR) TOMBR(AC_DAYPROR);
CL: CRTBNDCL PGM(WEB_5TST/AC_DAYPROR) SRCFILE(WEB_5TDV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- TS_DAYPROR
CL: CPYSRCF FROMFILE(ACS_5DEV/QCLLESRC) TOFILE(WEB_5TDV/QCLLESRC) FROMMBR(TS_DAYPROR) TOMBR(TS_DAYPROR);
CL: CRTBNDCL PGM(WEB_5TST/TS_DAYPROR) SRCFILE(WEB_5TDV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);

CL: GRTOBJAUT OBJ(WEB_5TST/AR_DAYPROR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5TST/AC_DAYPROR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5TST/TS_DAYPROR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


--------------------------------------------------------------------------------
-- Deployment
--------------------------------------------------------------------------------

CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5WEB/QRPGLESRC) FROMMBR(K3S_APIPRO) TOMBR(K3S_APIPRO);

-- AR_DAYPROR
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(AR_DAYPROR) TOMBR(AR_DAYPROR);
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_DAYPROR) SRCFILE(WEB_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) TGTRLS(V7R2M0);

-- AC_DAYPROR
CL: CPYSRCF FROMFILE(WEB_5TDV/QCLLESRC) TOFILE(WEB_5DEV/QCLLESRC) FROMMBR(AC_DAYPROR) TOMBR(AC_DAYPROR);
CL: CRTBNDCL PGM(WEB_5OBJ/AC_DAYPROR) SRCFILE(WEB_5DEV/QCLLESRC) OPTION(*EVENTF);

-- TS_DAYPROR
CL: CPYSRCF FROMFILE(WEB_5TDV/QCLLESRC) TOFILE(WEB_5DEV/QCLLESRC) FROMMBR(TS_DAYPROR) TOMBR(TS_DAYPROR);
CL: CRTBNDCL PGM(WEB_5OBJ/TS_DAYPROR) SRCFILE(WEB_5DEV/QCLLESRC) OPTION(*EVENTF);

CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_DAYPROR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AC_DAYPROR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5OBJ/TS_DAYPROR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

--------------------------------------------------------------------------------
-- Hotfix to self-hosted
--------------------------------------------------------------------------------

-- Clear save file
CL: CLRSAVF FILE(QGPL/r6objects);

-- Add objects to save file
CL: SAVOBJ OBJ(AC_DAYPROR AR_DAYPROR TS_DAYPROR) LIB(ACS_5OBJ) DEV(*SAVF) SAVF(QGPL/r6objects);

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


--------------------------------------------------------------------------------
-- Hotfix to hosted
--------------------------------------------------------------------------------
-- Clear the save file
CL: CLRSAVF FILE(QGPL/APIMISSCHK);

-- Add API object in error to save file
CL: SAVOBJ OBJ(AR_DAYPROR AC_DAYPROR TS_DAYPROR) LIB(WEB_5OBJ) DEV(*SAVF) SAVF(QGPL/APIMISSCHK);

-- Transfer save file
CL: CALL QGPL/CBEAN_PUTL;

-- on Leno...

-- Restore the save file objects to library DMO
CL: RSTOBJ OBJ(*ALL) SAVLIB(WEB_5OBJ) DEV(*SAVF) SAVF(QGPL/APIMISSCHK) RSTLIB(DMO_5OBJ) ALWOBJDIF(*ALL) MBROPT(*ALL);


--------------------------------------------------------------------------------
-- Hotfix to self-hosted
--------------------------------------------------------------------------------
-- Clear the save file
CL: CLRSAVF FILE(QGPL/APIMISSCHK);

-- Add API object in error to save file
CL: SAVOBJ OBJ(AR_PUSORDR AR_LTMAPOR) LIB(WEB_5OBJ) DEV(*SAVF) SAVF(QGPL/APIMISSCHK);

-- Transfer save file
CL: CALL QGPL/CBEAN_PUTL;


--------------------------------------------------------------------------------
-- Hotfix to Conan DR
--------------------------------------------------------------------------------

-- Clear the save file
CL: CLRSAVF FILE(QGPL/APIMISSCHK);

-- Add API objects to save file
CL: SAVOBJ OBJ(AR_PUSORDR AR_LTMAPOR) LIB(WEB_5OBJ) DEV(*SAVF) SAVF(QGPL/APIMISSCHK);

-- Transfer save file
CL: CALL QGPL/CBEANPUTDR;
