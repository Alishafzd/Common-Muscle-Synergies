clc;
clear;

EMG_file = 'EMG data';

subjects = {'1L', '2L', '3R', '5R', '7L', '8L'};
for i = 6:-1:1
    DataSet(i).Name = ['K' char(subjects(i))];
end

files = dir(fullfile(EMG_file,'*.csv'));

for i = 1:length(files)

    file = files(i).name;
    file_split = split(file, '_');
    subject = char(file_split(1));
    tf = ismember({DataSet.Name}, subject);
    index = find(tf);

    task = file_split(2:end-3);
    task = strjoin(task, '_');
    
    switch task
        case 'Gait'
            task = 'LevelWalking';
        case 'DHW'
            task = 'DownHillWalking';
        case 'SD'
            task = 'StairDescent';
    end
    

    DataSet(index).EMG.(task) = [];
end

for i = 1:length(files)

    file = files(i).name;
    file_split = split(file, '_');
    subject = char(file_split(1));
    tf = ismember({DataSet.Name}, subject);
    index = find(tf);

    task = file_split(2:end-3);
    task = strjoin(task, '_');

    switch task
        case 'Gait'
            task = 'LevelWalking';
        case 'DHW'
            task = 'DownHillWalking';
        case 'SD'
            task = 'StairDescent';
    end
    
    table = readtable([EMG_file,'/', file]);
    table = removevars(table, {'time'});
    
    leg = subject(3);
    if leg == 'L'
        I = 1:8;
    else
        I = 9:16;
    end

    data = struct('Raw', table2array(table(:, I)));
    DataSet(index).EMG.(task) = cat(1, DataSet(index).EMG.(task), data);
end

save('DataSet.mat', 'DataSet')
