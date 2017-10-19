/*
 * 6-5
 * Eight subjects are tested to see which of two medications (A or B)
 * works best. Each subj tries each of two drugs (for 2 different headaches)
 * Ignoring an order effect, what type of test would you use to test if one
 * drug is faster than the other? The following are some made up data:
 Problem 6.5 
 1 20 18 
 2  40 36 
 3  30 30 
 4  45 46 
 5  19 15 
 6  27 22 
 7  32 29 
 8  26 25 
 */

/* We use a paired t-test */

DATA PAIR;
INPUT SUBJECT DRUG_A DRUG_B;
DATALINES;
   1 20 18
   2 40 36
   3 30 30
   4 45 46
   5 19 15
   6 27 22
   7 32 29
   8 26 25
   ;
PROC TTEST DATA=PAIR;
    TITLE "Paired T-Test";
    PAIRED DRUG_A * DRUG_B;
RUN;   

/*
   t = 3.00, p = 0.0199. So there is a significant difference between drug A and 
   drug B with drug B working faster.
*/