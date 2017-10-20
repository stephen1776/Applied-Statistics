/*
 * 7-6
 * Two groups of patients, those with a genetic defiency and the other a 
 * "normal" group, are given either a drug to cure depression or placebo.
 * A standardized depression survey is given to all the subjects with the 
 * results shown:
 * 				Anti-Depression Drug 		Placebo
Genetic Def  	9  							9
				11 							6
				10 							6
				10 							7
				------------------------------
Normal			5  							12
				4  							11
				7  							10
				7  							11	
 * 
 * Perform a two-way analysis of variance to test
 * for drug and genetic differences.
 */

DATA GEN_DEF;
   DO GROUP = 'DEFICIENT','NORMAL';
      DO I = 1 TO 4;
         DO TREAT = 'DRUG   ','PLACEBO';
            INPUT DEPRESSION @@;
            OUTPUT;
         END;
      END;
   END;
   DROP I;
DATALINES;
9  9
11 6
10 6
10 7
5  12
4  11
7  10
7  11
;
PROC ANOVA DATA=GEN_DEF;
   TITLE "Anti-Depression Study";
   CLASS GROUP TREAT;
   MODEL DEPRESSION = GROUP | TREAT;
   MEANS GROUP | TREAT / SNK;
RUN;
