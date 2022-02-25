﻿--------------------------------------------------------------------------------
-- In Development
--------------------------------------------------------------------------------

-------------------------------
--        Tables
-------------------------------
-- K_MFUBHED
CL: DLTF FILE(ACS_5MOD/K_MFUBHED);
CL: CRTPF FILE(ACS_5MOD/K_MFUBHED) SRCFILE(ACS_5DEV/QDDSSRC) SRCMBR(K_MFUBHED) IGCDTA(*N);

-- K_MFUBENT
CL: DLTF FILE(ACS_5MOD/K_MFUBENT);
CL: CRTPF FILE(ACS_5MOD/K_MFUBENT) SRCFILE(ACS_5DEV/QDDSSRC) SRCMBR(K_MFUBENT) IGCDTA(*N);

-- K_INTMFUB
CL: DLTF FILE(ACS_5MOD/K_INTMFUB);
CL: CRTPF FILE(ACS_5MOD/K_INTMFUB) SRCFILE(ACS_5DEV/QDDSSRC) SRCMBR(K_INTMFUB) IGCDTA(*N);


-------------------------------
--    Service Programs
-------------------------------
CL: CALL PGM(ACS_5OBJ/APISRVPGM) PARM('AR_MFUBHED' 'ACS_5DEV' 'QRPGLESRC' 'ACS_5OBJ' 'QSRVSRC' 'K3SDIR');
CL: CALL PGM(ACS_5OBJ/APISRVPGM) PARM('AR_MFUBENT' 'ACS_5DEV' 'QRPGLESRC' 'ACS_5OBJ' 'QSRVSRC' 'K3SDIR');
CL: CALL PGM(ACS_5OBJ/APISRVPGM) PARM('AS_MFUBCH' 'ACS_5DEV' 'QRPGLESRC' 'ACS_5OBJ' 'QSRVSRC' 'K3SDIR');
-- CL: Call PGM(ACS_5OBJ/APISRVPGM) PARM('AS_MFUPD' 'ACS_5DEV' 'QRPGLESRC' 'ACS_5OBJ' 'QSRVSRC' 'K3SDIR');
CL: Call PGM(ACS_5OBJ/APISRVPGM) PARM('AR_INTMFUB' 'ACS_5DEV' 'QRPGLESRC' 'ACS_5OBJ' 'QSRVSRC' 'K3SDIR');

-------------------------------
--          APIs
-------------------------------
-- AR_ADDMFUB
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_ADDMFUB) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_ADDMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_ADDMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/AC_ADDMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_ADDMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_ADDMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/TS_ADDMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_ADDMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


-- AR_DELMFUB
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_DELMFUB) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_DELMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_DELMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/AC_DELMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_DELMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_DELMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/TS_DELMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_DELMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


-- AR_UPBMFUB
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_UPBMFUB) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_UPBMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_UPBMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/AC_UPBMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_UPBMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_UPBMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/TS_UPBMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_UPBMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


-- AR_LCKMFUB
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_LCKMFUB) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_LCKMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_LCKMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/AC_LCKMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_LCKMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_LCKMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/TS_LCKMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_LCKMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


-- AR_UNLMFUB
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_UNLMFUB) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_UNLMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_UNLMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/AC_UNLMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_UNLMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_UNLMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/TS_UNLMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_UNLMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


-- AR_ADEMFUB
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_ADEMFUB) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_ADEMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_ADEMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/AC_ADEMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_ADEMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_ADEMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/TS_ADEMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_ADEMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


-- AR_DLEMFUB
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_DLEMFUB) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_DLEMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_DLEMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/AC_DLEMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_DLEMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_DLEMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/TS_DLEMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_DLEMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


-- AR_UPEMFUB
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_UPEMFUB) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_UPEMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_UPEMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/AC_UPEMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_UPEMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_UPEMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/TS_UPEMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_UPEMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);




-- AR_GENMFUB
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_GENMFUB) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_GENMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_GENMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/AC_GENMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_GENMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_GENMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/TS_GENMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_GENMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AR_PROMFUB
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PROMFUB) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_PROMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_PROMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/AC_PROMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_PROMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_PROMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/TS_PROMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_PROMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AR_REVMFUB
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_REVMFUB) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_REVMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_REVMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/AC_REVMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_REVMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_REVMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/TS_REVMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_REVMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);




