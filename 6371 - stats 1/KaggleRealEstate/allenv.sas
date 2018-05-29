data train;  
infile "/home/cdmorgan0/6371 statistical foundations/KaggleRealEstate/train.csv" firstobs=2 dsd; 
input Id MSSubClass	MSZoning $ LotFrontage $ LotArea Street $ Alley $ LotShape $ LandContour $ Utilities $ LotConfig $ LandSlope $ Neighborhood $ Condition1 $ Condition2 $ BldgType $ HouseStyle $ OverallQual OverallCond YearBuilt YearRemodAdd RoofStyle $ RoofMatl $ Exterior1st $ Exterior2nd $ MasVnrType $ MasVnrArea $ ExterQual $ ExterCond $ Foundation $ BsmtQual $ BsmtCond $ BsmtExposure $ BsmtFinType1 $ BsmtFinSF1 BsmtFinType2 $ BsmtFinSF2 BsmtUnfSF TotalBsmtSF Heating $ HeatingQC $ CentralAir $ Electrical $ OneFlrSF TwoFlrSF LowQualFinSF GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr KitchenQual $ TotRmsAbvGrd Functional $ Fireplaces FireplaceQu $ GarageType $ GarageYrBlt $ GarageFinish $ GarageCars GarageArea GarageQual $ GarageCond $ PavedDrive $ WoodDeckSF OpenPorchSF EnclosedPorch 
ThreeSsnPorch ScreenPorch PoolArea PoolQC $	Fence $	MiscFeature $ MiscVal $	MoSold YrSold SaleType $ SaleCondition $ SalePrice
;
run;

data test;  
infile "/home/cdmorgan0/6371 statistical foundations/KaggleRealEstate/test.csv" firstobs=2 dsd;
input Id MSSubClass	MSZoning $ LotFrontage $ LotArea Street $ Alley $ LotShape $ LandContour $ Utilities $ LotConfig $ LandSlope $ Neighborhood $ Condition1 $ Condition2 $ BldgType $ HouseStyle $ OverallQual OverallCond YearBuilt YearRemodAdd RoofStyle $ RoofMatl $ Exterior1st $ Exterior2nd $ MasVnrType $ MasVnrArea $ ExterQual $ ExterCond $ Foundation $ BsmtQual $ BsmtCond $ BsmtExposure $ BsmtFinType1 $ BsmtFinSF1 BsmtFinType2 $ BsmtFinSF2 BsmtUnfSF TotalBsmtSF Heating $ HeatingQC $ CentralAir $ Electrical $ OneFlrSF TwoFlrSF LowQualFinSF GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr KitchenQual $ TotRmsAbvGrd Functional $ Fireplaces FireplaceQu $ GarageType $ GarageYrBlt $ GarageFinish $ GarageCars GarageArea GarageQual $ GarageCond $ PavedDrive $ WoodDeckSF OpenPorchSF EnclosedPorch 
ThreeSsnPorch ScreenPorch PoolArea PoolQC $	Fence $	MiscFeature $ MiscVal $	MoSold YrSold SaleType $ SaleCondition $
;
SalePrice = .;
run;

proc print data=train (obs=10);
run;

proc print data=test (obs=10);
run;

*combine data sets;
data train2;
set train test;
RGrLivArea = Round(GrLivArea,100);
run;

*create log variables;
data ltrain3;
set train2;
lSalePrice = log(SalePrice);
lGrLivArea = log(GrLivArea);
lRGrLivArea = log(RGrLivArea);
MaxArea= GrLivArea + TotalBsmtSF;
run;

*remove outliers from dataset;
data ltrain4;
set ltrain3;
if ID = 1299 OR ID = 725 then Delete;
run;

