/*
 * 6-7
 * A researcher wants to randomly assign 10 patients to one of 3 treatment
 * groups. Each subject has a unique subject number (SUBJ), Write a SAS
 * program to assign these subjects to a treatment group and produce a 
 * listing of subjects and groups in suject order (ascending).
 */

PROC FORMAT;
   VALUE GROUP 0 = 'A' 1 = 'B' 2 = 'C';
RUN;
DATA RANDOM;
   INPUT SUBJ @@;
   GROUP = RANUNI(0); 
DATALINES;
1286 1975 2234 6678 0357 3041 3608 8819 0012 4867
;
PROC RANK DATA=RANDOM OUT = RANKED GROUP = 3;
   VAR GROUP;
RUN;
PROC SORT DATA=RANKED;
   BY SUBJ;
RUN;
PROC PRINT DATA=RANKED;
   TITLE "Listing of Subject Numbers and Group Assignments";
   FORMAT GROUP GROUP.;
   ID SUBJ;
   VAR GROUP;
RUN;