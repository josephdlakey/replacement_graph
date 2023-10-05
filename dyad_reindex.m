function [binsort,dec] = dyad_reindex(N)
%reindex numbers 1:2^N according to the lexicographic ordering
% of their binary expansions
% JDL 6/30/17
bin=[];
for i=1:2^N
    b=de2bi(i-1,N);
    b=cat(2,b,sum(b));
    bin=cat(1,bin,b);
end
%binsum=bin(:,N+1);
[~,ix]=sort(bin(:,N+1));
binsort=zeros(2^N,N);
for i=1:2^N
    binsort(i,:)=bin(ix(i),1:N);
end
dec=zeros(1,2^N);
for i=1:2^N
dec(i)=bi2de(binsort(i,:));
end
dec=dec+1;
% [binsort1,ix]=sort(bin,N+1);
% bin=binsort1(:,1:N);


% copute indices first
% next sort indices
% next 
% temp=[];
% for i=1:2^N
%     t=de2bi(i-1,N);
%     if sum(t)==K
%         temp=cat(1,temp,t);
%     end
% end
% T=temp;


