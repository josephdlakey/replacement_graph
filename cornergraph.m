function [C] = cornergraph(N,alpha)

% Corner graph of size NxN with values -1/alpha and alpha in the upper
% right and -alpha in the lower left corner and value 1 in the upper left and lower right
% corner. Alphas should be a complex unimodular

C=zeros(N);
C(1,N)=-1/alpha;
C(N,1)=-alpha;
C(1,1)=1;C(N,N)=1;
end
