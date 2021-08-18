-- GH811

-- 1. Name this file after its corresponding GitHub issue
-- 2. Search for <api_name> and replace with API program name (shift + command + H)
-- 3. Remove service program compile commands if not used
-- 4. Search for <api_text> and replace with API text
-- 5. Search for <api_test_text> and replace with API test text
-- 6. If service programs are involved...
--    A. Search for <srvpgm_name> and replace with service program name
--    B. Search for <srvpgm_text> and replace with service program text
--

--------------------------------------------------------------------------------
-- In Development
--------------------------------------------------------------------------------

-- Service Program(s)
-- AR_<srvpgm_name>
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AR_<srvpgm_name>);
CL: DLTOBJ OBJ(ACS_5OBJ/AR_<srvpgm_name>) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(ACS_5OBJ/AR_<srvpgm_name>) OBJTYPE(*MODULE);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_<srvpgm_name>) SRCFILE(ACS_5DEV/QRPGLESRC) OBJTYPE(*MODULE) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSRVPGM SRVPGM(ACS_5OBJ/AR_<srvpgm_name>) MODULE(ACS_5OBJ/AR_<srvpgm_name>) SRCFILE(ACS_5DEV/QSRVSRC) SRCMBR(<srvpgm_name>_B) BNDDIR(K3SDIR) TEXT('<srvpgm_text>');
CL: ADDBNDDIRE BNDDIR(K3SDIR) OBJ((AR_<srvpgm_name>));


-- API Program(s)
-- AR_<api_name>
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_<api_name>) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0) TEXT('<api_text>');

-- AC_<api_name>
CL: CRTBNDCL PGM(ACS_5OBJ/AC_<api_name>) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('<api_text>');

-- TS_<api_name>
CL: CRTBNDCL PGM(ACS_5OBJ/TS_<api_name>) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('<api_test_text>');


-- Authority
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_<srvpgm_name>) OBJTYPE(*SRVPGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_<api_name>) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_<api_name>) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_<api_name>) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


--------------------------------------------------------------------------------
-- Integrated Testing Environment
--------------------------------------------------------------------------------

-- Service Program(s)
-- AR_<srvpgm_name>
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AR_<srvpgm_name>);
CL: DLTOBJ OBJ(WEB_5TST/<srvpgm_name>) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(WEB_5TST/<srvpgm_name>) OBJTYPE(*MODULE);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_<srvpgm_name>) TOMBR(AR_<srvpgm_name>);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(<srvpgm_name>_H) TOMBR(<srvpgm_name>_H);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_<srvpgm_name>) SRCFILE(WEB_5TDV/QRPGLESRC) OBJTYPE(*MODULE) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CPYSRCF FROMFILE(ACS_5DEV/QSRVSRC) TOFILE(WEB_5TDV/QSRVSRC) FROMMBR(<srvpgm_name>_B) TOMBR(<srvpgm_name>_B);
CL: CRTSRVPGM SRVPGM(WEB_5TST/AR_<srvpgm_name>) MODULE(WEB_5TST/AR_<srvpgm_name>) SRCFILE(WEB_5TDV/QSRVSRC) SRCMBR(<srvpgm_name>_B) BNDDIR(K3SDIR) TEXT('<srvpgm_text>');
CL: ADDBNDDIRE BNDDIR(K3SDIR) OBJ((<srvpgm_name>));

-- API Program(s)
-- AR_<api_name>
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_<api_name>) TOMBR(AR_<api_name>);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_<api_name>) SRCFILE(WEB_5TDV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0) TEXT('<api_text>');

-- AC_<api_name>
CL: CPYSRCF FROMFILE(ACS_5DEV/QCLLESRC) TOFILE(WEB_5TDV/QCLLESRC) FROMMBR(AC_<api_name>) TOMBR(AC_<api_name>);
CL: CRTBNDCL PGM(WEB_5TST/AC_<api_name>) SRCFILE(WEB_5TDV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('<api_text>');

-- TS_<api_name>
CL: CPYSRCF FROMFILE(ACS_5DEV/QCLLESRC) TOFILE(WEB_5TDV/QCLLESRC) FROMMBR(TS_<api_name>) TOMBR(TS_<api_name>);
CL: CRTBNDCL PGM(WEB_5TST/TS_<api_name>) SRCFILE(WEB_5TDV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('<api_test_text>');

CL: GRTOBJAUT OBJ(WEB_5TST/AR_<srvpgm_name>) OBJTYPE(*SRVPGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5TST/AR_<api_name>) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5TST/AC_<api_name>) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5TST/TS_<api_name>) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


--------------------------------------------------------------------------------
-- Deployment
--------------------------------------------------------------------------------

-- Service Program(s)
-- AR_<srvpgm_name>
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(AR_<srvpgm_name>) TOMBR(AR_<srvpgm_name>);
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_<srvpgm_name>) SRCFILE(WEB_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) TGTRLS(V7R2M0) TEXT('<srvpgm_text>');

-- AR_<api_name>
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(AR_<api_name>) TOMBR(AR_<api_name>);
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_<api_name>) SRCFILE(WEB_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) TGTRLS(V7R2M0) TEXT('<api_text>');

-- AC_<api_name>
CL: CPYSRCF FROMFILE(WEB_5TDV/QCLLESRC) TOFILE(WEB_5DEV/QCLLESRC) FROMMBR(AC_<api_name>) TOMBR(AC_<api_name>);
CL: CRTBNDCL PGM(WEB_5OBJ/AC_<api_name>) SRCFILE(WEB_5DEV/QCLLESRC) OPTION(*EVENTF) TEXT('<api_text>');

-- TS_<api_name>
CL: CPYSRCF FROMFILE(WEB_5TDV/QCLLESRC) TOFILE(WEB_5DEV/QCLLESRC) FROMMBR(TS_<api_name>) TOMBR(TS_<api_name>);
CL: CRTBNDCL PGM(WEB_5OBJ/TS_<api_name>) SRCFILE(WEB_5DEV/QCLLESRC) OPTION(*EVENTF) TEXT('<api_test_text>');

CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_<srvpgm_name>) OBJTYPE(*SRVPGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_<api_name>) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AC_<api_name>) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5OBJ/TS_<api_name>) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

--------------------------------------------------------------------------------
-- Hotfix to self-hosted
--------------------------------------------------------------------------------

-- Clear save file
CL: CLRSAVF FILE(QGPL/r6objects);

-- Add objects to save file
CL: SAVOBJ OBJ(AR_<srvpgm_name> AC_<api_name> AR_<api_name> TS_<api_name>) LIB(ACS_5OBJ) DEV(*SAVF) SAVF(QGPL/r6objects);

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
CL: SAVOBJ OBJ(AR_<api_name> AR_LTMAPOR) LIB(WEB_5OBJ) DEV(*SAVF) SAVF(QGPL/APIMISSCHK);

-- Transfer save file
CL: CALL QGPL/CBEAN_PUTL;

-- on Leno...

-- Restore the save file objects to library DMO
CL: RSTOBJ OBJ(*ALL) SAVLIB(ACS_5DEV) DEV(*SAVF) SAVF(QGPL/APIMISSCHK) RSTLIB(DMO_5OBJ) ALWOBJDIF(*ALL) MBROPT(*ALL);


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
