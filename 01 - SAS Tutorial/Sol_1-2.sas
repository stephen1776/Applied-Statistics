/*
 * 1-2
 * You have collected the following info on some participants in a diet
 * program:
 * 00768155150
 * 00272250240
 * 00563240200
 * 00170345298
 *  
 * 
 * a. Reading the following data lines, create a SAS data set using column
 * input. Include in this data set three comuted variables called BMI_INIT
 * (body mass index initial), BMI_FINAL, and BMI_DIFF. BMI is a person's
 * weight (kg) / height (meters) squared. 
 * 
 * b. Print out a listing of this data set in subject number order. Incude 
 * in the listing only the var's SUBJ, HEIGHT, BMI_INIT, BMI_FINAL, and 
 * BMI_DIFF.
 *  
 */

DATA DIET;
   INPUT SUBJ    $ 1-3
         HEIGHT    4-5
         WT_INIT   6-8
         WT_FINAL  9-11;
   ***Convert to metric;
   WT_INIT = WT_INIT/2.2; *convert pounds to kg;
   WT_FINAL = WT_FINAL/2.2;
   HEIGHT = HEIGHT*.0254; *convert inches to meters;
   BMI_INIT = WT_INIT/HEIGHT**2;
   BMI_FINAL = WT_FINAL/HEIGHT**2;
   BMI_DIFF = BMI_FINAL - BMI_INIT;
DATALINES;
00768155150
00272250240
00563240200
00170345298
;
PROC SORT DATA=DIET;
   BY SUBJ;
RUN;
PROC PRINT DATA=DIET;
   TITLE "Diet Program";
   ID SUBJ;
   VAR HEIGHT BMI_INIT BMI_FINAL BMI_DIFF;
RUN;