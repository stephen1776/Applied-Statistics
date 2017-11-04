/*
 * 9-3
 * We would prefer to estimate the numbe of books in a college library without
 * counting them. Data are collected from colleges across the country of the 
 * number of volumes, the student enrollment (in thousands), the highest degree
 * offered ( 1 = BA, 2 = MA, 3 = PhD), and size of the main campus (in acres).
 * Results are shown p 316. Using forward stepwise regression, show how each of
 * the three factors affect the number of volumes in a college library. Treat
 * DEGREE as a continuous variable for now.
 */

DATA LIBRARY;
   INPUT BOOKS ENROLLMENT HIGHEST_DEGREE AREA;
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
PROC REG DATA=LIBRARY;
   MODEL BOOKS = ENROLLMENT HIGHEST_DEGREE AREA / SELECTION=FORWARD;
RUN;