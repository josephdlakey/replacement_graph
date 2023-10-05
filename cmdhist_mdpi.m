
%% routines to generate figures in the manuscript 
%% "Spatio–spectral limiting on replacements of tori by cubes
%% JDL 100323

% Eigen-decomposition of L(T_11^2 r B_4)
[L4,A4]=boolean_laplace(4);
A4re=dyad_reindex_matrix(A4);
bH=[1,16,13,4];
[TH] = torus_replacement_graph(11,A4re,bH);
imagesc(TH);
LTH=adjacencylaplace(TH);
[UTH,STH]=eig(LTH);
sth=diag(STH);
plot(sth);

% Eigen-decomposition of L(C_21 r B_7)
[L7,A7]=boolean_laplace(7);
L7re=dyad_reindex_matrix(L7);
H=hadamard(128);
Hre=dyad_reindex_matrix(H);
[Lbig] = cyclesub(Lre,21);
[Ubig,Sbig]=eig(Lbig);

% Eigendecomposition of L(C_21 r P_8)
C821=cycle(8*21);
LC821=adjacencylaplace(C821);
[UC821,SC821]=eig(LC821);


% Augmented Laplacian: Torus case
L4re=adjacencylaplace(A4re);
LC=L4re+cornergraph(16,exp(2*pi*1i/21));
[ULC,SLC]=eig(LC);
slc=real(diag(SLC));
[sslc,ix]=sort(slc);
ULCix=zeros(16);
for j=1:16
ULCix(:,j)=ULC(:,ix(j));
end
Hneu=boolean_neumannvecs(4);
HULCix=Hneu*Hneu'*ULCix; % projection onto Neumann subspace
hULCix=Hneu'*ULCix;


%%%%% PQ operators %%%%

%% Case of cycle of length 8x21 %%%%
QC21=submatrix_add(zeros(8*21),eye(8),1,1);
PQC821=UC821(:,1:63)*(UC821(:,1:63))'*QC21;
[UPQC821,SPQC821]=eig(PQC821);
[spqc821,ix821]=sort(real(diag(SPQC821)),'descend');
plot(spqc821)
axis([1 20 0 1.1])

%% Case of C_21 and B_7
Qbig=submatrix_add(zeros(2688),eye(128),1,1);
PQbig=Ubig(:,1:1323)*(Ubig(:,1:1323))'*Qbig;
[UPQbig,SPQbig]=eig(PQbig);
[spqbig,ixbig]=sort(real(diag(SPQbig)),'descend');
plot(spqbig)
axis([1 80 0 1.1])

%% Case of T_11^2 and B_4

[L4,A4]=boolean_laplace(4);
A4re=dyad_reindex_matrix(A4);
bH=[1,16,13,4];
TH2=torus_replacement_graph2(11,11,A4re,bH);
LTH=adjacencylaplace(TH2);
[UTH,STH]=eig(LTH);
n=605;
[KH] = torus_cutoff_graph(1,1,11,11,A4re);
QP=UTH(:,1:n)*(UTH(:,1:n))'*KH;
[UQP,SQP]=eig(QP);
sqp=diag(SQP);
[sqp,ix]=sort(real(sqp),'descend');
plot(sqp)
axis([1 20 0 1.1])

%%%%%%%%%%%%%%%%%%%%%%%%%
%% eigenvalue plots for the 3 cases
%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
subplot(3,1,1);
plot(spqc821)
axis([1 20 0 1.1])
subplot(3,1,2);
plot(spqbig)
axis([1 80 0 1.1])
subplot(3,1,3);
plot(sqp)
axis([1 20 0 1.1])

%%%%%%%%  
%%Need to do subplots above!!

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Radial type eigenvalues

figure;
plot(spqc821(1:8));
hold on
hold on
plot(spqbig(61:68));plot(spqbig(61:68),'d');
plot(sqp(3:10));plot(sqp(3:10),'o');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% tiled plots of eigenvectors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
tiledlayout(6,3)
nexttile([2,1])
plot(circshift(real(UPQC821(:,ix821(3))),84));
axis tight
nexttile([1,2])
plot(diag(SC821))
nexttile([1,2])
plot(real((UPQC821(:,ix821(3)))'*UC821)); % Fourier coefficients
axis tight
nexttile([2,1]);
plot(circshift(real(UPQbig(:,ixbig(63))),1344));
nexttile([1,2]);
plot(diag(Sbig))
nexttile([1,2]);
plot(UPQbig(:,ixbig(63))'*Ubig);
nexttile([2,1]);
plot(circshift(UQP(:,ix(5)),963));
nexttile([1,2]);
plot(diag(STH))
nexttile([1,2]);
plot(UQP(:,ix(5))'*UTH);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% code to check change of basis hypothesis %%%
%% cef: matrix of change of basis from radial eigenfunctions to 
%% eigenfunctions of augmented Laplacian
[coef] = neumann_augmented(3,5,3);

