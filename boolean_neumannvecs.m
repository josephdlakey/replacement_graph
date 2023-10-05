function [Hneu] = boolean_neumannvecs(N)

% generate standard *Neumann* vectors of Boolean cubes. These can be
% defined to be the sums of Hadamard vectors with fixed Laplacian
% eigenvalue. They should have the property of vanishing against Dirichlet
% Laplacian eigenvectors.

[~,AN]=boolean_laplace(N);
 Are=dyad_reindex_matrix(AN);
 H=hadamard(2^N); % not normalized hadamard
 Hre=dyad_reindex_matrix(H);
 Hneu=zeros(2^N,N+1);
 Hneu(:,1)=Hre(:,1);
 count=1;
 for k=1:N
     Hneu(:,k+1)=sum(Hre(:,1+count:nchoosek(N,k)+count),2);
     count=count+nchoosek(N,k);
 end
 for col=1:N+1
     Hneu(:,col)=Hneu(:,col)./norm(Hneu(:,col));
 end