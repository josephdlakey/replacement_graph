 function [CH] = cycle_replacement_graph(m,H,bd1,bd2)

%%WARNING: Prior to 082923 I had the roles of bd1 and bd2 mixed up in the
%%local adjacencies. This meant I was gluing the first element of the ith
%%copy of H to the last element of the i+1th copy of H instead of last to
%%first.
%
% It may be that first-first and last-last makes mores sense from a strict
% "replacement" perspective.
%
% Inputs
% m: length of replacement cycle
% H: square adjacency matrix
% bd1,bd2: boundary indices for joining conjecutive copies of H
%% 
%% compare to replacement_graph. 
%% this is specifically for the case S is a cycle C
%% we do a submatrix add to create blocks along the diagonal, we join the last
%% vertex of each block to the first vertex of the next, and we join the last vertex of the last block to the first 
%% vertex of the first


[rh,ch]=size(H);
CH=zeros(rh*m,ch*m);

if nargin < 3    % indices of boundary vertice
    bd1=rh;
    bd2=1;
end

 
for j=0:m-1 % add H in blocks along the  diagonal
    CH=submatrix_add(CH,H,j*rh+1,j*ch+1);
end
r=sum(CH(1,:));

for j=0:m-2  % add adjacencies of consecutive blocks (last vertex to first vertex)
    % CH(j*rh+bd1,(j+1)*ch+bd2)=1;
    % CH((j+1)*ch+bd2,j*rh+bd1)=1;
    CH(j*rh+bd2,(j+1)*ch+bd1)=1;
    CH((j+1)*ch+bd1,j*rh+bd2)=1;
end

CH((m-1)*rh+bd2,bd1)=1;
CH(bd1,(m-1)*rh+bd2)=1;   % adjacency of last term of 

size(CH)


