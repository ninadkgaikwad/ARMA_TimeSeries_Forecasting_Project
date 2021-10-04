function [ ARMALagMatrix ] = ARMA_LagMatrix_Creator( TimeSeries,LagVector )
%% Function Details



%% Function : Creating ARMA Lag Matrix
ARMALagMatrix=[];
k=1;
for i=1:length(TimeSeries)
    if i>max(LagVector)
        for j=1:length(LagVector)
            ARMALagMatrix(k,j)=TimeSeries(i-LagVector(j));
        end
        k=k+1;
    end
end
end

