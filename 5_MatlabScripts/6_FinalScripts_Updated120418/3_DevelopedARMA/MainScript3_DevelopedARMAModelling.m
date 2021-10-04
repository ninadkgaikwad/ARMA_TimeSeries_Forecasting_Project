%% ARMA Modelling Using MATLAB's Econometrics Toolbox

clear all
close all
clc

%% Step 1 : Data Acquisition

FileName='Diamond300_ProcessedFile.xlsx';

[FullData]=xlsread(FileName,1);

%% Getting the Desired Continuous Series

 % Getting Information on Desired Part of Data Series (Training Set)   

SeriesNum3=1; % Data Column Number

Res=5; % Time Resolution of the Datafile in minutes 

StartYear=2016; 

EndYear=2016; 

StartMonth=12;

EndMonth=12;

StartDay=18;

EndDay=31;    

StartTime=0;

EndTime=23.9166;    

% Slicing the Desired Data Series using external Function

OriginalSeries=DateTimeSeriesSlicer(FullData,SeriesNum3,Res,StartYear,EndYear,StartMonth,EndMonth,StartDay,EndDay,StartTime,EndTime);

LenOriginalSeries=length(OriginalSeries);

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

while stationarity_status==0
     %Differencing the Series
    SingleLag_Num=input('Enter single lag number:');
    SeasonalLag_Num=input('Enter seasonal lag number:');
    
    %Application of Seasonal Lag
    if SeasonalLag_Num==0
        Data_Differenced_Seasonal=orig_time_series;
    else
        [Data_Differenced_Seasonal,~,Seasonal_Inverse_seed] = Differencing_function( orig_time_series,1,SeasonalLag_Num);
    end
    
    %Application of Single Lag       
    if SingleLag_Num==0
        Data_Differenced_Final=Data_Differenced_Seasonal;
    else
        [Data_Differenced_Final,Inverse_seed_final ] = Differencing_function( Data_Differenced_Seasonal,SingleLag_Num,1);
    end
    
  
    figure(1);
    hold on
    plot(Data_Differenced_Final)
    title('Plot of differenced time-series')
    xlabel('Time')
    ylabel('Power')

    %
%     adf_test_output=adftest(Data_Differenced_Final)
%     kpss_test_output=kpsstest(Data_Differenced_Final)
%     
% 
%     disp(strcat('The chosen single lag number is ',' ',int2str(SingleLag_Num),' and the chosen seasonal lag number is ',' ',int2str(SeasonalLag_Num)))
%     disp('The ACF and PACF plots for the Differenced Time Series are as follows.')
%     figure(2)
%     autocorr(Data_Differenced_Final)
%     figure(3)
%     parcorr(Data_Differenced_Final)
    
    resp=input('Do you want to perform further operations to induce stationarity? (Y/N):','s');
    
    if lower(resp)=='y'
        stationarity_status=0;
    else
        stationarity_status=1;
    end
end

%% Step 3 : Model Creation - Model Estimation - Model Forecasting

% Model Selection

ModelType_Num=2; % 1 - AR ; 2 - MA ; 3 - ARMA 

ModelEstimationMethod_Num=2; % 1 - Least Squares ; 2 - Max Likelihood

% Enter Forecast Duratio Information    

StartYear=2017; 

EndYear=2017; 

StartMonth=1;

EndMonth=1;

StartDay=1;

EndDay=7;    

StartTime=0;

EndTime=23.9166;    

% Computing Rows And Columns for the Processed Data File using Pre-defined Function

[ Rows,Cols,TotDays ] = RowsColsToComputeDataCleaning( StartYear,StartMonth,StartDay,EndYear,EndMonth,EndDay,Res,1,4 );

% Initializing Processed Data File to zeros

ProcessedData=zeros(Rows,Cols);

% Putting Data into CORRECT ROWS & COLUMNS from Raw Data File to the Pre-Initialized Processed Data file
% Creating Date Time Matrix for the given number of Days using Pre-Defined Function

[ DateTimeMatrix,TimeT ] = StartEndCalender( StartYear,StartMonth,StartDay,TotDays,Res,1 );

ProcessedData(:,1:4)=DateTimeMatrix(:,1:4);

% Getting Original Series for the Forecasted Duration (Validation Set)

[ OriginalSeries1,StartIndex,EndIndex ] = DateTimeSeriesSlicer(FullData,1,Res,StartYear,EndYear,StartMonth,EndMonth,StartDay,EndDay,StartTime,EndTime);

[ ~,StartIndex1,EndIndex1 ] = DateTimeSeriesSlicer(ProcessedData,1,Res,StartYear,EndYear,StartMonth,EndMonth,StartDay,EndDay,StartTime,EndTime);
    
ForecastPoints=length(StartIndex:EndIndex);

