--------------------------------------------------------------------------------
-- In Development
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(DEV)



-------------------------------
--          APIs
-------------------------------

-- AR_UPDPROR
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_TOTAPOR) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_TOTAPOR) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

--------------------------------------------------------------------------------
-- Integrated Testing Environment
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(ITE)

CL: CPYSRCF FROMFILE(ACS_5WEB/QRPGLESRC) TOFILE(WEB_5WEB/QRPGLESRC) FROMMBR(K3S_APIPRO) TOMBR(K3S_APIPRO);


-- APIs
-- AR_UPDPROR
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qrpglesrc/ar_updpror.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_updpror.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_updpror.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/testing'; 
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_updpror) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_updpror.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);


--------------------------------------------------------------------------------
-- Deployment
--------------------------------------------------------------------------------
-- APIs
-- AR_updpror
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_updpror.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_updpror.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_updpror.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/deployment'; 
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_updpror) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_updpror.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);


-- Set to current date
CL: CHGDTAARA DTAARA(WEB_5OBJ/AR_RELEASE *ALL) VALUE('080222');

--------------------------------------------------------------------------------
-- Hotfix to FTP site
--------------------------------------------------------------------------------

-- Clear save file
CL: CLRSAVF FILE(QGPL/k3shotfix);

-- Add objects to save file
CL: SAVOBJ OBJ(AR_UPDPROR) LIB(WEB_5OBJ) DEV(*SAVF) SAVF(QGPL/k3shotfix);

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
