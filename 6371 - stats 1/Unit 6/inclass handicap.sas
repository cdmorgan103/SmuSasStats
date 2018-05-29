data handicap;  
infile "/home/cdmorgan0/6371 statistical foundations/Unit 6/Unit 6 Handicap Data.csv" firstobs=2 dsd;  
input Score Handicap $;
run; 

*Generates base plots;
/*proc univariate data=handicap;
by handicap notsorted;
histogram score;
qqplot score;
run;
*/
*amputee - crutches - hearing - none - wheelchair;

/*base anova test;
proc glm data=handicap;
class Handicap;
model Score = Handicap;
run;*/

proc glm data=handicap /*plots=all*/;
class handicap;
model score = handicap;
means handicap / HOVTEST=BF bon cldiff;
/*estimate 'Amputee vs. None' handicap 1 0 0 -1 0/ e;
estimate 'Amputee vs. crutches' handicap 1 -1 0 0 0/ e;
estimate 'Amputee vs. wheelchair' handicap 1 0 0 0 -1/ e;
estimate 'Crutches vs. wheelchair' handicap 0 1 0 0 -1/ e;*/

run;

*use estimate instead of contrast
estimate 'Amputee vs. None' handicap 1 0 0 -1 0 / e;
*/e tells what was tested;

*meta;
proc glm data=handicap /*plots=all*/;
class handicap;
model score = handicap;
means handicap / LSD;
means handicap / dunnett;
means handicap / tukey;
means handicap / bon;
means handicap / scheffe;
run;






