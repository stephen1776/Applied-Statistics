/*
 * 6-3
 * Using same data as 6-1, perform wilcoxon rank-sum test, use the EXACT Wilcoxon 
 * statement and compare the p-value from the exact solution to the normal 
 * approximation. How does this value compare to the t-test results?
 */

PROC NPAR1WAY DATA=headache_relief WILCOXON;
   TITLE "Nonparametric Comparison";
   CLASS DRUG;
   VAR TIME;
   EXACT WILCOXON;
RUN;

/*
Exact two-sided p-val = 0.1385
Approximation using a normal approximation with a continuity correction of 0.5
z = 1.4539, p = 0.1460.
*/