*forward selection model;
proc glmselect data = ltrain3 plots=All;
class MSZoning LotFrontage Street Alley LotShape LandContour Utilities LotConfig LandSlope
Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl
Exterior1st Exterior2nd	MasVnrType MasVnrArea ExterQual ExterCond Foundation BsmtQual
BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical
KitchenQual Functional FireplaceQu GarageType GarageYrBlt GarageFinish GarageQual GarageCond
PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition MiscVal;
model lSalePrice = lRGrLivArea MSZoning LotFrontage Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl
Exterior1st Exterior2nd	MasVnrType MasVnrArea ExterQual ExterCond Foundation BsmtQual
BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical
KitchenQual Functional FireplaceQu GarageType GarageYrBlt GarageFinish GarageQual GarageCond
PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition
MSSubClass LotFrontage LotArea OverallQual OverallCond YearBuilt YearRemodAdd MasVnrArea 
BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF OneFlrSF TwoFlrSF LowQualFinSF GrLivArea BsmtFullBath 
BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd Fireplaces GarageYrBlt GarageCars	GarageArea WoodDeckSF OpenPorchSF EnclosedPorch	ThreeSsnPorch ScreenPorch PoolArea MoSold YrSold MiscVal MaxArea
/ selection=forward(stop=cv) cvmethod=random(5);
output out = results(where=(lsaleprice=.))  p = Predict;
run;

*output forward selection model;
data results_final_f;
set results;
if predict > 0 then SalePrice = exp(predict);
if predict < 0 then SalePrice = 10000;
keep id SalePrice;
;

proc print data=results_final_f; run;

*backward selection model;
proc glmselect data = ltrain3 plots=All;
class MSZoning LotFrontage Street Alley LotShape LandContour Utilities LotConfig LandSlope
Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl
Exterior1st Exterior2nd	MasVnrType MasVnrArea ExterQual ExterCond Foundation BsmtQual
BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical
KitchenQual Functional FireplaceQu GarageType GarageYrBlt GarageFinish GarageQual GarageCond
PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition MiscVal;
model lSalePrice = lRGrLivArea MSZoning LotFrontage Street Alley LotShape LandContour Utilities LotConfig LandSlope
Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl
Exterior1st Exterior2nd	MasVnrType MasVnrArea ExterQual ExterCond Foundation BsmtQual
BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical
KitchenQual Functional FireplaceQu GarageType GarageYrBlt GarageFinish GarageQual GarageCond
PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition
MSSubClass LotFrontage LotArea OverallQual OverallCond YearBuilt YearRemodAdd MasVnrArea 
BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF OneFlrSF TwoFlrSF LowQualFinSF GrLivArea BsmtFullBath 
BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd Fireplaces GarageYrBlt GarageCars	GarageArea WoodDeckSF OpenPorchSF EnclosedPorch	ThreeSsnPorch ScreenPorch PoolArea MoSold YrSold MiscVal MaxArea
/ selection=backward(stop=cv) cvmethod=random(5);
output out = results(where=(lsaleprice=.))  p = Predict;
run;

*output backward selection model;
data results_final_b;
set results;
if predict > 0 then SalePrice = exp(predict);
if predict < 0 then SalePrice = 10000;
keep id SalePrice;
;

proc print data=results_final_b; run;

*stepwise selection model;
proc glmselect data = ltrain3 plots=All;
class MSZoning LotFrontage Street Alley LotShape LandContour Utilities LotConfig LandSlope
Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl
Exterior1st Exterior2nd	MasVnrType MasVnrArea ExterQual ExterCond Foundation BsmtQual
BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical
KitchenQual Functional FireplaceQu GarageType GarageYrBlt GarageFinish GarageQual GarageCond
PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition MiscVal;
model lSalePrice = lRGrLivArea MSZoning LotFrontage Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl
Exterior1st Exterior2nd	MasVnrType MasVnrArea ExterQual ExterCond Foundation BsmtQual
BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical
KitchenQual Functional FireplaceQu GarageType GarageYrBlt GarageFinish GarageQual GarageCond
PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition
MSSubClass LotFrontage LotArea OverallQual OverallCond YearBuilt YearRemodAdd MasVnrArea 
BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF OneFlrSF TwoFlrSF LowQualFinSF GrLivArea BsmtFullBath 
BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd Fireplaces GarageYrBlt GarageCars	GarageArea WoodDeckSF OpenPorchSF EnclosedPorch	ThreeSsnPorch ScreenPorch PoolArea MoSold YrSold MiscVal MaxArea
/ selection=stepwise(stop=cv) cvmethod=random(5);
output out = results(where=(lsaleprice=.))  p = Predict;
run;

*output stepwise selection model;
data results_final_s;
set results;
if predict > 0 then SalePrice = exp(predict);
if predict < 0 then SalePrice = 10000;
keep id SalePrice;
;

proc print data=results_final_s; run;


proc print data=results_final_f; run;
proc print data=results_final_b; run;
proc print data=results_final_s; run;
