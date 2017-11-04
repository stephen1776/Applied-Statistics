/*
 * 9-8
 * Run the program shown p. 317 to create a SAS data set called SMOKING.
 * Outcome values of 1 = lung cancer, 0 = controls (no lung cancer).
 * Generate a 2 x 2 table outcome by smoking status. What is the chi-square
 * and the odds ratio? Now run a logistic regression with only SMOKING as 
 * the predictor variable.  
 */


PROC FORMAT;
   VALUE YESNO 1='Yes' 0='No';
   VALUE OUTCOME 1='Case' 0='Control';
RUN;
DATA SMOKING;
   DO SUBJECT = 1 TO 1000;
      DO OUTCOME = 0,1;
         IF RANUNI(567) LT .1 OR RANUNI(0)*OUTCOME GT .5 THEN SMOKING = 1;
         ELSE SMOKING = 0;
         IF RANUNI(0) LT .05 OR (RANUNI(0)*OUTCOME + .1*SMOKING) GT .6 THEN ASBESTOS = 1;
         ELSE ASBESTOS = 0;
         IF RANUNI(0) LT .3 OR OUTCOME*RANUNI(0) GT .9 THEN SES = '1-Low   ';
         ELSE IF RANUNI(0) LT .3 OR OUTCOME*RANUNI(0) GT .8 THEN SES = '2-Medium';
         ELSE SES = '3-High';
         OUTPUT;
      END;
   END;
   FORMAT SMOKING ASBESTOS YESNO. OUTCOME OUTCOME.;
RUN;
PROC FREQ DATA=SMOKING;
   TITLE "Outcome by smoking status";
   TABLES SMOKING*OUTCOME/ CHISQ CMH;
RUN;
PROC LOGISTIC DATA=SMOKING ORDER=FORMATTED;
   TITLE "Logistic Model with SMOKING as Predictor Variable";
   MODEL OUTCOME = SMOKING / CTABLE PPROB=0 TO 1 BY .1
                                          OUTROC=ROCDATA;
RUN;