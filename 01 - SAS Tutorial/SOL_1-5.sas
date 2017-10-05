/*
 * 1-5
 * What's wrong with the program?
 */
DATA MISTAKE;
INPUT ID 1-3 TOWN 4-6 REGION 7-9 YEAR 11-12 BUDGET 13-14
VOTER-TURNOUT 16-20  **Variable has a dash. Semicolon missing at end.;
DATALINES;
00104050422 12345
   (more data lines)
;
PROC MEANS DATA=MISTAKE;
VAR ID REGION VOTER-TURNOUT; **don't want the mean of ID. REGION?;
N,STD,MEAN; *Needs to go up on the proc line;
RUN;