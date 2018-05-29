data mice;
input treatment $ tcell;
datalines;
Drug 21.57974174
Drug 12.89526225
Drug 13.72169094
Drug 14.77544677
Drug 16.17620417
Drug 29.68715327
Drug 19.13042537
Drug 15.02082785
Drug 11.48132621
Drug 14.16337133
Drug 16.65262586
Drug 14.97931308
Drug 14.41285536
Drug 12.83706004
Drug 15.33400564
Drug 14.93787977
Drug 18.89709596
Drug 16.08080689
Drug 23.84664192
Drug 13.20107144
Drug 18.2414573
Drug 11.00199455
Drug 12.74658247
Drug 8.592232492
Drug 21.72276324
Drug 28.17256002
Drug 16.84713779
Drug 14.44481819
Drug 9.354524487
Drug 17.04085353
Drug 19.78591355
Drug 20.47636971
Placebo 2.682907434
Placebo 0.495880386
Placebo 1.994072017
Placebo 0.305080174
Placebo 1.132200761
Placebo 6.177703002
Placebo 1.17914479
Placebo 0.113108673
Placebo 0.872797159
Placebo 2.257993159
Placebo 0.044729989
Placebo 3.071055932
Placebo 2.664123407
Placebo 3.963251814
Placebo 0.505674233
Placebo 1.524985239
Placebo 0.364838112
Placebo 0.189051947
Placebo 1.442189847
Placebo 1.49738099
Placebo 0.362521594
Placebo 2.168557993
Placebo 0.16444631
Placebo 4.304026154
Placebo 2.791009154
Placebo 2.103821712
Placebo 4.822120754
Placebo 2.465946515
Placebo 0.037029688
Placebo 2.860754737
Placebo 3.006433253
Placebo 0.722369166
;
run;

**Option 1;
proc univariate data=mice;
class treatment;
var tcell;
hist tcell;
qqplot tcell;
run;

**Option 2 (run only for plots and ignore test output for the time being);
proc ttest data=mice;
class treatment;
var tcell;
run;