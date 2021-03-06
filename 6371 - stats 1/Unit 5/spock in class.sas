data spock;
input percent judge $;
datalines;
6.400000095 Spock's
8.699999809 Spock's
13.30000019 Spock's
13.60000038 Spock's
15 Spock's
15.19999981 Spock's
17.70000076 Spock's
18.60000038 Spock's
23.10000038 Spock's
16.79999924 A
30.79999924 A
33.59999847 A
40.5 A
48.90000153 A
27 B
28.89999962 B
32 B
32.70000076 B
35.5 B
45.59999847 B
21 C
23.39999962 C
27.5 C
27.5 C
30.5 C
31.89999962 C
32.5 C
33.79999924 C
33.79999924 C
24.29999924 D
29.70000076 D
17.70000076 E
19.70000076 E
21.5 E
27.89999962 E
34.79999924 E
40.20000076 E
16.5 F
20.70000076 F
23.5 F
26.39999962 F
26.70000076 F
29.5 F
29.79999924 F
31.89999962 F
36.20000076 F
;
**Spock data;

data spock2; set spock;
if judge ne "Spock's" then OthersModel="Others";
else OthersModel = "Spock's";
run;

**Separate means model;
proc glm data=spock2;
class Judge;
model Percent = Judge;
run;

**Others equal model;
proc glm data=spock2;
class OthersModel;
model Percent = OthersModel;
run;

proc glm data=spock2;
class Judge;
model Percent = Judge;
means Judge / HOVTEST = BF;
run;