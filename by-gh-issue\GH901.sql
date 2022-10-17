
-- CL: CPYSRCF FROMFILE(WEB_5DEV/QCLLESRC) TOFILE(ACS_5DEV/QCLLESRC) FROMMBR(AC_OBSREPT) TOMBR(AC_OBSREPT);

--------------------------------------------------------------------------------
-- In Development
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(DEV)

-------------------------------
--          APIs
-------------------------------

-- AR_Z00BCHS
CL: CHGATR OBJ('/home/chuk/apps/k3s-replenish-rpg/qrpglesrc/ar_Z00BCHS.pgm.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/home/chuk/apps/K3S-Replenish-RPG'; 
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_Z00BCHS) SRCSTMF('/home/chuk/apps/k3s-replenish-rpg/qrpglesrc/ar_Z00BCHS.pgm.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) CVTCCSID(*JOB);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_Z00BCHS) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

--------------------------------------------------------------------------------
-- Integrated Testing Environment
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(ITE)

-----------------------------
-- APIs
-----------------------------
-- AR_Z00BCHS
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qrpglesrc/ar_Z00BCHS.pgm.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_Z00BCHS.pgm.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_Z00BCHS.pgm.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/testing'; 
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_Z00BCHS) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_Z00BCHS.pgm.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);

-- TS_Z00BCHS
CL: COPY OBJ('/home/chuk/apps/k3s-replenish-rpg/qcllesrc/ts_Z00BCHS.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_Z00BCHS.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_Z00BCHS.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5TST/TS_Z00BCHS) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_Z00BCHS.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(WEB_5TST/TS_Z00BCHS) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);



--------------------------------------------------------------------------------
-- Deployment
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(DPL)
-- Search source members for any other references to changed d spec copy members

-- Service Programs
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_prodsez.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_prodsez.sqlrpgle') REPLACE(*YES);
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/prodsez_h.rpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/prodsez_h.rpgle') REPLACE(*YES);
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qsrvsrc/ar_prodsez.bnd') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qsrvsrc/ar_prodsez.bnd') REPLACE(*YES);
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AR_prodsez);
CL: DLTOBJ OBJ(WEB_5OBJ/AR_prodsez) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(WEB_5OBJ/AR_prodsez) OBJTYPE(*MODULE);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/deployment';
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_prodsez) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_prodsez.sqlrpgle') OBJTYPE(*MODULE) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: CRTSRVPGM SRVPGM(WEB_5OBJ/AR_prodsez) MODULE(WEB_5OBJ/AR_prodsez) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qsrvsrc/ar_prodsez.bnd')  BNDDIR(K3SDIR);
CL: ADDBNDDIRE BNDDIR(K3SDIR) OBJ((AR_prodsez));
CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_prodsez) OBJTYPE(*SRVPGM) USER(*PUBLIC) AUT(*ALL);


-----------------------------
-- APIs
-----------------------------

-- AR_PULSEZN
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_PULSEZN.pgm.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_PULSEZN.pgm.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_PULSEZN.pgm.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/deployment'; 
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_PULSEZN) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_PULSEZN.pgm.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_PULSEZN) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_PULSEZN
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_PULSEZN.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_PULSEZN.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_PULSEZN.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5OBJ/AC_PULSEZN) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_PULSEZN.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AC_PULSEZN) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_PULSEZN
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_PULSEZN.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ts_PULSEZN.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ts_PULSEZN.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5OBJ/TS_PULSEZN) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ts_PULSEZN.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(WEB_5OBJ/TS_PULSEZN) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AR_CCLSEZN
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_CCLSEZN.pgm.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_CCLSEZN.pgm.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_CCLSEZN.pgm.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/deployment'; 
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_CCLSEZN) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_CCLSEZN.pgm.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_CCLSEZN) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_CCLSEZN
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_CCLSEZN.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_CCLSEZN.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_CCLSEZN.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5OBJ/AC_CCLSEZN) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_CCLSEZN.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AC_CCLSEZN) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_CCLSEZN
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_CCLSEZN.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ts_CCLSEZN.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ts_CCLSEZN.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5OBJ/TS_CCLSEZN) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ts_CCLSEZN.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(WEB_5OBJ/TS_CCLSEZN) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AR_CNTPROD
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_CNTPROD.pgm.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_CNTPROD.pgm.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_CNTPROD.pgm.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/deployment'; 
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_CNTPROD) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_CNTPROD.pgm.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_CNTPROD) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_CNTPROD
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_CNTPROD.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_CNTPROD.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_CNTPROD.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5OBJ/AC_CNTPROD) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_CNTPROD.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AC_CNTPROD) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_CNTPROD
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_CNTPROD.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ts_CNTPROD.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ts_CNTPROD.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5OBJ/TS_CNTPROD) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ts_CNTPROD.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(WEB_5OBJ/TS_CNTPROD) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AR_CRPSEZN
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_CRPSEZN.pgm.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_CRPSEZN.pgm.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_CRPSEZN.pgm.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/deployment'; 
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_CRPSEZN) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_CRPSEZN.pgm.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_CRPSEZN) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_CRPSEZN
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_CRPSEZN.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_CRPSEZN.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_CRPSEZN.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5OBJ/AC_CRPSEZN) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_CRPSEZN.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AC_CRPSEZN) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_CRPSEZN
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_CRPSEZN.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ts_CRPSEZN.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ts_CRPSEZN.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5OBJ/TS_CRPSEZN) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ts_CRPSEZN.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(WEB_5OBJ/TS_CRPSEZN) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AR_APLSEZN
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_APLSEZN.pgm.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_APLSEZN.pgm.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_APLSEZN.pgm.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/deployment'; 
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_APLSEZN) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_APLSEZN.pgm.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_APLSEZN) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_APLSEZN
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_APLSEZN.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_APLSEZN.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_APLSEZN.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5OBJ/AC_APLSEZN) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_APLSEZN.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AC_APLSEZN) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_APLSEZN
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_APLSEZN.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ts_APLSEZN.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ts_APLSEZN.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5OBJ/TS_APLSEZN) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ts_APLSEZN.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(WEB_5OBJ/TS_APLSEZN) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


-- AR_SUMNITE
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_SUMNITE.pgm.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_SUMNITE.pgm.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_SUMNITE.pgm.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/deployment'; 
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_SUMNITE) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_SUMNITE.pgm.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) CVTCCSID(*JOB);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_SUMNITE) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);



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
