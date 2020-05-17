%Update_FeatureVector
r=(sum( U(:,a1(:,1)).*V(:,a1(:,2)) ,1))';
r3=Gd(r).*( G(r)-a1(:,3) );       clear r;
F=sparse(a1(:,1),a1(:,2),r3,m,n); clear r3;

r=(sum( W(:,a2(:,1)).*Y(:,a2(:,2)) ,1))';
r3=Gd(r).*( G(r)-a2(:,3) );       clear r;
% % % r3=2*Gd(r).*( 2*G(r)-1-a2(:,3) ); clear r; %h(x)=2g(x)-1
H=sparse(a2(:,1),a2(:,2),r3,m,m); clear r3;

sum1=V*F';
sum2=c1*(U-c3*W);
sum3=c2*(U-c3*Y);
De_U=sum1+sum2+sum3+y*U*C1; clear sum1;clear sum2;clear sum3;

sum1=U*F;              clear F;
De_V=sum1+y*V*C2;      clear sum1;

sum1=Y*H'; 
sum2=-c1*c3*(U-c3*W);
De_W=sum1+sum2+y*W*C3; clear sum1;clear sum2;

sum1=W*H;              clear H;
sum2=-c2*c3*(U-c3*Y);
De_Y=sum1+sum2+y*Y*C4; clear sum1;clear sum2;

U=U-a*De_U;       clear De_U;
V=V-a*De_V;       clear De_V;
W=W-a*De_W;       clear De_W;
Y=Y-a*De_Y;       clear De_Y;

%turn the 'NaN' into a random number
U(isnan(U))=c*randn;V(isnan(V))=c*randn;
W(isnan(W))=c*randn;Y(isnan(Y))=c*randn;
