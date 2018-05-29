/*
proc power;
twosamplemeans test=ratio
meanratio = .94
cv = 0.1
npergroup= .
power = .8;
run;
*/

data result;
do diet = 1 to 2;
input LDL @@;
output;
end;
datalines;
100
80
;
run;

proc glmpower data=result;
class diet;
model LDL = diet;
power
stddev=100
ntotal = .
power = .8;
run;

proc power;
twosamplemeans
power = .8
ntotal = .
stddev = 100
meandiff = 20
alpha = .05;
run;


