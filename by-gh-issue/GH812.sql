-- GH812

--------------------------------------------------------------------------------
-- In Development
--------------------------------------------------------------------------------

-- AR_3052
CL: CRTSQLRPGI OBJ(ACS_5DEV/AR_3052) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);

-- AR_GENHOLD
CL: CRTSQLRPGI OBJ(ACS_5DEV/AR_GENHOLD) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);

CL: GRTOBJAUT OBJ(ACS_5DEV/AR_3052) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(ACS_5DEV/AR_GENHOLD) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


--------------------------------------------------------------------------------
-- Integrated Testing Environment
--------------------------------------------------------------------------------
-- AR_3052
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_3052) TOMBR(AR_3052);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_3052) SRCFILE(WEB_5TDV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);

-- AR_GENHOLD
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_GENHOLD) TOMBR(AR_GENHOLD);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_GENHOLD) SRCFILE(WEB_5TDV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);

CL: GRTOBJAUT OBJ(WEB_5TST/AR_3052) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5TST/AR_GENHOLD) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


--------------------------------------------------------------------------------
-- Deployment
--------------------------------------------------------------------------------
-- AR_3052
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(AR_3052) TOMBR(AR_3052);
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_3052) SRCFILE(WEB_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) TGTRLS(V7R2M0);

-- AR_GENHOLD
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(AR_GENHOLD) TOMBR(AR_GENHOLD);
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_GENHOLD) SRCFILE(WEB_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) TGTRLS(V7R2M0);

CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_3052) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_GENHOLD) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


--------------------------------------------------------------------------------
-- Hotfix to self-hosted
--------------------------------------------------------------------------------

-- Clear save file
CL: CLRSAVF FILE(QGPL/r6objects);

-- Add objects to save file
CL: SAVOBJ OBJ(AR_3052 AC_3052) LIB(ACS_5DEV) DEV(*SAVF) SAVF(QGPL/r6objects);

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
CL: SAVOBJ OBJ(AR_3052) LIB(WEB_5OBJ) DEV(*SAVF) SAVF(QGPL/APIMISSCHK);

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
CL: SAVOBJ OBJ(AR_3052) LIB(WEB_5OBJ) DEV(*SAVF) SAVF(QGPL/APIMISSCHK);

-- Transfer save file
CL: CALL QGPL/CBEAN_PUTL;

