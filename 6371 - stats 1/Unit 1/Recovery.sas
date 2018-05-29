data recovery;
input Name $ Recovery;
datalines;
 Jones 3.1
 Smith 3.6
 Harris 4.2
 Mcculley 2.1
 Brown 2.8
 Curtis 3.8
 Johnston 1.8
 ;
 run;
 
 
 proc print data=recovery;run;
 
title 'Means of Recovery - Chris Morgan';
proc means data = recovery;
run;