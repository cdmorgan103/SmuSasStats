data autism;
input child before after;
datalines;
1 85 75
2 70 50
3 40 50
4 65 40
5 80 20
6 75 65
7 55 40
8 20 25
9 70 30
;
run;

data autism2; set autism;
diff = before-after;
run;

proc univariate data=autism2;
var diff;
run;

 proc ttest side= U;
      paired before*after;
   run;