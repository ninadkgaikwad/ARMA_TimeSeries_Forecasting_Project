function [ ForecastSeries,TimeSeries1 ] = ARMA_Forecast_Creator( ARMA_Theta, TimeSeries,InnovationSeries, Forecast_ObsNum, AR_LagVector,MA_LagVector, Mean_OriginalSeries1,Innovation )
%% Function Details:



%% Function: ARMA Forecast Creator

for i=1:Forecast_ObsNum
    
    % Creating X0 for Forecasting New Value
    
    X0_AR=zeros(1,length(AR_LagVector));
    
    for j=1:length(AR_LagVector)
        
        X0_AR(1,j)=TimeSeries(length(TimeSeries)-AR_LagVector(1,j),1);
        
    end
    
    X0_MA=zeros(1,length(MA_LagVector));
    
    for j=1:length(MA_LagVector)
        
        X0_MA(1,j)=InnovationSeries(length(InnovationSeries)-MA_LagVector(1,j),1);
        
    end  
    
    X0=horzcat(X0_AR,X0_MA);
    
    
    % Forecasting New Value
    
    ForecastSeries(i,1)=X0*ARMA_Theta; 
    
    
    
    TimeSeries=vertcat(TimeSeries,ForecastSeries(i,1));  
    
    InnovationSeries=vertcat(InnovationSeries,Innovation(i,1));
    
    
end

ForecastSeries=ForecastSeries+Mean_OriginalSeries1+Innovation;

TimeSeries1=TimeSeries+Mean_OriginalSeries1;


end


