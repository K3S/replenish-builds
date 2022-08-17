
-- CL: CPYSRCF FROMFILE(WEB_5DEV/QCLLESRC) TOFILE(ACS_5DEV/QCLLESRC) FROMMBR(AC_OBSREPT) TOMBR(AC_OBSREPT);

--------------------------------------------------------------------------------
-- In Development
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(DEV)

-------------------------------
--          APIs
-------------------------------

-- AR_PULSEZN
CL: CHGATR OBJ('/home/chuk/apps/k3s-replenish-rpg/qrpglesrc/ar_pulsezn.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/home/chuk/apps/K3S-Replenish-RPG'; 
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PULSEZN) SRCSTMF('/home/chuk/apps/k3s-replenish-rpg/qrpglesrc/ar_pulsezn.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) CVTCCSID(*JOB);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_PULSEZN) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_PULSEZN
CL: CHGATR OBJ('/home/chuk/apps/k3s-replenish-rpg/qcllesrc/ac_pulsezn.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(ACS_5OBJ/AC_PULSEZN) SRCSTMF('/home/chuk/apps/k3s-replenish-rpg/qcllesrc/ac_pulsezn.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_PULSEZN) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_PULSEZN
CL: CRTBNDCL PGM(ACS_5OBJ/TS_PULSEZN) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_PULSEZN) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AR_CCLSEZN
CL: CHGATR OBJ('/home/chuk/apps/k3s-replenish-rpg/qrpglesrc/ar_CCLsezn.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/home/chuk/apps/K3S-Replenish-RPG'; 
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_CCLSEZN) SRCSTMF('/home/chuk/apps/k3s-replenish-rpg/qrpglesrc/ar_CCLsezn.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) CVTCCSID(*JOB);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_CCLSEZN) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_CCLSEZN
CL: CHGATR OBJ('/home/chuk/apps/k3s-replenish-rpg/qcllesrc/ac_CCLSEZN.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(ACS_5OBJ/AC_CCLSEZN) SRCSTMF('/home/chuk/apps/k3s-replenish-rpg/qcllesrc/ac_CCLSEZN.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_CCLSEZN) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_CCLSEZN
CL: CRTBNDCL PGM(ACS_5OBJ/TS_CCLSEZN) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_CCLSEZN) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);



--------------------------------------------------------------------------------
-- Integrated Testing Environment
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(ITE)

CL: CPYSRCF FROMFILE(ACS_5WEB/QRPGLESRC) TOFILE(WEB_5WEB/QRPGLESRC) FROMMBR(K3S_APIPRO) TOMBR(K3S_APIPRO);

-----------------------------
-- Service Programs
-----------------------------



-----------------------------
-- APIs
-----------------------------
-- AR_PULSEZN
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qrpglesrc/ar_PULSEZN.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_PULSEZN.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_PULSEZN.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/testing'; 
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_PULSEZN) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_PULSEZN.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);

-- AC_PULSEZN
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qcllesrc/ac_PULSEZN.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_PULSEZN.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_PULSEZN.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5TST/AC_PULSEZN) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_PULSEZN.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- TS_PULSEZN
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qcllesrc/ts_pulsezn.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_PULSEZN.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_PULSEZN.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5TST/TS_PULSEZN) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_pulsezn.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- AR_CCLSEZN
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qrpglesrc/ar_CCLSEZN.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_CCLSEZN.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_CCLSEZN.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/testing'; 
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_CCLSEZN) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_CCLSEZN.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB) TEXT('Generate a composite seasonality line');

-- AC_CCLSEZN
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qcllesrc/ac_CCLSEZN.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_CCLSEZN.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_CCLSEZN.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5TST/AC_CCLSEZN) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_CCLSEZN.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- TS_CCLSEZN
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qcllesrc/ts_CCLSEZN.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_CCLSEZN.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_CCLSEZN.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5TST/TS_CCLSEZN) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_cclsezn.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- AR_CNTPROD
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qrpglesrc/ar_CNTPROD.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_CNTPROD.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_CNTPROD.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/testing'; 
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_CNTPROD) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_CNTPROD.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB) TEXT('Generate a composite seasonality line');

-- AC_CNTPROD
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qcllesrc/ac_CNTPROD.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_CNTPROD.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_CNTPROD.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5TST/AC_CNTPROD) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_CNTPROD.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- TS_CNTPROD
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qcllesrc/ts_CNTPROD.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_CNTPROD.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_CNTPROD.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5TST/TS_CNTPROD) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_cntprod.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- AR_CRPSEZN
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qrpglesrc/ar_CRPSEZN.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_CRPSEZN.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_CRPSEZN.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/testing'; 
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_CRPSEZN) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_CRPSEZN.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB) TEXT('Generate a composite seasonality line');

-- AC_CRPSEZN
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qcllesrc/ac_CRPSEZN.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_CRPSEZN.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_CRPSEZN.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5TST/AC_CRPSEZN) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_CRPSEZN.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- TS_CRPSEZN
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qcllesrc/ts_CRPSEZN.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_CRPSEZN.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_CRPSEZN.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5TST/TS_CRPSEZN) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_crpsezn.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);


--------------------------------------------------------------------------------
-- Deployment
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(DPL)
-- Search source members for any other references to changed d spec copy members

