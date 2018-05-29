data Moore;  
infile "/home/cdmorgan0/6371 statistical foundations/Final/Moores Law.csv" firstobs=2 dsd; 
input Processor $ TransistorCount Year Designer $ Process Areasqmm PastCurrent $ PastCurrentInd $
;
run;

proc print data=Moore;
run;
