﻿--------------------------------------------------------------------------------
-- In Development
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(DEV)

-------------------------------
--          APIs
-------------------------------

-- AR_GRPBCHS
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_GRPBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_GRPBCHS) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_GRPBCHS
CL: CRTBNDCL PGM(ACS_5OBJ/AC_GRPBCHS) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_GRPBCHS) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_GRPBCHS
CL: CRTBNDCL PGM(ACS_5OBJ/TS_GRPBCHS) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_GRPBCHS) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


--------------------------------------------------------------------------------
-- Integrated Testing Environment
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(ITE)

CL: CPYSRCF FROMFILE(ACS_5WEB/QRPGLESRC) TOFILE(WEB_5WEB/QRPGLESRC) FROMMBR(K3S_APIPRO) TOMBR(K3S_APIPRO);

-- APIs
CL: CALL PGM(DEVTOOLS/APIPRART) PARM('AR_GRPBCHS' 'ACS_5DEV' 'QRPGLESRC' 'QRPGLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');

-- CL Wrappers
CL: CALL PGM(DEVTOOLS/APIPRACT) PARM('AC_GRPBCHS' 'ACS_5DEV' 'QCLLESRC' 'QCLLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');

-- Tests
CL: CALL PGM(DEVTOOLS/APIPRACT) PARM('TS_GRPBCHS' 'ACS_5DEV' 'QCLLESRC' 'QCLLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');


--------------------------------------------------------------------------------
-- Deployment
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(DPL)
-- Search source members for any other references to changed d spec copy members


-- APIs
CL: CALL PGM(DEVTOOLS/APIPRARD) PARM('AR_GRPBCHS' 'WEB_5TDV' 'QRPGLESRC' 'QRPGLESRC' 'WEB_5DEV' 'WEB_5OBJ' 'QSRVSRC' 'K3SDIR');

-- CL Wrappers
CL: CALL PGM(DEVTOOLS/APIPRACT) PARM('AC_GRPBCHS' 'WEB_5TDV' 'QCLLESRC' 'QCLLESRC' 'WEB_5DEV' 'WEB_5OBJ' 'QSRVSRC' 'K3SDIR');

-- Set to current date
CL: CHGDTAARA DTAARA(WEB_5OBJ/AR_RELEASE *ALL) VALUE('062722');

--------------------------------------------------------------------------------
-- Hotfix to FTP site
--------------------------------------------------------------------------------

-- Clear save file
CL: CLRSAVF FILE(QGPL/k3shotfix);

-- Add objects to save file
CL: SAVOBJ OBJ(AR_SSIREPT AC_PSIMISC AR_INVLOG AR_INVRLOG AS_SSTOCK AS_PRDINVT AR_PRDINVT AC_PRDINVT AC_SSIREPT AR_INVLOG AC_INVLOG AR_PSIREPT AC_PSIREPT AC_PRIREPT AC_PTHREPT) LIB(WEB_5TST) DEV(*SAVF) SAVF(QGPL/k3shotfix);
CL: SAVOBJ OBJ(AR_PSIREPT) LIB(WEB_5TST) DEV(*SAVF) SAVF(QGPL/k3shotfix);



-- Upload savefile to Smartfile FTP site
--  (on Conan Dev)
FTP RMTSYS(K3S.FILES.COM)
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
CL: SAVOBJ OBJ(TS_SSIREPT AC_SSIREPT AC_PRIREPT AC_PSIREPT) LIB(ACS_5OBJ) DEV(*SAVF) SAVF(QGPL/APIMISSCHK);


-- Transfer save file
CL: CALL QGPL/CBEAN_PUTL;

-- on Leno...

-- Restore the save file objects to library DMO
CL: RSTOBJ OBJ(*ALL) SAVLIB(WEB_5TST) DEV(*SAVF) SAVF(QGPL/APIMISSCHK) RSTLIB(HHH_5OBJ) ALWOBJDIF(*ALL) MBROPT(*ALL);
