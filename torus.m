function T = torus(m)
%
% JDL 0823
%% Adjacency map of two-torus on Z_m
%% Structure so that if i=l1+ml2 then T(i,j)=1 if either j=i\pm 1 mod m
%% or if j= i\pm m mod m^2
%% warning: need to be careful about endpoints, eg when passing from l1=m-1 to m

T=zeros(m^2);
for i=1:m
    T=submatrix_add(T,cycle(m),(i-1)*m+1,(i-1)*m+1);
end
for i=1:m^2-m
    T(i,i+m)=1;
end
for i=m+1:m^2
    T(i,i-m)=1;
end
for i=1:m
    T(i,m^2-m+i)=1;
    T(m^2-m+i,i)=1;
end


