function [L,A] = boolean_laplace(N)
%computes graph Laplacian of size 2^N of boolean hypercube
% can use eig to compute eigenvectors or use kronecker
% produces. Note: need to determine ordering of prolate neighbors
% as tehy relate to eigenvalues
% JDL 6/30/17
 
I=eye(N);
b=zeros(2^N,N);
c=zeros(2^N);
for i=1:2^N
b(i,:)=de2bi(i-1,N);
    for j=1:N
        d=bi2de(mod(b(i,:)+I(j,:),2));
        c(i,d+1)=1;
    end
end
A=c;
L=N*eye(2^N)-A;


end

