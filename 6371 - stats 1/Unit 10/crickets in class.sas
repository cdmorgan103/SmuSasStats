data crickets;
input chirps temp;
datalines;
882 69.7
1188 93.3
1104 84.3
864 76.3
1200 88.6
1032 82.6
960 71.6
900 79.6
1000 .
;

proc reg data=crickets;
model temp = chirps / R clm cli;
run;

proc glm data=crickets;
model temp=chirps /cli;
run;