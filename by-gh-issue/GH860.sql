--------------------------------------------------------------------------------
-- In Development
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(DEV)

-------------------------------
--          APIs
-------------------------------
-- AR_UHSHT12
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_UHSHT12) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_UHSHT12) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AR_UHSHT13
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_UHSHT13) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_UHSHT13) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);

-- AR_UHSHT52
CL: CRTSQLRPGI OBJ(ACS_5OBJ/AR_UHSHT52) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R3M0);
CL: GRTOBJAUT OBJ(ACS_5OBJ/AR_UHSHT52) OBJTYPE(*PGM) USER(*PUBLIC) AUT(*ALL);


--------------------------------------------------------------------------------
-- Integrated Testing Environment
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(ITE)


-- APIs
CL: CALL PGM(ACS_5OBJ/APIPRART) PARM('AR_UHSHT12' 'ACS_5DEV' 'QRPGLESRC' 'QRPGLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');
CL: CALL PGM(ACS_5OBJ/APIPRART) PARM('AR_UHSHT13' 'ACS_5DEV' 'QRPGLESRC' 'QRPGLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');
CL: CALL PGM(ACS_5OBJ/APIPRART) PARM('AR_UHSHT52' 'ACS_5DEV' 'QRPGLESRC' 'QRPGLESRC' 'WEB_5TDV' 'WEB_5TST' 'QSRVSRC' 'K3SDIR');

--------------------------------------------------------------------------------
-- Deployment
--------------------------------------------------------------------------------
-- DEVTOOLS/SETENV ENV(DPL)

CL: CALL PGM(DEVTOOLS/APIPRARD) PARM('AR_UHSHT12' 'WEB_5TDV' 'QRPGLESRC' 'QRPGLESRC' 'WEB_5DEV' 'WEB_5OBJ' 'QSRVSRC' 'K3SDIR');
CL: CALL PGM(DEVTOOLS/APIPRARD) PARM('AR_UHSHT13' 'WEB_5TDV' 'QRPGLESRC' 'QRPGLESRC' 'WEB_5DEV' 'WEB_5OBJ' 'QSRVSRC' 'K3SDIR');
CL: CALL PGM(DEVTOOLS/APIPRARD) PARM('AR_UHSHT52' 'WEB_5TDV' 'QRPGLESRC' 'QRPGLESRC' 'WEB_5DEV' 'WEB_5OBJ' 'QSRVSRC' 'K3SDIR');

-- Set to current date
CL: CHGDTAARA DTAARA(WEB_5OBJ/AR_RELEASE *ALL) VALUE('030422');

--------------------------------------------------------------------------------
-- Hotfix to FTP site
--------------------------------------------------------------------------------

-- Clear save file
CL: CLRSAVF FILE(QGPL/k3shotfix);

-- Add objects to save file
CL: SAVOBJ OBJ(AR_UHSHT12 AR_UHSHT13 AR_UHSHT52) LIB(WEB_5OBJ) DEV(*SAVF) SAVF(QGPL/k3shotfix);

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
CL: SAVOBJ OBJ(AR_UHSHT12 AR_UHSHT13 AR_UHSHT52) LIB(WEB_5OBJ) DEV(*SAVF) SAVF(QGPL/APIMISSCHK);

-- Transfer save file
CL: CALL QGPL/CBEANPUTDR;

-- on Conan DR...
CL: RSTOBJ OBJ(AR_UHSHT12 AR_UHSHT13 AR_UHSHT52) SAVLIB(WEB_5OBJ) DEV(*SAVF) SAVF(QGPL/APIMISSCHK) RSTLIB(RES_5OBJ) ALWOBJDIF(*ALL) MBROPT(*ALL);
