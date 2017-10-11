/*
 * 4-7
 * Write a proggram similar to 4-5 except we want to include all the data
 * for each patient and excluding single visit patients. Instead of having
 * proc means create printed output, use it to create a SAS data set (PAT_MEAN)
 * containg the mean for each patient. 
 */

PROC SORT DATA=PATIENTS; 
   BY ID;
RUN;
DATA PROB4_7;
   SET PATIENTS;
   BY ID;
IF FIRST.ID AND LAST.ID THEN DELETE; /* Omit patients with only one visit */
RUN;
PROC MEANS DATA=PROB4_7 NOPRINT NWAY;
   CLASS ID;
   VAR HR SBP DBP;
   OUTPUT OUT = PAT_MEAN MEAN= / AUTONAME;
RUN;