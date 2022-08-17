
CL: CPYSRCF FROMFILE(WEB_5DEV/QCLLESRC) TOFILE(ACS_5DEV/QCLLESRC) FROMMBR(AC_OBSREPT) TOMBR(AC_OBSREPT);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_OBSREPT) TOMBR(AR_OBSREPT);
CL: CPYSRCF FROMFILE(WEB_5DEV/QCLLESRC) TOFILE(ACS_5DEV/QCLLESRC) FROMMBR(AC_3705CL) TOMBR(AC_3705CL);
CL: CPYSRCF FROMFILE(WEB_5DEV/QCLLESRC) TOFILE(ACS_5DEV/QCLLESRC) FROMMBR(AC_3706CL) TOMBR(AC_3706CL);
CL: CPYSRCF FROMFILE(WEB_5DEV/QCLLESRC) TOFILE(ACS_5DEV/QCLLESRC) FROMMBR(AC_3710CL) TOMBR(AC_3710CL);
--------------------------------------------------------------------------------
-- In Development
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(DEV)

-- Service Programs
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AR_DEALPER);
CL: DLTOBJ OBJ(ACS_5OBJ/AR_DEALPER) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(ACS_5OBJ/AR_DEALPER) OBJTYPE(*MODULE);
CL: CD '/home/chuk/apps/K3s-Replenish-RPG';
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_DEALPER) SRCSTMF('/home/chuk/apps/K3S-Replenish-RPG/qrpglesrc/ar_dealper.sqlrpgle') OBJTYPE(*MODULE) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: CRTSRVPGM SRVPGM(ACS_5OBJ/AR_DEALPER) MODULE(ACS_5OBJ/AR_DEALPER) SRCSTMF('/home/chuk/apps/K3S-Replenish-RPG/qsrvsrc/dealper_b.bnd')  BNDDIR(K3SDIR);
CL: ADDBNDDIRE BNDDIR(K3SDIR) OBJ((AR_DEALPER));
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_DEALPER) OBJTYPE(*SRVPGM) USER(*PUBLIC) AUT(*ALL);


-------------------------------
--          APIs
-------------------------------

-- AR_CPPDEAL
CL: CD '/home/chuk/apps/K3S-Replenish-RPG/qrpglesrc'; 
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_CPPDEAL) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_CPPDEAL) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_CPPDEAL
CL: CRTBNDCL PGM(ACS_5OBJ/AC_CPPDEAL) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_CPPDEAL) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_CPPDEAL
CL: CRTBNDCL PGM(ACS_5OBJ/TS_CPPDEAL) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_CPPDEAL) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


-- AR_CPMDEAL
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_CPMDEAL) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_CPMDEAL) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_CPMDEAL
CL: CRTBNDCL PGM(ACS_5OBJ/AC_CPMDEAL) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_CPMDEAL) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_CPMDEAL
CL: CRTBNDCL PGM(ACS_5OBJ/TS_CPMDEAL) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_CPMDEAL) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AR_DPMDEAL
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_DPMDEAL) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_DPMDEAL) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_DPMDEAL
CL: CRTBNDCL PGM(ACS_5OBJ/AC_DPMDEAL) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_DPMDEAL) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_DPMDEAL
CL: CRTBNDCL PGM(ACS_5OBJ/TS_DPMDEAL) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_DPMDEAL) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);



--------------------------------------------------------------------------------
-- Integrated Testing Environment
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(ITE)

CL: CPYSRCF FROMFILE(ACS_5WEB/QRPGLESRC) TOFILE(WEB_5WEB/QRPGLESRC) FROMMBR(K3S_APIPRO) TOMBR(K3S_APIPRO);

-- Service Programs
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qrpglesrc/ar_dealper.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_dealper.sqlrpgle') REPLACE(*YES);
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qrpglesrc/dealper_h.rpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/dealper_h.rpgle') REPLACE(*YES);
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qsrvsrc/dealper_b.bnd') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qsrvsrc/dealper_b.bnd') REPLACE(*YES);
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AR_DEALPER);
CL: DLTOBJ OBJ(WEB_5TST/AR_DEALPER) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(WEB_5TST/AR_DEALPER) OBJTYPE(*MODULE);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/testing';
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_DEALPER) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_dealper.sqlrpgle') OBJTYPE(*MODULE) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: CRTSRVPGM SRVPGM(WEB_5TST/AR_DEALPER) MODULE(WEB_5TST/AR_DEALPER) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qsrvsrc/dealper_b.bnd')  BNDDIR(K3SDIR);
CL: ADDBNDDIRE BNDDIR(K3SDIR) OBJ((AR_DEALPER));
CL: GRTOBJAUT OBJ(WEB_5TST/AR_DEALPER) OBJTYPE(*SRVPGM) USER(*PUBLIC) AUT(*ALL);




