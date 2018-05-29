/* engprof = b0 + b1(gender) + b2(income) + b3(momeduc) + b4(homelang1) + b5(homelang2)*/;
/* R2 (square) of the full model =0.48 */;
/* R2 model without momeduc = 0.45 */

proc power;
multreg model=fixed
nfullpredictors= 5
ntestpredictors=1
rsquarefull=0.48
rsquarediff=0.03
ntotal=.
power=0.7 to 0.9 by 0.1;
plot x = power;
run;

/* testing homelang1 and homelang2 */

proc power;
multreg model=fixed
nfullpredictors= 5
ntestpredictors=2
rsquarefull=0.48
rsquarediff=0.025
ntotal=.
alpha =.025
/*divided alpha in half for bonferoni reduction assuming no correlation, 
could use calculator online for better alpha bonf adjustment*/
power=0.7 to 0.9 by 0.1;
plot x = power;
run;



proc power;
multreg model=fixed
nfullpredictors= 5
ntestpredictors=2
rsquarefull=0.48
rsquarediff=0.025
ntotal=.
alpha =.034
/*reasonable bonf adjustment for correlated variables */
power=0.7 to 0.9 by 0.1;
plot x = power;
run;



proc power;
multreg model=fixed
nfullpredictors= 5
ntestpredictors=2
rsquarefull=0.48 0.52
rsquarediff=0.03 to 0.06 by 0.01
ntotal=100
alpha =.034 /*assumings correlation of 0.2*/
/*reasonable bonf adjustment for correlated variables */
power= .;
plot x = n min =50 max =100;
run;

