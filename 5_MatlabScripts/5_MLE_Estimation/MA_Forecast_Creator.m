function [ ForecastSeries,TimeSeries1 ] = MA_Forecast_Creator( MA_Theta, TimeSeries, Forecast_ObsNum, LagVector, Mean_OriginalSeries1,Innovation_et )
%% Function Details:



%% Function: ARMA Forecast Creator

for i=1:Forecast_ObsNum
    
    % Creating X0 for Forecasting New Value
    
    X0=zeros(1,length(LagVector));
    
    for j=1:length(LagVector)
        
        X0(1,j)=TimeSeries(length(TimeSeries)-LagVector(1,j),1);
        
    end
    
    
    % Forecasting New Value
    
    ForecastSeries(i,1)=X0*MA_Theta; 
    
    
    
    TimeSeries=vertcat(TimeSeries,ForecastSeries(i,1));    
    
    
end

ForecastSeries=ForecastSeries+Mean_OriginalSeries1+Innovation_et;

TimeSeries1=TimeSeries+Mean_OriginalSeries1;


end



