function [matout]=normcol_lessequal(matin)
% solve the proximal problem
     matout = matin./repmat(max(1,sqrt(sum(matin.*matin,1)+eps)),size(matin,1),1);

