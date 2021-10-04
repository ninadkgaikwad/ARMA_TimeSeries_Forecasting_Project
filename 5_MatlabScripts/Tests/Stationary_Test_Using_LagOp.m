%Description: Script to test stationarity of series and apply lag if
%required
%Date modified: 12/01/18

%%
clear all
in_data=importdata('Diamond300_Converted_File_MinutesResolution_5-Mins_To_15-Mins.xlsx');
%%
slice=1:96*7;
orig_time_series=in_data.data(slice,5);
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

while (stationarity_status==0)
    %Differencing the Series
    SingleLag_Num=input('Enter single lag number:');
    SeasonalLag_Num=input('Enter seasonal lag number:');
    D_SingleLag = LagOp({1,-1},'Lags',[0,1]);
    D_SeasonalLag = LagOp({1,-1},'Lags',[0,SeasonalLag_Num]);
    D_TotalLag=1; % Initialization

    for i=1:SingleLag_Num
        D_TotalLag=D_TotalLag*D_SingleLag ;    
    end

    D_TotalLag=D_TotalLag*D_SeasonalLag;
    Data_Differenced=filter(D_TotalLag,orig_time_series);
    figure(1);
    plot(Data_Differenced)
    title('Plot of differenced time-series')
    xlabel('Time')
    ylabel('Power')

    %
    adf_test_output=adftest(Data_Differenced);
    kpss_test_output=kpsstest(Data_Differenced);
    

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