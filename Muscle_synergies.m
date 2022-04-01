clc;clear;close all;

% Load dataset
load('DataSet.mat')

syn=6;
for k=1:6
    % Obtain EMG data of all the tasks in the dataset
    EMG = DataSet(k).EMG;
    
    % Obtain name of the tasks
    tasks = fieldnames(EMG);
    
    % Loop for each task
    for j = 1:size(tasks, 1)
        for t = length(EMG.(tasks{j})):-1:1
            data = EMG.(tasks{j})(t).Normal;
            data2 = EMG.(tasks{j})(t).Resample;
            for s=1:syn % s is number of Synergies (Reduced Data)
                clear W1 W S1 S
                [W0,S0]=nnmf(data,s,'algorithm','mult');
                [W1,S1]=nnmf(data,s,'w0',W0,'h0',S0,'replicate',500,'algorithm','als');
                W1_max=max(W1,[],1);
                S1_max=max(S1,[],2);

                E=W1*S1;

                E1=E .* EMG.(tasks{j})(t).vars;
                for ws=1:size(W1,2)
                    W(:,ws)=W1(:,ws)/W1_max(ws);
                end
                for ws=1:size(S1,1)
                    S(ws,:)=S1(ws,:)/S1_max(ws);
                end
                [VAF,i]=VAF_recognition(data2,W1,S1,E1);
                if i==1
                    DataSet(k).EMG.(tasks{j})(t).Weight=S';
                    DataSet(k).EMG.(tasks{j})(t).Profile=W';
                    DataSet(k).EMG.(tasks{j})(t).VAF_global=VAF;
                    break;
                end
            end
        end
    end
end

save('DataSet.mat','DataSet')