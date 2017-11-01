/*
 * 8-6
 * Using the STATIN data set, add DIET (not a repeated factor) to the model.
 * The independent var's are GENDER, DRUG(repeated), and DIET.
 */

PROC GLM DATA=STATIN;
   TITLE "Experiment with Repeated Measures on One Factor";
   CLASS GENDER DRUG DIET SUBJ;
   MODEL LDL HDL TOTAL = GENDER DIET GENDER*DIET SUBJ(GENDER DIET)
                         DRUG GENDER*DRUG DIET*DRUG GENDER*DIET*DRUG
                         DRUG*SUBJ(GENDER DIET) / SS3;
   TEST H = GENDER DIET GENDER*DIET         					
   		E = SUBJ(GENDER DIET);
   TEST H = DRUG GENDER*DRUG DIET*DRUG GENDER*DIET*DRUG
   		E = DRUG*SUBJ(GENDER DIET);
RUN;