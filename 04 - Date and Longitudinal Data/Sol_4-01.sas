/*
 * 4-1
 * We have collected data on a questionaire as shown page 154 with some 
 * sample datawith col indicators as well.
 * 
 * a) Write a SAS program to read these data
 * 
 * b) Compute age (in years) at time work was started and length of time
 * between ST_DATE and END_DATE.
 * 
 * c) Compute the sales per year of work
 * 
 * d) Print out a report showing:
 * ID	DOB	AGE	LENGTH	SALES_YR
 * use the MMDDYY10. format to print the DOB.
 * 
 * e) Modify the program to compute AGE as of the last birthday and sales
 * per year rounded to the nearest 10 dollars. 
 */

DATA questionaire;
   INPUT @1 ID 3.
         @5 (DOB ST_DATE END_DATE)(MMDDYY8.) /* using var and informat lists*/
         @29 SALES 4.;
   /* AGE = YRDIF(DOB,ST_DATE,'ACTUAL'); */  
   AGE = INT(YRDIF(DOB,ST_DATE,'ACTUAL'));
   LENGTH = YRDIF(ST_DATE,END_DATE,'ACTUAL') + 1;
   /* SALES_YR = SALES / LENGTH; */
   SALES_YR = ROUND ((SALES/LENGTH),10);
   FORMAT DOB ST_DATE END_DATE MMDDYY10. 
          SALES_YR DOLLAR8.;
DATALINES;
001 1021194611121980122819887343
002 0913195502021980020419880123
005 0606194003121981031220040000
003 0705194411151980111320009544
;
PROC PRINT DATA=questionaire;
   TITLE "Questionaire Report";
   ID ID;
   VAR DOB AGE LENGTH SALES_YR;
RUN;