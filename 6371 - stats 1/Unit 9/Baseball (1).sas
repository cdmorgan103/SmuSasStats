data Baseball;  
infile "/home/cdmorgan0/6371 statistical foundations/Unit 8/Baseball_Data.csv" firstobs=2 dsd;  
input Team $ Payroll Wins;
run;

proc glm data = Baseball;
model Wins = Payroll / solution clparm;
run;   