data Wheat;  
input Mass Tcell;
datalines;
3.33 0.252
4.62 0.263
5.43 0.251
5.73 0.251
6.12 0.183
6.29 0.213
6.45 0.332
6.51 0.203
6.65 0.252
6.75 0.342
6.81 0.471
7.56 0.431
7.83 0.312
8.02 0.304
8.06 0.370
8.18 0.381
9.08 0.430
9.15 0.430
9.35 0.213
9.42 0.508
9.95 0.411
4.5 .
run;

data critval;
p = quantile("T", 0.995, 19);
run;

proc print data=critval;
run;



proc print data=Wheat;
run;



proc reg data=Wheat;
model Tcell = Mass / R clm cli alpha=.01;
run;

proc glm data=Wheat;
model Tcell=Mass /cli alpha=.01;
run;




