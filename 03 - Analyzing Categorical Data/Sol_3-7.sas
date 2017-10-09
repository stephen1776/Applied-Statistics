/*
 * 3-7
 * A friend gives you a summary data on the relationship between socioeconomic
 * status (SES) and asthma, as folllows:
 * Asthma		yes	no
 * Low SES		40	100
 * Hoigh SES	30	130
 * 
 * Create a SAS data set from these data and compute chi-square.
 */


DATA ASTHMA;
   INPUT ASTHMA $ SES $ COUNT;
DATALINES;
YES LOW 40
NO LOW 100
YES HIGH 30
NO HIGH 130
;
PROC FREQ DATA=ASTHMA;
   TITLE "Relationship between Asthma and SES";
   TABLES SES*ASTHMA / CHISQ;
   WEIGHT COUNT;
RUN;

/*
Chi-square = 4.026, p = .045.
*/