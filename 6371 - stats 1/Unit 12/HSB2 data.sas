data hsb2;  
infile "/home/cdmorgan0/6371 statistical foundations/Unit 12/hsb2.csv" firstobs=2 dsd;  
input id female race ses schtyp prog read write math science socst;
run;

proc glm data=hsb2 plots=all;
class ses (ref='3');
model science = math ses / solution clparm;
run;

proc glm data=hsb2 plots=all;
model science = math read / solution clparm;
run;