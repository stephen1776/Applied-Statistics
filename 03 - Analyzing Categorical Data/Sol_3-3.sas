/*
 * 3-3
 * A survey is conducted and data are collected and coded. The data layout 
 * is shown in the text. Collected data are:
007M1110
013F2101
137F1001
117 1111
428M3110
017F3101
037M2101
 * 
 */
/*
 * a) Create a SAS data set with labels and formats from the questionaire.
 * b) Generate freq counts for var's GENDER, PARTY, VOTE, FOREIGN, and SPEND.
 * c) Test if there is a relationship between voting in the last election
 * versus agreement with spending and foreign policy. (Have SAS compute
 * chi-square for these relationships.)
 */
PROC FORMAT;
   VALUE $GENDER 'M' = 'Male'
                 'F' = 'Female';
   VALUE $PARTY '1' = 'Republican'
                '2' = 'Democrat'
                '3' = 'Not Registered';
   VALUE YESNO 0 = 'No' 1 = 'Yes';
RUN;
DATA SURVEY;
   INPUT ID     1-3 
         GENDER$  4 
         PARTY$   5
         VOTE     6 
         FOREIGN  7 
         SPEND    8;
   LABEL PARTY   =  'Political Party'
         VOTE    =  'Vote in Last Election?'
         FOREIGN = 'Agree with Government Policy?'
         SPEND   = 'Should we Increase Domestic Spending?';
   FORMAT GENDER $GENDER. 
          PARTY $PARTY. 
          VOTE FOREIGN SPEND YESNO.;
DATALINES;
007M1110
013F2101
137F1001
117 1111
428M3110
017F3101
037M2101
;
PROC FREQ DATA=SURVEY;
   TITLE "Political Survey Results";
   TABLES GENDER PARTY VOTE FOREIGN SPEND;
   TABLES VOTE*(SPEND FOREIGN) / CHISQ;
RUN;

/*
 * chi-sqquare 0.8750 	p=0.3496
 */