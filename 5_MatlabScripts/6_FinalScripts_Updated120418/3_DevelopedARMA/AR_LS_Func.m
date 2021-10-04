function [ ForecastSeries ] = AR_LS_Func( AR_Lags, Forecast_ObsNum, OriginalSeries1 )
%% Function Details:



%% Function : AR LS Estimation

Mean_OriginalSeries1=mean(OriginalSeries1);

OriginalSeries=OriginalSeries1-Mean_OriginalSeries1;

%% Creating Co-efficient Series for AR

%AR_Lags=[1,96,192];

[ Y_Lag ] = ARMA_LagMatrix_Creator( OriginalSeries,AR_Lags );

Y=OriginalSeries(max(AR_Lags)+1:end,1);

%% Computing the AR Parameters : Least Squares

AR_Theta=(Y_Lag)\(Y);

%% Estimating AR Innovation

[ InnovationSeries, Innovation_Variance ] = AR_Innovation_Calculator( Y,Y_Lag,AR_Theta );

%% Forecasting AR

%Forecast_ObsNum=96;

Innovation=0+sqrt(Innovation_Variance)*randn(Forecast_ObsNum,1);

[ ForecastSeries ] = AR_Forecast_Creator( AR_Theta, OriginalSeries, Forecast_ObsNum, AR_Lags,Mean_OriginalSeries1,Innovation );


end

