/*
 * 4-5
 * Using the data set (PATIENTS) from section D, write the necessary SAS 
 * statements to create a data set (PROB4_5) in which the first visit for 
 * each patient is omitted. Then using that data set, compute the mean HR, 
 * SBP, and DBP for  each patient. (Patient 9 with only one visit will be 
 * eliminated)
 */

DATA PATIENTS;
   INPUT  @1  ID         3.
          @4  DATE MMDDYY6.
          @10 HR         3.
          @13 SBP        3.
          @16 DBP        3.
          @19 DX         3.
          @22 DOCFEE     4.
          @26 LABFEE     4.;
   FORMAT DATE MMDDYY8.;
DATALINES;
00710218307012008001400400150
00712018307213009002000500200
00909038306611007013700300000
00507058307414008201300900000
00501158208018009601402001500
00506188207017008401400800400
00507038306414008401400800200
;
PROC SORT DATA=PATIENTS;
   BY ID DATE;
RUN;
DATA PROB4_5;
   SET PATIENTS;
   BY ID;
  IF NOT FIRST.ID; /* Omit the first visit */
RUN;
PROC MEANS DATA=PROB4_5 MEAN MAXDEC=2;
   CLASS ID;
   VAR HR SBP DBP;
RUN;