/*
 * 3-11
 * A researcher wants to determine if there is a relationship between use
 * of computer terminals and miscarriages. An unpaired, case control syudy
 * is conducted. Of the cses (women with miscarriages), there are 30 women
 * who used VDTs and 50 who did not. Among the controls, there were 90 
 * women who used VDTs and 200 who did not. Compute chi-square, the odds 
 * ratio, and a 95% confidence interval for the odds ratio.
 */

DATA VDT_USE;
   INPUT GROUP$ VDT$ COUNT;
DATALINES;
CASE 1-YES 30
CASE 2-NO 50
CONTROL 1-YES 90
CONTROL 2-NO 200
;
PROC FREQ DATA=VDT_USE;
   TITLE "Case Controled Study of Video Display Terminal Use";
   TABLES VDT * GROUP / CHISQ CMH;
   WEIGHT COUNT;
RUN;


/*
 * Chi-square = 1.1961, p = 0.2741  OR = 1.333, 95% CI (0.7956, 2.2349).
*/