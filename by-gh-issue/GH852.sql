-- GH852

CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(K3S_APIPRO) TOMBR(K3S_APIPRO);


--------------------------------------------------------------------------------
-- In Development
--------------------------------------------------------------------------------
CREATE INDEX WEB_5WEB.USER_IDX
    ON WEB_5WEB.USER ("user_id" ASC) UNIT ANY KEEP IN MEMORY NO;

CREATE INDEX WEB_5WEB.USERLOCN_IDX
    ON WEB_5WEB.USERLOCN ("user_id" ASC) UNIT ANY KEEP IN MEMORY NO;



-------------------------------------------------------
-- Run During Development
-------------------------------------------------------

-- SMANITE
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_SMANITE) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTBNDCL PGM(ACS_5OBJ/AC_SMANITE) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: CRTBNDCL PGM(ACS_5OBJ/TS_SMANITE) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Testing AC_SMANITE');
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_SMANITE) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_SMANITE) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_SMANITE) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

--------------------------------------------------------------------------------
-- Integrated Testing Environment
--------------------------------------------------------------------------------

CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(K3S_APIPRO) TOMBR(K3S_APIPRO);

-- AR_SMANITE
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_SMANITE) TOMBR(AR_SMANITE);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_SMANITE) SRCFILE(WEB_5TDV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);

-- AC_SMANITE
CL: CPYSRCF FROMFILE(ACS_5DEV/QCLLESRC) TOFILE(WEB_5TDV/QCLLESRC) FROMMBR(AC_SMANITE) TOMBR(AC_SMANITE);
CL: CRTBNDCL PGM(WEB_5TST/AC_SMANITE) SRCFILE(WEB_5TDV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);

CL: GRTOBJAUT OBJ(WEB_5TST/AR_SMANITE) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: GRTOBJAUT OBJ(WEB_5TST/AC_SMANITE) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


-- AR_INVLOG  todo: remove
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_NITTOT) TOMBR(AR_NITTOT);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_NITTOT) SRCFILE(WEB_5TDV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);



--------------------------------------------------------------------------------
-- Deployment
--------------------------------------------------------------------------------

CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(K3S_APIPRO) TOMBR(K3S_APIPRO);
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5WEB/QRPGLESRC) FROMMBR(K3S_APIPRO) TOMBR(K3S_APIPRO);

-- AR_SMANITE
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(AR_SMANITE) TOMBR(AR_SMANITE);
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_SMANITE) SRCFILE(WEB_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) TGTRLS(V7R2M0);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_SMANITE) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_SMANITE
CL: CPYSRCF FROMFILE(WEB_5TDV/QCLLESRC) TOFILE(WEB_5DEV/QCLLESRC) FROMMBR(AC_SMANITE) TOMBR(AC_SMANITE);
CL: CRTBNDCL PGM(WEB_5OBJ/AC_SMANITE) SRCFILE(WEB_5DEV/QCLLESRC) OPTION(*EVENTF);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AC_SMANITE) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

--------------------------------------------------------------------------------
-- Hotfix to FTP site
--------------------------------------------------------------------------------

-- Clear save file
CL: CLRSAVF FILE(QGPL/r6objects);

-- Add objects to save file
CL: SAVOBJ OBJ(AR_SMANITE AC_SMANITE) LIB(WEB_5OBJ) DEV(*SAVF) SAVF(QGPL/r6objects);

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
;



--------------------------------------------------------------------------------
-- Hotfix to Conan DR
--------------------------------------------------------------------------------

-- Clear the save file
CL: CLRSAVF FILE(QGPL/APIMISSCHK);

-- Add API objects to save file
CL: SAVOBJ OBJ(AR_SMANITE AC_SMANITE) LIB(WEB_5OBJ) DEV(*SAVF) SAVF(QGPL/APIMISSCHK);

-- Transfer save file
CL: CALL QGPL/CBEANPUTDR;