-- Service Programs
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_dealper.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_dealper.sqlrpgle') REPLACE(*YES);
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/dealper_h.rpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/dealper_h.rpgle') REPLACE(*YES);
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qsrvsrc/dealper_b.bnd') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qsrvsrc/dealper_b.bnd') REPLACE(*YES);
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AR_DEALPER);
CL: DLTOBJ OBJ(WEB_5OBJ/AR_DEALPER) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(WEB_5OBJ/AR_DEALPER) OBJTYPE(*MODULE);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/deployment';
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_DEALPER) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_dealper.sqlrpgle') OBJTYPE(*MODULE) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: CRTSRVPGM SRVPGM(WEB_5OBJ/AR_DEALPER) MODULE(WEB_5OBJ/AR_DEALPER) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qsrvsrc/dealper_b.bnd')  BNDDIR(K3SDIR);
CL: ADDBNDDIRE BNDDIR(K3SDIR) OBJ((AR_DEALPER));
CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_DEALPER) OBJTYPE(*SRVPGM) USER(*PUBLIC) AUT(*ALL);


-----------------------------
-- APIs
-----------------------------
-- AR_CPPDEAL
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_cppdeal.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_cppdeal.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_cppdeal.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/deployment'; 
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_CPPDEAL) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_cppdeal.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);

-- AC_CPPDEAL
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_cppdeal.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_cppdeal.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_cppdeal.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5OBJ/AC_CPPDEAL) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_cppdeal.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- TS_CPPDEAL
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_cppdeal.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ts_cppdeal.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ts_cppdeal.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5OBJ/TS_CPPDEAL) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ts_cppdeal.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- AR_ADPDEAL
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_adpdeal.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_adpdeal.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_adpdeal.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/deployment'; 
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_ADPDEAL) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_adpdeal.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);

-- AR_cpmdeal
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_cpmdeal.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_cpmdeal.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_cpmdeal.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/deployment'; 
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_CPMDEAL) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_cpmdeal.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);

-- AC_cpmdeal
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_cpmdeal.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_cpmdeal.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_cpmdeal.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5OBJ/AC_CPMDEAL) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_cpmdeal.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- TS_cpmdeal
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_cpmdeal.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ts_cpmdeal.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ts_cpmdeal.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5OBJ/TS_CPMDEAL) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ts_cpmdeal.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- AR_dlpdeal
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_dlpdeal.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_dlpdeal.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_dlpdeal.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/deployment'; 
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_dlpdeal) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_dlpdeal.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);

-- AC_dlpdeal
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_dlpdeal.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_dlpdeal.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_dlpdeal.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5OBJ/AC_dlpdeal) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_dlpdeal.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- AR_dlmdeal
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_dlmdeal.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_dlmdeal.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_dlmdeal.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/deployment'; 
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_dlmdeal) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_dlmdeal.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);

-- AC_dlmdeal
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_dlmdeal.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_dlmdeal.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_dlmdeal.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5OBJ/AC_dlmdeal) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_dlmdeal.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- TS_dlmdeal
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/TS_dlmdeal.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/TS_dlmdeal.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/TS_dlmdeal.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5OBJ/TS_dlmdeal) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/TS_dlmdeal.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- AR_uppdeal
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_uppdeal.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_uppdeal.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_uppdeal.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/deployment'; 
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_uppdeal) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_uppdeal.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);

-- AC_uppdeal
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_uppdeal.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_uppdeal.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_uppdeal.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5OBJ/AC_uppdeal) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_uppdeal.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- AR_lcnwork
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_lcnwork.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_lcnwork.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_lcnwork.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/deployment'; 
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_lcnwork) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_lcnwork.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);

-- AC_lcnwork
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_lcnwork.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_lcnwork.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_lcnwork.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5OBJ/AC_lcnwork) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_lcnwork.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- AR_buywork
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_buywork.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_buywork.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_buywork.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/deployment'; 
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_buywork) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qrpglesrc/ar_buywork.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);

-- AC_buywork
CL: COPY OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_buywork.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_buywork.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_buywork.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5OBJ/AC_buywork) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/deployment/qcllesrc/ac_buywork.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);




-- Set to current date
CL: CHGDTAARA DTAARA(WEB_5OBJ/AR_RELEASE *ALL) VALUE('080822');

--------------------------------------------------------------------------------
-- Hotfix to FTP site
--------------------------------------------------------------------------------

-- Clear save file
CL: CLRSAVF FILE(QGPL/k3shotfix);

-- Add objects to save file
CL: SAVOBJ OBJ(AR_SSIREPT AC_PSIMISC AR_INVLOG AR_INVRLOG AS_SSTOCK AS_PRDINVT AR_PRDINVT AC_PRDINVT AC_SSIREPT AR_INVLOG AC_INVLOG AR_PSIREPT AC_PSIREPT AC_PRIREPT AC_PTHREPT) LIB(WEB_5TST) DEV(*SAVF) SAVF(QGPL/k3shotfix);
CL: SAVOBJ OBJ(AR_DLPDEAL AR_DLMDEAL) LIB(WEB_5TST) DEV(*SAVF) SAVF(QGPL/k3shotfix);



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
