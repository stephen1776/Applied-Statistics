/*
 * 8-8
 * Restructure the STATIN data set to use the repeated statement of PROC GLM.
 * Do this only for LDL cholesterol. Include in the model GENDER, LDL_A, LDL_B, 
 * and LDL_C. 
 */

PROC SORT DATA=STATIN;
   BY SUBJ;
RUN;
DATA RESTRUCTURED;
   DO I = 1 TO 3;
      SET STATIN;
      IF I = 1 THEN LDL_A = LDL;
      ELSE IF I = 2 THEN LDL_B = LDL;
      ELSE IF I = 3 THEN DO;
         LDL_C = LDL;
         OUTPUT;
      END;
   END;
   DROP LDL I DRUG;
RUN;
PROC GLM DATA=RESTRUCTURED;
   CLASS GENDER;
   MODEL LDL_A LDL_B LDL_C = GENDER / SS3 NOUNI;
   REPEATED DRUG / NOM;
RUN;
