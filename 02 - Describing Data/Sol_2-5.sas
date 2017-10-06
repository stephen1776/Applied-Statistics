/*
 * Run the following program to create a SAS data set called PROB2_5,
 * containing var's X,Y,Z, and GROUP:
 *  */
DATA PROB2_5;
   LENGTH GROUP $ 1;
   INPUT X Y Z GROUP $;
DATALINES;
2   4   6   A
3   3   3   B
1   3   7   A
7   5   3   B
1   1   5   B
2   2   4   A
5   5   6   A
;


/*
 * a) Write the SAS statements to generate a frequency bar chart (histogram)
 * for GROUP.
 */
PROC SGPLOT DATA=PROB2_5;
   VBAR GROUP;
RUN;

/*
 * b) Write the SAS staements to generate the plots of Y vs X (with Y on vertical
 * axis and X on the horizontal).
 */
PROC PLOT DATA=PROB2_5;
   PLOT Y*X;
RUN;

/*
 * c) write the SAS staements to generate a seperate plot of Y vs X for 
 * each value of the GROUP var's.
 */

PROC SORT DATA=PROB2_5;
   BY GROUP;
RUN;
PROC PLOT DATA=PROB2_5;
   BY GROUP;
   PLOT Y*X;
RUN;












