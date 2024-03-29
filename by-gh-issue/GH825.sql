﻿-- GH811

--------------------------------------------------------------------------------
-- In Development
--------------------------------------------------------------------------------

-------------------------------------------------------
-- Dev Setup (run once before changing source)
-------------------------------------------------------
        -- Copy source members
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_ZCGBCHS) TOMBR(AR_ZCGBCHS);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_CSTBCHS) TOMBR(AR_CSTBCHS);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_DEXCER) TOMBR(AR_DEXCER);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(K3S_APIPRO) TOMBR(K3S_APIPRO);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(COMPANY_H) TOMBR(COMPANY_H);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(USERPRF_H) TOMBR(USERPRF_H);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(BUYRGRP_H) TOMBR(BUYRGRP_H);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(LOCATNS_H) TOMBR(LOCATNS_H);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(PRODSEB_H) TOMBR(PRODSEB_H);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(PRODSED_H) TOMBR(PRODSED_H);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(DLYPROD_H) TOMBR(DLYPROD_H);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(TABLCOD_H) TOMBR(TABLCOD_H);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_EXCER_H) TOMBR(AR_EXCER_H);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_SRLNB_H) TOMBR(AR_SRLNB_H);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_PGMDSTR) TOMBR(AR_PGMDSTR);
CL: CPYSRCF FROMFILE(K3S_5SRC/QRPGLESRC) TOFILE(ACS_5SRC/QRPGLESRC) FROMMBR(K3S_C030) TOMBR(K3S_C030);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_MEXCER) TOMBR(AR_MEXCER);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_OEXCER) TOMBR(AR_OEXCER);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_CUPBCHS) TOMBR(AR_CUPBCHS);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_CWRBCHS) TOMBR(AR_CWRBCHS);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_CGTBCHS) TOMBR(AR_CGTBCHS);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_CSQBCHS) TOMBR(AR_CSQBCHS);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_CPRBCHS) TOMBR(AR_CPRBCHS);
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_CEXCER) TOMBR(AR_CEXCER);
CL: CPYSRCF FROMFILE(K3S_5SRC/QRPGLESRC) TOFILE(ACS_5SRC/QRPGLESRC) FROMMBR(K3S_C031) TOMBR(K3S_C031);
CL: CPYSRCF FROMFILE(WEB_5DEV/QCLLESRC) TOFILE(ACS_5DEV/QCLLESRC) FROMMBR(AC_ZCGBCHS) TOMBR(AC_ZCGBCHS);


-------------------------------------------------------
-- Run During Development
-------------------------------------------------------

-- AR_ZCGBCHS
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_ZCGBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);

-- TS_ZCGBCHS
CL: CRTBNDCL PGM(ACS_5OBJ/TS_ZCGBCHS) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- AR_AR_DOABCHS
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_DOABCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_DODBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_FHIBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_FLOBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_HDVBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_IVFBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_LDVBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_LS1BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_LS2BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_LS3BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_LTMBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_OBSBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_OCRBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_OUTBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_OVBBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_OVRBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PDFBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PDTBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PE1BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PE2BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PE3BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PE4BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PE5BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PE6BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PE7BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PE8BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PE9BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PN1BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PSDBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PSLBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PSNBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PSRBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PSSBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PUFBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PUMBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PUPBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_PUWBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_Q01BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_Q02BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_Q03BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_Q04BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_Q05BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_Q06BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_Q07BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_Q08BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_Q09BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_Q10BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_Z00BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_Z10BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_ZC1BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_ZN1BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_ZNWBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_ZR1BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_ZRMBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_ZY1BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_ZY2BCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);

-- AC_ZCGBCHS
CL: CRTBNDCL PGM(ACS_5OBJ/AC_ZCGBCHS) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- TS_ZCGBCHS
CL: CRTBNDCL PGM(ACS_5OBJ/TS_ZCGBCHS) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);

CL: GRTOBJAUT OBJ(ACS_5OBJ/*ALL) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


--------------------------------------------------------------------------------
-- Integrated Testing Environment
--------------------------------------------------------------------------------

-- AR_ADDLINK
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_ZCGBCHS) TOMBR(AR_ZCGBCHS);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_ZCGBCHS) SRCFILE(WEB_5TDV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);

-- AC_ADDLINK
CL: CPYSRCF FROMFILE(ACS_5DEV/QCLLESRC) TOFILE(WEB_5TDV/QCLLESRC) FROMMBR(AC_ADDLINK) TOMBR(AC_ADDLINK);
CL: CRTBNDCL PGM(WEB_5TST/AC_ADDLINK) SRCFILE(WEB_5TDV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);

CL: GRTOBJAUT OBJ(WEB_5TST/*ALL) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


--------------------------------------------------------------------------------
-- Deployment
--------------------------------------------------------------------------------

-- AR_AR_ZCGBCHS
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(AR_ZCGBCHS) TOMBR(AR_ZCGBCHS);
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_ZCGBCHS) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);

CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_ZCGBCHS) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


--------------------------------------------------------------------------------
-- Hotfix to FTP site
--------------------------------------------------------------------------------

-- Clear save file
CL: CLRSAVF FILE(QGPL/r6objects);

-- Add objects to save file
CL: SAVOBJ OBJ(AR_ADDLINK AC_ADDLINK) LIB(ACS_5OBJ) DEV(*SAVF) SAVF(QGPL/r6objects);

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
