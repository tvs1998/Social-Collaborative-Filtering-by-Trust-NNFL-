%evaluate RMSE on test set
%tic;
s=find(a3(:,3) );
r=(sum( U(:,a3(s,1)).*V(:,a3(s,2)) ,1))';

r=6*G(r);
r(r>5)=5;r(r<1)=1;

err=r-a3(s,3);                       
clear r;
sum1=sum(abs(err));sum2=sum(err.^2);
clear err;
aa=length(a3(s,1));
clear s;

Mae=sum1/aa;
Rmse=sqrt(sum2/aa); 
clear aa;
clear sum1;
clear sum2;
fprintf(1,'Number of interations: %d ,test MAE: %6.4f ,test RMSE: %6.4f \n',...
    count,Mae,Rmse);

%toc;
