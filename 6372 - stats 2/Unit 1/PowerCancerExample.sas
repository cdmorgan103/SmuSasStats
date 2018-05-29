/*proc power for a test of equality of two proportions */;
/* Untreated group 30% cancer */;
/* Current drug reduction 10% */ ;
/* We want a difference is 15% to care about it */;
/* power of 0.8 and alpha 0.05 */;

proc power;
twosamplefreq test=pchi
groupproportions= (0.3 0.15)
nullproportiondiff=0
power = 0.8
npergroup= .;
run;


/* LRT Chi-square */
proc power;
twosamplefreq test=lrchi
groupproportions= (0.3 0.15)
power = 0.8
npergroup= .;
run;

/* Fisher's Exact Test 2sided */
proc power;
twosamplefreq test=fisher
groupproportions= (0.3 0.15)
power = 0.8
npergroup= .;
run;

/* Fisher's Exact Test 1sided */
proc power;
twosamplefreq test=fisher
groupproportions= (0.3 0.15)
power = 0.8
sides=1
npergroup= .;
run;

/* Fisher's Exact Test unbalanced */
proc power;
twosamplefreq test=fisher
groupproportions= (0.3 0.15)
power = 0.8
groupweights= (1 2)
sides=1
ntotal= .;
run;



