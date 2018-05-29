data ex525;  
infile "/home/cdmorgan0/6371 statistical foundations/Unit 5/ex0525.csv" firstobs=2 dsd;  
input Subject Educ $ Income SortOrd $;
run; 


**log it**;
data log525;
set ex525;
logincome = log(Income);
run;

/*
proc univariate data=ex525;
by SortOrd;
histogram Income;
qqplot Income;
run;



proc univariate data=log525;
by SortOrd;
histogram logincome;
qqplot logincome;
run;
*/

/*get yo boxplots
proc boxplot data=ex525;
plot Income*SortOrd;
run;

proc boxplot data=log525;
plot logincome*SortOrd;
run;
*/

Data log525est;
	set log525;
	if (SortOrd NE '1') THEN SORTORD='2';
	run;
	
data log525bvm; set log525;
	if SortOrd in (4 5) then SortOrd45='a';
	if SortOrd=1 then SortOrd45='b';
	if SortOrd=2 then SortOrd45='c';
	if SortOrd=3 then SortOrd45='d';
run;

proc glm data=log525;
class SortOrd;
model logincome = SortOrd;
run;

proc glm data=log525bvm;
class SortOrd45;
model logincome = SortOrd45;
run;
/*proc glm data=log525est;
class SortOrd;
model logincome = SortOrd;
run;*/

/*proc ttest data=log525est sides =2 alpha=.05;
class SortOrd;
var logincome;
run;*/

**Example of Welch's ANOVA;
proc glm data=ex525;
class SortOrd;
model Income = SortOrd;
means SortOrd / HOVTEST = BF Welch;
run;