-- AR_IMPMFUB
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_IMPMFUB) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_IMPMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_IMPMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/AC_IMPMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_IMPMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_IMPMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/TS_IMPMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_IMPMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);



--------------------------------------------------------------------------------
-- Integrated Testing Environment
--------------------------------------------------------------------------------

-- Tables
CL: CPYSRCF FROMFILE(ACS_5DEV/QDDSSRC) TOFILE(WEB_5TDV/QDDSSRC) FROMMBR(K_MFUBHED) TOMBR(K_MFUBHED);
CL: DLTF FILE(WEB_5MOD/K_MFUBHED);
CL: CRTPF FILE(WEB_5MOD/K_MFUBHED) SRCFILE(ACS_5DEV/QDDSSRC) SRCMBR(K_MFUBHED) IGCDTA(*N);

CL: CPYSRCF FROMFILE(ACS_5DEV/QDDSSRC) TOFILE(WEB_5TDV/QDDSSRC) FROMMBR(K_MFUBENT) TOMBR(K_MFUBENT);
CL: DLTF FILE(WEB_5MOD/K_MFUBENT);
CL: CRTPF FILE(WEB_5MOD/K_MFUBENT) SRCFILE(ACS_5DEV/QDDSSRC) SRCMBR(K_MFUBENT) IGCDTA(*N);

CL: CPYSRCF FROMFILE(ACS_5DEV/QDDSSRC) TOFILE(WEB_5TDV/QDDSSRC) FROMMBR(K_INTMFUB) TOMBR(K_INTMFUB);
CL: DLTF FILE(WEB_5MOD/K_INTMFUB);
CL: CRTPF FILE(WEB_5MOD/K_INTMFUB) SRCFILE(ACS_5DEV/QDDSSRC) SRCMBR(K_INTMFUB) IGCDTA(*N);


-- Service programs
CL: CALL PGM(ACS_5OBJ/APIPRSRVT) PARM('AR_MFUBHED' 'ACS_5DEV' 'QRPGLESRC' 'QRPGLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');
CL: CALL PGM(ACS_5OBJ/APIPRSRVT) PARM('AR_MFUBENT' 'ACS_5DEV' 'QRPGLESRC' 'QRPGLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');
CL: CALL PGM(ACS_5OBJ/APIPRSRVT) PARM('AS_MFUBCH' 'ACS_5DEV' 'QRPGLESRC' 'QRPGLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');
CL: CALL PGM(ACS_5OBJ/APIPRSRVT) PARM('AR_INTMFUB' 'ACS_5DEV' 'QRPGLESRC' 'QRPGLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');


-- APIs
CL: CALL PGM(ACS_5OBJ/APIPRART) PARM('AR_ADDMFUB' 'ACS_5DEV' 'QRPGLESRC' 'QRPGLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');
CL: CALL PGM(ACS_5OBJ/APIPRART) PARM('AR_DELMFUB' 'ACS_5DEV' 'QRPGLESRC' 'QRPGLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');
CL: CALL PGM(ACS_5OBJ/APIPRART) PARM('AR_UPBMFUB' 'ACS_5DEV' 'QRPGLESRC' 'QRPGLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');
CL: CALL PGM(ACS_5OBJ/APIPRART) PARM('AR_LCKMFUB' 'ACS_5DEV' 'QRPGLESRC' 'QRPGLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');
CL: CALL PGM(ACS_5OBJ/APIPRART) PARM('AR_UNLMFUB' 'ACS_5DEV' 'QRPGLESRC' 'QRPGLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');
CL: CALL PGM(ACS_5OBJ/APIPRART) PARM('AR_ADEMFUB' 'ACS_5DEV' 'QRPGLESRC' 'QRPGLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');
CL: CALL PGM(ACS_5OBJ/APIPRART) PARM('AR_DLEMFUB' 'ACS_5DEV' 'QRPGLESRC' 'QRPGLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');
CL: CALL PGM(ACS_5OBJ/APIPRART) PARM('AR_UPEMFUB' 'ACS_5DEV' 'QRPGLESRC' 'QRPGLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');


