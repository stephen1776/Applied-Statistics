/*
 * 2-11
 * Given the shown data set
 * a) Write a SAS program to compare the sales records of teh company's 
 * three sales people.
 */

DATA SALES;
   INPUT PERSON $ TARGET $ VISITS CALLS UNITS;
DATALINES;
Brown      American   3   12   28000
Johnson   VRW      6   14   33000
Rivera   Texam      2   6   8000
Brown      Standard   0   22   0
Brown      Knowles   2   19   12000
Rivera   Metro      4   8   13000
Rivera   Uniman   8   7   27000
Johnson   Oldham   3   16   8000
Johnson   Rondo      2   14   2000
;
PROC MEANS DATA=SALES N SUM MEAN STD MAXDEC=0;
   CLASS PERSON;
   TITLE "Sales Figures for Each Salesperson";
   VAR VISITS CALLS UNITS;
RUN;

/*
 * b) Plot the number of visits against the number of phone calls. Use the value
 * of Salesperson as the plotting symbol.
 */


PROC PLOT DATA=SALES;
   TITLE "Number of Visits vs Phone Calls";
   PLOT VISITS*CALLS = PERSON;
RUN;

/*
 * c) Make a frequency bar chart for each salesperson for the sum of "units sold."
 */

PROC CHART DATA=SALES;
   TITLE "Frequency by Salesperson";
   VBAR PERSON / SUMVAR=UNITS TYPE=SUM;
RUN;






