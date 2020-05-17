
for times=1:5000
    %tic;
    count=count+1;
    %Update_V;Update_U;Update_W;Update_Y;
    Update_FeatureVector
    Evaluate;
    
    if mod(count,2)==0
        if Rmse>Rmse_pre&&count>10
            a=0.5*a;disp(a);
            V=V_pre;U=U_pre;W=W_pre;Y=Y_pre;
            Rmse=Rmse_pre;
        end
        V_pre=V;U_pre=U;W_pre=W;Y_pre=Y;
        Rmse_pre=Rmse;
    end
    
    if a<1e-5
        break;
    end
    %Compute_L;
    %toc;
end
