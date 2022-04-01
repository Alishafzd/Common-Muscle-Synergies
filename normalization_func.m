function   EMG_norm_Mat = normalization_func(EMG_filt_Mat)

n = size(EMG_filt_Mat,2);    % number of Rows

for i = n:-1:1
    
    % 1)Raw data
    temp1(:,i)= EMG_filt_Mat(:,i);

    % 3)Divide by variance
    varian=std(temp1(:,i));
    if varian==0
        temp2(:,i)=zeros(1,length(temp1));
    else
        temp2(:,i) = temp1(:,i)/varian;
    end
    

end

% Finally
EMG_norm_Mat = temp2;


