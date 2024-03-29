﻿-- GH841

CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_OVSTK_H) TOMBR(AR_OVSTK_H);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_FWBUY_H) TOMBR(AR_FWBUY_H);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(INVRLOG_H) TOMBR(INVRLOG_H);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_NITTOT) TOMBR(AR_NITTOT);
CL: CPYSRCF FROMFILE(WEB_5DEV/QCLLESRC) TOFILE(ACS_5DEV/QCLLESRC) FROMMBR(AC_NITTOT) TOMBR(AC_NITTOT);
CL: CPYSRCF FROMFILE(WEB_5DEV/QCLLESRC) TOFILE(ACS_5DEV/QCLLESRC) FROMMBR(TS_NITTOT) TOMBR(TS_NITTOT);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_INTPROD) TOMBR(AR_INTPROD);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_INVMISC) TOMBR(AR_INVMISC);

CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_USERAPI) TOMBR(AR_USERAPI);

CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_NITTOT) TOMBR(AR_NITTOT);

CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(NITETOT_H) TOMBR(NITETOT_H);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(BUYRALG_H) TOMBR(BUYRALG_H);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_NITTOT) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);


--------------------------------------------------------------------------------
-- In Development
--------------------------------------------------------------------------------

-------------------------------------------------------
-- Run During Development
-------------------------------------------------------

-- AR_NITTOT
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_NITTOT) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_NITTOT) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_NITTOT
CL: CRTBNDCL PGM(ACS_5OBJ/AC_NITTOT) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AC_NITTOT) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_NITTOT
CL: CRTBNDCL PGM(ACS_5OBJ/TS_NITTOT) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(ACS_5OBJ/TS_NITTOT) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

--------------------------------------------------------------------------------
-- Integrated Testing Environment
--------------------------------------------------------------------------------

-- AR_NITTOT
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_NITTOT) TOMBR(AR_NITTOT);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_NITTOT) SRCFILE(WEB_5TDV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: GRTOBJAUT OBJ(WEB_5TST/AR_NITTOT) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_NITTOT
CL: CPYSRCF FROMFILE(ACS_5DEV/QCLLESRC) TOFILE(WEB_5TDV/QCLLESRC) FROMMBR(AC_NITTOT) TOMBR(AC_NITTOT);
CL: CRTBNDCL PGM(WEB_5TST/AC_NITTOT) SRCFILE(WEB_5TDV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(WEB_5TST/AC_NITTOT) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_NITTOT
CL: CPYSRCF FROMFILE(ACS_5DEV/QCLLESRC) TOFILE(WEB_5TDV/QCLLESRC) FROMMBR(TS_NITTOT) TOMBR(TS_NITTOT);
CL: CRTBNDCL PGM(WEB_5TST/TS_NITTOT) SRCFILE(WEB_5TDV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);
CL: GRTOBJAUT OBJ(WEB_5TST/TS_NITTOT) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


--------------------------------------------------------------------------------
-- Deployment
--------------------------------------------------------------------------------

-- AR_NITTOT
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(AR_NITTOT) TOMBR(AR_NITTOT);
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_NITTOT) SRCFILE(WEB_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*NONE) TGTRLS(V7R2M0);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_NITTOT) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AC_NITTOT
CL: CPYSRCF FROMFILE(WEB_5TDV/QCLLESRC) TOFILE(WEB_5DEV/QCLLESRC) FROMMBR(AC_NITTOT) TOMBR(AC_NITTOT);
CL: CRTBNDCL PGM(WEB_5OBJ/AC_NITTOT) SRCFILE(WEB_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*NONE);
CL: GRTOBJAUT OBJ(WEB_5OBJ/AC_NITTOT) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- TS_NITTOT
CL: CPYSRCF FROMFILE(WEB_5TDV/QCLLESRC) TOFILE(WEB_5DEV/QCLLESRC) FROMMBR(TS_NITTOT) TOMBR(TS_NITTOT);
CL: CRTBNDCL PGM(WEB_5OBJ/TS_NITTOT) SRCFILE(WEB_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*NONE);
CL: GRTOBJAUT OBJ(WEB_5OBJ/TS_NITTOT) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


-- Set to current date
CL: CHGDTAARA DTAARA(WEB_5OBJ/AR_RELEASE *ALL) VALUE('123121');


--------------------------------------------------------------------------------
-- Hotfix to FTP site
--------------------------------------------------------------------------------

-- Clear save file
CL: CLRSAVF FILE(QGPL/k3shotfix);

-- Add objects to save file
CL: SAVOBJ OBJ(AR_NITTOT) LIB(WEB_5OBJ) DEV(*SAVF) SAVF(QGPL/k3shotfix);

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
CL: SAVOBJ OBJ(AR_NITTOT) LIB(ACS_5OBJ) DEV(*SAVF) SAVF(QGPL/APIMISSCHK);

-- Transfer save file
CL: CALL QGPL/CBEANPUTDR;

-- on Conan DR...
CL: RSTOBJ OBJ(AR_NITTOT) SAVLIB(ACS_5OBJ) DEV(*SAVF) SAVF(QGPL/APIMISSCHK) RSTLIB(RES_5OBJ) ALWOBJDIF(*ALL) MBROPT(*ALL);
