data scores;
input Group $ Value;
datalines;
Int 12.0
Int 12.0
Int 12.9
Int 13.6
Int 16.6
Int 17.2
Int 17.5
Int 18.2
Int 19.1
Int 19.3
Int 19.8
Int 20.3
Int 20.5
Int 20.6
Int 21.3
Int 21.6
Int 22.1
Int 22.2
Int 22.6
Int 23.1
Int 24.0
Int 24.3
Int 26.7
Int 29.7
Ext 5.0
Ext 5.4
Ext 6.1
Ext 10.9
Ext 11.8
Ext 12.0
Ext 12.3
Ext 14.8
Ext 15.0
Ext 16.8
Ext 17.2
Ext 17.2
Ext 17.4
Ext 17.5
Ext 18.5
Ext 18.7
Ext 18.7
Ext 19.2
Ext 19.5
Ext 20.7
Ext 21.2
Ext 22.1
Ext 24.0
;

title 'Box plot for creativity scores in Intrinsic & Extrensic groupings';
proc boxplot data=scores;
	plot Value*Group;
	proc means data= scores;
class Group;
proc print data= scores;
run;


