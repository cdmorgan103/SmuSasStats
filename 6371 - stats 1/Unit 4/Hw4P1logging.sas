data logging;
input worked $ seedlings;
datalines;
L 45
L 53.1
L 40.8
L 75.5
L 46.7
L 85.4
L 85.6
L 18.2
L 43.2
U 23.6
U 13.3
U 34.2
U 18.1
U 56.1
U -8.1
U -20.1
;
run;

proc npar1way data=logging Wilcoxon ;
class worked;
var seedlings;
exact HL;
run;