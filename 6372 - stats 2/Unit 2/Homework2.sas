data SAT;                                                                                                                                                                                                                
input  State $      SAT      Takers      Income      Years      Public      Expend      Rank;                                                                                                                            
datalines;                                                                                                                                                                                                               
Iowa      1088      3      326      16.79      87.8      25.6      89.7                                                                                                                                                  
SouthDakota      1075      2      264      16.07      86.2      19.95      90.6                                                                                                                                          
NorthDakota      1068      3      317      16.57      88.3      20.62      89.8                                                                                                                                          
Kansas      1045      5      338      16.3      83.9      27.14      86.3                                                                                                                                                
Nebraska      1045      5      293      17.25      83.6      21.05      88.5                                                                                                                                             
Montana      1033      8      263      15.91      93.7      29.48      86.4                                                                                                                                              
Minnesota      1028      7      343      17.41      78.3      24.84      83.4                                                                                                                                            
Utah      1022      4      333      16.57      75.2      17.42      85.9                                                                                                                                                 
Wyoming      1017      5      328      16.01      97      25.96      87.5                                                                                                                                                
Wisconsin      1011      10      304      16.85      77.3      27.69      84.2                                                                                                                                           
Oklahoma      1001      5      358      15.95      74.2      20.07      85.6                                                                                                                                             
Arkansas      999      4      295      15.49      86.4      15.71      89.2                                                                                                                                              
Tennessee      999      9      330      15.72      61.2      14.58      83.4                                                                                                                                             
NewMexico      997      8      316      15.92      79.5      22.19      83.7                                                                                                                                             
Idaho      995      7      285      16.18      92.1      17.8      85.9                                                                                                                                                  
Mississippi      988      3      315      16.76      67.9      15.36      90.1                                                                                                                                           
Kentucky      985      6      330      16.61      71.4      15.69      86.4                                                                                                                                              
Colorado      983      16      333      16.83      88.3      26.56      81.8                                                                                                                                             
Washington      982      19      309      16.23      87.5      26.53      83.2                                                                                                                                           
Arizona      981      11      314      15.98      80.9      19.14      84.3                                                                                                                                              
Illinois      977      14      347      15.8      74.6      24.41      78.7                                                                                                                                              
Louisiana      975      5      394      16.85      44.8      19.72      82.9                                                                                                                                             
Missouri      975      10      322      16.42      67.7      20.79      80.6                                                                                                                                             
Michigan      973      10      335      16.5      80.7      24.61      81.8                                                                                                                                              
WestVirginia      968      7      292      17.08      90.6      18.16      86.2                                                                                                                                          
Alabama      964      6      313      16.37      69.6      13.84      83.9                                                                                                                                               
Ohio      958      16      306      16.52      71.5      21.43      79.5                                                                                                                                                 
NewHampshire      925      56      248      16.35      78.1      20.33      73.6                                                                                                                                         
Alaska      923      31      401      15.32      96.5      50.1      79.6                                                                                                                                                
Nevada      917      18      288      14.73      89.1      21.79      81.1                                                                                                                                               
Oregon      908      40      261      14.48      92.1      30.49      79.3                                                                                                                                               
Vermont      904      54      225      16.5      84.2      20.17      75.8                                                                                                                                               
California      899      36      293      15.52      83      25.94      77.5                                                                                                                                             
Delaware      897      42      277      16.95      67.9      27.81      71.4                                                                                                                                             
Connecticut      896      69      287      16.75      76.8      26.97      69.8                                                                                                                                          
NewYork      896      59      236      16.86      80.4      33.58      70.5                                                                                                                                              
Maine      890      46      208      16.05      85.7      20.55      74.6                                                                                                                                                
Florida      889      39      255      15.91      80.5      22.62      74.6                                                                                                                                              
Maryland      889      50      312      16.9      80.4      25.41      71.5                                                                                                                                              
Virginia      888      52      295      16.08      88.8      22.23      72.4                                                                                                                                             
Massachusetts      888      65      246      16.79      80.7      31.74      69.9                                                                                                                                        
Pennsylvania      885      50      241      17.27      78.6      27.98      73.4                                                                                                                                         
RhodeIsland      877      59      228      16.67      79.7      25.59      71.4                                                                                                                                          
NewJersey      869      64      269      16.37      80.6      27.91      69.8                                                                                                                                            
Texas      868      32      303      14.95      91.7      19.55      76.4                                                                                                                                                
Indiana      860      48      258      14.39      90.2      17.93      74.1                                                                                                                                              
Hawaii      857      47      277      16.4      67.6      21.21      69.9                                                                                                                                                
NorthCarolina      827      47      224      15.31      92.8      19.92      75.3                                                                                                                                        
Georgia      823      51      250      15.55      86.5      16.52      74                                                                                                                                                
SouthCarolina      790      48      214      15.42      88.1      15.6      74                                                                                                                                           
;                                                                                                                                                                                                                        
                                                                                                                                                                                                                         
                                                                                                                                                                                                                                                                                                                                                                                                                                                
proc print data = sat;
run;
 
 data SAT2;                                                                                                                                                                                                               
set SAT;                                                                                                                                                                                                                 
RandNumber = ranuni(11);                                                                                                                                                                                                  
lTakers = log(takers)                                                                                                                                                                                                    
;   
 

data train;                                                                                                                                                                                                              
set SAT2;  
if state eq "Alaska" then delete; 
if RandNumber <= 1/4 then delete;                                                                                                                                                                                         
run;                                                                                                                                                                                                                     
                                                                                                                                                                                                                         
                                                                                                                                                                                                                         
data test;                                                                                                                                                                                                               
set SAT2;    
if state eq "Alaska" then delete;  
if RandNumber > 1/4 then delete;                                                                                                                                                                                         
run;                                                                                                                                                                                                                     
                                                                                                                                                                                                                         
proc print data = train;                                                                                                                                                                                                  
run;          

proc print data = test;
run;
 
              
 
ods graphics on;                                                                                                                                                                                                         
proc glmselect data=train testdata = test                                                                                                                                                                            
               seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot CRITERIONPANEL);                                                                                                                                    
model SAT = lTakers      Income      Years      Public      Expend      Rank / selection=LASSO( choose=CV stop=CV) CVdetails  ;                                                                                          
                                                                                                                                                     
run;                                                                                                                                                                                                                     
quit;                                                                                                                                                                                                                    
ods graphics off;



ods graphics on;                                                                                                                                                                                                         
proc glmselect data=train testdata=test                                                                                                                                                                                  
               seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot CRITERIONPANEL);                                                                                                                                    
model SAT = lTakers Years  Expend   Rank   / selection=stepwise( choose=CV stop=CV include = 4) CVdetails  ;                                                                                                                                                                                                                                               
run;                                                                                                                                                                                                                     
quit;                                                                                                                                                                                                                    
ods graphics off;