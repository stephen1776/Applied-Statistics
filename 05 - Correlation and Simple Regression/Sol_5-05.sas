/*
 * 5-5
 * From the data for X and Y in 5-1:
 * a) Compute a regression line (Y on X). Y is dep var, X is ind var.
 * b) What is the slope and intercept?
 * c) Are they signifiantly different from zero?
 */

PROC REG DATA=data_5_1;
   MODEL Y = X;
RUN;

/*b.
 Intercept = 0.78916, prob>|t| = .5753
 Slope = 1.52410, prob>|t| = .0078
 c. Intercept is not sig, slope is
*/