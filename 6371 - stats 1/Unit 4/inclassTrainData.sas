**Training data;

data example;
input Score Method $;
datalines;
37 New
49 New
55 New
77 New
23 Trad
31 Trad
46 Trad
;
run;

proc npar1way data=example Wilcoxon;
class Method;
var Score;
exact hl;
run;