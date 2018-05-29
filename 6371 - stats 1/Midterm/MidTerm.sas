data curl;  
infile "/home/cdmorgan0/6371 statistical foundations/MidTerm/Curling.csv" firstobs=2 dsd;  
input tournament $ hao $ score newt $;
run; 

proc print data=curl;
run;

/*proc glm data=curl;
class newt;
model score = newt;
means newt / dunnettl ('WOLY18');
lsmeans newt/pdiff=control('WOLY18') cl;
run;
*/

/*
proc univariate data=curl;
class newt;
var score;
hist score;
qqplot score;
run;

proc sgplot data=curl;
scatter x=newt y=score;
run;

*/

proc ttest data=curl sides=U alpha=0.1;
var score;
class hao;
where hao = 'Home'| hao = 'Away';
run;

proc univariate data=curl;
class hao;
where hao = 'Home'| hao = 'Away';
var score;
hist score;
qqplot score;
run;




/*for crit
data critval;
p = quantile("T", 0.975, 170);
run;

proc print data=critval; run;
*/