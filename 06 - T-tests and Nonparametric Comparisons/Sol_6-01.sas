/*
 * 6-1
 * The following table shows the time for sujects to feal relief from 
 * headache pain:
 * Aspirin		Tylenol
 * (relief time in minutes)
 * 40			35
 * 42			37
 * 48			42
 * 35			22
 * 62			38
 * 35			29
 * 
 * Write a SAS program to read these data and perform a t-test. Is any product 
 * significantly faster than the other (at 0.05 level)?
 */

DATA headache_relief;
   INPUT DRUG$ TIME @@;
DATALINES;
A 40 A 42 A 48 A 35 A 62 A 35
T 35 T 37 T 42 T 22 T 38 T 29
;
PROC TTEST DATA=headache_relief;
   TITLE "Headache Relief Study";
   CLASS DRUG;
   VAR TIME;
RUN;

/*
No drug was significantly faster at the 0.05 level (t = 1.93, p = .0827).
*/




