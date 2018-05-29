data meta;
input care $ value;
datalines;
nontrauma 18.8
nontrauma 20
nontrauma 20.1
nontrauma 20.9
nontrauma 20.9
nontrauma 21.4
nontrauma 22.7
nontrauma 22.9
trauma 23
trauma 24.5
trauma 25.8
trauma 30
trauma 37.6
trauma 38.5
trauma 22
;
run;

proc ttest data=meta;
var value;
class care;
run;

proc npar1way data=meta Wilcoxon ;
class care;
var value;
exact HL;
run;
