/*
 * 2-9
 * */
 * What's wrong with the following program? ;

   1   DATA 123; *invalid name;
   2      INPUT AGE STATUS PROGNOSIS DOCTOR GENDER STATUS2
   3            STATUS3;
   4   (data lines) * should read DATALINES;
         ;
   5   PROC CHART DATA=123 BY GENDER; *needs to be sorted by GENDER first. Needs semicolon after data=123;
   6      VBAR STATUS * missins semicolon;
   7      VBAR PROGNOSIS;
   8   RUN;
   9   PROC PLOT DATA=123;
   10      DOCTOR BY PROGNOSIS;** should read plot DOCTOR * PROGNOSIS;
   11   RUN;
