


proc power;
twosamplemeans test=diff_satt
power = .8 .6
ntotal = .
stddev = 6.1518
meandiff = .8
alpha = .05
sides = 2;
plot x=effect min =.5 max =2;
run;