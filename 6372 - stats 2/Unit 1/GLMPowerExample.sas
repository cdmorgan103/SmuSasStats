data exemplary;
do variety = 1 to 2;
do exposure = 1 to 3;
input height @@;
output;
end;
end;
datalines;
14 16 21
10 15 16
;
run;

proc glmpower data=exemplary;
class variety exposure;
model height = variety | exposure;
power
stddev = 4 6.5
ntotal = 60
power = .;
plot x=n min=30 max=90;
run;