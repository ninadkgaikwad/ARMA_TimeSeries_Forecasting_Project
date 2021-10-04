function [ InnovationSeries, Innovation_Variance ] = AR_Innovation_Calculator( Y,Y_Lag,AR_Theta )
%% Function Details:


%% Function: 

InnovationSeries=Y-Y_Lag*AR_Theta;

Innovation_Variance=var(InnovationSeries);

end

