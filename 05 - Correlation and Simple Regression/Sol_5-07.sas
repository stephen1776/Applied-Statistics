/*
 * 5-7
 * Using the data from 5-1, compute 3 new var's LX, LY, and LZ, which are
 * the natural logs of original values. Compute a correlation matrix
 * for the 3 new variables.
 */

DATA data_5_7;
   INPUT X Y Z;
   LX = LOG(X);
   LY = LOG(Y);
   LZ = LOG(Z);
DATALINES;
1 3 15
7 13 7
8 12 5
3 4 14
4 7 10
;
PROC CORR DATA=data_5_7;
   VAR LX LY LZ;
RUN;