data drugtest;
input treat $ count;
datalines;
mar 15
mar 25
mar 0
mar 0
mar 4
pla 23
pla 50
pla 0
pla 99
pla 31
;

proc npar1way data=drugtest wilcoxon;
var count;
class treat;
exact wilcoxon;
run;