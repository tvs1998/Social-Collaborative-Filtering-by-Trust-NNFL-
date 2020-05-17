%Load_data
disp('begin:');
%Load data 
%RD_train1;m=5178;n=11643;
% m=49289;n=139738;a1=load('train2_large.txt');
% a2=load('T_large.txt');a3=load('test2_large.txt');
%m=129490;n=58541;a1=load('train1_douban.txt');a2=load('T_douban.txt');a3=load('test1_douban.txt');
%m=120492;n=755760;a1=load('train1_ep_ex.txt');a2=load('T_ep_ex.txt');a3=load('test1_ep_ex.txt');
%m=1049511;n=66726;a1=load('train1_flixter.txt');a2=load('T_flixter.txt');a3=load('test1_flixter.txt');
%m=147612;n=48794;a1=load('train1_flixter_reduce.txt');a2=load('T_flixter_reduce.txt');a3=load('test1_flixter_reduce.txt');
m= max( max( train(:,1) ), max( test(:,1) ));
n = max( max( train(:,2) ), max( test(:,2) ) );
% a1=load('train2_large.txt');
% a2=load('T_large.txt');a3=load('test2_large.txt');
a1=train;
a2=trust;a3=test;
%load('data_douban1.mat'); 
%load('data_ep_ex_trustonly1.mat');
% load('data_flixter_reduce1.mat');
%load('data_ep_ex1.mat');
%load('data_flixter1.mat');

%X=sparse(a1(:,1),a1(:,2),a1(:,3),m,n);
a1(:,3)=a1(:,3)./6; 

%T=sparse(a2(:,1),a2(:,2),a2(:,3),m,m);
a2(:,3)=a2(:,3)./1.2;

%X_test=sparse(a3(:,1),a3(:,2),a3(:,3),m,n);

disp('Load successfully ');
