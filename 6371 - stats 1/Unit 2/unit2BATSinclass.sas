data bats;
input weight @@;
datalines;
1.7 1.6 1.5 2.0 2.3 1.6 1.6 1.8 1.5 1.7 2.2 1.4 1.6 1.6 1.6
;
run;

data critval;
p = quantile("T", 0.975, 14);
run;

proc print data=critval; run;

proc ttest data=bats h0=1.8 sides=2 alpha=0.05;
var weight;
run;