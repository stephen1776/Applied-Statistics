/*
 * 4-9
 * We have a data set called BLOOD (page 157) that contains from 1 to 5 observations
 * per patient. Each observation has the variables ID, GROUP, TIME, WBC
 * (Whit Blood Cells), and RBC (red blood cells). 
 * We want to create a data set that contains the mean WBC and RBC for each subject.
 * This new data set should contain the var's ID, GROUP, M_WBC, and M_RBC where
 * these are the respective mean values for the subject. We also ant to exclude any
 * subjects from this data set who have 2 or fewer observations in the original
 * data set.
 */

DATA BLOOD;
   LENGTH GROUP$ 1;
   INPUT ID GROUP$ TIME WBC RBC @@;
DATALINES;
1 A 1 8000 4.5   1 A 2 8200 4.8   1 A 3 8400 5.2
1 A 4 8300 5.3   1 A 5 8400 5.5
2 A 1 7800 4.9   2 A 2 7900 5.0
3 B 1 8200 5.4   3 B 2 8300 5.4   3 B 3 8300 5.2
3 B 4 8200 4.9   3 B 5 8300 5.0
4 B 1 8600 5.5
5 A 1 7900 5.2   5 A 2 8000 5.2   5 A 3 8200 5.4
5 A 4 8400 5.5
;
PROC MEANS DATA=BLOOD NWAY NOPRINT;
   CLASS ID;
   ID GROUP;
   VAR WBC RBC;
   OUTPUT OUT=BLOOD_MEANS(WHERE=(_FREQ_ GT 2) 
                   DROP=_TYPE_) 
                   MEAN = M_WBC M_RBC;
RUN;
PROC PRINT DATA=BLOOD_MEANS NOOBS;
   TITLE "Listing of data set BLOOD_MEANS";
RUN;
