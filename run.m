close all;
load('yale_newdouble.mat');
% Ref: Relaxed Multi-view Clustering in Latent Embedding Space
% Written by: Mansheng Chen, chenmsh27@mail2.sysu.edu.cn
% 2020-10-20

alpha = 0.8; 
beta = 0.7;  
d = 30; %lower dimension 
mu = 1;
lambda = 0.004; 


result = RMCLES(X, alpha, beta, d, lambda, mu, gt)

