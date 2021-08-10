-- GH829

--------------------------------------------------------------------------------
-- In Development
--------------------------------------------------------------------------------

-------------------------------------------------------
-- Run During Development
-------------------------------------------------------

-- AR_APRORDR
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_APRORDR) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);

-- AC_APRORDR
CL: CRTBNDCL PGM(ACS_5OBJ/AC_APRORDR) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- TS_APRORDR
CL: CRTBNDCL PGM(ACS_5OBJ/TS_APRORDR) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);

--CL: CALL ACS_5OBJ/TS_APRORDR;

CL: GRTOBJAUT OBJ(ACS_5OBJ/*ALL) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


--------------------------------------------------------------------------------
-- Integrated Testing Environment
--------------------------------------------------------------------------------

-- AR_APRORDR
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_APRORDR) TOMBR(AR_APRORDR);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_APRORDR) SRCFILE(WEB_5TDV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);

-- AC_APRORDR
CL: CPYSRCF FROMFILE(ACS_5DEV/QCLLESRC) TOFILE(WEB_5TDV/QCLLESRC) FROMMBR(AC_APRORDR) TOMBR(AC_APRORDR);
CL: CRTBNDCL PGM(WEB_5TST/AC_APRORDR) SRCFILE(WEB_5TDV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);

CL: GRTOBJAUT OBJ(WEB_5TST/*ALL) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


--------------------------------------------------------------------------------
-- Deployment
--------------------------------------------------------------------------------

-- AR_APRORDR
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(AR_APRORDR) TOMBR(AR_APRORDR);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_APRORDR) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);

CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_APRORDR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


--------------------------------------------------------------------------------
-- Hotfix to FTP site
--------------------------------------------------------------------------------

-- Clear save file
CL: CLRSAVF FILE(QGPL/r6objects);

-- Add objects to save file
CL: SAVOBJ OBJ(AR_APRORDR AC_APRORDR) LIB(ACS_5OBJ) DEV(*SAVF) SAVF(QGPL/r6objects);

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
