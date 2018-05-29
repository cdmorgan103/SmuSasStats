data TestD;  
infile "/home/cdmorgan0/6371 statistical foundations/Unit 9/TEST DATA.csv" firstobs=2 dsd;  
input StudentID $ Mscore Rscore Wscore Sscore SSscore;
run;


proc glm data = TestD;
model Mscore = Sscore / solution clparm alpha=.01;
run;   