data qqbon;
input state $ cost;
datalines;
in 1000
in 4000
in 5000
in 8000
in 40000
out 3000
out 8000
out 30000
out 32000
out 40000
;

proc ttest data=qqbon sides =2 alpha=.05;
class state;
var cost;
