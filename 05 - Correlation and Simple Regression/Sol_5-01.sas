/*
 * 5-1
 * given the following data:
X	Y	Z
1  3  15
7  13 7
8  12 5
3  4  14
4  7  10

a) Write a SAS program and compute the Pearson correlation coefficient between
X; Y and Z. What is the significance of each? 
 */
DATA data_5_1;
   INPUT X Y Z;
DATALINES;
1 3 15
7 13 7
8 12 5
3 4 14
4 7 10
;
PROC CORR DATA=data_5_1;   
   VAR X;                   
   WITH Y Z;
RUN;
/* x vs. y r =  0.96509 p = .0078 */
/* x vs. z r = -0.97525 p = .0047 */

/*
 * b) Change the correlation request to produce a correlation matrix - the correlation
 * coef between each var vs every other var.
 */
PROC CORR DATA=data_5_1;   
   VAR X Y Z;
RUN;
/* y vs. z r = -0.96317 p = .0084 */







