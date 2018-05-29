data election2;                                                                                                                          
input buchanon bush;                                                                                                                    
datalines;                                                                                                                              
262 34062                                                                                                                          
73 5610                                                                                                                            
248 38637                                                                                                                          
65 5413                                                                                                                            
570 115185                                                                                                                         
789 177279                                                                                                                         
90 2873                                                                                                                            
182 35419                                                                                                                          
270 29744                                                                                                                          
186 41745                                                                                                                          
122 60426                                                                                                                          
89 10964                                                                                                                           
561 289456                                                                                                                         
36 4256                                                                                                                            
29 2698                                                                                                                            
650 152082                                                                                                                         
504 73029                                                                                                                          
83 12608                                                                                                                           
33 2448                                                                                                                            
39 4750                                                                                                                            
29 3300                                                                                                                            
9 1840                                                                                                                             
71 3546                                                                                                                            
24 2153                                                                                                                            
30 3764                                                                                                                            
22 4743                                                                                                                            
242 30646                                                                                                                          
99 20196                                                                                                                           
836 176967                                                                                                                         
76 4985                                                                                                                            
105 28627                                                                                                                          
102 9138                                                                                                                           
29 2481                                                                                                                            
10 1669                                                                                                                            
289 49963                                                                                                                          
305 106141                                                                                                                         
282 39053                                                                                                                          
67 6860                                                                                                                            
39 1316                                                                                                                            
29 3038                                                                                                                            
272 57948                                                                                                                          
563 55135                                                                                                                          
108 33864                                                                                                                          
47 16059                                                                                                                           
90 16404                                                                                                                           
267 52043                                                                                                                          
43 5058                                                                                                                            
446 134476                                                                                                                         
145 26216                                                                                                                          
570 68581                                                                                                                          
1010 184312                                                                                                                        
538 90101                                                                                                                          
147 13439                                                                                                                          
229 39497                                                                                                                          
124 34705                                                                                                                          
311 36248                                                                                                                          
305 83100                                                                                                                          
194 75293                                                                                                                          
114 12126                                                                                                                          
108 8014                                                                                                                           
27 4051                                                                                                                            
26 2326                                                                                                                            
396 82214                                                                                                                          
46 4511                                                                                                                            
120 12176                                                                                                                          
88 4983                                                                                                                            
. 152846                                                                                                                         
;                                                                                                                                  

data logelection2;                                                                                                                       
set election2;                                                                                                                           
logbuchanon = log(buchanon);                                                                                                            
logbush = log(bush);                                                                                                                    
run;
                                                                                                                                 
proc reg data = logelection2;                                                                                                            
model buchanon = logbush;                                                                                                               
run;                                                                                                                                    
                                                                                                                                        
proc reg data = logelection2;                                                                                                            
model buchanon = logbush;                                                                                                               
run;                                                                                                                                                                                                                                                                                                                                                                  
                                                                                                                                        
proc reg data = logelection2;                                                                                                            
model logbuchanon = bush;                                                                                                               
run;                                                                                                                                    
              
proc reg data  = logelection2;
model logbuchanon = logbush / cli;
run;