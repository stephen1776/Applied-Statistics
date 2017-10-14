/*
 * 5-9
 * Generate:
 * a) A plot of Y vs X from 5-1 data
 * b) A plot of the regression line and the original data on the same
 * set of axies.
 */

PROC PLOT DATA=data_5_1;
   PLOT Y*X;
RUN;


PROC SGPLOT DATA=data_5_1;   
  reg Y = Y X = X;
RUN;
