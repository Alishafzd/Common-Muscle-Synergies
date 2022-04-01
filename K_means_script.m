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
    
    [W_type,idx]=K_means_func(Weights',Weights_cell',0.576,0);
    
    for i=1:size(W_type,2)
        W_mean.(tasks{task})(:,i)=(mean(W_type{1, i},2));
        W_std.(tasks{task})(:,i)=std(W_type{1, i},0,2);
    end
    
    clusters = size(W_type, 2);
    for c = clusters:-1:1
        P_temp = [];
        for i = size(Profiles_cell, 1):-1:1
            P_temp = [P_temp; Profiles_cell{i}(idx{i} == c, :)];
        end
        P_mean.(tasks{task})(c, :) = mean(P_temp, 1);
    end

end

size(Weights_cell)
size(Weights)

%% Apply K-means to Cluster Tasks

Weights=[];
Profiles=[];
Weights_cell={};
Profiles_cell={};

% Gather the synergies of all the tasks
for task = length(tasks):-1:1
    
    Weights_cell{task} = W_mean.(tasks{task});
    Weights = [Weights, W_mean.(tasks{task})];
    
    Profiles_cell{task} = P_mean.(tasks{task});
    Profiles = [Profiles; P_mean.(tasks{task})];

end

size(Weights_cell)
size(Weights)

