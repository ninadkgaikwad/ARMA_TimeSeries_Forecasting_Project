clear all;
clc;

model = arima('Constant',0.5,'MA',{0.8,0.2},...
              'MALags',[1,12],'Variance',0.2);
          
rng('default')
MA_data = simulate(model,600,'NumPaths',1);
