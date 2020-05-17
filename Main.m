%function Main
dataName='../data/epinions_trust_distrust_1.mat';
load(dataName);
Load_data;
%Degree_load;
T=sparse(a2(:,1),a2(:,2),ones(length(a2),1),m,m);
m3=a1(:,1);n3=a1(:,2);x3=ones(length(m3),1);X3=sparse(m3,n3,x3,m,n);
b1=sum(X3,2);b1(b1==0)=1;b1=sparse(b1); C1=diag(b1);clear b1;
b2=sum(X3,1);b2(b2==0)=1;b2=sparse(b2); C2=diag(b2);clear b2;
b3=sum(T,2); b3(b3==0)=1;b3=sparse(b3); C3=diag(b3);clear b3;
b4=sum(T,1); b4(b4==0)=1;b4=sparse(b4); C4=diag(b4);clear b4;
clear m3;clear n3;clear x3;clear X3;

d=10;y=0.001;
a=0.02;

c=0.1;  W=c*randn(d,m);Y=c*randn(d,m);U=c*randn(d,m);V=c*randn(d,n);
% c=1;  W=c*rand(d,m);Y=c*rand(d,m);U=c*rand(d,m);V=c*rand(d,n);
c1=10;c2=10;  c3=0.5;   parameters=[d,y,a,c1,c2,c3];
count=0; 
%while (L has not converged)
Evaluate;Rmse_pre=Rmse;
for times=1:5000
%     break;
%     tic;
    count=count+1;
    Update_FeatureVector
    Evaluate;
    
    if mod(count,2)==0
        if Rmse>Rmse_pre&&count>20
            a=0.5*a;disp(a);
            V=V_pre;U=U_pre;W=W_pre;Y=Y_pre;
            Rmse=Rmse_pre;
        end
        V_pre=V;U_pre=U;W_pre=W;Y_pre=Y;
        Rmse_pre=Rmse;
    end
    
    if a<1e-4
        break;

    end

%     Compute_L;
%     toc;
end
count1=count;
Mae1=Mae;
Rmse1=Rmse;

disp('End');
fopen('../result/output.txt')
fprintf('Program is end. The Mae is %d, the Rmse is %d ',Mae1,Rmse1)
%record; 