-- CL Wrappers
CL: CALL PGM(ACS_5OBJ/APIPRACT) PARM('AC_ADDMFUB' 'ACS_5DEV' 'QCLLESRC' 'QCLLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');
CL: CALL PGM(ACS_5OBJ/APIPRACT) PARM('AC_DELMFUB' 'ACS_5DEV' 'QCLLESRC' 'QCLLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');
CL: CALL PGM(ACS_5OBJ/APIPRACT) PARM('AC_UPBMFUB' 'ACS_5DEV' 'QCLLESRC' 'QCLLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');
CL: CALL PGM(ACS_5OBJ/APIPRACT) PARM('AC_LCKMFUB' 'ACS_5DEV' 'QCLLESRC' 'QCLLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');
CL: CALL PGM(ACS_5OBJ/APIPRACT) PARM('AC_UNLMFUB' 'ACS_5DEV' 'QCLLESRC' 'QCLLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');
CL: CALL PGM(ACS_5OBJ/APIPRACT) PARM('AC_ADEMFUB' 'ACS_5DEV' 'QCLLESRC' 'QCLLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');
CL: CALL PGM(ACS_5OBJ/APIPRACT) PARM('AC_DLEMFUB' 'ACS_5DEV' 'QCLLESRC' 'QCLLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');
CL: CALL PGM(ACS_5OBJ/APIPRACT) PARM('AC_UPEMFUB' 'ACS_5DEV' 'QCLLESRC' 'QCLLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');

-- AC_ADDMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/AC_ADDMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_ADDMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_ADDMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/TS_ADDMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_ADDMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AR_ADEMFUB
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_ADEMFUB) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_ADEMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_ADEMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/AC_ADEMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_ADEMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_ADEMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/TS_ADEMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_ADEMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AR_DELMFUB
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_DELMFUB) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_DELMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_DELMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/AC_DELMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_DELMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_DELMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/TS_DELMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_DELMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AR_DLEMFUB
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_DLEMFUB) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_DLEMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_DLEMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/AC_DLEMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_DLEMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_DLEMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/TS_DLEMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_DLEMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AR_GENMFUB
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_GENMFUB) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_GENMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_GENMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/AC_GENMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_GENMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_GENMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/TS_GENMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_GENMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AR_PROMFUB
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PROMFUB) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_PROMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_PROMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/AC_PROMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_PROMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_PROMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/TS_PROMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_PROMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AR_REVMFUB
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_REVMFUB) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_REVMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_REVMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/AC_REVMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_REVMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_REVMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/TS_REVMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_REVMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AR_UPBMFUB
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_UPBMFUB) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_UPBMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_UPBMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/AC_UPBMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_UPBMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_UPBMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/TS_UPBMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_UPBMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AR_UPEMFUB
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_UPEMFUB) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_UPEMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_UPEMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/AC_UPEMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_UPEMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_UPEMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/TS_UPEMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_UPEMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AR_IMPMFUB
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_IMPMFUB) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_IMPMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_IMPMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/AC_IMPMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_IMPMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_IMPMFUB
CL: CRTBNDCL PGM(ACS_5OBJ/TS_IMPMFUB) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_IMPMFUB) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


















-- K3S_APIPRO
CL: CPYSRCF FROMFILE(ACS_5WEB/QRPGLESRC) TOFILE(WEB_5WEB/QRPGLESRC) FROMMBR(K3S_APIPRO) TOMBR(K3S_APIPRO);

-- AC_PSIMIS  (ready)
CL: CPYSRCF FROMFILE(ACS_5DEV/QDDSSRC) TOFILE(WEB_5TDV/QDDSSRC) FROMMBR(AC_PSIMIS) TOMBR(AC_PSIMIS);
CL: CRTPRTF FILE(WEB_5TST/AC_PSIMIS) SRCFILE(WEB_5TDV/QDDSSRC) SRCMBR(AC_PSIMIS) IGCDTA(*N) IGCEXNCHR(*N) PAGESIZE(*N 198) IGCCHRRTT(*N) IGCCPI(*N) IGCSOSI(*N) IGCCDEFNT(*SYSVAL) REPLACE(*YES);
CL: GRTOBJAUT OBJ(WEB_5TST/AC_PSIMIS) OBJTYPE(*ALL) USER(*PUBLIC) AUT(*ALL);


