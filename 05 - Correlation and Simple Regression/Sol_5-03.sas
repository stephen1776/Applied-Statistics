/*
 * 5-3
 * Given the following data:
AGE SBP
15 116
20 120
25 130
30 132
40 150
50 148

 * How much of the variance of SBP (systolic blood pressure) can be explained 
 * by the fact that there is variabilty in AGE? (Use SAS to compute the correlation
 * between SBP and AGE).
 */

DATA BLOOD_PRESSURE;
   INPUT AGE SBP;
DATALINES;
15 116
20 120
25 130
30 132
40 150
50 148
;
PROC CORR DATA=BLOOD_PRESSURE;
   VAR AGE SBP;
RUN;
/* r = 0.95258, p =0.0033 */
