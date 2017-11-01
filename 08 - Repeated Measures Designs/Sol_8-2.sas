/*
 * 8-2
 * Run the program (page 279) to create a SAS data set called STATIN.
 * Each patient has his or her cholesterol measured at the end of 6 weeks
 * while on drug A, B, or C. Ignoring GENDER and DIET in the data set, 
 * compare the total cholesterol (TOTAL), the LDL, and the HDL among 
 * the 3 drugs.
 */

DATA STATIN;
   DO SUBJ = 1 TO 20;
      IF RANUNI(1557) LT .5 THEN GENDER = 'FEMALE';
      ELSE GENDER = 'MALE';
      IF RANUNI(0) LT .3 THEN DIET = 'HIGH FAT';
      ELSE DIET = 'LOW FAT';
      DO DRUG = 'A','B','C';
         LDL = ROUND(RANNOR(1557)*20 + 110 
                     + 5*(DRUG EQ 'A') 
                     - 10*(DRUG EQ 'B')
                     - 5*(GENDER EQ 'FEMALE')
                     + 10*(DIET EQ 'HIGH FAT'));
         HDL = ROUND(RANNOR(1557)*10 + 20 
                     + .2*LDL 
                     + 12*(DRUG EQ 'B'));
         TOTAL = ROUND(RANNOR(1557)*20 + LDL + HDL + 50
                     -10*(GENDER EQ 'FEMALE')
                     +10*(DIET EQ 'HIGH FAT'));
         OUTPUT;
      END;
   END;
RUN;

PROC GLM DATA=STATIN;
   TITLE "Comparing Cholesterol among Three Statin Drugs";
   CLASS DRUG SUBJ;
   MODEL LDL HDL TOTAL = SUBJ DRUG / SS3;
   MEANS DRUG / SNK;
RUN;
