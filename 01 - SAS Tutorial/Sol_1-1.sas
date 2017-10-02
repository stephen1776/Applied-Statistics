/*
 * 1-1
 * We have collected the following data on five subjects:
 * 1  18 M  3.7   650
 * 2  18 F  2.0   490
 * 3  19 F  3.3   580
 * 4  23 M  2.8   530
 * 5  21 M  3.5   640
 * 
 * a. Write the SAS statements necessary to create a SAS data set.
 */
DATA COLLEGE;
   INPUT ID AGE GENDER$ GPA CSCORE;
DATALINES;
1 18 M 3.7 650
2 18 F 2.0 490
3 19 F 3.3 580
4 23 M 2.8 530
5 21 M 3.5 640
;
/*
 * b. Add the statements nec to compute the mean grade point average
 * and mean college entrance exam score.
 */
PROC MEANS DATA=COLLEGE;
   VAR GPA CSCORE;
RUN;

/* c. Compute an index for each subject a follows:
 *	Index = GPA + 3 x CSCORE / 500
 * Modify the program to compute this index for each student and to print
 * a list of students in order of increasing index. Include the student ID
 * GPA, CSCORE, and INDEX.
*/
DATA COLLEGE;
   INPUT ID AGE GENDER$ GPA CSCORE;
   INDEX = GPA + 3*CSCORE/500;
DATALINES;
1 18 M 3.7 650
2 18 F 2.0 490
3 19 F 3.3 580
4 23 M 2.8 530
5 21 M 3.5 640
;

PROC MEANS DATA=COLLEGE;
   VAR GPA CSCORE;
RUN;

PROC SORT DATA=COLLEGE;
   BY INDEX;
RUN;

PROC PRINT DATA=COLLEGE;
   TITLE "Students in Index Order"; 
   ID ID;
   VAR GPA CSCORE INDEX;
RUN;









