function [W_type,id]=K_means_func(data,data_cell,correlation,numsyn)
if numsyn==0
    syn=min_finder(data_cell);
    syn1=length(data_cell);
    m=1;
    while m==1
        [idx,c]=kmeans(data,syn,'Distance','sqeuclidean','MaxIter',10000,'Replicates',10000,'Display','off');
        z=1;
        for i=1:length(data_cell)
            for j=1:size(data_cell{1,i},2)
                idx_cell{i}(j)=idx(z);
                z=z+1;
            end
        end
        % to check if correlation of each W with it's corresponding c is more than 0.623
        for i=1:length(idx_cell)
            for j=1:size(idx_cell{1,i},1) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                cor=corrcoef(data_cell{1,i}(:,j),c(idx_cell{1,i}(j),:));
                if cor(1,2)<correlation
                    idx_cell{1,i}(j)=0;
                end
            end
        end
        % to omit k which is similar to i
        for w=1:syn
            for i=1:length(data_cell)
                t=find(idx_cell{1,i}==w);
                t2=t;
                if length(t)>1
                    for ws=1:length(t)
                        clear corcoef
                        cor=corrcoef(data_cell{1,i}(:,t(ws)),c(idx_cell{1,i}(t(ws)),:)');
                        corcoef(ws)=cor(1,2);
                    end
                    maximum=max(corcoef);
                    t1=find(corcoef==maximum);
                    t2(t1)=[];
                    for k=1:length(t2)
                        idx_cell{1,i}(t2(k))=0;
                    end
                    
                end
            end
        end
        %           to omit 0 values
        idx_cell2=idx_cell;
        for i=1:length(data_cell)
            t=find(idx_cell{1,i}==0);
            idx_cell2{1,i}(t)=[];
            
            for k=1:syn
                s1=[];
                for i=1:length(data_cell)
                    for j=1:size(idx_cell{1,i},2)
                        if idx_cell{1,i}(j)==k
                            s1=[s1,data_cell{1,i}(:,j)];
                        end
                    end
                end
                W_type_2{1,k}=s1;
            end
        end
        if min_finder(W_type_2)<0.5*syn1
            m=0;
            id=idx_cell;
            W_type=W_type_2;
        else
            syn=syn+1;
            
        end
    end
    
elseif numsyn==1
    syn=numsyn;
    [idx,c]=kmeans(data,syn,'Distance','sqeuclidean','MaxIter',10000,'Replicates',2000,'Display','off');
    z=1;
    for i=1:length(data_cell)
        for j=1:size(data_cell{1,i},2)
            idx_cell{i}(j)=idx(z);
            z=z+1;
        end
    end
    % to check if correlation of each W with it's corresponding c is more than 0.623
    for i=1:length(idx_cell)
        for j=1:size(idx_cell{1,i},1)
            cor=corrcoef(data_cell{1,i}(:,j),c(idx_cell{1,i}(j),:));
            if cor(1,2)<correlation
                idx_cell{1,i}(j)=0;
            end
        end
    end
%     % to omit k which is similar to i
%     for w=1:numsyn
%         for i=1:length(data_cell)
%             t=find(idx_cell{1,i}==w);
%             t2=t;
%             if length(t)>1
%                 for ws=1:length(t)
%                     clear corcoef
%                     cor=corrcoef(data_cell{1,i}(:,t(ws)),c(idx_cell{1,i}(t(ws)),:)');
%                     corcoef(ws)=cor(1,2);
%                 end
%                 maximum=max(corcoef);
%                 t1=find(corcoef==maximum);
%                 t2(t1)=[];
%                 for k=1:length(t2)
%                     idx_cell{1,i}(t2(k))=0;
%                 end
%                 
%             end
%         end
%     end
    % mean
    for k=1:numsyn
        s1=[];
        for i=1:length(data_cell)
            for j=1:size(idx_cell{1,i},2)
                if idx_cell{1,i}(j)==k
                    s1=[s1,data_cell{1,i}(:,j)];
                end
            end
        end
        W_type{1,k}=s1;
    end
    id=idx_cell;
    
else
    syn=numsyn;
    [idx,c]=kmeans(data,syn,'Distance','sqeuclidean','MaxIter',10000,'Replicates',2000,'Display','off');
    z=1;
    for i=1:length(data_cell)
        for j=1:size(data_cell{1,i},2)
            idx_cell{i}(j)=idx(z);
            z=z+1;
        end
    end
    % to check if correlation of each W with it's corresponding c is more than 0.623
    for i=1:length(idx_cell)
        for j=1:size(idx_cell{1,i},1)  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            cor=corrcoef(data_cell{1,i}(:,j),c(idx_cell{1,i}(j),:));
            if cor(1,2)<correlation
                idx_cell{1,i}(j)=0;
            end
        end
    end
    % to omit k which is similar to i
    for w=1:numsyn
        for i=1:length(data_cell)
            t=find(idx_cell{1,i}==w);
            t2=t;
            if length(t)>1
                for ws=1:length(t)
                    clear corcoef
                    cor=corrcoef(data_cell{1,i}(:,t(ws)),c(idx_cell{1,i}(t(ws)),:)');
                    corcoef(ws)=cor(1,2);
                end
                maximum=max(corcoef);
                t1=find(corcoef==maximum);
                t2(t1)=[];
                for k=1:length(t2)
                    idx_cell{1,i}(t2(k))=0;
                end
                
            end
        end
    end
    % mean
    for k=1:numsyn
        s1=[];
        for i=1:length(data_cell)
            for j=1:size(idx_cell{1,i},2)
                if idx_cell{1,i}(j)==k
                    s1=[s1,data_cell{1,i}(:,j)];
                end
            end
        end
        W_type{1,k}=s1;
    end
    id=idx_cell;
end