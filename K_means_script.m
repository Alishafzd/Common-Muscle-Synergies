clc;clear;
load('DataSet.mat');

%% Apply K-means to Calculate Average Values of Tasks and Cluster Results

% Find all tasks
tasks = fieldnames(DataSet(1).EMG);

W_mean = struct();
W_std = struct();

% Apply the algorithm for each task
for task = length(tasks):-1:1
    % Predefined values for every task
    Weights=[];
    Profiles=[];
    Weights_cell=[];
    Profiles_cell=[];
    
    % First we should find the mean value of Weigts and Profiles for the
    % task
    for k = 6:-1:1
        % Convert structure of the task to cell arrays for speed 
        temp = struct2cell(DataSet(k).EMG.(tasks{task}));
        
        % Find the index of the Weight and Profile fields
        data_fields = fieldnames(DataSet(k).EMG.(tasks{task}));
        index_W = find(strcmp(data_fields, 'Weight'));
        index_P = find(strcmp(data_fields, 'Profile'));
        
        % Create cell arrays of Weights and Profiles
        cell_temp_W = temp(index_W, :)';
        cell_temp_P = temp(index_P, :)';
        
        % Create matrix of Weights and Pforiles
        mat_temp_W = cat(2, cell_temp_W{:});
        mat_temp_P = cat(1, cell_temp_P{:});
        
        % Concatenate the results
        Weights = [Weights, mat_temp_W];
        Weights_cell = vertcat(Weights_cell, cell_temp_W);
        Profiles = [Profiles; mat_temp_P];
        Profiles_cell = vertcat(Profiles_cell, cell_temp_P);
    end
    syns = cellfun(@(x) size(x, 2), Weights_cell);
    syn = mode(syns);
    
    [W_type,idx]=K_means_func(Weights',Weights_cell',0.576,syn);
    
    for i=1:size(W_type,2)
        W_mean.(tasks{task})(:,i)=(mean(W_type{1, i},2));
        W_std.(tasks{task})(:,i)=std(W_type{1, i},0,2);
        P_temp = [];
        for j = size(Profiles_cell, 1):-1:1
            P_temp = [P_temp; Profiles_cell{j}(idx{j} == i, :)];
        end
        P_mean.(tasks{task})(i, :) = mean(P_temp, 1);
    end
    
end


%% Apply K-means to Cluster Tasks

Weights=[];
Profiles=[];
Weights_cell={};
Profiles_cell={};

% Gather the synergies of all the tasks
for task = 1:length(tasks)
    
    Weights_cell{task} = W_mean.(tasks{task});
    Weights = [Weights, W_mean.(tasks{task})];
    
    Profiles_cell{task} = P_mean.(tasks{task});
    Profiles = [Profiles; P_mean.(tasks{task})];

end

% Cluster all the tasks
syn = 7;
[W_type,idx]=K_means_func(Weights',Weights_cell,0.576,syn);

% Calculate mean values of each cluster
for i=1:size(W_type,2)
    W_mean.(tasks{task})(:,i)=(mean(W_type{1, i},2));
    W_std.(tasks{task})(:,i)=std(W_type{1, i},0,2);
end


%% Plots 

% Define colors of each task and muscles order
colors = ['r', 'k', 'b', 'g', 'g', 'm', 'm'];
muscles = {'RF'; 'VM'; 'VL'; 'TA'; 'HM'; 'HL'; 'GM'; 'GL';};

figure();
for task = 1:length(Weights_cell)
    % Insert name of the tasks and sub-clusters
    x = 0.01;
    y = (1 - 2.2773/15)*(7 - task)/7 + 1/13.17;
    dim = [x y 0.1 0.1];
    annotation('textbox',dim,'String',strrep(tasks{task}, '_', ''),...
        'FitBoxToText', 'on', 'HorizontalAlignment', 'center');
    
    for id = 1:length(idx{task})        
        % Plot synergies of each task
        k = (task - 1) * syn + idx{task}(id);
        subplot(length(Weights_cell), syn, k);
        
        % Plot error bars first
        er = errorbar(1:8, Weights_cell{task}(:, id),...
            W_std.(tasks{task})(:, id));   
        er.Color = [0 0 0];  
        er.LineStyle = 'none';  
        
        hold on
        bar_k = bar(Weights_cell{task}(:, id));
        
        ylim([0 1]);
        
        % Add Colors and TickLabels for each bar graph
        set(bar_k, 'FaceColor', colors(task))
        set(gca, 'XTickLabel', muscles, 'fontsize',7)
        xtickangle(90)
        
        hold off
    end
end
