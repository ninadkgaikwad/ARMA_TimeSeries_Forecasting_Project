%% ARMA Modelling Using MATLAB's Econometrics Toolbox

%% Step 1 : Data Acquisition

FileName='';

[FullData]=xlsread(FileName,1);

%% Getting the Desired Continuous Series

 % Getting Information on Desired Part of Data Series (Training Set)   

SeriesNum3=1; % Data Column Number

Res=15; % Time Resolution of the Datafile in minutes 

StartYear=2016; 

EndYear=2016; 

StartMonth=11;

EndMonth=11;

StartDay=15;

EndDay=30;    

StartTime=0;

EndTime=23.75;    

% Slicing the Desired Data Series using external Function

OriginalSeries=DateTimeSeriesSlicer(FullData,SeriesNum3,Res,StartYear,EndYear,StartMonth,EndMonth,StartDay,EndDay,StartTime,EndTime);

%% Step 2 : Model Identification

orig_time_series=OriginalSeries;

adf_test_output=adftest(orig_time_series)
kpss_test_output=kpsstest(orig_time_series)
if adf_test_output==0 && kpss_test_output==1
    disp('The time-series has unit root and will require differencing')
elseif adf_test_output==1 && kpss_test_output==0
    disp('The time-series is trend stationary and may require seasonal lag')
else
    disp('Nothing can be determined from the stationarity tests')
end

stationarity_status=0;

while (stationarity_status==0)
    %Differencing the Series
    SingleLag_Num=input('Enter single lag number:');
    SeasonalLag_Num=input('Enter seasonal lag number:');
    D_SingleLag = LagOp({1,-1},'Lags',[0,1]);
    D_SeasonalLag = LagOp({1,-1},'Lags',[0,SeasonalLag_Num]);
    D_TotalLag=1; % Initialization



    D_TotalLag=D_TotalLag*D_SeasonalLag;
    
    for i=1:SingleLag_Num
        D_TotalLag=D_TotalLag*D_SingleLag ;    
    end
    
    Data_Differenced=filter(D_TotalLag,orig_time_series);
    
    figure(1);
    hold on
    plot(Data_Differenced)
    title('Plot of differenced time-series')
    xlabel('Time')
    ylabel('Power')

    %
    adf_test_output=adftest(Data_Differenced);
    kpss_test_output=kpsstest(Data_Differenced);
    
    
    if adf_test_output==0 && kpss_test_output==1
        disp('The time-series has unit root and will require differencing')
    elseif adf_test_output==1 && kpss_test_output==0
        disp('The time-series is trend stationary and may require seasonal lag')
    else
        disp('Nothing can be determined from the stationarity tests')
    end

%     disp(strcat('The chosen single lag number is ',' ',int2str(SingleLag_Num),' and the chosen seasonal lag number is ',' ',int2str(SeasonalLag_Num)))
%     disp('The ACF and PACF plots for the Differenced Time Series are as follows.')
%     figure(2)
%     autocorr(Data_Differenced)
%     figure(3)
%     parcorr(Data_Differenced)
%     
    resp=input('Do you want to perform further operations to induce stationarity? (Y/N):','s');
    
    if lower(resp)=='y'
        stationarity_status=0;
    else
        stationarity_status=1;
    end
end

%% Step 3 : Model Creation

% Enter ARMA Parameter Values

P=0; % AR Process Order

D=0; % Number of Single Lag Differences 

Q=0; % MA Process Order

ARlags=0; % Auto-Regressive Lag Vector

MAlags=0; % Moving Average Lag Vector

Season=0; % Seasonality

SARlags=0; % Auto-Regressive Seasonal Lag Vector

SMAlags=0; % Moving Average Seasonal Lag Vector

Const=NaN; % Constant in ARMA


ModelOption = 1; % Choose the Model Option depending on the Kind of Model Structure

