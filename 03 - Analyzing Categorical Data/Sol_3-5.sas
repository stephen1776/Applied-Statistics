/*
 * 3-5
 * Run the following program to create a SAS data set called DEMOG:
 * 
 * We want to recode WEIGHT and HEIGHT as follows
 * WEIGHT 	0-100 = 1
 * 			101-150=2
 * 			151-200=3
 * 			>200 =4
 * HEIGHT	0-70 =1
 * 			>70 = 2
 * We then want to gen a table of WEIGHT categories (rows) by HEIGHT
 * categories (columns). Recode these var's 2 ways: 1) with 'If' statements
 * and 2) with formats.
 */

* Method 1;
DATA DEMOG;
   INPUT WEIGHT HEIGHT GENDER $;
   *Create weight groups;
   IF 0 LE WEIGHT LT 101 THEN WTGRP = 1;
   ELSE IF 101 LE WEIGHT LT 151 THEN WTGRP = 2;
   ELSE IF 151 LE WEIGHT LE 200 THEN WTGRP = 3;
   ELSE IF WEIGHT GT 200 THEN WTGRP = 4;
   *Create height groups;
   IF 0 LE HEIGHT LE 70 THEN HTGRP = 1;
   ELSE IF HEIGHT GT 70 THEN HTGRP = 2;
DATALINES;
155 68 M
98 60 F
202 72 M
280 75 M
130 63 F
.   57 F
166  . M
;
PROC FREQ DATA=DEMOG;
   TABLES WTGRP*HTGRP;
RUN;

* Method 2;
PROC FORMAT;
   VALUE WTFMT 0-100    = '1' 
               101-150  = '2' 
               151-200  = '3' 
               201-HIGH = '4';
   VALUE HTFMT 0-70    = '1' 
               71-HIGH = '2';
RUN;
DATA DEMOG;
   INPUT WEIGHT HEIGHT GENDER$;
DATALINES;
155 68 M
98 60 F
202 72 M
280 75 M
130 63 F
.   57 F
166  . M
;
PROC FREQ DATA=DEMOG;
   TITLE "Weight by Height";
   TABLES WEIGHT*HEIGHT;
   FORMAT WEIGHT WTFMT. HEIGHT HTFMT.;
RUN;