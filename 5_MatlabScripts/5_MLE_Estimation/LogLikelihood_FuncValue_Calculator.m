 function [LogLikelihood_FuncValue]=LogLikelihood_FuncValue_Calculator(Theta,Y_k,U_k,X_0,N)

 %% Function:
 % To Compute the Value of Loglikehood Function for Parameter Estimation 
 % problem of a Discrete Time System

% Discrete-Time System Matrices Inialization
C=zeros(1,N);
B=zeros(N,1);
A=zeros(N,N);

% Discrete-Time System Matrices in Controllable Canonical Form
C(1,:)=Theta(N+1:(2*N),1);

B(1,1)=1;

A(1,:)=(-1)*Theta(1:N,1);
A(2:N,1:N-1)=eye(N-1);

% Computing LogLikelihood Function Value

LogLikelihood_Value=0;

for k=1:length(Y_k)-1
    
   Mean_Y=(C*(A^k)*X_0);
   
   Mean_X=0;
   
   for j=1:k  % or k-1
       
       Mean_X = Mean_X+ (A^(k-j))*B*U_k(j);
              
   end
   
    Mean_Y=Mean_Y+(C*Mean_X);
   
    LogLikelihood_Value= LogLikelihood_Value - (Y_k(k+1)-Mean_Y)^2;
    
end

LogLikelihood_FuncValue=-LogLikelihood_Value; % Taking Negative to Maximize using fminsearch()


end

