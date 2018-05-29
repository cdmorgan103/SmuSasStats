data steer;                                                                                                                          
input time ph;                                                                                                                    
datalines;  
1 7.02
1 6.93
2 6.42
2 6.51
4 6.07
4 5.99
6 5.59
6 5.80
8 5.51
8 5.36
;

data logsteer;                                                                                                                       
set steer;                                                                                                                           
logph = log(ph);                                                                                                                                                                                                                             
run;

proc print data=logsteer;
run;

proc glm data = logsteer;
model logph = time / solution;
run;

proc glm data = logsteer;
class time;
model logph = time;
run;