function [Anew] = submatrix_add(A,B,k,l);
% Add matrix B at the k,l entry of A
% B must satisfy k+size(B,1)<= size(A,1) and l+size(B,2)<= size(A,2)
[ra,ca]=size(A);
[rb,cb]=size(B);
if rb+k>ra
    disp('Warning: insertion row plus number of input rows exceeds number of output rows');
elseif cb+l>ca
    disp('Warning: insertion column plus number of input columns exceeds number of output columns');
end
Anew=A;
Anew(k:k+rb-1,l:l+cb-1)=Anew(k:k+rb-1,l:l+cb-1)+B;

