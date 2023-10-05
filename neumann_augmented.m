[function [coef] = neumann_augmented(N,m,k)

% Neumman type eigenvectors of augmented Laplacian for Boolean cube
% N: size of cube
% m: size of cycle
% k: power of exp(2*pi*1i/m)

[L,A]=boolean_laplace(N);
Are=dyad_reindex_matrix(A);
Lre=adjacencylaplace(Are);
omega=exp(2*pi*1i/m);
LC=Lre+cornergraph(2^N,omega^k);
nind=[1];
c=1;
for i=1:N
    c=c+nchoosek(N,i);
    nind=cat(2,nind,c);
end
[ULC,SLC,VLC]=eig(LC);
[~,slcix]=sort(abs(diag(SLC)));
ULCneu=ULC(:,slcix(nind));
Hneu=boolean_neumannvecs(N);
ULCneucoeff=ULCneu'*Hneu;
min(diag((abs(ULCneucoeff))).^2)
coef=ULCneucoeff;

