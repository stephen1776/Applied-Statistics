/*
 * 9-4
 * Repeat 9-3, creating two dummy var's for DEGREE using DEGREE = 1 (MA)
 * as your reference level. Also use base-e log of AREA instead of AREA 
 * in the model.
 */

DATA LIBRARY;
   INPUT BOOKS ENROLLMENT HIGHEST_DEGREE AREA;
   MASTERS = (HIGHEST_DEGREE EQ 2);
   *Produces values of 1 and 0 for MASTERS;
   DOCTORATE = (HIGHEST_DEGREE EQ 3);
   LOG_AREA = LOG(AREA);
DATALINES;
 4   5  3   20
 5   8  3   40
10  40  3  100
 1   4  2   50
 5   2  1  300
 2   8  1  400
 7  30  3   40
 4  20  2  200
 1  10  2    5
 1  12  1  100
;
PROC REG DATA = LIBRARY;
   MODEL BOOKS = ENROLLMENT MASTERS DOCTORATE LOG_AREA / SELECTION = FORWARD;
RUN;