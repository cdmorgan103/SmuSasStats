data samagedisc;
input age emp $;
Datalines;
34 Fired
37 Fired
37 Fired
38 Fired
41 Fired
42 Fired
43 Fired
44 Fired
44 Fired
45 Fired
45 Fired
45 Fired
46 Fired
48 Fired
49 Fired
53 Fired
53 Fired
54 Fired
54 Fired
55 Fired
56 Fired
27 NotFired
33 NotFired
36 NotFired
37 NotFired
38 NotFired
38 NotFired
39 NotFired
42 NotFired
42 NotFired
43 NotFired
43 NotFired
44 NotFired
44 NotFired
44 NotFired
45 NotFired
45 NotFired
45 NotFired
45 NotFired
46 NotFired
46 NotFired
47 NotFired
47 NotFired
48 NotFired
48 NotFired
49 NotFired
49 NotFired
51 NotFired
51 NotFired
52 NotFired
54 NotFired
;
run;
data critval;
p = quantile("T", 0.975, 49);
run;

proc print data=critval;
run;

proc print data=samagedisc;
run;


proc ttest data=samagedisc sides=2 alpha=0.05;
var age;
class emp;
run;