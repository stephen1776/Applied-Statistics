/*
 * 2-1
 * Add the necessary staements to compute the number of males and females
 * in prob 1-1.
 *  from 1-1
 * We have collected the following data on five subjects:
 * 1  18 M  3.7   650
 * 2  18 F  2.0   490
 * 3  19 F  3.3   580
 * 4  23 M  2.8   530
 * 5  21 M  3.5   640
 *
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
PROC FREQ DATA=COLLEGE;
   TABLES GENDER;
RUN;