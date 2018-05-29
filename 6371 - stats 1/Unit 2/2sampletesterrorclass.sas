Proc power;
twosamplemeans test=diff_satt
/*alpha =.01*/
/*sides = 1 */
/*groupmeans = 10 | 14*/
meandiff= 3 6
/*stddev = 20*/
groupstddevs= 7 | 7 9 12
power = .
ntotal = 100;
plot x=effect min=3 max=6;
run;