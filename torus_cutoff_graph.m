function [KH] = torus_cutoff_graph(k1,k2,m1,m2,H)

%% companion to torus_replacement_graph. 
%%
%% 
%% Output: diagonal matrix with k1-identity blocks of size |H|m_1 in first k2 blocks 
%% Inputs: m1,m2: torus dimensions
%%         H: NxN block graph, only its size is used here




[rh,ch]=size(H);
KH=zeros(rh*m1*m2);
for k=0:k2-1
    KH=submatrix_add(KH,eye(k1*rh),k*m1*rh+1,k*m1*ch+1);
end

% 
% CH=cycle_replacement_graph(m1,H,bH(1),bH(2)); % size [m1*rhm1*ch]
% [rch,cch]=size(CH);
% 
% TH=zeros(rch*m2,cch*m2); % should be same as [rh*m1*m2,ch*m1*m2]
% for j=0:m2-1 % add CH in blocks along the  diagonal
%     TH=submatrix_add(TH,CH,j*rch+1,j*cch+1);
% end
% r=sum(CH(1,:));
% 
% 
% % for j=0:m^2-1
% %     TH=submatrix_add(TH,H,j*rh+1,j*ch+1);
% % end
% %r=sum(T(1,:));
% 
% % if length(bH)~=r
% %  	disp(['Warning: number of boundary vertices must equal',num2str(r)]);
% % end
% 
% 
% % for i=0:m1*m2-1
% %     TH(rh*i+bH(1),mod(ch*(i+1)+bH(2)-1,ch*m1*m2)+1)=1;
% %     TH(mod(rh*(i+1)+bH(2)-1,rh*m1*m2)+1,ch*(i)+bH(1))=1;
% % end
% % 
% % 
% 
% for i=0:m1*m2-1
%     i;
%     TH(rh*i+bH(3),mod(ch*(i+m1)+bH(4)-1,ch*m1*m2)+1)=1;
%     TH(mod(ch*(i+m1)+bH(4)-1,ch*m1*m2)+1,ch*(i)+bH(3))=1;
%     % TH(rh*i+bH(3),mod(ch*((i+1)+m)+bH(4),ch*m^2))=1;
%     % TH(mod(rh*((i+1)+m)+bH(4),rh*m^2),ch*(i)+bH(3))=1;
% end
% size(TH)
% 
% 
