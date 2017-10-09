/*
 * 3-1
 * Suppose we have a variable called GROUP that has numeric values 1,2, or 3.
 * Group 1 is a control group, group 2 is given aspiring, and group 3 is 
 * given ibuprofen. Create a format to be assigned to the GROUP variable.
 */

PROC FORMAT;
   VALUE GROUP  1 = 'CONTROL' 
                2 = 'DRUG A'
                3 = 'DRUG B';
RUN;