-----------------------------
-- APIs
-----------------------------
-- AR_CPPDEAL
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qrpglesrc/ar_cppdeal.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_cppdeal.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_cppdeal.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/testing'; 
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_CPPDEAL) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_cppdeal.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);

-- AC_CPPDEAL
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qcllesrc/ac_cppdeal.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_cppdeal.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_cppdeal.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5TST/AC_CPPDEAL) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_cppdeal.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- TS_CPPDEAL
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qcllesrc/ts_cppdeal.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_cppdeal.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_cppdeal.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5TST/TS_CPPDEAL) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_cppdeal.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- AR_ADPDEAL
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qrpglesrc/ar_adpdeal.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_adpdeal.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_adpdeal.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/testing'; 
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_ADPDEAL) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_adpdeal.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);

d
-- AR_cpmdeal
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qrpglesrc/ar_cpmdeal.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_cpmdeal.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_cpmdeal.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/testing'; 
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_CPMDEAL) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_cpmdeal.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);

-- AC_cpmdeal
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qcllesrc/ac_cpmdeal.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_cpmdeal.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_cpmdeal.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5TST/AC_CPMDEAL) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_cpmdeal.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- TS_cpmdeal
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qcllesrc/ts_cpmdeal.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_cpmdeal.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_cpmdeal.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5TST/TS_CPMDEAL) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ts_cpmdeal.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);


-- AR_dlpdeal
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qrpglesrc/ar_dlpdeal.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_dlpdeal.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_dlpdeal.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/testing'; 
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_dlpdeal) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_dlpdeal.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);

-- AC_dlpdeal
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qcllesrc/ac_dlpdeal.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_dlpdeal.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_dlpdeal.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5TST/AC_dlpdeal) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_dlpdeal.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);


-- AR_dlmdeal
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qrpglesrc/ar_dlmdeal.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_dlmdeal.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_dlmdeal.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/testing'; 
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_dlmdeal) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_dlmdeal.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);


-- AC_dlmdeal
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qcllesrc/ac_dlmdeal.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_dlmdeal.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_dlmdeal.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5TST/AC_dlmdeal) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_dlmdeal.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- AR_uppdeal
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qrpglesrc/ar_uppdeal.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_uppdeal.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_uppdeal.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/testing'; 
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_uppdeal) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_uppdeal.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);

-- AC_UPPDEAL
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qcllesrc/ac_uppdeal.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_uppdeal.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_uppdeal.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5TST/AC_uppdeal) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_uppdeal.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- AR_lcnwork
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qrpglesrc/ar_lcnwork.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_lcnwork.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_lcnwork.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/testing'; 
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_lcnwork) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_lcnwork.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);

-- AC_lcnwork
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qcllesrc/ac_lcnwork.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_lcnwork.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_lcnwork.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5TST/AC_lcnwork) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_lcnwork.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- AR_buywork
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qrpglesrc/ar_buywork.sqlrpgle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_buywork.sqlrpgle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_buywork.sqlrpgle') ATR(*CCSID) VALUE(1252);
CL: CD '/usr/local/k3s/k3s-replenish-rpg/testing'; 
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_buywork) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qrpglesrc/ar_buywork.sqlrpgle') COMMIT(*NONE) OPTION(*EVENTF *XREF *SEQSRC) TGTRLS(V7R3M0) CLOSQLCSR(*ENDMOD) DBGVIEW(*SOURCE) CVTCCSID(*JOB);

-- AC_buywork
CL: COPY OBJ('/home/chuk/apps/K3S-Replenish-RPG/qcllesrc/ac_buywork.clle') TOOBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_buywork.clle') REPLACE(*YES);
CL: CHGATR OBJ('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_buywork.clle') ATR(*CCSID) VALUE(1252);
CL: CRTBNDCL PGM(WEB_5TST/AC_buywork) SRCSTMF('/usr/local/k3s/k3s-replenish-rpg/testing/qcllesrc/ac_buywork.clle') OPTION(*EVENTF) DBGVIEW(*SOURCE);


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
