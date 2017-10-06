/*
 * 2-7
 * The following data has been recorded from an experiment.
 * 
 * Use PROC UNIVARIATE to produce histograms, normal probability plots,
 * boxplots, and test the dist's for normality. Do this for the var's 
 * REACT, LIVER_WT, and SPLEEN, first for all subjects and then seperately
 * for each of the two DOSES.
 */



DATA EXPERIMENT;
   INPUT SUBJECT DOSE REACT LIVER_WT SPLEEN;
DATALINES;
1   1  5.4  10.2  8.9
2   1  5.9   9.8  7.3
3   1  4.8  12.2  9.1
4   1  6.9  11.8  8.8
5   1 15.8  10.9  9.0
6   2  4.9  13.8  6.6
7   2  5.0  12.0  7.9
8   2  6.7  10.5  8.0
9   2 18.2  11.9  6.9
10  2  5.5   9.9  9.1
;
PROC SORT DATA=EXPERIMENT;
   BY DOSE;   
RUN;
PROC UNIVARIATE DATA=EXPERIMENT NORMAL PLOT;
   TITLE "Distributions for Liver and Spleen Data";
   VAR REACT -- SPLEEN; * First to last Var in order from SAS data set;
RUN;
PROC UNIVARIATE DATA=EXPERIMENT NORMAL PLOT;
   BY DOSE;
   TITLE "Distributions for Liver and Spleen Data by Dose";
   VAR REACT -- SPLEEN;
RUN;