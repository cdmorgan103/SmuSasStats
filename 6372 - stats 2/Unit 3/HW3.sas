data growth1;                                                                                                                           
input Fertilizer Growth;                                                                                                                
datalines;                                                                                                                              
1 10                                                                                                                                 
2 15                                                                                                                                 
3 8                                                                                                                                  
4 19                                                                                                                                 
1 20                                                                                                                                 
2 25                                                                                                                                 
3 18                                                                                                                                 
4 29                                                                                                                                 
1 12                                                                                                                                 
2 17                                                                                                                                 
3 10                                                                                                                                 
4 21                                                                                                                                 
;                                                                                                                                       
    


data growth2;                                                                                                                            
input Fertilizer ENV $ Growth;                                                                                                           
datalines;                                                                                                                              
1 MOSTLY_SHADY 10
2 MOSTLY_SHADY 15
3 MOSTLY_SHADY 8
4 MOSTLY_SHADY 19
1 WETLANDS 20
2 WETLANDS 25
3 WETLANDS 18
4 WETLANDS 29
1 SUNNY 12
2 SUNNY 17
3 SUNNY 10
4 SUNNY 21
;
   
 
data growth3;                                                                                                                           
input Fertilizer Growth;                                                                                                                
datalines;                                                                                                                              
1    10                                                                                                                                 
2    15                                                                                                                                 
3    8                                                                                                                                  
4    19                                                                                                                                 
1    20                                                                                                                                 
2    25                                                                                                                                 
3    18                                                                                                                                 
4    29                                                                                                                                 
1    12                                                                                                                                 
2    17                                                                                                                                 
3    10                                                                                                                                 
4    22                                                                                                                                
;                                                                                                                                       
    


data growth4;                                                                                                                            
input Fertilizer ENV $ Growth;                                                                                                           
datalines;                                                                                                                              
1  MOSTLY_SHADY  10                                                                                                                                
2  MOSTLY_SHADY  15                                                                                                                                
3  MOSTLY_SHADY  8                                                                                                                                 
4  MOSTLY_SHADY  19                                                                                                                                
1  WETLANDS  20                                                                                                                                
2  WETLANDS  25                                                                                                                                
3  WETLANDS  18                                                                                                                                
4  WETLANDS  29                                                                                                                                
1  SUNNY  12                                                                                                                                
2  SUNNY  17                                                                                                                                
3  SUNNY  10                                                                                                                                
4  SUNNY  22                                                                                                                               
;                          
/* 1 factor ANOVA */                                                                                                                         
proc glm data = growth1;                                                                                                                
class Fertilizer;                                                                                                                       
model Growth = Fertilizer / solution;                                                                                                   
run;                                                                                                                                    
       
                                                                                                                                 
/* 2 FACTOR ANOVA ADDITIVE*/                                                                                                              
proc glm data = growth2;                                                                                                                 
class Fertilizer ENV;                                                                                                                  
model Growth = Fertilizer ENV / solution;                                                                                              
run;                                                                                                                                    
                                                                                                                                        
/* 2 FACTOR ANOVA NONADDITIVE*/                                                                                                              
proc glm data = growth2;                                                                                                                 
class Fertilizer ENV;                                                                                                                  
model Growth = Fertilizer | ENV / solution;                                                                                              
run;                                                                                                                                    
                                                                                                                                      
proc sgscatter data = growth1;                                                                                                          
plot Growth*Fertilizer;                                                                                                                 
run;