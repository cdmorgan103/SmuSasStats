proc power;
onewayanova test=overall
alpha=.05
groupmeans= 3|7|8
stddev=4
power = 0.8
ntotal= .;
run;

proc power;
onewayanova test=contrast
contrast = (1 0 -1)
alpha=.05
groupmeans= 3|7|8
stddev=4
npergroup=25
power = .;
run;

proc power;
onewayanova test=overall
alpha=.05
groupmeans= 3|7|8
stddev=4
groupweights = (1 2 2)
ntotal=.
power = 0.9;
run;