-- AR_INVRLOG  (ready)
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AR_INVRLOG);
CL: DLTOBJ OBJ(WEB_5TST/AR_INVRLOG) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(WEB_5TST/AR_INVRLOG) OBJTYPE(*MODULE);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_INVRLOG) TOMBR(AR_INVRLOG);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(INVRLOG_H) TOMBR(INVRLOG_H);
CL: CPYSRCF FROMFILE(ACS_5DEV/QSRVSRC) TOFILE(WEB_5TDV/QSRVSRC) FROMMBR(INVRLOG_B) TOMBR(INVRLOG_B);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_INVRLOG) SRCFILE(WEB_5TDV/QRPGLESRC) OBJTYPE(*MODULE) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: CRTSRVPGM SRVPGM(WEB_5TST/AR_INVRLOG) MODULE(WEB_5TST/AR_INVRLOG) SRCFILE(WEB_5TDV/QSRVSRC) SRCMBR(INVRLOG_B) BNDDIR(K3SDIR);
CL: ADDBNDDIRE BNDDIR(K3SDIR) OBJ((AR_INVRLOG));
CL: GRTOBJAUT OBJ(WEB_5TST/AR_INVRLOG) OBJTYPE(*SRVPGM) USER(*PUBLIC) AUT(*ALL);

-- AS_SSTOCK (ready)
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AS_SSTOCK);
CL: DLTOBJ OBJ(WEB_5TST/AS_SSTOCK) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(WEB_5TST/AS_SSTOCK) OBJTYPE(*MODULE);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AS_SSTOCK) TOMBR(AS_SSTOCK);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(SSTOCK_H) TOMBR(SSTOCK_H);
CL: CPYSRCF FROMFILE(ACS_5DEV/QSRVSRC) TOFILE(WEB_5TDV/QSRVSRC) FROMMBR(SSTOCK_B) TOMBR(SSTOCK_B);
CL: CRTSQLRPGI OBJ(WEB_5TST/AS_SSTOCK) SRCFILE(WEB_5TDV/QRPGLESRC) OBJTYPE(*MODULE) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: CPYSRCF FROMFILE(ACS_5DEV/QSRVSRC) TOFILE(WEB_5TDV/QSRVSRC) FROMMBR(SSTOCK_B) TOMBR(SSTOCK_B);
CL: CRTSRVPGM SRVPGM(WEB_5TST/AS_SSTOCK) MODULE(WEB_5TST/AS_SSTOCK) SRCFILE(WEB_5TDV/QSRVSRC) SRCMBR(SSTOCK_B) BNDDIR(K3SDIR);
CL: ADDBNDDIRE BNDDIR(K3SDIR) OBJ((AS_SSTOCK));

-- AS_PRDINVT  (ready)
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AS_PRDINVT);
CL: DLTOBJ OBJ(WEB_5TST/AS_PRDINVT) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(WEB_5TST/AS_PRDINVT) OBJTYPE(*MODULE);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AS_PRDINVT) TOMBR(AS_PRDINVT);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(PRDINVT_H) TOMBR(PRDINVT_H);
CL: CPYSRCF FROMFILE(ACS_5DEV/QSRVSRC) TOFILE(WEB_5TDV/QSRVSRC) FROMMBR(PRDINVT_B) TOMBR(PRDINVT_B);
CL: CRTSQLRPGI OBJ(WEB_5TST/AS_PRDINVT) SRCFILE(WEB_5TDV/QRPGLESRC) OBJTYPE(*MODULE) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: CRTSRVPGM SRVPGM(WEB_5TST/AS_PRDINVT) MODULE(WEB_5TST/AS_PRDINVT) SRCFILE(WEB_5TDV/QSRVSRC) SRCMBR(PRDINVT_B) BNDDIR(K3SDIR);
CL: ADDBNDDIRE BNDDIR(K3SDIR) OBJ((AS_PRDINVT));
CL: GRTOBJAUT OBJ(WEB_5TST/AS_PRDINVT) OBJTYPE(*SRVPGM) USER(*PUBLIC) AUT(*ALL);

