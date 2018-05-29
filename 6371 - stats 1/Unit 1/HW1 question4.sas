Data ColMoney;
Input School $ Money;
Datalines;
SMU 34
SMU 1200
SMU 23
SMU 50
SMU 60
SMU 50
SMU 0
SMU 0
SMU 30
SMU 89
SMU 0
SMU 300
SMU 400
SMU 20
SMU 10
SMU 0
SeattleU 20
SeattleU 10
SeattleU 5
SeattleU 0
SeattleU 30
SeattleU 50
SeattleU 0
SeattleU 100
SeattleU 110
SeattleU 0
SeattleU 40
SeattleU 10
SeattleU 3
SeattleU 0
;
proc univariate data=ColMoney;
   class School;
   histogram;
run;
Proc ttest data= ColMoney alpha=.05 sides=2 ;
	class  School;
	Var Money;
run;
