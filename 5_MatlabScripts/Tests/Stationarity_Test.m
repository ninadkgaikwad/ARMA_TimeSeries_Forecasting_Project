%% Stationarity Tests : ADF and KPSS

%% Loading Data

load('Data_Test.mat')

%% Getting Data

Data=FullData(1:960,5);

figure(1);

plot(Data)

%% Stationarity before Differencing

ADF_StatTest=adftest(Data); % 0 - Series has Unit Root (Difference Stationary) ; 1 - Series is either Stationary or Trend-Stationary

KPSS_StatTest=kpsstest(Data); % 0 - Series is Trend Stationary ; 1- Series has a Unit Root (Difference Stationary)

%% Differencing the Series

SingleLag_Num=10;

SeasonalLag_Num=0;

D_SingleLag = LagOp({1,-1},'Lags',[0,1]);

D_SeasonalLag = LagOp({1,-1},'Lags',[0,SeasonalLag_Num]);

D_TotalLag=1; % Initialization

for i=1:SingleLag_Num
    
   D_TotalLag=D_TotalLag*D_SingleLag ;
    
end

D_TotalLag=D_TotalLag*D_SeasonalLag;

Data_Differenced=filter(D_TotalLag,Data);

figure(2);

plot(Data_Differenced);

%% Stationarity before Differencing

ADF_StatTest=adftest(Data_Differenced); % 0 - Series has Unit Root (Difference Stationary) ; 1 - Series is either Stationary or Trend-Stationary

KPSS_StatTest=kpsstest(Data_Differenced); % 0 - Series is Trend Stationary ; 1- Series has a Unit Root (Difference Stationary)

%% ACF and PACF Plots

AcfPacfLag=200;

figure(3)
subplot(2,1,1)
autocorr(Data_Differenced,'NumLags',AcfPacfLag)
subplot(2,1,2)
parcorr(Data_Differenced,'NumLags',AcfPacfLag)