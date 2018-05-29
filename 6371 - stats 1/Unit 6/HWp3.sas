data ex525;  
infile "/home/cdmorgan0/6371 statistical foundations/Unit 5/ex0525.csv" firstobs=2 dsd;  
input Subject Educ $ Income SortOrd $;
run; 

data log525;
set ex525;
logincome = log(Income);
run;


proc glm data=log525;
class Educ;
model logincome = Educ;
means Educ /HOVTEST=BF tukey CLDIFF;
lsmeans Educ/ pdiff adjust=tukey cl ;
run;



proc glm data=log525;
class Educ;
model logincome = Educ;
means Educ /HOVTEST=BF dunnett('12');
lsmeans Educ/pdiff=control('12');
run;

