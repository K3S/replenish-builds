--------------------------------------------------------------------------------
-- In Development
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(DEV)

-------------------------------
--    Service Programs
-------------------------------
CL: CALL PGM(DEVTOOLS/APISRVPGM) PARM('AR_POSTS' 'ACS_5DEV' 'QRPGLESRC' 'ACS_5OBJ' 'QSRVSRC' 'K3SDIR');

-------------------------------
--          APIs
-------------------------------
-- AR_PUSORDR
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PUSORDR) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_PUSORDR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


--------------------------------------------------------------------------------
-- Integrated Testing Environment
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(ITE)

CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_POSTS) TOMBR(AR_POSTS);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(POSTS_H) TOMBR(POSTS_H);
CL: CPYSRCF FROMFILE(ACS_5DEV/QSRVSRC) TOFILE(WEB_5TDV/QSRVSRC) FROMMBR(POSTS_B) TOMBR(POSTS_B);

-- Service Programs
CL: CALL PGM(ACS_5OBJ/APIPRSRVT) PARM('AR_POSTS' 'ACS_5DEV' 'QRPGLESRC' 'QRPGLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');

-- APIs
CL: CALL PGM(DEVTOOLS/APIPRART) PARM('AR_PUSORDR' 'ACS_5DEV' 'QRPGLESRC' 'QRPGLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');

--------------------------------------------------------------------------------
-- Deployment
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(DPL)

-- Service Programs
CL: CALL PGM(DEVTOOLS/APIPRSRVD) PARM('AR_POSTS' 'WEB_5TDV' 'QRPGLESRC' 'QRPGLESRC' 'WEB_5DEV' 'WEB_5OBJ' 'QSRVSRC' 'K3SDIR');

-- APIs
CL: CALL PGM(DEVTOOLS/APIPRARD) PARM('AR_DELDEAL' 'WEB_5TDV' 'QRPGLESRC' 'QRPGLESRC' 'WEB_5DEV' 'WEB_5OBJ' 'QSRVSRC' 'K3SDIR');

-- Set to current date
CL: CHGDTAARA DTAARA(WEB_5OBJ/AR_RELEASE *ALL) VALUE('041522');

--------------------------------------------------------------------------------
-- Hotfix to FTP site
--------------------------------------------------------------------------------

-- Clear save file
CL: CLRSAVF FILE(QGPL/k3shotfix);

-- Add objects to save file
CL: SAVOBJ OBJ(AR_PUSORDR AR_POSTS) LIB(WEB_5TST) DEV(*SAVF) SAVF(QGPL/k3shotfix);

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



-- Hotfix to Conan DR

-- Clear the save file
CL: CLRSAVF FILE(QGPL/APIMISSCHK);

-- Add API objects to save file
CL: SAVOBJ OBJ(AR_INVLOG) LIB(ACS_5OBJ) DEV(*SAVF) SAVF(QGPL/APIMISSCHK);

-- Transfer save file
CL: CALL QGPL/CBEANPUTDR;

-- on Conan DR...
CL: RSTOBJ OBJ(AR_INVLOG) SAVLIB(ACS_5OBJ) DEV(*SAVF) SAVF(QGPL/APIMISSCHK) RSTLIB(RES_5OBJ) ALWOBJDIF(*ALL) MBROPT(*ALL);


select distinct(XE_PROD), (select XE from (select XE_PROD, XE_LOCN from cmm_5dev.dalyint2 group by XE_PROD, XE_LOCN);


--------------------------------------------------------------------------------
-- Hotfix to hosted
--------------------------------------------------------------------------------
-- Clear the save file
CL: CLRSAVF FILE(QGPL/APIMISSCHK);

-- Add API object in error to save file
CL: SAVOBJ OBJ(AR_MFUBHED AR_MFUBENT AS_MFUBCH AR_INTMFUB AR_PRODUCT AR_ADDMFUB AR_DELMFUB AR_UPBMFUB AR_LCKMFUB AR_UNLMFUB AR_ADEMFUB AR_DLEMFUB AR_UPEMFUB AR_PROMFUB AR_IMPMFUB AR_GBEMFUB AR_USRMFUB AC_ADDMFUB AC_DELMFUB AC_UPBMFUB AC_LCKMFUB AC_UNLMFUB AC_ADEMFUB AC_DLEMFUB AC_UPEMFUB AC_PROMFUB AC_IMPMFUB AC_GBEMFUB AC_USRMFUB TS_ADDMFUB TS_DELMFUB TS_UPBMFUB TS_LCKMFUB TS_UNLMFUB TS_ADEMFUB TS_DLEMFUB TS_UPEMFUB TS_PROMFUB TS_IMPMFUB TS_GBEMFUB TS_USRMFUB) LIB(WEB_5OBJ) DEV(*SAVF) SAVF(QGPL/APIMISSCHK);

-- Add API object in error to save file
CL: SAVOBJ OBJ(K_MFUBHED K_MFUBENT K_INTMFUB) LIB(WEB_5MOD) DEV(*SAVF) SAVF(QGPL/APIMISSCHK);


CL: CRTPF FILE(WEB_5MOD/K_MFUBHED) SRCFILE(ACS_5DEV/QDDSSRC) SRCMBR(K_MFUBHED) IGCDTA(*N);
CL: CRTPF FILE(WEB_5MOD/K_MFUBENT) SRCFILE(ACS_5DEV/QDDSSRC) SRCMBR(K_MFUBENT) IGCDTA(*N);
CL: CRTPF FILE(WEB_5MOD/K_INTMFUB) SRCFILE(ACS_5DEV/QDDSSRC) SRCMBR(K_INTMFUB) IGCDTA(*N);










-- Transfer save file
CL: CALL QGPL/CBEAN_PUTL;

-- on Leno...

-- Restore the save file objects to library DMO
CL: RSTOBJ OBJ(*ALL) SAVLIB(ACS_5DEV) DEV(*SAVF) SAVF(QGPL/APIMISSCHK) RSTLIB(DMO_5OBJ) ALWOBJDIF(*ALL) MBROPT(*ALL);
