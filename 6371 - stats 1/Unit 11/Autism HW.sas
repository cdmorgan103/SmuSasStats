data Autism;                                                                                                                          
input year prev;                                                                                                                    
datalines;  
1992 3.5
1994 5.3
1996 7.8
1998 11.8
2000 18.3
;

proc reg data = Autism;                                                                                                            
model prev = year;                                                                                                               
run;

data logAut;
set Autism;
logyear= log(year);
logprev= log(prev);
run;

proc reg data = logAut;                                                                                                            
model logprev = year;                                                                                                               
run;

