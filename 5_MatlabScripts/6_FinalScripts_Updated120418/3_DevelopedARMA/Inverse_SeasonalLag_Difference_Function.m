function [Undifferenced_Forecast]=Inverse_SeasonalLag_Difference_Function(Data_Differenced,Inverse_seed_seasonal)
    %Undifferencing to invert Single Lag Differencing
    Differenced_Forecast=Data_Differenced;
    SeasonalLag_Num=length(Inverse_seed_seasonal);
    
    for jj=1:length(Differenced_Forecast)
        if jj<=SeasonalLag_Num
            Undifferenced_Forecast(jj,1)=Differenced_Forecast(jj,1)+Inverse_seed_seasonal(jj,1);
        else
            Undifferenced_Forecast(jj,1)=Differenced_Forecast(jj,1)+Undifferenced_Forecast(jj-SeasonalLag_Num,1);
        end
    end
end
        