syn = 7;
[W_type,idx]=K_means_func(Weights',Weights_cell,0.6,syn);

for i=1:size(W_type,2)
    W_mean.(tasks{task})(:,i)=(mean(W_type{1, i},2));
    W_std.(tasks{task})(:,i)=std(W_type{1, i},0,2);
end


%% plots 
% 
% figure
% for i=1:5
%     subplot(1,5,i)
%     bar(W_mean_lw(:,i))
% end
% 
% figure
% for i=1:2
%     subplot(1,4,i)
%     bar(W_mean_sq(:,i))
% end
% 
% figure
% for i=1:5
%     subplot(1,5,i)
%     bar(W_mean_DHW(:,i))
% end
% 
% figure
% for i=1:5
%     subplot(1,5,i)
%     bar(W_mean_SD(:,i))
% end
% %% for all
% W_mean_all=[W_mean_lw';W_mean_sq';W_mean_DHW';W_mean_SD'];
% W_mean_all_cell={W_mean_lw,W_mean_sq,W_mean_DHW,W_mean_SD};
% 
% W_std_all=[W_std_lw';W_std_sq';W_std_DHW';W_std_SD'];
% W_std_all_cell={W_std_lw,W_std_sq,W_std_DHW,W_std_SD};
% 
% synergy=7;
% 
% [W_type_all,id_all]=K_means_func(W_mean_all,W_mean_all_cell,0.623,0);
% %%
% % figure
% % i=1;
% % for j=1:length(id_all{1,i})
% %     if id_all{1,i}(j)==1
% %         subplot(4,synergy+1,1)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %     
% %     if id_all{1,i}(j)==2
% %         subplot(4,synergy+1,2)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %     
% %     if id_all{1,i}(j)==3
% %         subplot(4,synergy+1,3)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %     
% %     if id_all{1,i}(j)==4
% %         subplot(4,synergy+1,4)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %     
% %     if id_all{1,i}(j)==5
% %         subplot(4,synergy+1,5)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %     
% %     if id_all{1,i}(j)==6
% %         subplot(4,synergy+1,6)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %         
% %     if id_all{1,i}(j)==7
% %         subplot(4,synergy+1,7)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %         
% % %     if id_all{1,i}(j)==8
% % %         subplot(4,synergy+1,8)
% % %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% % %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% % %         
% % %         hold on
% % %         
% % %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% % %         er.Color = [0 0 0];
% % %         er.LineStyle = 'none';
% % %     end
% % %             
% % %     if id_all{1,i}(j)==9
% % %         subplot(4,synergy+1,9)
% % %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% % %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% % %         
% % %         hold on
% % %         
% % %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% % %         er.Color = [0 0 0];
% % %         er.LineStyle = 'none';
% % %     end
% % %                 
% % %     if id_all{1,i}(j)==10
% % %         subplot(4,synergy+1,10)
% % %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% % %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% % %         
% % %         hold on
% % %         
% % %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% % %         er.Color = [0 0 0];
% % %         er.LineStyle = 'none';
% % %     end
% % %                 
% %     if id_all{1,i}(j)==0
% %         subplot(4,synergy+1,8)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% % end
% % 
% % 
% % i=2;
% % for j=1:length(id_all{1,i})
% %     if id_all{1,i}(j)==1
% %         subplot(4,synergy+1,9)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %     
% %     if id_all{1,i}(j)==2
% %         subplot(4,synergy+1,10)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %     
% %     if id_all{1,i}(j)==3
% %         subplot(4,synergy+1,11)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %     
% %     if id_all{1,i}(j)==4
% %         subplot(4,synergy+1,12)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %     
% %     if id_all{1,i}(j)==5
% %         subplot(4,synergy+1,13)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %     
% %     if id_all{1,i}(j)==6
% %         subplot(4,synergy+1,14)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %         
% %     if id_all{1,i}(j)==7
% %         subplot(4,synergy+1,15)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %         
% % %     if id_all{1,i}(j)==8
% % %         subplot(4,synergy+1,17)
% % %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% % %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% % %         
% % %         hold on
% % %         
% % %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% % %         er.Color = [0 0 0];
% % %         er.LineStyle = 'none';
% % %     end
% % %             
% % %     if id_all{1,i}(j)==9
% % %         subplot(4,synergy+1,19)
% % %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% % %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% % %         
% % %         hold on
% % %         
% % %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% % %         er.Color = [0 0 0];
% % %         er.LineStyle = 'none';
% % %     end
% % %                 
% % %     if id_all{1,i}(j)==10
% % %         subplot(4,synergy+1,21)
% % %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% % %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% % %         
% % %         hold on
% % %         
% % %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% % %         er.Color = [0 0 0];
% % %         er.LineStyle = 'none';
% % %     end
% % %                 
% %     if id_all{1,i}(j)==0
% %         subplot(4,synergy+1,16)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% % end
% % 
% % 
% % i=3;
% % for j=1:length(id_all{1,i})
% %     if id_all{1,i}(j)==1
% %         subplot(4,synergy+1,17)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %     
% %     if id_all{1,i}(j)==2
% %         subplot(4,synergy+1,18)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %     
% %     if id_all{1,i}(j)==3
% %         subplot(4,synergy+1,19)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %     
% %     if id_all{1,i}(j)==4
% %         subplot(4,synergy+1,20)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %     
% %     if id_all{1,i}(j)==5
% %         subplot(4,synergy+1,21)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %     
% %     if id_all{1,i}(j)==6
% %         subplot(4,synergy+1,22)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %         
% %     if id_all{1,i}(j)==7
% %         subplot(4,synergy+1,23)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %         
% % %     if id_all{1,i}(j)==8
% % %         subplot(4,synergy+1,26)
% % %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% % %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% % %         
% % %         hold on
% % %         
% % %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% % %         er.Color = [0 0 0];
% % %         er.LineStyle = 'none';
% % %     end
% % %             
% % %     if id_all{1,i}(j)==9
% % %         subplot(4,synergy+1,29)
% % %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% % %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% % %         
% % %         hold on
% % %         
% % %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% % %         er.Color = [0 0 0];
% % %         er.LineStyle = 'none';
% % %     end
% % %                 
% % %     if id_all{1,i}(j)==10
% % %         subplot(4,synergy+1,32)
% % %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% % %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% % %         
% % %         hold on
% % %         
% % %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% % %         er.Color = [0 0 0];
% % %         er.LineStyle = 'none';
% % %     end
% % %                 
% %     if id_all{1,i}(j)==0
% %         subplot(4,synergy+1,24)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %     
% % end
% % 
% % i=4;
% % for j=1:length(id_all{1,i})
% %     if id_all{1,i}(j)==1
% %         subplot(4,synergy+1,25)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %     
% %     if id_all{1,i}(j)==2
% %         subplot(4,synergy+1,26)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %     
% %     if id_all{1,i}(j)==3
% %         subplot(4,synergy+1,27)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %     
% %     if id_all{1,i}(j)==4
% %         subplot(4,synergy+1,28)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %     
% %     if id_all{1,i}(j)==5
% %         subplot(4,synergy+1,29)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %     
% %     if id_all{1,i}(j)==6
% %         subplot(4,synergy+1,30)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %         
% %     if id_all{1,i}(j)==7
% %         subplot(4,synergy+1,31)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
%         
% %     if id_all{1,i}(j)==8
% %         subplot(4,synergy+1,36)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %             
% %     if id_all{1,i}(j)==9
% %         subplot(4,synergy+1,39)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %                 
% %     if id_all{1,i}(j)==10
% %         subplot(4,synergy+1,43)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% %                 
% %     if id_all{1,i}(j)==0
% %         subplot(4,synergy+1,32)
% %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
% %         bar(1:16,W_mean_all_cell{1,i}(:,j))
% %         
% %         hold on
% %         
% %         er = errorbar(1:16,W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j));
% %         er.Color = [0 0 0];
% %         er.LineStyle = 'none';
% %     end
% % end
% 
% % figure
% 
% % subplot(4,1,1)
% % errorbar(W_mean_all_cell{1,1}(:,1),W_std_all_cell{1,1}(:,1))
% % bar(1:16,W_mean_all_cell{1,1}(:,1))
% % 
% % hold on
% % 
% % er = errorbar(1:16,W_mean_all_cell{1,1}(:,1),W_std_all_cell{1,1}(:,1),W_std_all_cell{1,1}(:,1));
% % er.Color = [0 0 0];
% % er.LineStyle = 'none';
% % 
% % subplot(4,1,2)
% % errorbar(W_mean_all_cell{1,1}(:,2),W_std_all_cell{1,1}(:,2))
% % bar(1:16,W_mean_all_cell{1,1}(:,2))
% % 
% % hold on
% % 
% % er = errorbar(1:16,W_mean_all_cell{1,1}(:,2),W_std_all_cell{1,1}(:,2),W_std_all_cell{1,1}(:,2));
% % er.Color = [0 0 0];
% % er.LineStyle = 'none';
% % 
% % subplot(4,1,3)
% % errorbar(W_mean_all_cell{1,3}(:,2),W_std_all_cell{1,3}(:,2))
% % bar(1:16,W_mean_all_cell{1,3}(:,2))
% % 
% % hold on
% % 
% % er = errorbar(1:16,W_mean_all_cell{1,3}(:,2),W_std_all_cell{1,3}(:,2),W_std_all_cell{1,3}(:,2));
% % er.Color = [0 0 0];
% % er.LineStyle = 'none';
% % 
% % subplot(4,1,4)
% % errorbar(W_mean_all_cell{1,2}(:,2),W_std_all_cell{1,2}(:,2))
% % bar(1:16,W_mean_all_cell{1,2}(:,2))
% % 
% % hold on
% % 
% % er = errorbar(1:16,W_mean_all_cell{1,2}(:,2),W_std_all_cell{1,2}(:,2),W_std_all_cell{1,2}(:,2));
% % er.Color = [0 0 0];
% % er.LineStyle = 'none';
% % 
% % subplot(4,1,5)
% % errorbar(W_mean_all_cell{1,2}(:,5),W_std_all_cell{1,2}(:,5))
% % bar(1:16,W_mean_all_cell{1,2}(:,5))
% % 
% % hold on
% % 
% % er = errorbar(1:16,W_mean_all_cell{1,2}(:,5),W_std_all_cell{1,2}(:,5),W_std_all_cell{1,2}(:,5));
% % er.Color = [0 0 0];
% % er.LineStyle = 'none';
% % 
% % subplot(4,1,6)
% % errorbar(W_mean_all_cell{1,2}(:,8),W_std_all_cell{1,2}(:,8))
% % bar(1:16,W_mean_all_cell{1,2}(:,8))
% % 
% % hold on
% % 
% % er = errorbar(1:16,W_mean_all_cell{1,2}(:,8),W_std_all_cell{1,2}(:,8),W_std_all_cell{1,2}(:,8));
% % er.Color = [0 0 0];
% % er.LineStyle = 'none';
% % 
% % subplot(4,1,7)
% % errorbar(W_mean_all_cell{1,3}(:,1),W_std_all_cell{1,3}(:,1))
% % bar(1:16,W_mean_all_cell{1,3}(:,1))
% % 
% % hold on
% % 
% % er = errorbar(1:16,W_mean_all_cell{1,3}(:,1),W_std_all_cell{1,3}(:,1),W_std_all_cell{1,3}(:,1));
% % er.Color = [0 0 0];
% % er.LineStyle = 'none';
% % 
% % subplot(4,1,10)
% % errorbar(W_mean_all_cell{1,4}(:,2),W_std_all_cell{1,4}(:,2))
% % bar(1:16,W_mean_all_cell{1,4}(:,2))
% % 
% % hold on
% % 
% % er = errorbar(1:16,W_mean_all_cell{1,4}(:,2),W_std_all_cell{1,4}(:,2),W_std_all_cell{1,4}(:,2));
% % er.Color = [0 0 0];
% % er.LineStyle = 'none';
% 
% % subplot(4,1,13)
% % errorbar(W_mean_all_cell{1,4}(:,4),W_std_all_cell{1,4}(:,4))
% % bar(1:16,W_mean_all_cell{1,4}(:,4))
% % 
% % hold on
% % 
% % er = errorbar(1:16,W_mean_all_cell{1,4}(:,4),W_std_all_cell{1,4}(:,4),W_std_all_cell{1,4}(:,4));
% % er.Color = [0 0 0];
% % er.LineStyle = 'none';
% % 
% % subplot(4,1,14)
% % errorbar(W_mean_all_cell{1,4}(:,6),W_std_all_cell{1,4}(:,6))
% % bar(1:16,W_mean_all_cell{1,4}(:,6))
% % 
% % hold on
% % 
% % er = errorbar(1:16,W_mean_all_cell{1,4}(:,6),W_std_all_cell{1,4}(:,6),W_std_all_cell{1,4}(:,6));
% % er.Color = [0 0 0];
% % er.LineStyle = 'none';
% 
