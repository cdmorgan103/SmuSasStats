data MetabData;  
infile "/home/cdmorgan0/6371 statistical foundations/Unit 11/Metabolism Data Prob 26.csv" firstobs=2 dsd;  
input Name $ Species $ Mass Metab Life;
run;

data MetabData34;
set MetabData;
Mass34 = Mass**(3/4);
run;

data logMetabData34;
set MetabData34;
LogMass34= log(Mass34);
LogMetab= log(Metab);
run;

proc reg data = MetabData34;                                                                                                               
model Metab = Mass34;                                                                                                                  
run;  

proc reg data = logMetabData34;                                                                                                               
model LogMetab = LogMass34;                                                                                                                  
run;  