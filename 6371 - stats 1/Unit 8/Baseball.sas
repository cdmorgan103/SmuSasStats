data Baseball;  
infile "/home/cdmorgan0/6371 statistical foundations/Unit 8/Baseball_Data.csv" firstobs=2 dsd;  
input Team $ Payroll Wins;
run;

proc sgscatter data=Baseball;
plot Wins*Payroll;
run;


proc corr data=Baseball plots=all;
var Wins Payroll;
run;     