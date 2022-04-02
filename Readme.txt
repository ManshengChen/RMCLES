Some tips to use this package code:

1. Open run.m to run RMCLES.
2. You can replace the dataset in the experiment as you want.

The tunable parameters about different datasets are listed as follows:
1.yale    d=30 , alpha=0.8 ,beta=0.7 ,gamma=0.004, K= tanh(2*(H'*H))
2.MSRC  d=70 , alpha=8 ,beta=1.5 ,gamma=0.004, K= tanh(2*(H'*H))
3.ORL     d=50 , alpha=0.8 ,beta=1 ,gamma=0.004, K= tanh(2*(H'*H))
4.Notting-Hill    d=40 , alpha=5 ,beta=4 ,gamma=0.004, K= tanh(2*(H'*H))
5.UCI   d=50 , alpha=2 ,beta= 9,gamma=0.004, K= tanh(1*(H'*H))
6.BBCSport    d=40 , alpha=0.8 ,beta=2 ,gamma=0.004, K= tanh(2*(H'*H))
7.WebKB-Texas   d=70 , alpha=0.8 ,beta=6 ,gamma=0.004, K= tanh(2*(H'*H))
8.3Sourses   d= 20, alpha=0.8 ,beta=6 ,gamma=0.004, K= tanh(2*(H'*H))
9.Reuters    d= 70, alpha=6 ,beta=0.8 ,gamma=0.004, K= tanh(1*(H'*H)+1)
10.Citeseer   d=60 , alpha=6 ,beta=0.1 ,gamma=0.004, K= tanh(1*(H'*H)+1)

References:
 "Relaxed Multi-view Clustering in Latent Embedding Space" 
Written by: Mansheng Chen, chenmsh27@mail2.sysu.edu.cn
 2020-10-20