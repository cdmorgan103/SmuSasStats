data hsb;  
infile "/home/cdmorgan0/6371 statistical foundations/MidTermPrep/hsb2-2.csv" firstobs=2 dsd;  
input id $ female $ race $ ses $ schtyp $ prog $ read write math science socst;
run; 

data critval;
p = quantile("T", 0.975, 170);
run;

proc print data=critval; run;

proc print data=hsb; run;

proc ttest data=hsb h0=50 sides=2 alpha=0.05;
var write;
run;

proc glm data=hsb;
class female;
model write = female;
means female / HOVTEST=bf;
run;
***f test available in regular t test;



proc ttest data=hsb sides=2 alpha=0.05;
var write;
class female;
run;




/*
proc univariate data=hsb;
class female;
var write;
hist write;
qqplot write;
run;
*/

/*
*alt for wilcoxn rank sum;
proc npar1way data=hsb wilcoxon;
class female;
var write;
run;
*/



/*proc univariate data=hsb;
class race;
var write;
hist write;
qqplot write;
run;
*/


proc glm data=hsb plots= all;
class race;
model write = race;
means race / HOVTEST=bf;
estimate '1 vs. 4' race 1 0 0 -1/ e;
run;
***if we didn't have bad normality, small sample then we'd use contrast/estimate regular anova;



* performs kruskal wallis;
proc npar1way data=hsb Wilcoxon;
class race;
var write;
exact /mc;
run;

proc means data =hsb median;
class race;
var write;
run;

*can be used to make new data;
data racemin;
set hsb;
if race = 2 then Delete;
if race = 3 then delete;
run;

proc print data=racemin;
run;

*To get critical value for rank sum test;
data quantile;
aquant = quantile('NORMAL', 0.975);
run;
proc print data = quantile;
run;


*performs ranksum;
proc npar1way data=racemin Wilcoxon hl;
*where race = 1 |race = 4;
class race;
var write;
run;

proc power;
twosamplemeans test=diff_satt
power = .
ntotal = 60
groupstddevs = 5 | 8
groupweights = (1 2)
meandiff = 3
alpha = .05
sides = 2;
*plot x=effect min =.5 max =2;
run;

