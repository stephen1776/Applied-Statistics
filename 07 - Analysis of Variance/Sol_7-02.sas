/*
 * 7-2
 * Two cholesterol-lowering meds (statins) and a placebo were given to each
 * of 10 volunteers with cholesterol readings of 240 or higher. After 6 weeks, 
 * the following cholesterol values were recorded:
 * Statin A:	220  190  180  185  210  170  178  200  177  189
 * statin B:	160  168  178  200  172  155  159  167  185  199
 * Placebo:		240  220  246  244  198  238  277  255  190  188
 * Create a SAS data set by reading these data. Have the program create 
 * a treatment variable (call it treat) with values of A, B and Placebo. 
 * Then run a one-way ANOVA followed by a student-newman-keuls multiple-
 * comparison test. 
 */

DATA CHOL_MEDS;
   LENGTH TREAT$ 7;
   DO TREAT = 'A','B','PLACEBO';
      DO I = 1 TO 10;
         INPUT CHOLESTEROL @;
         OUTPUT;
      END;
   END;
   DROP I;
DATALINES;
220  190  180  185  210  170  178  200  177  189
160  168  178  200  172  155  159  167  185  199
240  220  246  244  198  238  277  255  190  188
;
PROC ANOVA DATA=CHOL_MEDS;
   TITLE "Cholesterol Treatment";
   CLASS TREAT;
   MODEL CHOLESTEROL = TREAT;
   MEANS TREAT / SNK;
RUN;