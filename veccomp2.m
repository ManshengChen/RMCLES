function [all]=veccomp2(ij,n,F)
x = (repmat(F(ij, :), n, 1) - F);
all = sum(x.^2, 2)';
end