/*
 * 3-17
 * The relationship between office temp and head colds is tested for 
 * smokers and non-smokers. Since smoking is considered to be a confounding
 * factor in this relationship, use a Mantel-Haenszel chi-square for 
 * stratified tables to analyze the two tables here:
 * 						Smokers					Non-Smokers		
 * 						Colds	No Colds		Colds	No Colds
 * Temp		Poor		20		100				30		100			
 * Control	Good		15		150				25		200
 */

DATA TEMP;
   INPUT T_CONTRL$ GROUP : $10. COLD$ COUNT;
DATALINES;
1-POOR SMOKERS 1-YES 20
1-POOR SMOKERS 2-NO 100
1-POOR NONSMOKERS 1-YES 30
1-POOR NONSMOKERS 2-NO 100
2-GOOD SMOKERS 1-YES 15
2-GOOD SMOKERS 2-NO 150
2-GOOD NONSMOKERS 1-YES 25
2-GOOD NONSMOKERS 2-NO 200
;
PROC FREQ DATA=TEMP;
   TITLE "Relationship Between Temperature Control and Colds";
   TABLES GROUP * T_CONTRL * COLD / ALL;
   WEIGHT COUNT;
RUN;

/*
The overall RR for the combined tables = 1.9775.
	The 95% CI is (1.3474, 	2.9021).
	The p-value is 0.0235.
*/


