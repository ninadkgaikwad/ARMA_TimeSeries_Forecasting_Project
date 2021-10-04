%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Readme File %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

Course: Optimal Estimation and Kalman Filtering
Project:  ARMA Time Series Modeling for Solar PV Generation Forecasting

by,
Ninad  Gaikwad
Karthikeya Devaprasad

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The Main MATLAB Scripts: 

1. MainScript1_SolarGenData_PreProcessing.m	: For Pre-Processing the given data (Find in 1_DataPreProcessing Folder)
2. MainScript2_MatlabARMAModelling.m		: ARMA Modelling using MATLAB's Econometrics Toolbox (Find in 2_MatlabARMA Folder)		
3. MainScript3_DevelopedARMAModelling.m		: AR and MA Modelling using Self-Developed Functions (Find in 3_DevelopedARMA Folder)

- The data file was converted to excel from csv for ease of use. [Diamond_Solar_data.xlsx]
- All the above scripts have been initialized with appropriate User Inputs.
- MainScript1_SolarGenData_PreProcessing.m takes avery long time to run.

- The functions for which description is not given are pre-written functions from Ninad's Master's Project

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The Functions used within in each script and function:

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

MainScript1_SolarGenData_PreProcessing.m
	- SolarDataCleaner.m		: Cleaning the Solar generation data
		- DateTimeString_Processor1.m
		- DateTimeString_Processor2.m
		- RowsColsToComputeDataCleaning.m
		- StartEndCalender.m
			- LeapYearFinder.m
		- HMToDeci.m
		- JulianDay.m
			- LeapYearFinder.m
		- ClockToSolarTime.m 
		- SolarToClockTime.m  		 
	- minToMINDataCoverter.m	: Converting to different minutes resolution		
	- MINToDayDataCoverter.m	: Converting to a daily resolution
	- DayToMonthDataCoverter.m	: Converting to a monthly resolution

** Takes almost 2 hours to run completely

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

MainScript2_MatlabARMAModelling.m
	- DateTimeSeriesSlicer.m
	- RowsColsToComputeDataCleaning.m
	- StartEndCalender.m
		- LeapYearFinder.m

** All other ARMA modelling functions are from Econometrics Toolbox

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

MainScript3_DevelopedARMAModelling.m
	- DateTimeSeriesSlicer.m
	- Differencing_function.m			: Differences the Time Series
	- RowsColsToComputeDataCleaning.m
	- StartEndCalender.m
		- LeapYearFinder.m
	- AR_LS_Func.m					: Creates AR Model Forecast using Least Squares				 
		- ARMA_LagMatrix_Creator.m			: Creates all lagged seires for specified AR or MA Model
		- AR_Innovation_Calculator.m			: Computes Innovations for Training Data using estimated AR Model
		- AR_Forecast_Creator.m				: Creates forecast for estimated AR Model 
	- AR_MLE_Func.m					: Creates AR Model Forecast using Maximum Likelihood Esitmation	 
		- ARMA_LagMatrix_Creator.m			: Creates all lagged seires for specified AR or MA Model
		- AR_Innovation_Calculator.m			: Computes Innovations for Training Data using estimated AR Model
		- AR_Loglikelihood_Func.m
		- AR_Forecast_Creator.m				: Creates forecast for estimated AR Model  		
	- MA_LS_Func.m					: Creates MA Model Forecast using Least Squares	 
		- ARMA_LagMatrix_Creator.m			: Creates all lagged seires for specified AR or MA Model
		- AR_Innovation_Calculator.m			: Computes Innovations for Training Data using estimated AR Model
		- MA_Forecast_Creator.m				: Creates forecast for estimated MA Model  
	- MA_MLE_Func.m					: Creates AR Model Forecast using Maximum Likelihood Esitmation	
		- ARMA_LagMatrix_Creator.m			: Creates all lagged seires for specified AR or MA Model
		- AR_Innovation_Calculator.m			: Computes Innovations for Training Data using estimated AR Model
		- MA_Loglikelihood_Func.m
		- MA_Forecast_Creator.m				: Creates forecast for estimated MA Model  
	- Inverse_SingleLag_Difference_Function.m	: Inverses the Forecast to undifferenced Format	 
	- Inverse_SeasonalLag_Difference_Function 	: Inverses the Forecast to seasonally undifferenced Format

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%