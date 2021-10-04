function [ ForecastSeries ] = AR_MLE_Func( AR_Lags, Forecast_ObsNum, OriginalSeries1 )
%% Function Details:



%% Function : AR - MLE Estimation

Mean_OriginalSeries1=mean(OriginalSeries1);

OriginalSeries=OriginalSeries1-Mean_OriginalSeries1;

%% Creating Co-efficient Series for AR

% AR_Lags=[1,96,192];

[ Y_Lag ] = ARMA_LagMatrix_Creator( OriginalSeries,AR_Lags );

Y=OriginalSeries(max(AR_Lags)+1:end,1);

%% Computing the AR Parameters : Least Squares for creating initial AR_Theta_Initial

AR_Theta_Initial=(Y_Lag)\(Y);

%% Estimating AR Innovation

[ InnovationSeries, Innovation_Variance ] = AR_Innovation_Calculator( Y,Y_Lag,AR_Theta_Initial );

%% Computing the AR Parameters : Maximum Likelihood Estimation

Initial_Guess=[AR_Theta_Initial;Innovation_Variance];

options = optimset('PlotFcns',@optimplotfval);
%thetahat=fminsearch(@(theta) loglikelihood_functionparam(theta,uVec,Y,n,x0),initguess)

% thetahat=fminsearch(@(theta) AR_Loglikelihood_Func(theta,Y_Lag),Initial_Guess);

Aeq=[zeros(1,length(AR_Lags)) -1];

B=0;

thetahat=fmincon(@(theta) AR_Loglikelihood_Func(theta,Y_Lag,Y),Initial_Guess,Aeq,B);

AR_Theta=thetahat(1:end-1,1);

Innovation_Variance=thetahat(end,1);

%% Forecasting AR

% Forecast_ObsNum=96;

Innovation=0+sqrt(Innovation_Variance)*randn(Forecast_ObsNum,1);

[ ForecastSeries ] = AR_Forecast_Creator( AR_Theta, OriginalSeries, Forecast_ObsNum, AR_Lags,Mean_OriginalSeries1,Innovation );



end

