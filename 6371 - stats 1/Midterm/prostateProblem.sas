data prostate;  
infile "/home/cdmorgan0/6371 statistical foundations/MidTermPrep/prostate.csv" firstobs=2 dsd;  
input id $ psa cancvol weight age bph sem $ capsen gleason $;
run; 

/*proc print data=prostate;
run;

proc univariate data=prostate;
class gleason;
var psa;
hist psa;
qqplot psa;
run;

proc sgplot data=prostate;
scatter x=gleason y=psa;
run;
*/
data logpro;
set prostate;
logpsa = log(psa);
run;

data sqrpro;
set prostate;
sqrpsa = sqrt(psa);
run;
/*
proc univariate data=logpro;
class gleason;
var logpsa;
hist logpsa;
qqplot logpsa;
run;

proc sgplot data=logpro;
scatter x=gleason y=logpsa;
run;


proc univariate data=sqrpro;
class gleason;
var sqrpsa;
hist sqrpsa;
qqplot sqrpsa;
run;

proc sgplot data=sqrpro;
scatter x=gleason y=sqrpsa;
run;
*/
*does anova and bonferoni test;
proc glm data=logpro;
class gleason;
model logpsa = gleason;
means gleason / bon;
lsmeans gleason/ pdiff adjust=bon cl ;
contrast "linear trend in log transformed PSA with respect to Gleason" gleason -1 0 1;
contrast "quadratic trend in log transformed PSA with respect to Gleason" gleason 1 -2 1;



