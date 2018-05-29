data braindat;  
infile "/home/cdmorgan0/6371 statistical foundations/Unit 12/Brain.csv" firstobs=2 dsd;  
input Species $ Brain Body Gestation Litter;
run;

data logbraindat;
set braindat;
logBrain= log(Brain);
logBody= log(Body);
logGestation= log(Gestation);
logLitter= log(Litter);
run;

proc sgscatter data=braindat;
matrix Brain Body Gestation Litter;
run;

proc sgscatter data=logbraindat;
matrix logBrain Body Gestation Litter;
run;

proc glm data=braindat plots=all;
model Brain = Gestation Litter Body / solution clparm;
run;

proc glm data=logbraindat plots=all;
model logBrain = Body Gestation Litter  / solution clparm;
run;


