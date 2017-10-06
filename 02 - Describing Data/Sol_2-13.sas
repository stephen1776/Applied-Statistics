/*
 * 2-13
 * You have completed an experiment and have recorded a subject ID and 
 * values A, B, C. You want to compute means for A, B, and C but, the lab 
 * tech arranged the data like that shown
 * 
 * Write a program to read these data and produce means.
 */

DATA EXPERIMENT;
   INPUT ID TYPE$ SCORE;
DATALINES;
1   A   44
1   B   9
1   C   203
2   A   50
2   B   7
2   C   188
3   A   39
3   B   9
3   C   234
;
PROC SORT DATA=EXPERIMENT;
   BY TYPE;
RUN;

PROC MEANS DATA=EXPERIMENT;
   VAR SCORE;
RUN;