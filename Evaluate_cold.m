% Evaluate_cold
x=ratingNum(a3(:,1));  % rating cold start
% x=degreeNum(a3(:,1));  % relation cold start
s=find(x>=0 & x<=5); clear x;
r=(sum( U(:,a3(s,1)).*V(:,a3(s,2)) ,1))';

r=6*G(r);
r(r>5)=5;r(r<1)=1;

err=r-a3(s,3);                      
clear r;
sum1=sum(abs(err));
sum2=sum(err.^2);
clear err;
aa=length(a3(s,1));
clear s;

Mae=sum1/aa;
Rmse=sqrt(sum2/aa);
clear aa;
clear sum1;
clear sum2;
fprintf(1,'Number of iterations:%d,MAE: %6.4f ,RMSE: %6.4f \n',...
count,Mae,Rmse);
