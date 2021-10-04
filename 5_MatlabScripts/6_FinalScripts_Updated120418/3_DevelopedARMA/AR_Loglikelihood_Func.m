function [ LogLikelihood_FuncValue ] = AR_Loglikelihood_Func( Theta, Y_Lag,Y )

%% Function Details:


%% Function: AR Loglikelihood Function

AR_Theta=Theta(1:end-1,1);

Variance=Theta(end,1);

[R,C]=size(Y_Lag);

LogLikelihood_FuncValue=0;

for i=1:R % For each observation
    
    Y_Estimate=Y_Lag(i,:)*AR_Theta;
    
    Current_LogLikelihood=(1/2)*log(1/Variance)-(((Y(i)-Y_Estimate)^(2))/(2*Variance));
    
    LogLikelihood_FuncValue=LogLikelihood_FuncValue+Current_LogLikelihood;
    
end

LogLikelihood_FuncValue=-LogLikelihood_FuncValue;

end