switch ModelOption    

    case 1        

        ARIMAModel={arima(P,D,Q)};        

    case 2   

        ARIMAModel={arima('D',D,'ARLags',ARlags,'Constant',Const)};        

    case 3

        ARIMAModel={arima('D',D,'MALags',MAlags,'Constant',Const)};         

    case 4

        ARIMAModel={arima('D',D,'ARLags',ARlags,'MALags',MAlags,'Constant',Const)};   

    case 5

        ARIMAModel={arima('D',D,'ARLags',ARlags,'Seasonality',Season,'SARLags',SARlags,'Constant',Const)};         

    case 6

        ARIMAModel={arima('D',D,'MALags',MAlags,'Seasonality',Season,'SARLags',SARlags,'Constant',Const)};        

    case 7

        ARIMAModel={arima('D',D,'ARLags',ARlags,'MALags',MAlags,'Seasonality',Season,'SARLags',SARlags,'Constant',Const)};        

    case 8

        ARIMAModel={arima('D',D,'ARLags',ARlags,'Seasonality',Season,'SMALags',SMAlags,'Constant',Const)};        

    case 9  

        ARIMAModel={arima('D',D,'MALags',MAlags,'Seasonality',Season,'SMALags',SMAlags,'Constant',Const)};       

    case 10 

        ARIMAModel={arima('D',D,'ARLags',ARlags,'MALags',MAlags,'Seasonality',Season,'SMALags',SMAlags,'Constant',Const)};        

    case 11 

        ARIMAModel={arima('D',D,'ARLags',ARlags,'Seasonality',Season,'SARLags',SARlags,'SMALags',SMAlags,'Constant',Const)};        

    case 12

        ARIMAModel={arima('D',D,'MALags',MAlags,'Seasonality',Season,'SARLags',SARlags,'SMALags',SMAlags,'Constant',Const)};         

    case 13

        ARIMAModel={arima('D',D,'ARLags',ARlags,'MALags',MAlags,'Seasonality',Season,'SARLags',SARlags,'SMALags',SMAlags,'Constant',Const)};         

end


%% Step 4 : Model Estimation

Model=ARIMAModel;

[EstModel,EstParamCov,logL,info] = estimate(Model,OriginalSeries);

% Computing Residuals

res = infer(EstModel,OriginalSeries);

ARIMAmodelRes={res};

% Computing Standardized Residuals

stres = res/sqrt(EstModel.Variance);

ARIMAmodelStres={stres};

% Plotting Standardized Residuals
figure(5);
title('Standardized Residual Plot');
plot(1:length(Stres),Stres);

% ACF and PACF of Statndardized Residuals
figure(6);
autocorr(Stres);

figure(7);
parcorr(Stres);

% Computing AIC (Akaike Information Criterion) and BIC (Bayesian Information Criterion)

numParam=length(info.X);

numObs=length(OriginalSeries);

[aic,bic] = aicbic(logL,numParam,numObs);

fprintf('The AIC = %.2f and the BIC = %.2f of the current estimated Model. \n\n',aic,bic);

%% Step 5 : Model Forecast

% Enter Forecast Duratio Information    

StartYear=2016; 

EndYear=2016; 

StartMonth=12;

EndMonth=12;

StartDay=1;

EndDay=14;    

StartTime=0;

EndTime=23.75;    

% Computing Rows And Columns for the Processed Data File using Pre-defined Function

[ Rows,Cols,TotDays ] = RowsColsToComputeDataCleaning( StartYear,StartMonth,StartDay,EndYear,EndMonth,EndDay,Res,1,4 );

% Initializing Processed Data File to zeros

ProcessedData=zeros(Rows,Cols);

% Putting Data into CORRECT ROWS & COLUMNS from Raw Data File to the Pre-Initialized Processed Data file
% Creating Date Time Matrix for the given number of Days using Pre-Defined Function

[ DateTimeMatrix,TimeT ] = StartEndCalender( StartYear,StartMonth,StartDay,TotDays,Res,1 );

ProcessedData(:,1:4)=DateTimeMatrix(:,1:4);

% Getting Original Series for the Forecasted Duration (Validation Set)

[ OriginalSeries1,StartIndex,EndIndex ] = DateTimeSeriesSlicer(ProcessedData,1,Res,StartYear,EndYear,StartMonth,EndMonth,StartDay,EndDay,StartTime,EndTime);

ForecastPoints=length(StartIndex:EndIndex);

% Forecasting Time Series 

[ForecastSeries,yMSE] = forecast(BestModelEstimate,ForecastPoints,'Y0',OriginalSeries);

lenForecastSeries=length(ForecastSeries);

% Plotting Forecasted Series

figure(8);

plot(OriginalSeries,'Color',[.75,.75,.75]);
hold on
plot(LenOriginalSeries+1:LenOriginalSeries+lenForecastSeries,ForecastSeries,'r','LineWidth',2);
plot(LenOriginalSeries+1:LenOriginalSeries+lenForecastSeries,OriginalSeries1,'g','LineWidth',1.5);

xlim([0,LenOriginalSeries+lenForecastSeries])

title('Training Data and Forecasted Data')
xlabel('Time')
ylabel('Observations')
legend('Training Data','Forecasted Data','Validation Data')

hold off     

% Creating an Excel File f the Forecast

ProcessedData(StartIndex:EndIndex,5)=ForecastSeries;

ForecastFile=ProcessedData;

% Creating Excel Files of the Forecasted Values 
    
HorizontalExcelIntraDay={'Day','Month','Year','Time','Forecasted Series'};  

filename = 'ForecastedSeriesFile.xlsx';

sheet = 1;

xlRange = 'A1';

xlswrite(filename,HorizontalExcelIntraDay,sheet,xlRange); 

sheet = 1;

xlRange = 'A2';

xlswrite(filename,ForecastFile,sheet,xlRange); 