-- AR_PRDINVT  (ready)
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_PRDINVT) TOMBR(AR_PRDINVT);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_PRDINVT) SRCFILE(WEB_5TDV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(WEB_5TST/AR_PRDINVT) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_PRDINVT (ready)
CL: CPYSRCF FROMFILE(ACS_5DEV/QCLLESRC) TOFILE(WEB_5TDV/QCLLESRC) FROMMBR(AC_PRDINVT) TOMBR(AC_PRDINVT);
CL: CRTBNDCL PGM(WEB_5TST/AC_PRDINVT) SRCFILE(WEB_5TDV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(WEB_5TST/AC_PRDINVT) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AR_INVLOG (ready)
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_INVLOG) TOMBR(AR_INVLOG);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_INVLOG) SRCFILE(WEB_5TDV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(WEB_5TST/AR_INVLOG) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_INVLOG (ready)
CL: CPYSRCF FROMFILE(ACS_5DEV/QCLLESRC) TOFILE(WEB_5TDV/QCLLESRC) FROMMBR(AC_INVLOG) TOMBR(AC_INVLOG);
CL: CRTBNDCL PGM(WEB_5TST/AC_INVLOG) SRCFILE(WEB_5TDV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(WEB_5TST/AC_INVLOG) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: CPYSRCF FROMFILE(ACS_5DEV/QCLLESRC) TOFILE(WEB_5TDV/QCLLESRC) FROMMBR(TS_INVLOG) TOMBR(TS_INVLOG);
CL: CRTBNDCL PGM(WEB_5TST/TS_INVLOG) SRCFILE(WEB_5TDV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(WEB_5TST/TS_INVLOG) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AR_PSIREPT (ready)
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_PSIREPT) TOMBR(AR_PSIREPT);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_PSIREPT) SRCFILE(WEB_5TDV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(WEB_5TST/AR_PSIREPT) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);



--------------------------------------------------------------------------------
-- Deployment
--------------------------------------------------------------------------------

-- AC_PSIMIS  (ready)
CL: CPYSRCF FROMFILE(WEB_5TDV/QDDSSRC) TOFILE(WEB_5DEV/QDDSSRC) FROMMBR(AC_PSIMIS) TOMBR(AC_PSIMIS);
CL: CRTPRTF FILE(WEB_5OBJ/AC_PSIMIS) SRCFILE(WEB_5DEV/QDDSSRC) SRCMBR(AC_PSIMIS) IGCDTA(*N) IGCEXNCHR(*N) PAGESIZE(*N 198) IGCCHRRTT(*N) IGCCPI(*N) IGCSOSI(*N) IGCCDEFNT(*SYSVAL) REPLACE(*YES);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AC_PSIMIS) OBJTYPE(*ALL) USER(*PUBLIC) AUT(*ALL);

-- AR_INVRLOG  (ready)
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AR_INVRLOG);
CL: DLTOBJ OBJ(WEB_5OBJ/AR_INVRLOG) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(WEB_5OBJ/AR_INVRLOG) OBJTYPE(*MODULE);
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(AR_INVRLOG) TOMBR(AR_INVRLOG);
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(INVRLOG_H) TOMBR(INVRLOG_H);
CL: CPYSRCF FROMFILE(WEB_5TDV/QSRVSRC) TOFILE(WEB_5DEV/QSRVSRC) FROMMBR(INVRLOG_B) TOMBR(INVRLOG_B);
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_INVRLOG) SRCFILE(WEB_5DEV/QRPGLESRC) OBJTYPE(*MODULE) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: CRTSRVPGM SRVPGM(WEB_5OBJ/AR_INVRLOG) MODULE(WEB_5OBJ/AR_INVRLOG) SRCFILE(WEB_5DEV/QSRVSRC) SRCMBR(INVRLOG_B) BNDDIR(K3SDIR);
CL: ADDBNDDIRE BNDDIR(K3SDIR) OBJ((AR_INVRLOG));
CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_INVRLOG) OBJTYPE(*SRVPGM) USER(*PUBLIC) AUT(*ALL);

-- AS_SSTOCK (ready)
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AS_SSTOCK);
CL: DLTOBJ OBJ(WEB_5OBJ/AS_SSTOCK) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(WEB_5OBJ/AS_SSTOCK) OBJTYPE(*MODULE);
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(AS_SSTOCK) TOMBR(AS_SSTOCK);
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(SSTOCK_H) TOMBR(SSTOCK_H);
CL: CPYSRCF FROMFILE(WEB_5TDV/QSRVSRC) TOFILE(WEB_5DEV/QSRVSRC) FROMMBR(SSTOCK_B) TOMBR(SSTOCK_B);
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AS_SSTOCK) SRCFILE(WEB_5DEV/QRPGLESRC) OBJTYPE(*MODULE) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: CRTSRVPGM SRVPGM(WEB_5OBJ/AS_SSTOCK) MODULE(WEB_5OBJ/AS_SSTOCK) SRCFILE(WEB_5DEV/QSRVSRC) SRCMBR(SSTOCK_B) BNDDIR(K3SDIR);
CL: ADDBNDDIRE BNDDIR(K3SDIR) OBJ((AS_SSTOCK));

