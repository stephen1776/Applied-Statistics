/*
 * 3-9
 * A matched pair case-control study is conducted. Each case (a person
 * with disease X) is matched to a single control, based on age (plus or
 * minus 2 years) and gender. Each person is then asked if he/she used
 * multivitamins regularly in the past year. The results are:
 * Used Vitamins	Matched Controls use of vitamins	Count 
 * yes				yes									100
 * yes				no									50
 * no				yes									90
 * no				no									200
 * 
 * remembering that this is a matched study, compute a McNemar chi-square.
 * Are the cases more or less likely to have used vitamins?
 */

DATA VITAMINS;
   INPUT V_CASE $ V_CONT $ COUNT;
   LABEL V_CASE = 'Case Use Vitamins'
         V_CONT = 'Control Use Vitamins';
   
DATALINES;
1-YES  1-YES  100
1-YES  2-NO    50
2-NO   1-YES   90
2-NO   2-NO   200
;
PROC FREQ DATA=VITAMINS;
   TITLE "Matched Case-control Study";
   TABLES V_CASE * V_CONT / AGREE;
   WEIGHT COUNT;
RUN;

/*
Chi-square (McNemar) = 11.429, p = .001 
It is more likely to develop disease X if you do not use vitamins. 
Note: It is only the discordant pairs (yes/no or no/yes) that 
contribute to the McNemar Chi-square.
*/
