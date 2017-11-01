/*
 * 8-4
 * Using the STATIN data set from 8-2, add GENDER to the model and test
 * for GENDER and DRUG effects as well as GENDER by DRUG interaction.
 * Remember that DRUG is a repeated measure and the design is unbalanced.
 * Generate an interaction graph for LDL, HDL, and TOTAL with DRUG on the 
 * x-axis and GENDER as the plotting symbol.
 */

PROC GLM DATA=STATIN;
   TITLE "Model Cholesterol with DRUG and GENDER";
   CLASS SUBJ DRUG GENDER;
   MODEL LDL HDL TOTAL = GENDER SUBJ(GENDER) DRUG
                        GENDER*DRUG DRUG*SUBJ(GENDER);
   LSMEANS GENDER|DRUG;
   TEST H = GENDER             E = SUBJ(GENDER);
   TEST H = DRUG GENDER*DRUG   E = DRUG*SUBJ(GENDER);
RUN;
 
PROC MEANS DATA=STATIN NOPRINT NWAY;
   CLASS DRUG GENDER;
   VAR LDL HDL TOTAL;
   OUTPUT OUT=INTERACT MEAN=;
RUN;

PROC PLOT DATA=INTERACT;
   TITLE "Interaction Plot";
   PLOT (LDL HDL TOTAL)*DRUG = GENDER;
RUN;
