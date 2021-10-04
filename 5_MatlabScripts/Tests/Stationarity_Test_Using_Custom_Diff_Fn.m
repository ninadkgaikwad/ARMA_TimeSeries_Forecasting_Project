%%
clear all
in_data=importdata('Diamond300_Converted_File_MinutesResolution_5-Mins_To_15-Mins.xlsx');

%%
slice=96*7;
orig_time_series=in_data.data(1:slice,5);
%orig_time_series=in_data.data(:,5);

%%
adf_test_output=adftest(orig_time_series)
kpss_test_output=kpsstest(orig_time_series)
if adf_test_output==0 && kpss_test_output==1
    disp('The time-series has unit root and will require differencing')
elseif adf_test_output==1 && kpss_test_output==0
    disp('The time-series is trend stationary and may require seasonal lag')
else
    disp('Nothing can be determined from the stationarity tests')
end

stationarity_status=0;

while stationarity_status==0
     %Differencing the Series
    SingleLag_Num=input('Enter single lag number:');
    SeasonalLag_Num=input('Enter seasonal lag number:');
    
    %Application of Single Lag
    Input_series=orig_time_series;
    Inverse_seed(1)=orig_time_series(length(orig_time_series));
    if SingleLag_Num==0
        Data_SingleLag_Differenced=orig_time_series;
    else
        for i=1:SingleLag_Num
            if i~=1
                Input_series=Data_SingleLag_Differenced;
            end
            subtrahend=Input_series(1:end-1);
            Input_series=Input_series(2:end);
            Data_SingleLag_Differenced=Input_series-subtrahend;
            Inverse_seed(i+1)=Data_SingleLag_Differenced(length(Data_SingleLag_Differenced));
        end
    end
    
    %Application of Seasonal Lag
    if SeasonalLag_Num==0
        Data_Differenced=Data_SingleLag_Differenced;
    else
        subtrahend=Data_SingleLag_Differenced(1:end-SeasonalLag_Num);
        Data_SingleLag_Differenced=Data_SingleLag_Differenced(SeasonalLag_Num+1:end);
        Data_Differenced=Data_SingleLag_Differenced-subtrahend;
    end
    
    figure(1);
    plot(Data_Differenced)
    title('Plot of differenced time-series')
    xlabel('Time')
    ylabel('Power')

    %
    adf_test_output=adftest(Data_Differenced)
    kpss_test_output=kpsstest(Data_Differenced)
    

    disp(strcat('The chosen single lag number is ',' ',int2str(SingleLag_Num),' and the chosen seasonal lag number is ',' ',int2str(SeasonalLag_Num)))
    disp('The ACF and PACF plots for the Differenced Time Series are as follows.')
    figure(2)
    autocorr(Data_Differenced)
    figure(3)
    parcorr(Data_Differenced)
    
    resp=input('Do you want to perform further operations to induce stationarity? (Y/N):','s');
    
    if lower(resp)=='y'
        stationarity_status=0;
    else
        stationarity_status=1;
    end
end