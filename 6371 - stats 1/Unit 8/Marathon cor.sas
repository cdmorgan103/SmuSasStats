data marathon;
input temp time;
datalines;
55 145.283
61 148.717
49 148.300
62 148.100
70 147.617
73 146.400
51 144.667
57 147.533
;

proc sgscatter data=marathon;
plot time*temp;
run;    

proc corr data=marathon plots=all ;
var temp time;
run;      