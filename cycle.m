

function [C] = cycle(N)
%adjacency matrix of N-cycle

% JDL 051221

C=zeros(N);
for row=1:N
    if row<N
    C(row,row+1)=1;
    end
    if row>1
        C(row,row-1)=1;
    end
    C(1,N)=1;
    C(N,1)=1;
end
end

