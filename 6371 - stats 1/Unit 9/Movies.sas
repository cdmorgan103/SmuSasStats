data movie; 
input bud earn;                                                                                                                  
datalines;                                                                                                                              
62 65
90 64
50 48
35 57
200 601
100 146
90 47                                                                                                                                
;        

proc print data=movie;
run;


proc glm data = movie;
model earn = bud / solution clparm;
run;          