function [ ForecastSeries,TimeSeries1 ] = AR_Forecast_Creator( ARMA_Theta, TimeSeries, Forecast_ObsNum, LagVector, Mean_OriginalSeries1,Innovation )
%% Function Details:



%% Function: ARMA Forecast Creator

for i=1:Forecast_ObsNum
    
    % Creating X0 for Forecasting New Value
    
    X0=zeros(1,length(LagVector));
    
    for j=1:length(LagVector)
        
        X0(1,j)=TimeSeries(length(TimeSeries)-LagVector(1,j),1);
        
    end
    
    
    % Forecasting New Value
    
    ForecastSeries(i,1)=X0*ARMA_Theta; 
    
    
    
    TimeSeries=vertcat(TimeSeries,ForecastSeries(i,1));    
    
    
end

%ForecastSeries=ForecastSeries+Mean_OriginalSeries1+Innovation;

ForecastSeries=ForecastSeries+Mean_OriginalSeries1;

TimeSeries1=TimeSeries+Mean_OriginalSeries1;


end


