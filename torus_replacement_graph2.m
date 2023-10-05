function [TH] = torus_replacement_graph2(m1,m2,H,bH)

%% compare to torus_replacement_graph. 
%%
%% that had a problem of one long cycle versus parallel cycles
%% Instead we use replacement cycle to build a single m1-replacement cycle
%% then we use submatrix_add to build m2 copies of the m1 replacement cycle
%% finally we use the 
%%
%%
%% below is the HELP for torus_replacement_graph
%%
%%
%% Torus T has m^2 vertices and adjacency is ordered so that (l1,l2) are assigned
%% to index l1+ml2
%% adjacencies are assigned to (l1 pm 1,l2) and (l1,l2 pm 1) in this ordering
%% Boundaries are paired so that adjacencies in the first coordinate are 
%% are coded in the first boundary pair and adjacencies in 2nd coord by second pair
% 
% This assumes square blocks of size b
%% boundary vertices are assumed in pairs bH=[b11,b12;b21,b22]
%% then b11b12 is used to join replacements coming from the same block
%% b21b22 is used to join replacements coming from different blocks.
%%
%% Motivated by example S=torus. Can apply to other cartesian products
%%

%% Output: replacement graph TH built from skeleton graph T (torus) and block graph H
%% Inputs: m: torus length (T=torus(m) has dimension m^2 x m^2)
%%         H: NxN block graph
%%         bh: Vector of length 4 (for torus) bh=[h11,h12,h21,h22]

[rh,ch]=size(H);
CH=cycle_replacement_graph(m1,H,bH(1),bH(2)); % size [m1*rhm1*ch]
[rch,cch]=size(CH);

TH=zeros(rch*m2,cch*m2); % should be same as [rh*m1*m2,ch*m1*m2]
for j=0:m2-1 % add CH in blocks along the  diagonal
    TH=submatrix_add(TH,CH,j*rch+1,j*cch+1);
end
r=sum(CH(1,:));

 
% for j=0:m^2-1
%     TH=submatrix_add(TH,H,j*rh+1,j*ch+1);
% end
%r=sum(T(1,:));
 
% if length(bH)~=r
%  	disp(['Warning: number of boundary vertices must equal',num2str(r)]);
% end


% for i=0:m1*m2-1
%     TH(rh*i+bH(1),mod(ch*(i+1)+bH(2)-1,ch*m1*m2)+1)=1;
%     TH(mod(rh*(i+1)+bH(2)-1,rh*m1*m2)+1,ch*(i)+bH(1))=1;
% end
% 
% 

for i=0:m1*m2-1
    i;
    TH(rh*i+bH(3),mod(ch*(i+m1)+bH(4)-1,ch*m1*m2)+1)=1;
    TH(mod(ch*(i+m1)+bH(4)-1,ch*m1*m2)+1,ch*(i)+bH(3))=1;
    % TH(rh*i+bH(3),mod(ch*((i+1)+m)+bH(4),ch*m^2))=1;
    % TH(mod(rh*((i+1)+m)+bH(4),rh*m^2),ch*(i)+bH(3))=1;
end
size(TH)


