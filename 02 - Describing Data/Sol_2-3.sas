/*
 * 2-3
 * Modify the program from 1-3 to create a new variable (AGE_GROUP)
 * that has a value of 1 for ages between 0 and 35, and 2 for ages greater
 * than 35. Compute the number of whites (W) and blacks (B) and the number 
 * of each age group. Use appropriate option to omit cumulative statistics
 * from the output.
 */

DATA TAXES;
   INPUT SS SALARY AGE RACE$;
   IF AGE GE 0 AND AGE LE 35 THEN AGE_GROUP = 1;
   ELSE IF AGE GT 35 THEN AGE_GROUP = 2;
   FORMAT SS SSN11.; 
DATALINES;
123874414 28000 35 W
646239182 29500 37 B
012437652 35100 40 W
018451357 26500 31 W
;
PROC FREQ DATA=TAXES;
   TITLE "The Numbers";
   TABLES RACE AGE_GROUP / NOCUM;
RUN;