-- AS_PRDINVT  (ready)
CL: RMVBNDDIRE BNDDIR(K3SDIR) OBJ(AS_PRDINVT);
CL: DLTOBJ OBJ(WEB_5OBJ/AS_PRDINVT) OBJTYPE(*SRVPGM);
CL: DLTOBJ OBJ(WEB_5OBJ/AS_PRDINVT) OBJTYPE(*MODULE);
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(AS_PRDINVT) TOMBR(AS_PRDINVT);
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(PRDINVT_H) TOMBR(PRDINVT_H);
CL: CPYSRCF FROMFILE(WEB_5TDV/QSRVSRC) TOFILE(WEB_5DEV/QSRVSRC) FROMMBR(PRDINVT_B) TOMBR(PRDINVT_B);
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AS_PRDINVT) SRCFILE(WEB_5DEV/QRPGLESRC) OBJTYPE(*MODULE) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: CRTSRVPGM SRVPGM(WEB_5OBJ/AS_PRDINVT) MODULE(WEB_5OBJ/AS_PRDINVT) SRCFILE(WEB_5DEV/QSRVSRC) SRCMBR(PRDINVT_B) BNDDIR(K3SDIR);
CL: ADDBNDDIRE BNDDIR(K3SDIR) OBJ((AS_PRDINVT));
CL: GRTOBJAUT OBJ(WEB_5OBJ/AS_PRDINVT) OBJTYPE(*SRVPGM) USER(*PUBLIC) AUT(*ALL);

-- AR_PRDINVT  (ready)
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(AR_PRDINVT) TOMBR(AR_PRDINVT);
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_PRDINVT) SRCFILE(WEB_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_PRDINVT) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_PRDINVT (ready)
CL: CPYSRCF FROMFILE(WEB_5TDV/QCLLESRC) TOFILE(WEB_5DEV/QCLLESRC) FROMMBR(AC_PRDINVT) TOMBR(AC_PRDINVT);
CL: CRTBNDCL PGM(WEB_5OBJ/AC_PRDINVT) SRCFILE(WEB_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AC_PRDINVT) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AR_INVLOG (ready)
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(AR_INVLOG) TOMBR(AR_INVLOG);
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_INVLOG) SRCFILE(WEB_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_INVLOG) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_INVLOG (ready)
CL: CPYSRCF FROMFILE(WEB_5TDV/QCLLESRC) TOFILE(WEB_5DEV/QCLLESRC) FROMMBR(AC_INVLOG) TOMBR(AC_INVLOG);
CL: CRTBNDCL PGM(WEB_5OBJ/AC_INVLOG) SRCFILE(WEB_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AC_INVLOG) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);
CL: CPYSRCF FROMFILE(WEB_5TDV/QCLLESRC) TOFILE(WEB_5DEV/QCLLESRC) FROMMBR(TS_INVLOG) TOMBR(TS_INVLOG);
CL: CRTBNDCL PGM(WEB_5OBJ/TS_INVLOG) SRCFILE(WEB_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(WEB_5OBJ/TS_INVLOG) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AR_PSIREPT (ready)
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(AR_PSIREPT) TOMBR(AR_PSIREPT);
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_PSIREPT) SRCFILE(WEB_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_PSIREPT) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- Set to current date
CL: CHGDTAARA DTAARA(WEB_5OBJ/AR_RELEASE *ALL) VALUE('012722');

--------------------------------------------------------------------------------
-- Hotfix to FTP site
--------------------------------------------------------------------------------

-- Clear save file
CL: CLRSAVF FILE(QGPL/k3shotfix);

-- Add objects to save file
CL: SAVOBJ OBJ(AC_PSIMIS AR_INVRLOG AS_SSTOCK AS_PRDINVT AR_PRDINVT AC_PRDINVT AR_INVLOG AC_INVLOG AR_PSIREPT) LIB(WEB_5OBJ) DEV(*SAVF) SAVF(QGPL/k3shotfix);

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

