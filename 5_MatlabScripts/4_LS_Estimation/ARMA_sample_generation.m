clear all;
clc;

MdlSim = arima('Constant',0 ,'AR',{1.1, -0.28},'MA',0.4, 'Variance',1);
rng 'default';
ARMA_data = simulate(MdlSim,1000, 'NumPaths', 1);