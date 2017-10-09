/*
 * 3-13
 * A researcher wantsw to determine if sound proofing a classroom leads
 * tp better behavior among the students. In standard classrooms, there 
 * were 30 behavior problems from a total of 250 students. In the sound-
 * proofed classrooms there were 20 problem students out of 300.
 * Test if room noise 
 * results in an incresed number of behavior problems by computing the 
 * relative risk (of noisy classrooms) for producing behavior problems.
 * Have SAS produce a 95% CI for the relative risk as well. 
 */

DATA CLASS_BEHAVIOR;
   INPUT TYPE : $10. PROBLEM$ COUNT;
DATALINES;
1-STANDARD 1-YES 30
1-STANDARD 2-NO 220
2-PROOFED  1-YES 20
2-PROOFED  2-NO 280
;
PROC FREQ DATA=CLASS_BEHAVIOR;
   TITLE "Sound Proofing Classroom Study";
   TABLES TYPE * PROBLEM / CHISQ CMH;
   WEIGHT COUNT;
RUN;

/*
RR = 1.800 (room noise increases the number of behavior problems), 95% CI (1.057, 3.065).
*/