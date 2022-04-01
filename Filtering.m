clc;
clear;
load('DataSet.mat')

for k=1:6
    % Obtain EMG data of all the tasks in the dataset
    EMG = DataSet(k).EMG;
    
    % Obtain name of the tasks
    tasks = fieldnames(EMG);
    
    % Loop for each task
    for j = 1:size(tasks, 1)
        for t = length(EMG.(tasks{j})):-1:1
            DataSet(k).EMG.(tasks{j})(t).Filter = Filtering_func(EMG.(tasks{j})(t).Raw, 40, 4, 1);
        end
    end
end

save('DataSet.mat','DataSet');