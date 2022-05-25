-- GH798

--------------------------------------------------------------------------------
-- In Development
--------------------------------------------------------------------------------

-- AR_APRORDR
CL: CRTSQLRPGI OBJ(ACS_5DEV/AR_APRORDR) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);

-- AC_3052
-- CL: CRTBNDCL PGM(ACS_5DEV/AC_3052) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);


--------------------------------------------------------------------------------
-- Integrated Testing Environment
--------------------------------------------------------------------------------

-- AR_1106_H
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_1106_H) TOMBR(AR_1106_H);

-- AR_APRORDR
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_APRORDR) TOMBR(AR_APRORDR);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_APRORDR) SRCFILE(WEB_5TDV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);

-- AC_APRORDR
-- CL: CPYSRCF FROMFILE(ACS_5DEV/QCLLESRC) TOFILE(WEB_5TDV/QCLLESRC) FROMMBR(AC_APRORDR) TOMBR(AC_APRORDR);
-- CL: CRTBNDCL PGM(WEB_5TST/AC_APRORDR) SRCFILE(WEB_5TDV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);


--------------------------------------------------------------------------------
-- Deployment
--------------------------------------------------------------------------------
-- AR_APRORDR
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(AR_APRORDR) TOMBR(AR_APRORDR);
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_APRORDR) SRCFILE(WEB_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) TGTRLS(V7R2M0);

-- AC_APRORDR
CL: DLTOBJ OBJ(WEB_5OBJ/AC_APRORDR) OBJTYPE(*PGM);
CL: CPYSRCF FROMFILE(WEB_5TDV/QCLLESRC) TOFILE(WEB_5DEV/QCLLESRC) FROMMBR(AC_APRORDR) TOMBR(AC_APRORDR);
CL: CRTBNDCL PGM(WEB_5OBJ/AC_APRORDR) SRCFILE(WEB_5DEV/QCLLESRC) OPTION(*EVENTF);

CL: GRTOBJAUT OBJ(WEB_5DEV/AR_APRORDR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


--------------------------------------------------------------------------------
-- Hotfix to self-hosted
--------------------------------------------------------------------------------

-- Clear save file
CL: CLRSAVF FILE(QGPL/r6objects);

-- Add objects to save file
CL: SAVOBJ OBJ(AR_APRORDR AC_APRORDR) LIB(ACS_5DEV) DEV(*SAVF) SAVF(QGPL/r6objects);

-- Upload savefile to Smartfile FTP site
--  (on Conan Dev)
FTP RMTSYS(K3S.SMARTFILE.COM)
> cd /R6_Deployment/Customer_Access
  250 "/Chuk" is the current directory.
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
CL: SAVOBJ OBJ(AR_ADDLINK TS_ADDLINK) LIB(ACS_5OBJ) DEV(*SAVF) SAVF(QGPL/APIMISSCHK);

-- Transfer save file
CL: CALL QGPL/CBEAN_PUTL;

-- on Leno...

-- Restore the save file objects to library DMO
CL: RSTOBJ OBJ(*ALL) SAVLIB(ACS_5OBJ) DEV(*SAVF) SAVF(QGPL/APIMISSCHK) RSTLIB(DMO_5OBJ) ALWOBJDIF(*ALL) MBROPT(*ALL);


--------------------------------------------------------------------------------
-- Hotfix to self-hosted
--------------------------------------------------------------------------------
-- Clear the save file
CL: CLRSAVF FILE(QGPL/APIMISSCHK);

-- Add API object in error to save file
CL: SAVOBJ OBJ(AR_APRORDR) LIB(WEB_5OBJ) DEV(*SAVF) SAVF(QGPL/APIMISSCHK);

-- Transfer save file
CL: CALL QGPL/CBEAN_PUTL;

