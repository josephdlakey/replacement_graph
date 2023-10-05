function [Lbig] = cyclesub(L,k,w);
% edge substitution of matrix A into a path
% L is assumed to be a Laplacian matrix of an unweighted graph
% k is the path length
if nargin<3
    w=1;
end

Lbig=pathsub(L,k,w);
C=zeros(size(Lbig));
[m,n]=size(Lbig);
C(1,1)=1;
C(1,n)=-1;
C(m,1)=-1;
C(m,n)=1;
%Lbig=Lbig+w*C; % need a different weight defnL
Lbig=Lbig+C;


