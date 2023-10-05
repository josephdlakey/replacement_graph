function [L] = adjacencylaplace(A)
%c computes Laplacian matrix given adjacency matrix.
% the adjacency matrix is assumed to be symmetric and have zeroes along the
% diagonal. Otherwise will not provide a valid Lplace matrix

d=sum(A,2);     % column sum
D=diag(d);
L=D-A;
