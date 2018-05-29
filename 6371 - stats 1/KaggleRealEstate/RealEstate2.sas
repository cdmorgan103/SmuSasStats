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
ThreeSsnPorch ScreenPorch PoolArea PoolQC $	Fence $	MiscFeature $ MiscVal $ MoSold YrSold SaleType $ SaleCondition $ SalePrice
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
ThreeSsnPorch ScreenPorch PoolArea PoolQC $	Fence $	MiscFeature $ MiscVal $ MoSold YrSold SaleType $ SaleCondition $
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
  RGrLivArea = Round(GrLivArea,100);
run;

*performs log transform on data;
data ltrain3;
set train3;
lSalePrice = log(SalePrice);
lGrLivArea = log(GrLivArea);
lRGrLivArea = log(RGrLivArea);
MaxArea= GrLivArea + TotalBsmtSF;
run;
/*
*w data points removed;
proc glm data = ltrain3 plots = all ;
class Neighborhood;
model lSalePrice = lRGrLivArea Neighborhood/ clparm ;
output out = results p = Predict;
run;
*/

/*
proc glmselect data = ltrain4 plots = all ;
class Neighborhood;
model lSalePrice = lRGrLivArea Neighborhood/ selection=backward;
output out = results p = Predict;
run;*/

proc glmselect data = ltrain3 plots=All;
class MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope
Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl
Exterior1st Exterior2nd	MasVnrType ExterQual ExterCond Foundation BsmtQual
BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical
KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond
PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition MiscVal;
model lSalePrice = lRGrLivArea MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope
Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl
Exterior1st Exterior2nd	MasVnrType ExterQual ExterCond Foundation BsmtQual
BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical
KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond
PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition
MSSubClass LotFrontage LotArea OverallQual OverallCond YearBuilt YearRemodAdd MasVnrArea 
BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF OneFlrSF TwoFlrSF LowQualFinSF GrLivArea BsmtFullBath 
BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd Fireplaces GarageYrBlt GarageCars	
GarageArea WoodDeckSF OpenPorchSF EnclosedPorch	ThreeSsnPorch ScreenPorch PoolArea MoSold YrSold MiscVal MaxArea
/ selection=backward;
output out = results p = Predict;
run;

proc glmselect data = ltrain3 plots=All;
class MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope
Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl
Exterior1st Exterior2nd	MasVnrType ExterQual ExterCond Foundation BsmtQual
BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical
KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond
PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition MiscVal;
model lSalePrice = lRGrLivArea MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope
Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl
Exterior1st Exterior2nd	MasVnrType ExterQual ExterCond Foundation BsmtQual
BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical
KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond
PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition
MSSubClass LotFrontage LotArea OverallQual OverallCond YearBuilt YearRemodAdd MasVnrArea 
BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF OneFlrSF TwoFlrSF LowQualFinSF GrLivArea BsmtFullBath 
BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd Fireplaces GarageYrBlt GarageCars	
GarageArea WoodDeckSF OpenPorchSF EnclosedPorch	ThreeSsnPorch ScreenPorch PoolArea MoSold YrSold MiscVal MaxArea
/ selection=forward;
output out = results p = Predict;
run;

proc glmselect data = ltrain3 plots=All;
class MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope
Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl
Exterior1st Exterior2nd	MasVnrType ExterQual ExterCond Foundation BsmtQual
BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical
KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond
PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition MiscVal;
model lSalePrice = lRGrLivArea MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope
Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl
Exterior1st Exterior2nd	MasVnrType ExterQual ExterCond Foundation BsmtQual
BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical
KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond
PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition
MSSubClass LotFrontage LotArea OverallQual OverallCond YearBuilt YearRemodAdd MasVnrArea 
BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF OneFlrSF TwoFlrSF LowQualFinSF GrLivArea BsmtFullBath 
BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd Fireplaces GarageYrBlt GarageCars	
GarageArea WoodDeckSF OpenPorchSF EnclosedPorch	ThreeSsnPorch ScreenPorch PoolArea MoSold YrSold MiscVal MaxArea
/ selection=stepwise;
output out = results p = Predict;
run;








*classes;
/*
MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope
Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl
Exterior1st Exterior2nd	MasVnrType ExterQual ExterCond Foundation BsmtQual
BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical
KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond
PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition
*/



*variables;
/*
MSSubClass LotFrontage LotArea OverallQual OverallCond YearBuilt YearRemodAdd MasVnrArea 
BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF OneFlrSF TwoFlrSF LowQualFinSF GrLivArea BsmtFullBath 
BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd Fireplaces GarageYrBlt GarageCars	
GarageArea WoodDeckSF OpenPorchSF EnclosedPorch	ThreeSsnPorch ScreenPorch PoolArea MiscVal MoSold YrSold
*/







*generates results for printing to kaggle... 
could tweak sale price for nonzero to improve score;
data results2;
set results;
if Predict > 0 then SalePrice = Predict;
if Predict < 0 then SalePrice = 10000;
keep id SalePrice;
where id > 1460;
;