%OriginalSeries1=FullData(StartIndex:EndIndex+SingleLag_Num,5);

% Forecasting Time Series 

% [ForecastSeries,yMSE] = forecast(BestModelEstimate,ForecastPoints,'Y0',OriginalSeries);

% Model Structure

AR_Lag=[1,288,576,864,1152]; % User-Defined

MA_Lag=[0,1,288]; % User-Defined

AR_Lag_MA=[1:15]; % User-Defined

if (ModelType_Num==1) % AR
    
   if (ModelEstimationMethod_Num==1) % AR-LS
       
        [ ForecastSeries_1 ] = AR_LS_Func( AR_Lag, ForecastPoints, Data_Differenced_Final );       
       
   elseif (ModelEstimationMethod_Num==2) % AR-MLE
       
        [ ForecastSeries_1 ] = AR_MLE_Func( AR_Lag, ForecastPoints, Data_Differenced_Final );
       
   end
    
elseif (ModelType_Num==2) % MA
    
   if (ModelEstimationMethod_Num==1) % MA-LS
       
       [ ForecastSeries_1 ] = MA_LS_Func( MA_Lag,AR_Lag_MA, ForecastPoints, Data_Differenced_Final );
       
   elseif (ModelEstimationMethod_Num==2) % MA-MLE
       
       [ ForecastSeries_1 ] = MA_MLE_Func( MA_Lag,AR_Lag_MA, ForecastPoints, Data_Differenced_Final );
       
   end    
    
elseif (ModelType_Num==3) % ARMA
    
   if (ModelEstimationMethod_Num==1) % ARMA-LS
       
       
       
   elseif (ModelEstimationMethod_Num==2) % ARMA-MLE
       
       
       
   end    
    
end

% Undifferencing ForecastSeries

if ((SingleLag_Num~=0) && (SeasonalLag_Num~=0))% Single + Seasonal
    
    [Undifferenced_Forecast1]=Inverse_SingleLag_Difference_Function(ForecastSeries_1,Inverse_seed_final);
    
    Undifferenced_Forecast1=Undifferenced_Forecast1(1:end-SingleLag_Num);
    
    [ForecastSeries]=Inverse_SeasonalLag_Difference_Function(Undifferenced_Forecast1,Seasonal_Inverse_seed);
    
    %Original
elseif ((SingleLag_Num~=0) && (SeasonalLag_Num==0)) % Single
    
    [ForecastSeries]=Inverse_SingleLag_Difference_Function(ForecastSeries_1,Inverse_seed_final);
    
    ForecastSeries=ForecastSeries(1:end-SingleLag_Num);
    
elseif ((SingleLag_Num==0) && (SeasonalLag_Num~=0)) % Seasonal
    
    [ForecastSeries]=Inverse_SeasonalLag_Difference_Function(ForecastSeries_1,Seasonal_Inverse_seed);
    
elseif ((SingleLag_Num==0) && (SeasonalLag_Num==0)) % None
    
    ForecastSeries=ForecastSeries_1;
    
end

lenForecastSeries=length(ForecastSeries);

% Plotting Forecasted Series

figure(8);

plot(OriginalSeries,'Color',[.75,.75,.75]);
hold on
plot(LenOriginalSeries+1:LenOriginalSeries+lenForecastSeries,ForecastSeries,'r','LineWidth',2);
plot(LenOriginalSeries+1:LenOriginalSeries+lenForecastSeries,OriginalSeries1,'g','LineWidth',1.5);

xlim([0,LenOriginalSeries+lenForecastSeries])

title('Training Data - Forecasted Data - Validation Data')
xlabel('Time')
ylabel('Observations')
legend('Training Data','Forecasted Data','Validation Data')

hold off    

% Computing Percentage Error

for ii=1:length(OriginalSeries1)
   
    if (OriginalSeries1(ii)==0)
        
        PercentageError(ii,1)=0;
        
    else
        
        PercentageError(ii,1)=abs(((OriginalSeries1(ii)-ForecastSeries(ii))/(OriginalSeries1(ii)))*100);
        
    end
    
end

% Creating an Excel File f the Forecast

ProcessedData(StartIndex1:EndIndex1,5)=ForecastSeries;

ProcessedData=horzcat(ProcessedData,OriginalSeries1,PercentageError);

ForecastFile=ProcessedData;

% Creating Excel Files of the Forecasted Values 
    
HorizontalExcelIntraDay={'Day','Month','Year','Time','Forecasted Series','Actual Series', 'Absolute Percentage Error'};  

filename = 'ForecastedSeriesFile.xlsx';

sheet = 1;

xlRange = 'A1';

xlswrite(filename,HorizontalExcelIntraDay,sheet,xlRange); 

sheet = 1;

xlRange = 'A2';

xlswrite(filename,ForecastFile,sheet,xlRange);
