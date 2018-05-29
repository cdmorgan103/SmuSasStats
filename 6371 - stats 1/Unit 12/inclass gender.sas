data interact;
input x y Gender $;
datalines;
1 4 Male
1 6 Male
2 5 Male
2 8 Male
3 6 Male
3 7 Male
4 9 Male
4 10 Male
5 11 Male
5 13 Male
1 15 Female
1 17 Female
2 20 Female
2 22 Female
3 27 Female
3 29 Female
4 34 Female
4 33 Female
5 38 Female
5 40 Female
;

proc sgplot data=interact;
scatter x=x y=y / group=gender;
run;

proc sgplot data=interact;
reg x=x y=y / group=gender clm cli;

proc glm data=interact;
class Gender;
model y = x | Gender / solution;
run;