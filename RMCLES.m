function [result] = RMCLES(X, alpha, beta, d, lambda, mu, gt)
% Ref: Relaxed Multi-view Clustering in Latent Embedding Space
% Written by: Mansheng Chen, chenmsh27@mail2.sysu.edu.cn
% 2020-10-20
C = size(unique(gt),1);
V = size(X,2);
n = size(X{1},2);
MAXiter = 1000;  
REPlic = 20; 

for i=1:V
    X{i} = X{i}./repmat(sqrt(sum(X{i}.^2,1)),size(X{i},1),1); 
end

for i=1:V
    D{i} = size(X{i},1); 
end
SD = 0;
M = [];
for i=1:V
    SD = SD + D{i};
    M = [M;X{i}]; 
end
P = zeros(SD,d);
H = rand(d,n);
S = zeros(n);
F = rand(n,C);
Y1= zeros(n);

for it=1:30
    %------update P--------
    P = UpdateP(H,M,P);
    
    %------update H--------
    H = SMR_mtv(M,P,S,alpha);
    
    %------update S--------
    K = tanh(2*(H'*H)); %Sigmoid Kernel
    
    D=S-Y1/mu;
    W=(mu*D)/(2*(beta/alpha)+mu);
    W=W-diag(diag(W));
    W(find(W<0))=0;
    E=W+Y1/mu;
    parfor ij=1:n
        [all]=veccomp2(ij,n,F);
        T=mu*eye(n)+2*K;
        ff=(lambda/alpha)/2*all'-2*K(:,ij)-mu*E(:,ij);
        S(:,ij)=T\(-ff);
    end
    S=S-diag(diag(S));
    S(find(S<0))=0;
    
    Y1=Y1+mu*(W-S);
    mu=mu*1.2;
    
    %------update F--------
    S = (S+S')/2;
    D = diag(sum(S));
    L = D-S;
    [F, ~, ~]=eig1(L, C, 0);
end

l = kmeans(F,C,'maxiter',MAXiter,'replicates',REPlic,'EmptyAction','singleton');
[ACC, NMI, PUR] = ClusteringMeasure(gt,l);
[~,RI,~,~]=RandIndex(gt,l);
result = [ACC NMI PUR RI];
