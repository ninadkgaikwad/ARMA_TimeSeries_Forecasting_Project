%% Differencing Tests : The implementation in the GUI as well as the simplified logic is the same

% We can create our own differencing function

%% Loading Data

load('Data_Test.mat')

%% Plotting Undifferenced Data

Data=FullData(1:96,5);

figure(1)
plot(Data);

%% Manual 1st Difference

Manual_FirstDiff=(Data(2:end)-Data(1:end-1));

figure(2)
hold on;

plot(Manual_FirstDiff);

%% LagOperator 1st Difference

D1 = LagOp({1,-1},'Lags',[0,1]);

LagOperator_FirstDiff = filter(D1,Data);

plot(LagOperator_FirstDiff);

%% Manual 2nd Difference

Manual_SecondDiff=(Manual_FirstDiff(2:end)-Manual_FirstDiff(1:end-1));

figure(3)
hold on;

plot(Manual_SecondDiff);

%% LagOperator 2nd Difference [As in ARIMA GUI]

D1 = LagOp({1,-1},'Lags',[0,1]);

D1=D1*D1;

LagOperator_SecondDiff = filter(D1,Data);

plot(LagOperator_SecondDiff);

