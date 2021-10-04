%% Least Squares Method for MA Parameter Estimation



%% MA Parameter Estimation : Durbin's Method

%% File Selection
% [Filename,Pathname]=uigetfile({'*.*'},'Time Series File Selector');
% 
% Fullpathname=strcat(Pathname,Filename);
% 
% [FullData]=xlsread(Fullpathname,1);
% 
% %% Getting the Desired Continuous Series
% 
%  % Getting Information on Desired Part of Data Series    
% 
% SeriesNum3=1;
% 
% Res=15;    
% 
% StartYear=2016; 
% 
% EndYear=2016; 
% 
% StartMonth=11;
% 
% EndMonth=11;
% 
% StartDay=15;
% 
% EndDay=30;    
% 
% StartTime=0;
% 
% EndTime=23.75;    
% 
% % Slicing the Desired Data Series using external Function
% 
% OriginalSeries1=DateTimeSeriesSlicer(FullData,SeriesNum3,Res,StartYear,EndYear,StartMonth,EndMonth,StartDay,EndDay,StartTime,EndTime);
% 
% Mean_OriginalSeries1=mean(OriginalSeries1);
% 
% OriginalSeries=OriginalSeries1-Mean_OriginalSeries1;



%% Creating Co-efficient Series for MA

Mean_OriginalSeries1=mean(MA_data);

OriginalSeries=MA_data-Mean_OriginalSeries1;

Lag_Percent=50;

% AR_Lags=[1:floor(Lag_Percent*length(OriginalSeries)/100)];

AR_Lags=[1:15];

[ Y_Lag ] = ARMA_LagMatrix_Creator( OriginalSeries,AR_Lags );

Y_AR=OriginalSeries(max(AR_Lags)+1:end,1);

%% Computing the AR Parameters : Least Squares

AR_Theta=(Y_Lag)\(Y_AR);

%% Estimating AR Innovation

[ InnovationSeries, Innovation_Variance ] = AR_Innovation_Calculator( Y_AR,Y_Lag,AR_Theta );




%% Creating Co-efficient Series for MA [Since MA process is a infinite AR Process]

MA_Lags=[0,1];

[ Y_Lag ] = ARMA_LagMatrix_Creator( InnovationSeries,MA_Lags );

Y=Y_AR(max(MA_Lags)+1:end,1);

Innovation_et=Y_Lag(:,1);

Y_MA=Y-Innovation_et;

Y_Lag_MA=Y_Lag(:,2:end);



%% Computing the MA Parameters : Least Squares

MA_Theta=(Y_Lag_MA)\(Y_MA);

%% Estimating AR Innovation

%[ InnovationSeries, Innovation_Variance ] = AR_Innovation_Calculator( Y,Y_Lag,AR_Theta );

%% Forecasting MA

Forecast_ObsNum=100;

% Variance of Innovation_et

Variance_Innovation_et=var(Innovation_et);

Innovation_Series_et=sqrt(Variance_Innovation_et)*randn(Forecast_ObsNum,1);

%Innovation=0+sqrt(Innovation_Variance)*randn(Forecast_ObsNum,1);

[ ForecastSeries,TimeSeries1 ] = MA_Forecast_Creator( MA_Theta, Y_AR, Forecast_ObsNum, MA_Lags(1,2:end), Mean_OriginalSeries1,Innovation_Series_et );


plot(vertcat(MA_data,ForecastSeries));


