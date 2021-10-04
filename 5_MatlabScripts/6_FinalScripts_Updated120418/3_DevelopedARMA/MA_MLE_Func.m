function [ ForecastSeries,TimeSeries1 ] = MA_MLE_Func( MA_Lags,AR_Lags, Forecast_ObsNum, MA_data )
%% Function Details:


%% Function : MA - MLE Estimation

Mean_OriginalSeries1=mean(MA_data);

OriginalSeries=MA_data-Mean_OriginalSeries1;

%Lag_Percent=50;

% AR_Lags=[1:floor(Lag_Percent*length(OriginalSeries)/100)];

% AR_Lags=[1:15];

[ Y_Lag ] = ARMA_LagMatrix_Creator( OriginalSeries,AR_Lags );

Y_AR=OriginalSeries(max(AR_Lags)+1:end,1);

%% Computing the AR Parameters : Least Squares

AR_Theta=(Y_Lag)\(Y_AR);

%% Estimating AR Innovation

[ InnovationSeries, Innovation_Variance ] = AR_Innovation_Calculator( Y_AR,Y_Lag,AR_Theta );




%% Creating Co-efficient Series for MA [Since MA process is a infinite AR Process]

% MA_Lags=[0,1];

[ Y_Lag ] = ARMA_LagMatrix_Creator( InnovationSeries,MA_Lags );

Y=Y_AR(max(MA_Lags)+1:end,1);

Innovation_et=Y_Lag(:,1);

Y_MA=Y-Innovation_et;

Y_Lag_MA=Y_Lag(:,2:end);



%% Computing the MA Parameters : Least Squares

MA_Theta_Initial=(Y_Lag_MA)\(Y_MA);

%% Computing the MA Parameters : Maximum Likelihood Estimation

Initial_Guess=[MA_Theta_Initial;Innovation_Variance];

% options = optimset('PlotFcns',@optimplotfval);
%thetahat=fminsearch(@(theta) loglikelihood_functionparam(theta,uVec,Y,n,x0),initguess)

% thetahat=fminsearch(@(theta) AR_Loglikelihood_Func(theta,Y_Lag),Initial_Guess);

Aeq=[zeros(1,(length(MA_Lags)-1)) -1];

B=0;

thetahat=fmincon(@(theta) MA_Loglikelihood_Func(theta,Y_Lag_MA,Y),Initial_Guess,Aeq,B);

MA_Theta=thetahat(1:end-1,1);

Innovation_Variance=thetahat(end,1);


%% Estimating AR Innovation

%[ InnovationSeries, Innovation_Variance ] = AR_Innovation_Calculator( Y,Y_Lag,AR_Theta );

%% Forecasting MA

% Forecast_ObsNum=100;

% Variance of Innovation_et

Variance_Innovation_et=var(Innovation_et);

Innovation_Series_et=sqrt(Variance_Innovation_et)*randn(Forecast_ObsNum,1);

%Innovation=0+sqrt(Innovation_Variance)*randn(Forecast_ObsNum,1);

[ ForecastSeries,TimeSeries1 ] = MA_Forecast_Creator( MA_Theta, Y_AR, Forecast_ObsNum, MA_Lags(1,2:end), Mean_OriginalSeries1,Innovation_Series_et );


end

