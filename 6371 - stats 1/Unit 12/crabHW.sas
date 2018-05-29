data crabdat;  
infile "/home/cdmorgan0/6371 statistical foundations/Unit 12/Crab17.csv" firstobs=2 dsd;  
input Force Height Species $;
run;

data logcrabdat;
set crabdat;
logForce= log(Force);
logHeight= log(Height);
run;

proc sgplot data=crabdat;
scatter x=Height y=Force / group=Species;
run;

proc sgplot data=logcrabdat;
scatter x=Height y=logForce / group=Species;
run;


/*
proc sgplot data=logcrabdat;
scatter x=logHeight y=Force / group=Species;
run;

proc sgplot data=logcrabdat;
scatter x=Height y=logForce / group=Species;
run;

proc sgplot data=logcrabdat;
scatter x=logHeight y=logForce / group=Species;
run;

*/

proc glm data=crabdat plots=all;
class Species (ref="Lophopan");
model Force = Height | Species / solution clparm;
run;

proc glm data=logcrabdat plots=all;
class Species (ref="Lophopan");
model logForce = Height |Species / solution clparm;
run;
