-- GH810

--------------------------------------------------------------------------------
-- In Development
--------------------------------------------------------------------------------

-- AR_UWPVORC
CL: CRTSQLRPGI OBJ(ACS_5DEV/AR_UWPVORC) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);

--------------------------------------------------------------------------------
-- Integrated Testing Environment
--------------------------------------------------------------------------------

-- copy members
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_3426_H) TOMBR(AR_3426_H);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(BUYRGRP_H) TOMBR(BUYRGRP_H);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(PRODWKD_H) TOMBR(PRODWKD_H);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(SUPLVOC_H) TOMBR(SUPLVOC_H);
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(WEEKDIS_H) TOMBR(WEEKDIS_H);

-- AR_UWPVORC
CL: CPYSRCF FROMFILE(ACS_5DEV/QRPGLESRC) TOFILE(WEB_5TDV/QRPGLESRC) FROMMBR(AR_UWPVORC) TOMBR(AR_UWPVORC);
CL: CRTSQLRPGI OBJ(WEB_5TST/AR_UWPVORC) SRCFILE(WEB_5TDV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);

--------------------------------------------------------------------------------
-- Deployment
--------------------------------------------------------------------------------
-- AR_UWPVORC
CL: CPYSRCF FROMFILE(WEB_5TDV/QRPGLESRC) TOFILE(WEB_5DEV/QRPGLESRC) FROMMBR(AR_UWPVORC) TOMBR(AR_UWPVORC);
CL: CRTSQLRPGI OBJ(WEB_5OBJ/AR_UWPVORC) SRCFILE(WEB_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) TGTRLS(V7R2M0);

CL: GRTOBJAUT OBJ(WEB_5OBJ/AR_UWPVORC) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


--------------------------------------------------------------------------------
-- Hotfix
--------------------------------------------------------------------------------

-- Clear save file
CL: CLRSAVF FILE(QGPL/r6objects);

-- Add objects to save file
CL: SAVOBJ OBJ(AR_UWPVORC AC_UWPVORC) LIB(ACS_5DEV) DEV(*SAVF) SAVF(QGPL/r6objects);

-- Upload savefile to Smartfile FTP site
--  (on Conan Dev)
FTP RMTSYS(K3S.SMARTFILE.COM)
> cd /R6_Deployment/Customer_Access
  250 "/Chuk" is the current directory.
> bin
  200 Type set to: Binary.
> put r6objects                                                        
229 Entering extended passive mode (|||21344|).                            
125 Data connection already open. Transfer starting.                       
226 Transfer complete.                                                     
2356992 bytes transferred in 0.721 seconds. Transfer rate 3270.406 KB/sec. 
