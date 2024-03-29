﻿--------------------------------------------------------------------------------
-- Promote to ITE ("Integrated Testing Environment")
--------------------------------------------------------------------------------

-- Signature members
CL: CPYSRCF FROMFILE(ACS_5DEV/QSRVSRC) TOFILE(WEB_5TDV/QSRVSRC) FROMMBR(HIST_B) TOMBR(HIST_B);
CL: CPYSRCF FROMFILE(ACS_5DEV/QSRVSRC) TOFILE(WEB_5TDV/QSRVSRC) FROMMBR(STRYRPD_B) TOMBR(STRYRPD_B);

-- Prototype headers
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(HIST_H) TOMBR(HIST_H);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(STRYRPD_H) TOMBR(STRYRPD_H);

-- AR_HIST
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AR_HIST);
CL: DLTOBJ OBJ(WEB_5TST/AR_HIST) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(WEB_5TST/AR_HIST) OBJTYPE(*MODULE);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_HIST) TOMBR(AR_HIST);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_HIST) SRCFILE(WEB_5TDV/QRPGLESRC) OBJTYPE(*MODULE) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSRVPGM SRVPGM(WEB_5TST/AR_HIST) MODULE(WEB_5TST/AR_HIST) SRCFILE(WEB_5TDV/QSRVSRC) SRCMBR(HIST_B) BNDDIR(K3SDIR);
CL: ADDBNDDIRE BNDDIR(WEB_5TST/K3SDIR) OBJ((AR_HIST));

-- AR_STRYRPD
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AR_STRYRPD);
CL: DLTOBJ OBJ(WEB_5TST/AR_STRYRPD) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(WEB_5TST/AR_STRYRPD) OBJTYPE(*MODULE);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_STRYRPD) TOMBR(AR_STRYRPD);
CL: CRTRPGMOD MODULE(WEB_5TST/AR_STRYRPD) SRCFILE(WEB_5TDV/QRPGLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSRVPGM SRVPGM(WEB_5TST/AR_STRYRPD) MODULE(WEB_5TST/AR_STRYRPD) SRCFILE(WEB_5TDV/QSRVSRC) SRCMBR(STRYRPD_B);
CL: ADDBNDDIRE BNDDIR(WEB_5TST/K3SDIR) OBJ((AR_STRYRPD));

-- AR_3035
--CL: DLTOBJ OBJ(WEB_5TST/AR_3035) OBJTYPE(*PGM);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_3035) TOMBR(AR_3035);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_3035) SRCFILE(WEB_5TDV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);

-- AR_FPRPROR
--CL: DLTOBJ OBJ(WEB_5TST/AR_FPRPROR) OBJTYPE(*PGM);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_FPRPROR) TOMBR(AR_FPRPROR);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_FPRPROR) SRCFILE(WEB_5TDV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);

-- AC_FPRPROR
--CL: DLTOBJ OBJ(WEB_5TST/AC_FPRPROR) OBJTYPE(*PGM);
CL: CPYSRCF FROMFILE(ACS_5DEV/QCLLESRC) TOFILE(WEB_5TDV/QCLLESRC) FROMMBR(AC_FPRPROR) TOMBR(AC_FPRPROR);
CL: CRTBNDCL PGM(WEB_5TST/AC_FPRPROR) SRCFILE(WEB_5TDV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- AR_FSMPROR
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_FSMPROR) TOMBR(AR_FSMPROR);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_FSMPROR) SRCFILE(WEB_5TDV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);

-- AC_FSMPROR
CL: CPYSRCF FROMFILE(ACS_5DEV/QCLLESRC) TOFILE(WEB_5TDV/QCLLESRC) FROMMBR(AC_FSMPROR) TOMBR(AC_FSMPROR);
CL: CRTBNDCL PGM(WEB_5TST/AC_FSMPROR) SRCFILE(WEB_5TDV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- AC_FSPROR
CL: CPYSRCF FROMFILE(ACS_5DEV/QCLLESRC) TOFILE(WEB_5TDV/QCLLESRC) FROMMBR(AC_FSPPROR) TOMBR(AC_FSPPROR);
CL: CRTBNDCL PGM(WEB_5TST/AC_FSPPROR) SRCFILE(WEB_5TDV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- AR_FSPROR
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_FSPPROR) TOMBR(AR_FSPPROR);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_FSPPROR) SRCFILE(WEB_5TDV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);


-- Once tested...
-- Move source from WEB_5TDV to WEB_5DEV
-- Compile from WEB_5DEV to WEB_5OBJ
  -- This includes moving binding directory, signature source members, prototype headers, etc.

