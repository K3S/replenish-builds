
-- CL: CPYSRCF FROMFILE(WEB_5DEV/QCLLESRC) TOFILE(ACS_5DEV/QCLLESRC) FROMMBR(AC_OBSREPT) TOMBR(AC_OBSREPT);

--------------------------------------------------------------------------------
-- In Development
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(DEV)

-------------------------------
--          APIs
-------------------------------

-- AC_SCRYOUR
CL: CHGATR OBJ('/home/chuk/apps/k3s-replenish-rpg/qcllesrc/ac_SCRYOUR.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(ACS_5OBJ/AC_SCRYOUR) SRCSTMF('/home/chuk/apps/k3s-replenish-rpg/qcllesrc/ac_SCRYOUR.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Web your Space Shelf to invoke User Program');

-- TS_SCRYOUR
CL: CHGATR OBJ('/home/chuk/apps/k3s-replenish-rpg/qcllesrc/ts_scryour.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(ACS_5OBJ/AC_SCRYOUR) SRCSTMF('/home/chuk/apps/k3s-replenish-rpg/qcllesrc/ts_scryour.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Web - Testing AC_SCRYOUR');

--------------------------------------------------------------------------------
-- Integrated Testing Environment
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(ITE)

-----------------------------
-- APIs
-----------------------------
-- AC_SCRYOUR
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qcllesrc/ac_SCRYOUR.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_SCRYOUR.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_SCRYOUR.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5TST/AC_SCRYOUR) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_SCRYOUR.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Web your Space Shelf to invoke User Program');

-- TS_SCRYOUR
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qcllesrc/TS_SCRYOUR.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/TS_SCRYOUR.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/TS_SCRYOUR.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5TST/TS_SCRYOUR) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/TS_SCRYOUR.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Web - Testing AC_SCRYOUR');


--------------------------------------------------------------------------------
-- Deployment
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(DPL)
-- Search source members for any other references to changed d spec copy members


-----------------------------
-- APIs
-----------------------------
-- AC_SCRYOUR
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_SCRYOUR.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_SCRYOUR.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_SCRYOUR.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5OBJ/AC_SCRYOUR) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_SCRYOUR.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Web your Space Shelf to invoke User Program');

-- TS_SCRYOUR
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/TS_SCRYOUR.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/TS_SCRYOUR.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/TS_SCRYOUR.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5OBJ/TS_SCRYOUR) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/TS_SCRYOUR.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE) TEXT('Web - Testing AC_SCRYOUR');


-- Set to current date
CL: CHGDTAARA DTAARA(WEB_5OBJ/AR_RELEASE *ALL) VALUE('081222');

--------------------------------------------------------------------------------
-- Hotfix to FTP site
--------------------------------------------------------------------------------

-- Clear save file
CL: CLRSAVF FILE(QGPL/k3shotfix);

-- Add objects to save file
CL: SAVOBJ OBJ(AC_SCRYOUR TS_SCRYOUR) LIB(WEB_5TST) DEV(*SAVF) SAVF(QGPL/k3shotfix);

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
