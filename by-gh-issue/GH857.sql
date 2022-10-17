﻿
-- CL: CPYSRCF FROMFILE(WEB_5DEV/QCLLESRC) TOFILE(ACS_5DEV/QCLLESRC) FROMMBR(AC_OBSREPT) TOMBR(AC_OBSREPT);

--------------------------------------------------------------------------------
-- In Development
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(DEV)

-------------------------------
--          APIs
-------------------------------

-- AR_UPDSUPL
CL: CHGATR OBJ('/home/chuk/apps/k3s-replenish-rpg/qrpglesrc/ar_updsupl.pgm.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/home/chuk/apps/K3S-Replenish-RPG'; 
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_UPDSUPL) SRCSTMF('/home/chuk/apps/k3s-replenish-rpg/qrpglesrc/ar_updsupl.pgm.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) CVTCCSID(*JOB);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_UPDSUPL) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_UPDSUPL
CL: CRTBNDCL PGM(ACS_5OBJ/AC_UPDSUPL) SRCSTMF('/home/chuk/apps/k3s-replenish-RPG/qcllesrc/ac_updsupl.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_UPDSUPL) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_UPDSUPL
CL: CRTBNDCL PGM(ACS_5OBJ/TS_UPDSUPL) SRCSTMF('/home/chuk/apps/k3s-replenish-RPG/qcllesrc/ts_updsupl.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_UPDSUPL) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


-- AR_2001A
CL: CHGATR OBJ('/home/chuk/apps/k3s-replenish-rpg/qrpglesrc/ar_2001a.pgm.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/home/chuk/apps/K3S-Replenish-RPG'; 
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_2001A) SRCSTMF('/home/chuk/apps/k3s-replenish-rpg/qrpglesrc/ar_2001A.pgm.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) CVTCCSID(*JOB);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_2001A) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_2001A
CL: CRTBNDCL PGM(ACS_5OBJ/AC_2001A) SRCSTMF('/home/chuk/apps/k3s-replenish-RPG/qcllesrc/ac_2001a.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_2001A) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_2001A
CL: CRTBNDCL PGM(ACS_5OBJ/TS_2001A)  SRCSTMF('/home/chuk/apps/k3s-replenish-RPG/qcllesrc/ts_2001a.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_2001A) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


--------------------------------------------------------------------------------
-- Integrated Testing Environment
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(ITE)

CL: CPYSRCF FROMFILE(ACS_5WEB/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(K3S_APIPRO) TOMBR(K3S_APIPRO);

-----------------------------
-- APIs
-----------------------------
-- AR_UPDSUPL
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qrpglesrc/ar_UPDSUPL.pgm.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_UPDSUPL.pgm.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_UPDSUPL.pgm.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/testing'; 
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_UPDSUPL) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_UPDSUPL.pgm.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);

-- AC_UPDSUPL
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qcllesrc/ac_UPDSUPL.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_UPDSUPL.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_UPDSUPL.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5TST/AC_UPDSUPL) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_UPDSUPL.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- TS_UPDSUPL
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qcllesrc/TS_UPDSUPL.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/TS_UPDSUPL.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/TS_UPDSUPL.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5TST/TS_UPDSUPL) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/TS_UPDSUPL.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);


-- AR_2001A
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qrpglesrc/ar_2001A.pgm.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_2001A.pgm.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_2001A.pgm.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/testing'; 
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_2001A) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_2001A.pgm.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);

-- AC_2001A
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qcllesrc/ac_2001A.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_2001A.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_2001A.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5TST/AC_2001A) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_2001A.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- TS_2001A
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qcllesrc/TS_2001A.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/TS_2001A.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/TS_2001A.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5TST/TS_2001A) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/TS_2001A.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);




--------------------------------------------------------------------------------
-- Deployment
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(DPL)
-- Search source members for any other references to changed d spec copy members


-----------------------------
-- APIs
-----------------------------





-- Set to current date
CL: CHGDTAARA DTAARA(WEB_5OBJ/AR_RELEASE *ALL) VALUE('090922');

--------------------------------------------------------------------------------
-- Hotfix to FTP site
--------------------------------------------------------------------------------

-- Clear save file
CL: CLRSAVF FILE(QGPL/k3shotfix);

-- Add objects to save file
CL: SAVOBJ OBJ(AR_SSIREPT AC_PSIMISC AR_INVLOG AR_INVRLOG AS_SSTOCK AS_PRDINVT AR_PRDINVT AC_PRDINVT AC_SSIREPT AR_INVLOG AC_INVLOG AR_PSIREPT AC_PSIREPT AC_PRIREPT AC_PTHREPT) LIB(WEB_5TST) DEV(*SAVF) SAVF(QGPL/k3shotfix);
CL: SAVOBJ OBJ(AR_SUMNITE) LIB(WEB_5OBJ) DEV(*SAVF) SAVF(QGPL/k3shotfix);



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
