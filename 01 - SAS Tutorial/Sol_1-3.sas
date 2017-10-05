/*
 * 1-3
 * Given the data set:
 * 
 * a) create a SAS data set using the previous data. Compute the average 
 * annual salary and ave age.  
 */

DATA TAXES;
   INPUT SS SALARY AGE RACE $;
   FORMAT SS SSN11.; 
DATALINES;
123874414 28000 35 W
646239182 29500 37 B
012437652 35100 40 W
018451357 26500 31 W
;
PROC MEANS DATA=TAXES N MEAN MAXDEC=0;
   TITLE "Descriptive Statistics for Salary and Age";
   VAR SALARY AGE;
RUN;

/*
 *  b) If all sudjects were in a 30% tax bracket, compute their taxes and 
 * print out a list, in ssn order, showing annual salary and the tax.
 */
DATA TAXES;
   INPUT SS SALARY AGE RACE$;
   TAX = 0.30 * SALARY;
   FORMAT SS SSN11.; 
DATALINES;
123874414 28000 35 W
646239182 29500 37 B
012437652 35100 40 W
018451357 26500 31 W
;
PROC MEANS DATA=TAXES N MEAN MAXDEC=0;
   TITLE "Descriptive Statistics for Salary and Age";
   VAR SALARY AGE;
RUN;
PROC SORT DATA=TAXES;
   BY SS;
RUN;
PROC PRINT DATA=TAXES;
   TITLE "Listing of Salary and Taxes";
   ID SS;
   VAR SALARY TAX;
RUN;




