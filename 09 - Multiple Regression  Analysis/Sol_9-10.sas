/*
 * 9-10
 * Using the data from 9-8, conduct a logistic regression predicting outcome
 * (case or control) using SMOKING, ASBESTOS, and SES. Use a class statement 
 * to create 2 dummy var's for SES, setting the reference level to
 * '2-Medium'.
 */

PROC LOGISTIC DATA=SMOKING ORDER=FORMATTED;
   CLASS SES (PARAM=REF REF='2-Medium');
   MODEL OUTCOME = SMOKING ASBESTOS SES / CTABLE PPROB=0 TO 1 BY .1
                                          OUTROC=ROCDATAOUT;
RUN;
