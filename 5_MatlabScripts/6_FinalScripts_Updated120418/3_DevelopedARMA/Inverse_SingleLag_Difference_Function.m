function [Undifferenced_Forecast]=Inverse_SingleLag_Difference_Function(Data_Differenced,Inverse_seed_final)
    %Undifferencing to invert Single Lag Differencing
    SingleLag_Num=length(Inverse_seed_final);
    Differenced_Forecast=Data_Differenced;
    Inverse_seed=Inverse_seed_final;

    for ii=1:SingleLag_Num
        if ii~=1
            Differenced_Forecast=Undifferenced_Forecast;
        end
        for jj=1:length(Differenced_Forecast)+1
            if jj==1
                Undifferenced_Forecast(jj,1)=Inverse_seed(length(Inverse_seed)-ii+1)+Differenced_Forecast(1,1);
            else
                Undifferenced_Forecast(jj,1)=Differenced_Forecast(jj-1,1)+Undifferenced_Forecast(jj-1,1);
            end
        end
    end
end
        