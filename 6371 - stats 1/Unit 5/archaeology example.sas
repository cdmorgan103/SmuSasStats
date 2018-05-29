data arch;  
infile "/home/cdmorgan0/6371 statistical foundations/Unit 5/Archeology ANOVA Example.csv" firstobs=2 dsd;  
input Depth Site Grouped $ ;
run; 


**Overall ANOVA;
proc glm data=arch;
class Site;
model Depth = Site;
*means Site / HOVTEST = BF;
run;

data arch2; set arch;
if site in (1 4) then grouped14='a';
if site=2 then grouped14='b';
if site=3 then grouped14='c';
run;

**Site 1 and 4;
proc glm data=arch2;
class grouped14;
model Depth = grouped14;
run;
/*
data arch3; set arch;
if site in (2 3) then grouped23='d';
if site=1 then grouped23='b';
if site=4 then grouped23='c';
run;

**Site 2 and 3;
proc glm data=arch3;
class grouped23;
model Depth = grouped23;
run;

**Sites 1/4 and 2/3;
data arch4; set arch;
if site in (1 4) then grouped14_23='a';
if site in (2 3) then grouped14_23='b';
run;

proc glm data=arch4;
class grouped14_23;
model depth=grouped14_23;
run;

**Example of Kruskal-Wallis;
proc npar1way data=spock2 Wilcoxon;
class Judge;
var Percent;
run;

**Example of Welch's ANOVA;
proc glm data=spock2;
class Judge;
model Percent = Judge;
means Judge / HOVTEST = BF Welch;
run;
*/