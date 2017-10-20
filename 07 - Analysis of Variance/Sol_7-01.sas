/*
 * 7-1
 * Three brands of tennis shoes are tested to see how many months of playing 
 * would wear out the soles. Eight pairs of brands A, N, and T are randomly 
 * assigned to a group of 24 volunteers. Table page 231 shows the results.
 * Are the brands equal in wear quality? Write a SAS program to solve this
 * problem, using ANOVA. Include statements to perform an SNK multiple 
 * comparison.   
 */

DATA tennis_shoes;
   DO BRAND = 'A','N','T';
      DO PAIRNUM = 1 TO 8;
         INPUT TIME @;
         OUTPUT;
      END;
   END;
DATALINES;
8 10 9 11 10 10 8 12
4 7 5 5 6 7 6 4
12 8 10 10 11 9 9 12
;
PROC ANOVA DATA=tennis_shoes;
   TITLE "Tennis Shoe Brand Comparison";
   CLASS BRAND;
   MODEL TIME = BRAND;
   MEANS BRAND / SNK;
RUN;

/*
F = 28.89, p < 0.0001 
N is significantly lower than either T or A 
*/







