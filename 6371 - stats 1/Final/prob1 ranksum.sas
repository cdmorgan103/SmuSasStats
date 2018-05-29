data ranksum;
input income candidate $ code;
datalines;
10000004 Trump 1
1100000 Trump 1
90000 Trump 1
165000 Trump 1
86000 Trump 1
111000 Trump 1
165000 Trump 1
70000 Trump 1
1160000 Trump 1
54000 Carson 2
87000 Carson 2
56000 Carson 2
90000 Carson 2
20000 Carson 2
140000 Carson 2
45000 Carson 2
69000 Carson 2
56000 Carson 2
90000 Cruz 3
45000 Cruz 3
89000 Cruz 3
700000 Cruz 3
80000 Cruz 3
70000 Cruz 3
34500 Cruz 3
;

proc univariate data= ranksum;
class candidate;
var income;
hist income;
qqplot income;
run;

data TrumpCruz;
set ranksum;
if candidate ="Carson" then delete;
run;

data TrumpCarson;
set ranksum;
if candidate ="Cruz" then delete;
run;

data CruzCarson;
set ranksum;
if candidate ="Trump" then delete;
run;

proc npar1way data=TrumpCruz wilcoxon;
var income;
class candidate;
exact;
run;

proc npar1way data=TrumpCarson wilcoxon;
var income;
class candidate;
exact;
run;

proc npar1way data=CruzCarson wilcoxon;
var income;
class candidate;
exact HL;
run;


