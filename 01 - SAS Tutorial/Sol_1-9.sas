/*
 * 1-9
 * 
 * Given the data set:
 * write SAS statements to produce a report as shown.
 */

DATA HEALTH_DATA;
   INPUT ID RACE$ SBP DBP HR; *systolic & diastolic blood pressure, heart rate; 
DATALINES;
001   W   130   80   60
002   B   140   90   70
003   W   120   70   64
004   W   150   90   76
005   B   124   86   72
;
PROC SORT DATA=HEALTH_DATA;
   BY SBP;
RUN;
PROC PRINT DATA=HEALTH_DATA;
   TITLE "Race and Hemodynamic Variables";
   ID ID;
   VAR RACE SBP DBP;
RUN;
