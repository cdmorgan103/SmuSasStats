**Heights;
                                                                                                                                       
data heights;                                                                                                                           
input mother daughter;                                                                                                                  
datalines;                                                                                                                              
63 58.6                                                                                                                                 
67 64.7                                                                                                                                 
64 65.3                                                                                                                                 
60 61.0                                                                                                                                 
65 65.4                                                                                                                                 
67 67.4                                                                                                                                 
59 60.9                                                                                                                                 
60 63.1                                                                                                                                 
;        

proc reg data= heights;
model daughter = mother / clb;
run;
 
proc glm data = heights;
model daughter = mother / solution clparm;
run;   **Heights;