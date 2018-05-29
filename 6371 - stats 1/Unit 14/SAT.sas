data sat;  
infile "/home/cdmorgan0/6371 statistical foundations/Unit 14/sat.csv" firstobs=2 dsd;  
input State $ SAT takers Income Years Public Expend Rank;
run;

data sat; set sat;
ltakers=log(takers);
run;

proc reg data=sat;
model SAT = ltakers Income Years Public Rank / selection=forward;
run;

proc reg data=sat;
model SAT = ltakers Income Years Public Rank / selection=backward;
run;

proc reg data=sat;
model SAT = ltakers Income Years Public Rank / selection=stepwise;
run;