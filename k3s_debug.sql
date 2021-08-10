------------------------------------------
-- Troubleshooting a Bug
------------------------------------------

-- First time

-- Create a developer-specific save file on Conan Dev
CL: DLTF FILE(QGPL/APIMISSCHK);
CL: CRTSAVF FILE(QGPL/APIMISSCHK) TEXT('Web - SAVF TO transfer Conan to Leno');

-- Create a developer-specific save file on Leno
CL: DLTF FILE(QGPL/APIMISSCHK);
CL: CRTSAVF FILE(QGPL/APIMISSCHK) TEXT('Web - SAVF TO send objects from Conan to Leno');


-- Every time

-- Clear the save file
CL: CLRSAVF FILE(QGPL/APIMISSCHK);

-- Add API object in error to save file
CL: SAVOBJ OBJ(AR_FPRPROR TS_FPRPROR) LIB(ACS_5DEV) DEV(*SAVF) SAVF(QGPL/APIMISSCHK);

-- Transfer save file
CL: CALL QGPL/CBEAN_PUTL;


---------------------
-- on Leno...
---------------------

-- Restore the save file objects to library DMO
CL: RSTOBJ OBJ(*ALL) SAVLIB(ACS_5DEV) DEV(*SAVF) SAVF(QGPL/APIMISSCHK) RSTLIB(DMO_5OBJ) ALWOBJDIF(*ALL) MBROPT(*ALL);

-- Set library list to include DMO_5MOD DMO_5DTA DMO_5OBJ DMO_5WEB
CL: ADDLIBLE LIB(DMO_5MOD) POSITION(*LAST);
CL: ADDLIBLE LIB(DMO_5DTA) POSITION(*LAST);
CL: ADDLIBLE LIB(DMO_5OBJ) POSITION(*LAST);
CL: ADDLIBLE LIB(DMO_5WEB) POSITION(*LAST);

-- Call the TS_* program on Leno
CL: CALL DMO_5OBJ/TS_*;