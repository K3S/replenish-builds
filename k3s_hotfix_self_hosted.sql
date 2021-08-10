-- Copy current API source member to dev library
CL: CPYSRCF FROMFILE(WEB_5DEV/QRPGLESRC) TOFILE(ACS_5DEV/QRPGLESRC) FROMMBR(AR_UWPVORC) TOMBR(AR_UWPVORC);

-- Copy current Test source member to dev library
CL: CPYSRCF FROMFILE(WEB_5DEV/QCLLESRC) TOFILE(ACS_5DEV/QCLLESRC) FROMMBR(TS_UWPVORC) TOMBR(TS_UWPVORC);

-- Compile source with DBGVIEW(*SOURCE) param
CL: CRTSQLRPGI OBJ(ACS_5DEV/AR_UWPVORC) SRCFILE(ACS_5DEV/QRPGLESRC) COMMIT(*NONE) OPTION(*EVENTF *XREF) DBGVIEW(*SOURCE) TGTRLS(V7R2M0);

-- Edit TS_* source member in dev library

-- Compile TS_* source member in dev library
CL: CRTBNDCL PGM(ACS_5DEV/TS_UWPVORC) SRCFILE(ACS_5DEV/QCLLESRC) OPTION(*EVENTF) DBGVIEW(*SOURCE);

-- Clear save file
CL: CLRSAVF FILE(QGPL/r6objects);

-- Add objects to save file
CL: SAVOBJ OBJ(AR_UWPVORC TS_UWPVORC) LIB(ACS_5DEV) DEV(*SAVF) SAVF(QGPL/r6objects);

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

-- Create empty save file on MR Williams's server
CL: CRTSAVF QGPL/r6objects;
CL: CLRSAVF QGPL/r6objects;

-- Download savefile to MR Williams
-- (on MR Williams's server)
FTP RMTSYS(K3S.SMARTFILE.COM)   
> cd /R6_Deployment/Customer_Access                                                                 
  250 "/R6_Deployment/Customer_Access" is the current directory.                                    
> bin                                                                      
  200 Type set to: Binary.                                                 
> get r6objects (replace                                            
  200 Active data connection established.                                  
  125 Data connection already open. Transfer starting.                     
  226 Transfer complete.                                                   
  2356992 bytes transferred in 2.426 seconds. Transfer rate 971.642 KB/sec.


-- Restore objects to K3S_5HOTFX library
CL: RSTOBJ OBJ(*ALL) SAVLIB(ACS_5DEV) DEV(*SAVF) SAVF(QGPL/r6objects) RSTLIB(K3S_5HOTFX) ALWOBJDIF(*ALL) MBROPT(*ALL);

-- Start debug


