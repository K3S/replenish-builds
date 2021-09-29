-- GH843

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

CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(INTORDF_H) TOMBR(INTOR);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_POUORDR) TOMBR(AR_POUORDR);



--------------------------------------------------------------------------------
-- In Development
--------------------------------------------------------------------------------

-- Service Program(s)
-- AR_INTCAML
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AR_INTCAML);
CL: DLTOBJ OBJ(ACS_5OBJ/AR_INTCAML) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(ACS_5OBJ/AR_INTCAML) OBJTYPE(*MODULE);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_INTCAML) SRCFILE(ACS_5DEV/QRPGLESRC) OBJTYPE(*MODULE) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSRVPGM SRVPGM(ACS_5OBJ/AR_INTCAML) MODULE(ACS_5OBJ/AR_INTCAML) SRCFILE(ACS_5DEV/QSRVSRC) SRCMBR(INTCAML_B) BNDDIR(K3SDIR) TEXT('Web-Service Prog. 2 Insert/Delete/Update K_INTCAML');
CL: ADDBNDDIRE BNDDIR(K3SDIR) OBJ((AR_INTCAML));

-- API Program(s)
-- AR_POUORDR
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_POUORDR) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0) TEXT('Web - Update K3S PO with Customer PO');

-- Authority
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_INTCAML) OBJTYPE(*SRVPGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_POUORDR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

--------------------------------------------------------------------------------
-- Integrated Testing Environment
--------------------------------------------------------------------------------

-- Service Program(s)
-- AR_INTCAML
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AR_INTCAML);
CL: DLTOBJ OBJ(WEB_5TST/AR_INTCAML) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(WEB_5TST/AR_INTCAML) OBJTYPE(*MODULE);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_INTCAML) TOMBR(AR_INTCAML);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(INTCAML_H) TOMBR(INTCAML_H);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_INTCAML) SRCFILE(WEB_5TDV/QRPGLESRC) OBJTYPE(*MODULE) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CPYSRCF FROMFILE(ACS_5DEV/QSRVSRC) TOFILE(WEB_5TDV/QSRVSRC) FROMMBR(INTCAML_B) TOMBR(INTCAML_B);
CL: CRTSRVPGM SRVPGM(WEB_5TST/AR_INTCAML) MODULE(WEB_5TST/AR_INTCAML) SRCFILE(WEB_5TDV/QSRVSRC) SRCMBR(INTCAML_B) BNDDIR(K3SDIR) TEXT('Web-Service Prog. 2 Insert/Delete/Update K_INTCAML');
CL: ADDBNDDIRE BNDDIR(K3SDIR) OBJ((AR_INTCAML));

-- API Program(s)
-- AR_POUORDR
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_POUORDR) TOMBR(AR_POUORDR);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_POUORDR) SRCFILE(WEB_5TDV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0) TEXT('Web - Update K3S PO with Customer PO');

CL: GRTOBJAUT OBJ(WEB_5TST/AR_INTCAML) OBJTYPE(*SRVPGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5TST/AR_POUORDR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


--------------------------------------------------------------------------------
-- Deployment
--------------------------------------------------------------------------------

-- Service Program(s)
-- AR_INTCAML
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AR_INTCAML);
CL: DLTOBJ OBJ(WEB_5OBJ/AR_INTCAML) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(WEB_5OBJ/AR_INTCAML) OBJTYPE(*MODULE);
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(AR_INTCAML) TOMBR(AR_INTCAML);
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(INTCAML_H) TOMBR(INTCAML_H);
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_INTCAML) SRCFILE(WEB_5DEV/QRPGLESRC) OBJTYPE(*MODULE) TGTRLS(V7R2M0);
CL: CPYSRCF FROMFILE(WEB_5TDV/QSRVSRC) TOFILE(WEB_5DEV/QSRVSRC) FROMMBR(INTCAML_B) TOMBR(INTCAML_B);
CL: CRTSRVPGM SRVPGM(WEB_5OBJ/AR_INTCAML) MODULE(WEB_5OBJ/AR_INTCAML) SRCFILE(WEB_5DEV/QSRVSRC) SRCMBR(INTCAML_B) BNDDIR(K3SDIR) TEXT('Web-Service Prog. 2 Insert/Delete/Update K_INTCAML');
CL: ADDBNDDIRE BNDDIR(K3SDIR) OBJ((AR_INTCAML));

-- AR_POUORDR
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(AR_POUORDR) TOMBR(AR_POUORDR);
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_POUORDR) SRCFILE(WEB_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) TGTRLS(V7R2M0) TEXT('<api_text>');

CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_INTCAML) OBJTYPE(*SRVPGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_POUORDR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

--------------------------------------------------------------------------------
-- Hotfix to self-hosted
--------------------------------------------------------------------------------

-- Clear save file
CL: CLRSAVF FILE(QGPL/r6objects);

-- Add objects to save file
CL: SAVOBJ OBJ(AR_INTCAML AR_POUORDR) LIB(ACS_5OBJ) DEV(*SAVF) SAVF(QGPL/r6objects);

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
CL: SAVOBJ OBJ(AR_POUORDR AC_POUORDR TS_POUORDR) LIB(WEB_5OBJ) DEV(*SAVF) SAVF(QGPL/APIMISSCHK);

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
