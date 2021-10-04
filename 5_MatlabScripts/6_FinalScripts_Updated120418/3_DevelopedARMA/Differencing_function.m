function [Data_Differenced,Inverse_seed,Seasonal_Inverse_seed] = Differencing_function( Input_series,SingleLag_Num,n)
%When this function is called for single lag, use n=1 and required number
%of single lags as SingleLag_num.
%When this function is called for seasonal lag, use n=Seasonality and
%SingleLag_num
Seasonal_Inverse_seed=Input_series(end-n+1:end);
Inverse_seed(1)=Input_series(length(Input_series));
    for i=1:SingleLag_Num
        if i~=1
            Input_series=Data_Differenced;
            Inverse_seed(i)=Input_series(length(Input_series));
        end
        subtrahend=Input_series(1:end-n);
        Input_series=Input_series(n+1:end);
        Data_Differenced=Input_series-subtrahend;
    end
end

