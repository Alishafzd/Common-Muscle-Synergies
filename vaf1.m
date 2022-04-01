function out = vaf1(M_rec, M, dim)

m=size(M_rec,1);
n=size(M_rec,2);
E = M - M_rec;
if dim==1
%     out = zeros(1,n);
    delta_norm = cell2mat(arrayfun(@(i) norm(E(:, i), 'fro'),...
        1:size(E, 2), 'uni', 0));
    M_norm = cell2mat(arrayfun(@(i) norm(M(:, i), 'fro'),...
        1:size(M, 2), 'uni', 0));
    
    out = 1 - delta_norm ./ M_norm;
%     for i =1:m
%         out(i,1) = 1-(norm(M_rec(i,:)-M(i,:),'fro')/norm(M(i,:),'fro'))^2;
%     end
  
elseif dim==2
    out = 1-(norm(M_rec - M,'fro')/norm(M,'fro'))^2;
    
elseif dim==3
    L = n;
    for i=1:n
        L = L - rms(E(:,i))/rms(M(:,i));
    end
    L = L/n;
    out = L;
    
else
    
end
end