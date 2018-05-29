data police_force;
input population police violent_crime;
datalines;
10000  200  18
10000  300  17
10000  400  13
10000  500  10
10000  600  9
10000  700  7
50000  1000 90
50000  1200 80
50000  1350 70
50000  1400 68
100000 2000 200
100000 3000 170
100000 3100 165
100000 3800 150
100000 4000 145
100000 5000 120
300000 4000 590
300000 4500 550
300000 5000 510
300000 5500 480
300000 5600 477
1000000 7000 2100
1000000 8000 1800
1000000 10000 1700
1000000 13000 1500
1000000 17000 1100
;
run;

proc sgscatter data = police_force;
matrix violent_crime police population / diagonal=(histogram);
run;

data lpolice_force;
set police_force;
lpolice = log(police);
lpopulation = log(population);
lviolent_crime = log(violent_crime);
run;

proc sgscatter data = lpolice_force;
matrix lviolent_crime lpolice lpopulation / diagonal=(histogram);
run;

**What is weird about this?;
proc glm data = lpolice_force plots = all;
model lviolent_crime = lpolice;
run;

**That is because we are not accounting for the fact that as population of the city grows;
**..so does the police force;
**AND ... so does violent crime;
**So, police force and population go up at the same time ... as does violent crime;
**This means that the size of the police force is potenitally confounded with the population of the city;

**Add population in the model;
proc glm data = lpolice_force plots = all;
model lviolent_crime = lpolice lpopulation;
run;

**Assumptions still have a problem ... a little curvature;
**No problem .. add a squared term;
proc glm data = lpolice_force plots = all;
model lviolent_crime = lpolice lpopulation lpopulation*lpopulation / solution tolerance;
run;

**The tolerance values (look at Type 2) suggest high VIF values - try centering lpopulation;

proc means data=lpolice_force;
var lpopulation; run;

data lpolice_force2; set lpolice_force;
lpopulation_c = lpopulation-11.5289981;
run;

**This fixes the VIF problem for the quadratic term, but lpolice and lpopulation still have high VIFs;
**It turns out that centering lpolice doesn't fix the problem either;
**What to do? Try penalized regression (like ridge regression);
proc glm data = lpolice_force2 plots = all;
model lviolent_crime = lpolice lpopulation_c lpopulation_c*lpopulation_c / solution tolerance;
run;