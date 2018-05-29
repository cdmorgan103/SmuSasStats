data BP;  
infile "/home/cdmorgan0/6371 statistical foundations/prepfin2/bloodpressure.csv" firstobs=2 dsd; 
input Pt BP Age Weight BSA Dur Pulse Pulse_C $ Pulse_N Stress;
run;

proc print data= BP;
run;

proc sgscatter data = BP;
matrix Pt BP Age Weight BSA Dur Pulse Pulse_N Stress;
run;

proc glm data=BP plots=all;
model BP= Weight Age / clparm solution;
run;

proc glm data=BP plots=all;
class Pulse_C (Ref="Low");
model BP= Weight Age Pulse_C / clparm solution;
run;


