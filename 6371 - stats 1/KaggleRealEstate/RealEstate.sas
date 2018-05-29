data train;  
infile "/home/cdmorgan0/6371 statistical foundations/KaggleRealEstate/train.csv" firstobs=2 dsd;  
input Id MSSubClass	MSZoning $ LotFrontage LotArea Street $ Alley $ LotShape $ LandContour $ Utilities $ 
LotConfig $ LandSlope $ Neighborhood $ Condition1 $ Condition2 $ BldgType $ HouseStyle $ OverallQual
OverallCond YearBuilt YearRemodAdd RoofStyle $ RoofMatl $ Exterior1st $ Exterior2nd $ MasVnrType $ 
MasVnrArea ExterQual $ ExterCond $ Foundation $ BsmtQual $ BsmtCond $ BsmtExposure $ BsmtFinType1 $ 
BsmtFinSF1 BsmtFinType2 $ BsmtFinSF2 BsmtUnfSF TotalBsmtSF Heating $ HeatingQC $ CentralAir $ 
Electrical $ OneFlrSF TwoFlrSF LowQualFinSF GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr
KitchenAbvGr KitchenQual $ TotRmsAbvGrd Functional $ Fireplaces FireplaceQu $ GarageType $ GarageYrBlt
GarageFinish $ GarageCars GarageArea GarageQual $ GarageCond $ PavedDrive $ WoodDeckSF OpenPorchSF EnclosedPorch 
ThreeSsnPorch ScreenPorch PoolArea PoolQC $	Fence $	MiscFeature $ MiscVal $	MoSold YrSold SaleType $ SaleCondition $ SalePrice
;
run;

data test;  
infile "/home/cdmorgan0/6371 statistical foundations/KaggleRealEstate/test.csv" firstobs=2 dsd;  
input Id MSSubClass	MSZoning $ LotFrontage LotArea Street $ Alley $ LotShape $ LandContour $ Utilities $ 
LotConfig $ LandSlope $ Neighborhood $ Condition1 $ Condition2 $ BldgType $ HouseStyle $ OverallQual
OverallCond YearBuilt YearRemodAdd RoofStyle $ RoofMatl $ Exterior1st $ Exterior2nd $ MasVnrType $ 
MasVnrArea ExterQual $ ExterCond $ Foundation $ BsmtQual $ BsmtCond $ BsmtExposure $ BsmtFinType1 $ 
BsmtFinSF1 BsmtFinType2 $ BsmtFinSF2 BsmtUnfSF TotalBsmtSF Heating $ HeatingQC $ CentralAir $ 
Electrical $ OneFlrSF TwoFlrSF LowQualFinSF GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr
KitchenAbvGr KitchenQual $ TotRmsAbvGrd Functional $ Fireplaces FireplaceQu $ GarageType $ GarageYrBlt
GarageFinish $ GarageCars GarageArea GarageQual $ GarageCond $ PavedDrive $ WoodDeckSF OpenPorchSF EnclosedPorch 
ThreeSsnPorch ScreenPorch PoolArea PoolQC $	Fence $	MiscFeature $ MiscVal $	MoSold YrSold SaleType $ SaleCondition $
;
SalePrice = .;
run;

*combines train & test;
data train2;
 set train test;
run;

*filters for neighborhoods and rounds to nearest 100 val;
DATA train3;
  SET train2;
  IF (Neighborhood = 'NAmes') OR (Neighborhood = 'Edwards') OR (Neighborhood = 'BrkSide');
  RGrLivArea = Round(GrLivArea,100);
run;

*performs log transform on data;
data ltrain3;
set train3;
lSalePrice = log(SalePrice);
lGrLivArea = log(GrLivArea);
lRGrLivArea = log(RGrLivArea);
run;

data ltrain4;
set ltrain3;
if ID = 1299 OR ID = 725 then Delete;
if LotFrontage=NA  then call missing(LotFrontage);
run;


*w data points removed;
proc glm data = ltrain4 plots = all ;
class Neighborhood;
model lSalePrice = lRGrLivArea Neighborhood/ clparm solution;
output out = results p = Predict;
run;

proc glmselect data = ltrain4 plots = all ;
class Neighborhood;
model lSalePrice = lRGrLivArea Neighborhood/selection=forward(stop=cv) cvmethod=random(5) ;
output out = results p = Predict;
run;

*generates results for printing to kaggle... 
could tweak sale price for nonzero to improve score;
data results2;
set results;
if Predict > 0 then SalePrice = Predict;
if Predict < 0 then SalePrice = 10000;
keep id SalePrice;
where id > 1460;
;

/*
*scatter charts for appendix;
proc sgscatter data = train3;
matrix SalePrice GrLivArea / diagonal=(histogram);
run;

proc sgscatter data = ltrain3;
matrix lSalePrice lGrLivArea / diagonal=(histogram);
run;
*/

/*refrence glm's
*with log transform only; 
proc reg data = ltrain3 plots=all;
class Neighborhood;
model lSalePrice = lGrLivArea Neighborhood   / influence;
run;

*without rounding but w log transform;
proc glm data = ltrain3 plots = all ;
class Neighborhood;
model lSalePrice = lGrLivArea Neighborhood  / solution tolerance;
output out = results p = Predict;
run;

*without 2 data points removed;
proc glm data = ltrain3 plots = all ;
class Neighborhood;
model lSalePrice = lRGrLivArea Neighborhood  / solution tolerance;
output out = results p = Predict;
run;
*/