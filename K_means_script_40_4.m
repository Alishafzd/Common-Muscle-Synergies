clc;clear;close all;
load('DataSet.mat');
%% LevelWalking
% W Extractions
Weights_lw=[];
Profiles_lw=[];
Weights_cell_lw=[];
Profiles_cell_lw=[];
z=1;
for k=1:6
    for i=1:length(DataSet(k).EMG.LevelWalking.Syn_fil_40_4_fixed_4.Right)
        Weight=DataSet(k).EMG.LevelWalking.Syn_fil_40_4_fixed_4.Right(i).Weight;
        Profile=DataSet(k).EMG.LevelWalking.Syn_fil_40_4_fixed_4.Right(i).Profile;
        Weights_lw=[Weights_lw,Weight];
        Profiles_lw=[Profiles_lw,Profile'];
        Weights_cell_lw{z}=Weight;
        Profiles_cell_lw{z}=Profile';
        z=z+1;
    end
    for i=1:length(DataSet(k).EMG.LevelWalking.Syn_fil_40_4_fixed_4.Left)
        Weight=DataSet(k).EMG.LevelWalking.Syn_fil_40_4_fixed_4.Left(i).Weight;
        Profile=DataSet(k).EMG.LevelWalking.Syn_fil_40_4_fixed_4.Left(i).Profile;
        Weights_lw=[Weights_lw,Weight];
        Profiles_lw=[Profiles_lw,Profile'];
        Weights_cell_lw{z}=Weight;
        Profiles_cell_lw{z}=Profile';
        z=z+1;
    end
end
Weights_lw=Weights_lw';
Weights_copy_lw=Weights_lw;
[W_type_lw,id_lw]=K_means_func(Weights_lw,Weights_cell_lw,0.576,4);
for i=1:size(W_type_lw,2)
    W_mean_lw(:,i)=(mean(W_type_lw{1, i},2));
    W_std_lw(:,i)=std(W_type_lw{1, i},0,2);
end
k=0;
S1=[];
for i=1:length(id_lw)
    t=find(id_lw{1,i}==1);
    if t~=0
        S1=[S1,Profiles_cell_lw{1,i}(:,t)];
        k=k+1;
    end
end
S1_mean_lw=(mean(S1,2));
S1_std_lw=std(S1,0,2);
k=0;
S2=[];
for i=1:length(id_lw)
    t=find(id_lw{1,i}==2);
    if t~=0
        S2=[S2,Profiles_cell_lw{1,i}(:,t)];
        k=k+1;
    end
end
S2_mean_lw=(mean(S2,2));
S2_std_lw=std(S2,0,2);
k=0;
S3=[];
for i=1:length(id_lw)
    t=find(id_lw{1,i}==3);
    if t~=0
        S3=[S3,Profiles_cell_lw{1,i}(:,t)];
        k=k+1;
    end
end
S3_mean_lw=(mean(S3,2));
S3_std_lw=std(S3,0,2);
k=0;
S4=[];
for i=1:length(id_lw)
    t=find(id_lw{1,i}==4);
    if t~=0
        S4=[S4,Profiles_cell_lw{1,i}(:,t)];
        k=k+1;
    end
end
S4_mean_lw=(mean(S4,2));
S4_std_lw=std(S4,0,2);

S_type_lw={S1,S2,S3,S4};

S_mean_lw=[S1_mean_lw,S2_mean_lw,S3_mean_lw,S4_mean_lw];
S_std_lw=[S1_std_lw,S2_std_lw,S3_std_lw,S4_std_lw];
%% Squat_SU
% W Extractions
load('Squat.mat');
Weights_sq_SU=[];
Profiles_sq_SU=[];
Weights_cell_sq_SU=[];
Profiles_cell_sq_SU=[];
z=1;
for k=1:6
    for i=1:length(Squat(k).EMG.Squat.StandingUp.Syn_fil_40_4_fixed_3.Right)
        Weight=Squat(k).EMG.Squat.StandingUp.Syn_fil_40_4_fixed_3.Right(i).Weight;
        Profile=Squat(k).EMG.Squat.StandingUp.Syn_fil_40_4_fixed_3.Right(i).Profile;
        Weights_sq_SU=[Weights_sq_SU,Weight];
        Profiles_sq_SU=[Profiles_sq_SU,Profile'];
        Weights_cell_sq_SU{z}=Weight;
        Profiles_cell_sq_SU{z}=Profile';
        z=z+1;
    end
    for i=1:length(Squat(k).EMG.Squat.StandingUp.Syn_fil_40_4_fixed_3.Left)
        Weight=Squat(k).EMG.Squat.StandingUp.Syn_fil_40_4_fixed_3.Left(i).Weight;
        Profile=Squat(k).EMG.Squat.StandingUp.Syn_fil_40_4_fixed_3.Left(i).Profile;
        Weights_sq_SU=[Weights_sq_SU,Weight];
        Profiles_sq_SU=[Profiles_sq_SU,Profile'];
        Weights_cell_sq_SU{z}=Weight;
        Profiles_cell_sq_SU{z}=Profile';
        z=z+1;
    end
end
Weights_sq_SU=Weights_sq_SU';
Weights_copy_sq_SU=Weights_sq_SU;
[W_type_sq_SU,id_sq_SU]=K_means_func(Weights_sq_SU,Weights_cell_sq_SU,0.576,3);
for i=1:size(W_type_sq_SU,2)
    W_mean_sq_SU(:,i)=(mean(W_type_sq_SU{1, i},2));
    W_std_sq_SU(:,i)=std(W_type_sq_SU{1, i},0,2);
end
k=0;
S1=[];
for i=1:length(id_sq_SU)
    t=find(id_sq_SU{1,i}==1);
    if t~=0
        S1=[S1,Profiles_cell_sq_SU{1,i}(:,t)];
        k=k+1;
    end
end
S1_mean_sq_SU=(mean(S1,2));
S1_std_sq_SU=std(S1,0,2);
k=0;
S2=[];
for i=1:length(id_sq_SU)
    t=find(id_sq_SU{1,i}==2);
    if t~=0
        S2=[S2,Profiles_cell_sq_SU{1,i}(:,t)];
        k=k+1;
    end
end
S2_mean_sq_SU=(mean(S2,2));
S2_std_sq_SU=std(S2,0,2);

k=0;
S3=[];
for i=1:length(id_sq_SU)
    t=find(id_sq_SU{1,i}==3);
    if t~=0
        S3=[S3,Profiles_cell_sq_SU{1,i}(:,t)];
        k=k+1;
    end
end
S3_mean_sq_SU=(mean(S3,2));
S3_std_sq_SU=std(S3,0,2);

S_type_sq_SU={S1,S2,S3};
S_mean_sq_SU=[S1_mean_sq_SU,S2_mean_sq_SU,S3_mean_sq_SU];
S_std_sq_SU=[S1_std_sq_SU,S2_std_sq_SU,S3_std_sq_SU];

%% Squat_SD
% W Extractions
load('Squat.mat');
Weights_sq_SD=[];
Profiles_sq_SD=[];
Weights_cell_sq_SD=[];
Profiles_cell_sq_SD=[];
z=1;
for k=1:6
    for i=1:length(Squat(k).EMG.Squat.SittingDown.Syn_fil_40_4_fixed_2.Right)
        Weight=Squat(k).EMG.Squat.SittingDown.Syn_fil_40_4_fixed_2.Right(i).Weight;
        Profile=Squat(k).EMG.Squat.SittingDown.Syn_fil_40_4_fixed_2.Right(i).Profile;
        Weights_sq_SD=[Weights_sq_SD,Weight];
        Profiles_sq_SD=[Profiles_sq_SD,Profile'];
        Weights_cell_sq_SD{z}=Weight;
        Profiles_cell_sq_SD{z}=Profile';
        z=z+1;
    end
    for i=1:length(Squat(k).EMG.Squat.SittingDown.Syn_fil_40_4_fixed_2.Left)
        Weight=Squat(k).EMG.Squat.SittingDown.Syn_fil_40_4_fixed_2.Left(i).Weight;
        Profile=Squat(k).EMG.Squat.SittingDown.Syn_fil_40_4_fixed_2.Left(i).Profile;
        Weights_sq_SD=[Weights_sq_SD,Weight];
        Profiles_sq_SD=[Profiles_sq_SD,Profile'];
        Weights_cell_sq_SD{z}=Weight;
        Profiles_cell_sq_SD{z}=Profile';
        z=z+1;
    end
end
Weights_sq_SD=Weights_sq_SD';
Weights_copy_sq_SD=Weights_sq_SD;
[W_type_sq_SD,id_sq_SD]=K_means_func(Weights_sq_SD,Weights_cell_sq_SD,0.576,2);
for i=1:size(W_type_sq_SD,2)
    W_mean_sq_SD(:,i)=(mean(W_type_sq_SD{1, i},2));
    W_std_sq_SD(:,i)=std(W_type_sq_SD{1, i},0,2);
end
k=0;
S1=[];
for i=1:length(id_sq_SD)
    t=find(id_sq_SD{1,i}==1);
    if t~=0
        S1=[S1,Profiles_cell_sq_SD{1,i}(:,t)];
        k=k+1;
    end
end
S1_mean_sq_SD=(mean(S1,2));
S1_std_sq_SD=std(S1,0,2);
k=0;
S2=[];
for i=1:length(id_sq_SD)
    t=find(id_sq_SD{1,i}==2);
    if t~=0
        S2=[S2,Profiles_cell_sq_SD{1,i}(:,t)];
        k=k+1;
    end
end
S2_mean_sq_SD=(mean(S2,2));
S2_std_sq_SD=std(S2,0,2);

S_type_sq_SD={S1,S2};
S_mean_sq_SD=[S1_mean_sq_SD,S2_mean_sq_SD];
S_std_sq_SD=[S1_std_sq_SD,S2_std_sq_SD];
%% DHW
Weights_DHW=[];
Profiles_DHW=[];
Weights_cell_DHW=[];
Profiles_cell_DHW=[];
z=1;
for k=1:4
    for i=1:length(DataSet(k).EMG.DownHillWalking.Syn_fil_40_4_fixed_4.Right)
        Weight=DataSet(k).EMG.DownHillWalking.Syn_fil_40_4_fixed_4.Right(i).Weight;
        Profile=DataSet(k).EMG.DownHillWalking.Syn_fil_40_4_fixed_4.Right(i).Profile;
        Weights_DHW=[Weights_DHW,Weight];
        Profiles_DHW=[Profiles_DHW,Profile'];
        Weights_cell_DHW{z}=Weight;
        Profiles_cell_DHW{z}=Profile';
        z=z+1;
    end
end
for k=1:6
    for i=1:length(DataSet(k).EMG.DownHillWalking.Syn_fil_40_4_fixed_4.Left)
        Weight=DataSet(k).EMG.DownHillWalking.Syn_fil_40_4_fixed_4.Left(i).Weight;
        Profile=DataSet(k).EMG.DownHillWalking.Syn_fil_40_4_fixed_4.Left(i).Profile;
        Weights_DHW=[Weights_DHW,Weight];
        Profiles_DHW=[Profiles_DHW,Profile'];
        Weights_cell_DHW{z}=Weight;
        Profiles_cell_DHW{z}=Profile';
        z=z+1;
    end
end
Weights_DHW=Weights_DHW';
Weights_copy_DHW=Weights_DHW;
[W_type_DHW,id_DHW]=K_means_func(Weights_DHW,Weights_cell_DHW,0.576,4);
for i=1:size(W_type_DHW,2)
    W_mean_DHW(:,i)=(mean(W_type_DHW{1, i},2));
    W_std_DHW(:,i)=std(W_type_DHW{1, i},0,2);
end
k=0;
S1=[];
for i=1:length(id_DHW)
    t=find(id_DHW{1,i}==1);
    if t~=0
        S1=[S1,Profiles_cell_DHW{1,i}(:,t)];
        k=k+1;
    end
end
S1_mean_DHW=(mean(S1,2));
S1_std_DHW=std(S1,0,2);
k=0;
S2=[];
for i=1:length(id_DHW)
    t=find(id_DHW{1,i}==2);
    if t~=0
        S2=[S2,Profiles_cell_DHW{1,i}(:,t)];
        k=k+1;
    end
end
S2_mean_DHW=(mean(S2,2));
S2_std_DHW=std(S2,0,2);
k=0;
S3=[];
for i=1:length(id_DHW)
    t=find(id_DHW{1,i}==3);
    if t~=0
        S3=[S3,Profiles_cell_DHW{1,i}(:,t)];
        k=k+1;
    end
end
S3_mean_DHW=(mean(S3,2));
S3_std_DHW=std(S3,0,2);
k=0;
S4=[];
for i=1:length(id_DHW)
    t=find(id_DHW{1,i}==4);
    if t~=0
        S4=[S4,Profiles_cell_DHW{1,i}(:,t)];
        k=k+1;
    end
end
S4_mean_DHW=(mean(S4,2));
S4_std_DHW=std(S4,0,2);

S_type_DHW={S1,S2,S3,S4};
S_mean_DHW=[S1_mean_DHW,S2_mean_DHW,S3_mean_DHW,S4_mean_DHW];
S_std_DHW=[S1_std_DHW,S2_std_DHW,S3_std_DHW,S4_std_DHW];
%% Stair Descent
Weights_SD=[];
Profiles_SD=[];
Weights_cell_SD=[];
Profiles_cell_SD=[];
z=1;
for k=3:4
    for i=1:length(DataSet(k).EMG.StairDescent.Syn_fil_40_4_fixed_4.Right)
        Weight=DataSet(k).EMG.StairDescent.Syn_fil_40_4_fixed_4.Right(i).Weight;
        Profile=DataSet(k).EMG.StairDescent.Syn_fil_40_4_fixed_4.Right(i).Profile;
        Weights_SD=[Weights_SD,Weight];
        Profiles_SD=[Profiles_SD,Profile'];
        Weights_cell_SD{z}=Weight;
        Profiles_cell_SD{z}=Profile';
        z=z+1;
    end
end
for k=1:2
    for i=1:length(DataSet(k).EMG.StairDescent.Syn_fil_40_4_fixed_4.Left)
        Weight=DataSet(k).EMG.StairDescent.Syn_fil_40_4_fixed_4.Left(i).Weight;
        Profile=DataSet(k).EMG.StairDescent.Syn_fil_40_4_fixed_4.Left(i).Profile;
        Weights_SD=[Weights_SD,Weight];
        Profiles_SD=[Profiles_SD,Profile'];
        Weights_cell_SD{z}=Weight;
        Profiles_cell_SD{z}=Profile';
        z=z+1;
    end
end
for k=5:6
    for i=1:length(DataSet(k).EMG.StairDescent.Syn_fil_40_4_fixed_4.Left)
        Weight=DataSet(k).EMG.StairDescent.Syn_fil_40_4_fixed_4.Left(i).Weight;
        Profile=DataSet(k).EMG.StairDescent.Syn_fil_40_4_fixed_4.Left(i).Profile;
        Weights_SD=[Weights_SD,Weight];
        Profiles_SD=[Profiles_SD,Profile'];
        Weights_cell_SD{z}=Weight;
        Profiles_cell_SD{z}=Profile';
        z=z+1;
    end
end
Weights_SD=Weights_SD';
Weights_copy_SD=Weights_SD;
[W_type_SD,id_SD]=K_means_func(Weights_SD,Weights_cell_SD,0.576,4);
for i=1:size(W_type_SD,2)
    W_mean_SD(:,i)=(mean(W_type_SD{1, i},2));
    W_std_SD(:,i)=std(W_type_SD{1, i},0,2);
end
k=0;
S1=[];
for i=1:length(id_SD)
    t=find(id_SD{1,i}==1);
    if t~=0
        S1=[S1,Profiles_cell_SD{1,i}(:,t)];
        k=k+1;
    end
end
S1_mean_sd=(mean(S1,2));
S1_std_sd=std(S1,0,2);
k=0;
S2=[];
for i=1:length(id_SD)
    t=find(id_SD{1,i}==2);
    if t~=0
        S2=[S2,Profiles_cell_SD{1,i}(:,t)];
        k=k+1;
    end
end
S2_mean_sd=(mean(S2,2));
S2_std_sd=std(S2,0,2);
k=0;
S3=[];
for i=1:length(id_SD)
    t=find(id_SD{1,i}==3);
    if t~=0
        S3=[S3,Profiles_cell_SD{1,i}(:,t)];
        k=k+1;
    end
end
S3_mean_sd=(mean(S3,2));
S3_std_sd=std(S3,0,2);
k=0;
S4=[];
for i=1:length(id_SD)
    t=find(id_SD{1,i}==4);
    if t~=0
        S4=[S4,Profiles_cell_SD{1,i}(:,t)];
        k=k+1;
    end
end
S4_mean_sd=(mean(S4,2));
S4_std_sd=std(S4,0,2);

S_type_SD={S1,S2,S3,S4};
S_mean_sd=[S1_mean_sd,S2_mean_sd,S3_mean_sd,S4_mean_sd];
S_std_sd=[S1_std_sd,S2_std_sd,S3_std_sd,S4_std_sd];
%% Sit_Stand_SU
% W Extractions
load('Sit_Stand.mat');
Weights_ss_SU=[];
Profiles_ss_SU=[];
Weights_cell_ss_SU=[];
Profiles_cell_ss_SU=[];
z=1;
for k=1:6
    for i=1:length(Sit_Stand(k).EMG.Sit_Stand.Syn_fil_40_4_fixed_3.Right)
        Weight=Sit_Stand(k).EMG.Sit_Stand.Syn_fil_40_4_fixed_3.Right(i).Weight;
        Profile=Sit_Stand(k).EMG.Sit_Stand.Syn_fil_40_4_fixed_3.Right(i).Profile;
        Weights_ss_SU=[Weights_ss_SU,Weight];
        Profiles_ss_SU=[Profiles_ss_SU,Profile'];
        Weights_cell_ss_SU{z}=Weight;
        Profiles_cell_ss_SU{z}=Profile';
        z=z+1;
    end
    for i=1:length(Sit_Stand(k).EMG.Sit_Stand.Syn_fil_40_4_fixed_3.Left)
        Weight=Sit_Stand(k).EMG.Sit_Stand.Syn_fil_40_4_fixed_3.Left(i).Weight;
        Profile=Sit_Stand(k).EMG.Sit_Stand.Syn_fil_40_4_fixed_3.Left(i).Profile;
        Weights_ss_SU=[Weights_ss_SU,Weight];
        Profiles_ss_SU=[Profiles_ss_SU,Profile'];
        Weights_cell_ss_SU{z}=Weight;
        Profiles_cell_ss_SU{z}=Profile';
        z=z+1;
    end
end
Weights_ss_SU=Weights_ss_SU';
Weights_copy_ss_SU=Weights_ss_SU;
[W_type_ss_SU,id_ss_SU]=K_means_func(Weights_ss_SU,Weights_cell_ss_SU,0.576,3);
for i=1:size(W_type_ss_SU,2)
    W_mean_ss_SU(:,i)=(mean(W_type_ss_SU{1, i},2));
    W_std_ss_SU(:,i)=std(W_type_ss_SU{1, i},0,2);
end
k=0;
S1=[];
for i=1:length(id_ss_SU)
    t=find(id_ss_SU{1,i}==1);
    if t~=0
        S1=[S1,Profiles_cell_ss_SU{1,i}(:,t)];
        k=k+1;
    end
end
S1_mean_ss_SU=(mean(S1,2));
S1_std_ss_SU=std(S1,0,2);
k=0;
S2=[];
for i=1:length(id_ss_SU)
    t=find(id_ss_SU{1,i}==2);
    if t~=0
        S2=[S2,Profiles_cell_ss_SU{1,i}(:,t)];
        k=k+1;
    end
end
S2_mean_ss_SU=(mean(S2,2));
S2_std_ss_SU=std(S2,0,2);

k=0;
S3=[];
for i=1:length(id_ss_SU)
    t=find(id_ss_SU{1,i}==3);
    if t~=0
        S3=[S3,Profiles_cell_ss_SU{1,i}(:,t)];
        k=k+1;
    end
end
S3_mean_ss_SU=(mean(S3,2));
S3_std_ss_SU=std(S3,0,2);

S_type_ss_SU={S1,S2,S3};

S_mean_ss_SU=[S1_mean_ss_SU,S2_mean_ss_SU,S3_mean_ss_SU];
S_std_ss_SU=[S1_std_ss_SU,S2_std_ss_SU,S3_std_ss_SU];

%% Sit_Stand_SD
% W Extractions
load('Sit_Stand.mat');
Weights_ss_SD=[];
Profiles_ss_SD=[];
Weights_cell_ss_SD=[];
Profiles_cell_ss_SD=[];
z=1;
for k=1:6
    for i=1:length(Sit_Stand(k).EMG.Stand_Sit.Syn_fil_40_4_fixed.Right)
        Weight=Sit_Stand(k).EMG.Stand_Sit.Syn_fil_40_4_fixed.Right(i).Weight;
        Profile=Sit_Stand(k).EMG.Stand_Sit.Syn_fil_40_4_fixed.Right(i).Profile;
        Weights_ss_SD=[Weights_ss_SD,Weight];
        Profiles_ss_SD=[Profiles_ss_SD,Profile'];
        Weights_cell_ss_SD{z}=Weight;
        Profiles_cell_ss_SD{z}=Profile';
        z=z+1;
    end
    for i=1:length(Sit_Stand(k).EMG.Stand_Sit.Syn_fil_40_4_fixed.Left)
        Weight=Sit_Stand(k).EMG.Stand_Sit.Syn_fil_40_4_fixed.Left(i).Weight;
        Profile=Sit_Stand(k).EMG.Stand_Sit.Syn_fil_40_4_fixed.Left(i).Profile;
        Weights_ss_SD=[Weights_ss_SD,Weight];
        Profiles_ss_SD=[Profiles_ss_SD,Profile'];
        Weights_cell_ss_SD{z}=Weight;
        Profiles_cell_ss_SD{z}=Profile';
        z=z+1;
    end
end
Weights_ss_SD=Weights_ss_SD';
Weights_copy_ss_SD=Weights_ss_SD;
[W_type_ss_SD,id_ss_SD]=K_means_func(Weights_ss_SD,Weights_cell_ss_SD,0.576,3);
for i=1:size(W_type_ss_SD,2)
    W_mean_ss_SD(:,i)=(mean(W_type_ss_SD{1, i},2));
    W_std_ss_SD(:,i)=std(W_type_ss_SD{1, i},0,2);
end
k=0;
S1=[];
for i=1:length(id_ss_SD)
    t=find(id_ss_SD{1,i}==1);
    if t~=0
        S1=[S1,Profiles_cell_ss_SD{1,i}(:,t)];
        k=k+1;
    end
end
S1_mean_ss_SD=(mean(S1,2));
S1_std_ss_SD=std(S1,0,2);
k=0;
S2=[];
for i=1:length(id_ss_SD)
    t=find(id_ss_SD{1,i}==2);
    if t~=0
        S2=[S2,Profiles_cell_ss_SD{1,i}(:,t)];
        k=k+1;
    end
end
S2_mean_ss_SD=(mean(S2,2));
S2_std_ss_SD=std(S2,0,2);

k=0;
S3=[];
for i=1:length(id_ss_SD)
    t=find(id_ss_SD{1,i}==3);
    if t~=0
        S3=[S3,Profiles_cell_ss_SD{1,i}(:,t)];
        k=k+1;
    end
end
S3_mean_ss_SD=(mean(S3,2));
S3_std_ss_SD=std(S3,0,2);

S_type_ss_SD={S1,S2,S3};

S_mean_ss_SD=[S1_mean_ss_SD,S2_mean_ss_SD,S3_mean_ss_SD];
S_std_ss_SD=[S1_std_ss_SD,S2_std_ss_SD,S3_std_ss_SD];
%% for all
W_mean_all=[W_mean_lw';W_mean_DHW';W_mean_SD';W_mean_sq_SU';W_mean_sq_SD';W_mean_ss_SU';W_mean_ss_SD'];
W_mean_all_cell={W_mean_lw,W_mean_DHW,W_mean_SD,W_mean_sq_SU,W_mean_sq_SD,W_mean_ss_SU,W_mean_ss_SD};
S_mean_all=[S_mean_lw';S_mean_DHW';S_mean_sd';S_mean_sq_SU';S_mean_sq_SD';S_mean_ss_SU';S_mean_ss_SD'];
S_mean_all_cell={S_mean_lw,S_mean_DHW,S_mean_sd,S_mean_sq_SU,S_mean_sq_SD,S_mean_ss_SU,S_mean_ss_SD};

W_std_all=[W_std_lw';W_std_DHW';W_std_SD';W_std_sq_SU';W_std_sq_SD';W_std_ss_SU';W_std_ss_SD'];
W_std_all_cell={W_std_lw,W_std_DHW,W_std_SD,W_std_sq_SU,W_std_sq_SD,W_std_ss_SU,W_std_ss_SD};
S_std_all=[S_std_lw';S_std_DHW';S_std_sd';S_std_sq_SU';S_std_sq_SD';S_std_ss_SU';S_std_ss_SD'];
S_std_all_cell={S_std_lw,S_std_DHW,S_std_sd,S_std_sq_SU,S_std_sq_SD,S_std_ss_SU,S_std_ss_SD};

synergy=7;

[W_type_all,id_all]=K_means_func(W_mean_all,W_mean_all_cell,0.576,7);
%%
figure
i=1;
for j=1:length(id_all{1,i})
    if id_all{1,i}(j)==1
        subplot(7+1,synergy,1)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'black')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==2
        subplot(7+1,synergy,2)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'black')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==3
        subplot(7+1,synergy,3)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'black')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==4
        subplot(7+1,synergy,4)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'black')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==5
        subplot(7+1,synergy,5)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'black')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==6
        subplot(7+1,synergy,6)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'black')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==7
        subplot(7+1,synergy,7)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'black')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
%     if id_all{1,i}(j)==8
%         subplot(7+1,synergy,8)
%         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
%         bar(1:8,W_mean_all_cell{1,i}(:,j),'black')
%         xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
%         xtickangle(90)
%         hold on
%         
%         er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
%         er.Color = [0 0 0];
%         er.LineStyle = 'none';
%     end
%     
%         if id_all{1,i}(j)==9
%             subplot(7+1,synergy,9)
%             errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
%             bar(1:8,W_mean_all_cell{1,i}(:,j),'black')
%            xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
%             xtickangle(90)
%             hold on
%     
%             er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
%             er.Color = [0 0 0];
%             er.LineStyle = 'none';
%         end
%     
    %     if id_all{1,i}(j)==10
    %         subplot(7+1,synergy,10)
    %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
    %         bar(1:8,W_mean_all_cell{1,i}(:,j),'black')
    %        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
    %         xtickangle(90)
    %         hold on
    %     label('syn 10')
    
    %
    %         er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
    %         er.Color = [0 0 0];
    %         er.LineStyle = 'none';
    %     end
    %
%     if id_all{1,i}(j)==0
%         subplot(7+1,synergy,10)
%         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
%         bar(1:8,W_mean_all_cell{1,i}(:,j),'black')
%         xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
%         xtickangle(90)
%         hold on
%         
%         er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
%         er.Color = [0 0 0];
%         er.LineStyle = 'none';
%     end
end

i=2;
for j=1:length(id_all{1,i})
    if id_all{1,i}(j)==1
        subplot(7+1,synergy,8)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'red')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==2
        subplot(7+1,synergy,9)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'red')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==3
        subplot(7+1,synergy,10)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'red')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==4
        subplot(7+1,synergy,11)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'red')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end 
        if id_all{1,i}(j)==5
            subplot(7+1,synergy,12)
            errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
            bar(1:8,W_mean_all_cell{1,i}(:,j),'red')
                xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
            xtickangle(90)
    
            hold on
    
            er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
            er.Color = [0 0 0];
            er.LineStyle = 'none';
        end
    
    if id_all{1,i}(j)==6
        subplot(7+1,synergy,13)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'red')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    if id_all{1,i}(j)==7
        subplot(7+1,synergy,14)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'red')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
end

i=3;
for j=1:length(id_all{1,i})
    if id_all{1,i}(j)==1
        subplot(7+1,synergy,15)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'blue')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==2
        subplot(7+1,synergy,16)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'blue')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==3
        subplot(7+1,synergy,17)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'blue')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==4
        subplot(7+1,synergy,18)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'blue')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==5
        subplot(7+1,synergy,19)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'blue')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==6
        subplot(7+1,synergy,20)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'blue')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==7
        subplot(7+1,synergy,21)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'blue')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
%     
%     if id_all{1,i}(j)==8
%         subplot(7+1,synergy,26)
%         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
%         bar(1:8,W_mean_all_cell{1,i}(:,j),'blue')
%         xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
%         xtickangle(90)
%         hold on
%         
%         er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
%         er.Color = [0 0 0];
%         er.LineStyle = 'none';
%     end
%     
%         if id_all{1,i}(j)==9
%             subplot(7+1,synergy,27)
%             errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
%             bar(1:8,W_mean_all_cell{1,i}(:,j),'blue')
%            xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
%             xtickangle(90)
%             hold on
%     
%             er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
%             er.Color = [0 0 0];
%             er.LineStyle = 'none';
%         end
%     
    %     if id_all{1,i}(j)==10
    %         subplot(7+1,synergy,28)
    %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
    %         bar(1:8,W_mean_all_cell{1,i}(:,j),'blue')
    %        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
    %         xtickangle(90)
    %         hold on
    %
    %         er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
    %         er.Color = [0 0 0];
    %         er.LineStyle = 'none';
    %     end
    %
%     if id_all{1,i}(j)==0
%         subplot(7+1,synergy,29)
%         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
%         bar(1:8,W_mean_all_cell{1,i}(:,j),'blue')
%         
%         hold on
%         
%         er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
%         er.Color = [0 0 0];
%         er.LineStyle = 'none';
%     end
    
end

i=4;
for j=1:length(id_all{1,i})
    if id_all{1,i}(j)==1
        subplot(7+1,synergy,22)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'green')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==2
        subplot(7+1,synergy,23)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'green')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==3
        subplot(7+1,synergy,24)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'green')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==4
        subplot(7+1,synergy,25)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'green')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==5
        subplot(7+1,synergy,26)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'green')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    if id_all{1,i}(j)==6
        subplot(7+1,synergy,27)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'green')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==7
        subplot(7+1,synergy,28)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'green')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
%     if id_all{1,i}(j)==8
%         subplot(7+1,synergy,35)
%         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
%         bar(1:8,W_mean_all_cell{1,i}(:,j),'green')
%         xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
%         xtickangle(90)
%         hold on
%         
%         er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
%         er.Color = [0 0 0];
%         er.LineStyle = 'none';
%     end
%     
%         if id_all{1,i}(j)==9
%             subplot(7+1,synergy,36)
%             errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
%             bar(1:8,W_mean_all_cell{1,i}(:,j),'green')
%            xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
%             xtickangle(90)
%             hold on
%     
%             er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
%             er.Color = [0 0 0];
%             er.LineStyle = 'none';
%         end
    
    %     if id_all{1,i}(j)==10
    %         subplot(7+1,synergy,37)
    %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
    %         bar(1:8,W_mean_all_cell{1,i}(:,j),'green')
    %        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
    %         xtickangle(90)
    %         hold on
    %
    %         er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
    %         er.Color = [0 0 0];
    %         er.LineStyle = 'none';
    %     end
    %
%     if id_all{1,i}(j)==0
%         subplot(7+1,synergy,38)
%         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
%         bar(1:8,W_mean_all_cell{1,i}(:,j),'green')
%         xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
%         xtickangle(90)
%         hold on
%         
%         er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
%         er.Color = [0 0 0];
%         er.LineStyle = 'none';
%     end
end
i=5;
for j=1:length(id_all{1,i})
    if id_all{1,i}(j)==1
        subplot(7+1,synergy,29)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'green')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==2
        subplot(7+1,synergy,30)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'green')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==3
        subplot(7+1,synergy,31)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'green')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==4
        subplot(7+1,synergy,32)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'green')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==5
        subplot(7+1,synergy,33)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'green')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==6
        subplot(7+1,synergy,34)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'green')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==7
        subplot(7+1,synergy,35)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'green')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
%     if id_all{1,i}(j)==8
%         subplot(7+1,synergy,44)
%         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
%         bar(1:8,W_mean_all_cell{1,i}(:,j),'green')
%         xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
%         xtickangle(90)
%         hold on
%         
%         er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
%         er.Color = [0 0 0];
%         er.LineStyle = 'none';
%     end
%     
%         if id_all{1,i}(j)==9
%             subplot(7+1,synergy,45)
%             errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
%             bar(1:8,W_mean_all_cell{1,i}(:,j),'green')
%            xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
%             xtickangle(90)
%             hold on
%     
%             er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
%             er.Color = [0 0 0];
%             er.LineStyle = 'none';
%         end
%     
    %     if id_all{1,i}(j)==10
    %         subplot(7+1,synergy,46)
    %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
    %         bar(1:8,W_mean_all_cell{1,i}(:,j),'green')
    %        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
    %         xtickangle(90)
    %         hold on
    %
    %         er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
    %         er.Color = [0 0 0];
    %         er.LineStyle = 'none';
    %     end
    %
%     if id_all{1,i}(j)==0
%         subplot(7+1,synergy,47)
%         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
%         bar(1:8,W_mean_all_cell{1,i}(:,j),'green')
%         xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
%         xtickangle(90)
%         hold on
%         
%         er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
%         er.Color = [0 0 0];
%         er.LineStyle = 'none';
%     end
end
i=6;
for j=1:length(id_all{1,i})
    if id_all{1,i}(j)==1
        subplot(7+1,synergy,36)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'magenta')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==2
        subplot(7+1,synergy,37)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'magenta')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==3
        subplot(7+1,synergy,38)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'magenta')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==4
        subplot(7+1,synergy,39)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'magenta')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==5
        subplot(7+1,synergy,40)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'magenta')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==6
        subplot(7+1,synergy,41)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'magenta')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==7
        subplot(7+1,synergy,42)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'magenta')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
%     if id_all{1,i}(j)==8
%         subplot(7+1,synergy,44)
%         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
%         bar(1:8,W_mean_all_cell{1,i}(:,j),'magenta')
%         xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
%         xtickangle(90)
%         hold on
%         
%         er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
%         er.Color = [0 0 0];
%         er.LineStyle = 'none';
%     end
%     
%         if id_all{1,i}(j)==9
%             subplot(7+1,synergy,45)
%             errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
%             bar(1:8,W_mean_all_cell{1,i}(:,j),'magenta')
%            xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
%             xtickangle(90)
%             hold on
%     
%             er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
%             er.Color = [0 0 0];
%             er.LineStyle = 'none';
%         end
%     
    %     if id_all{1,i}(j)==10
    %         subplot(7+1,synergy,46)
    %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
    %         bar(1:8,W_mean_all_cell{1,i}(:,j),'magenta')
    %        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
    %         xtickangle(90)
    %         hold on
    %
    %         er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
    %         er.Color = [0 0 0];
    %         er.LineStyle = 'none';
    %     end
    %
%     if id_all{1,i}(j)==0
%         subplot(7+1,synergy,47)
%         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
%         bar(1:8,W_mean_all_cell{1,i}(:,j),'magenta')
%         xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
%         xtickangle(90)
%         hold on
%         
%         er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
%         er.Color = [0 0 0];
%         er.LineStyle = 'none';
%     end
end
i=7;
for j=1:length(id_all{1,i})
    if id_all{1,i}(j)==1
        subplot(7+1,synergy,43)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'magenta')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==2
        subplot(7+1,synergy,44)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'magenta')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==3
        subplot(7+1,synergy,45)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'magenta')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==4
        subplot(7+1,synergy,46)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'magenta')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==5
        subplot(7+1,synergy,47)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'magenta')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==6
        subplot(7+1,synergy,48)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'magenta')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
    if id_all{1,i}(j)==7
        subplot(7+1,synergy,49)
        errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
        bar(1:8,W_mean_all_cell{1,i}(:,j),'magenta')
        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
        xtickangle(90)
        hold on
        
        er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
        er.Color = [0 0 0];
        er.LineStyle = 'none';
    end
    
%     if id_all{1,i}(j)==8
%         subplot(7+1,synergy,44)
%         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
%         bar(1:8,W_mean_all_cell{1,i}(:,j),'magenta')
%         xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
%         xtickangle(90)
%         hold on
%         
%         er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
%         er.Color = [0 0 0];
%         er.LineStyle = 'none';
%     end
%     
%         if id_all{1,i}(j)==9
%             subplot(7+1,synergy,45)
%             errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
%             bar(1:8,W_mean_all_cell{1,i}(:,j),'magenta')
%            xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
%             xtickangle(90)
%             hold on
%     
%             er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
%             er.Color = [0 0 0];
%             er.LineStyle = 'none';
%         end
%     
    %     if id_all{1,i}(j)==10
    %         subplot(7+1,synergy,46)
    %         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
    %         bar(1:8,W_mean_all_cell{1,i}(:,j),'magenta')
    %        xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
    %         xtickangle(90)
    %         hold on
    %
    %         er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
    %         er.Color = [0 0 0];
    %         er.LineStyle = 'none';
    %     end
    %
%     if id_all{1,i}(j)==0
%         subplot(7+1,synergy,47)
%         errorbar(W_mean_all_cell{1,i}(:,j),W_std_all_cell{1,i}(:,j))
%         bar(1:8,W_mean_all_cell{1,i}(:,j),'magenta')
%         xticklabels({'RF','VM','VL','TA','HM','HL','GM','GL'});
%         xtickangle(90)
%         hold on
%         
%         er = errorbar(1:8,W_mean_all_cell{1,i}(:,j),zeros(8,1),W_std_all_cell{1,i}(:,j));
%         er.Color = [0 0 0];
%         er.LineStyle = 'none';
%     end
end
%%
figure
i=1;
for j=1:length(id_all{1,i})
    if id_all{1,i}(j)==1
        subplot(7+1,synergy,1)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'k','EdgeColor','none')
        hold on
        plot(0:100,y,'black','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==2
        subplot(7+1,synergy,2)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'k','EdgeColor','none')
        hold on
        plot(0:100,y,'black','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==3
        subplot(7+1,synergy,3)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'k','EdgeColor','none')
        hold on
        plot(0:100,y,'black','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==4
        subplot(7+1,synergy,4)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'k','EdgeColor','none')
        hold on
        plot(0:100,y,'black','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==5
        subplot(7+1,synergy,5)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'k','EdgeColor','none')
        hold on
        plot(0:100,y,'black','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==6
        subplot(7+1,synergy,6)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'k','EdgeColor','none')
        hold on
        plot(0:100,y,'black','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==7
        subplot(7+1,synergy,7)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'k','EdgeColor','none')
        hold on
        plot(0:100,y,'black','LineWidth',1.2); alpha(0.3);
    end
    
%         if id_all{1,i}(j)==8
%             subplot(7+1,synergy,8)
%             temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
%             temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
%             x=0:100';
%             y=S_mean_all_cell{1,i}(:,j)';
%     
%             patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'k','EdgeColor','none')
%             hold on
%             plot(0:100,y,'k')
%         end
%     
%         if id_all{1,i}(j)==9
%             subplot(7+1,synergy,9)
%             temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
%             temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
%             x=0:100';
%             y=S_mean_all_cell{1,i}(:,j)';
%     
%             patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'k','EdgeColor','none')
%             hold on
%             plot(0:100,y,'black','LineWidth',1.2); alpha(0.3);
%         end
%     
    %     if id_all{1,i}(j)==10
    %         subplot(7+1,synergy,10)
    %         temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
    %         temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
    %         x=0:100';
    %         y=S_mean_all_cell{1,i}(:,j)';
    %
    %         patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'k','EdgeColor','none')
    %         hold on
    %         plot(0:100,y,'black','LineWidth',1.2); alpha(0.3);
    %     end
    %
%     if id_all{1,i}(j)==0
%         subplot(7+1,synergy,11)
%         temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
%         temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
%         x=0:100';
%         y=S_mean_all_cell{1,i}(:,j)';
%         
%         patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'k','EdgeColor','none')
%         hold on
%         plot(0:100,y,'black','LineWidth',1.2); alpha(0.3);
%     end
 end

i=2;
for j=1:length(id_all{1,i})
    if id_all{1,i}(j)==1
        subplot(7+1,synergy,8)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'r','EdgeColor','none')
        hold on
        plot(0:100,y,'red','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==2
        subplot(7+1,synergy,9)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'r','EdgeColor','none')
        hold on
        plot(0:100,y,'red','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==3
        subplot(7+1,synergy,10)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'r','EdgeColor','none')
        hold on
        plot(0:100,y,'red','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==4
        subplot(7+1,synergy,11)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'r','EdgeColor','none')
        hold on
        plot(0:100,y,'red','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==5
        subplot(7+1,synergy,12)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'r','EdgeColor','none')
        hold on
        plot(0:100,y,'red','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==6
        subplot(7+1,synergy,13)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'r','EdgeColor','none')
        hold on
        plot(0:100,y,'red','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==7
        subplot(7+1,synergy,14)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'r','EdgeColor','none')
        hold on
        plot(0:100,y,'red','LineWidth',1.2); alpha(0.3);
    end
%     
%         if id_all{1,i}(j)==8
%             subplot(7+1,synergy,17)
%             temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
%             temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
%             x=0:100';
%             y=S_mean_all_cell{1,i}(:,j)';
%     
%             patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'r','EdgeColor','none')
%             hold on
%             plot(0:100,y,'red','LineWidth',1.2); alpha(0.3);
%         end
%     
%         if id_all{1,i}(j)==9
%             subplot(7+1,synergy,18)
%             temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
%             temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
%             x=0:100';
%             y=S_mean_all_cell{1,i}(:,j)';
%     
%             patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'r','EdgeColor','none')
%             hold on
%             plot(0:100,y,'red','LineWidth',1.2); alpha(0.3);
%         end
%     
    %     if id_all{1,i}(j)==10
    %         subplot(7+1,synergy,19)
    %         temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
    %         temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
    %         x=0:100';
    %         y=S_mean_all_cell{1,i}(:,j)';
    %
    %         patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'r','EdgeColor','none')
    %         hold on
    %         plot(0:100,y,'red','LineWidth',1.2); alpha(0.3);
    %     end
    %
%     if id_all{1,i}(j)==0
%         subplot(7+1,synergy,20)
%         temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
%         temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
%         x=0:100';
%         y=S_mean_all_cell{1,i}(:,j)';
%         
%         patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'r','EdgeColor','none')
%         hold on
%         plot(0:100,y,'red','LineWidth',1.2); alpha(0.3);
%     end
 end

i=3;
for j=1:length(id_all{1,i})
    if id_all{1,i}(j)==1
        subplot(7+1,synergy,15)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'b','EdgeColor','none')
        hold on
        plot(0:100,y,'blue','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==2
        subplot(7+1,synergy,16)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'b','EdgeColor','none')
        hold on
        plot(0:100,y,'blue','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==3
        subplot(7+1,synergy,17)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'b','EdgeColor','none')
        hold on
        plot(0:100,y,'blue','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==4
        subplot(7+1,synergy,18)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'b','EdgeColor','none')
        hold on
        plot(0:100,y,'blue','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==5
        subplot(7+1,synergy,19)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'b','EdgeColor','none')
        hold on
        plot(0:100,y,'blue','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==6
        subplot(7+1,synergy,20)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'b','EdgeColor','none')
        hold on
        plot(0:100,y,'blue','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==7
        subplot(7+1,synergy,21)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'b','EdgeColor','none')
        hold on
        plot(0:100,y,'blue','LineWidth',1.2); alpha(0.3);
    end
    
%         if id_all{1,i}(j)==8
%             subplot(7+1,synergy,26)
%             temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
%             temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
%             x=0:100';
%             y=S_mean_all_cell{1,i}(:,j)';
%     
%             patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'b','EdgeColor','none')
%             hold on
%             plot(0:100,y,'blue','LineWidth',1.2); alpha(0.3);
%         end
%     
%         if id_all{1,i}(j)==9
%             subplot(7+1,synergy,27)
%             temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
%             temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
%             x=0:100';
%             y=S_mean_all_cell{1,i}(:,j)';
%     
%             patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'b','EdgeColor','none')
%             hold on
%             plot(0:100,y,'blue','LineWidth',1.2); alpha(0.3);
%         end
%     
    %     if id_all{1,i}(j)==10
    %         subplot(7+1,synergy,28)
    %         temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
    %         temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
    %         x=0:100';
    %         y=S_mean_all_cell{1,i}(:,j)';
    %
    %         patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'b','EdgeColor','none')
    %         hold on
    %         plot(0:100,y,'blue','LineWidth',1.2); alpha(0.3);
    %     end
    %
%     if id_all{1,i}(j)==0
%         subplot(7+1,synergy,29)
%         temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
%         temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
%         x=0:100';
%         y=S_mean_all_cell{1,i}(:,j)';
%         
%         patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'b','EdgeColor','none')
%         hold on
%         plot(0:100,y,'blue','LineWidth',1.2); alpha(0.3);
%     end
end

i=4;
for j=1:length(id_all{1,i})
    if id_all{1,i}(j)==1
        subplot(7+1,synergy,22)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'g','EdgeColor','none')
        hold on
        plot(0:100,y,'green','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==2
        subplot(7+1,synergy,23)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'g','EdgeColor','none')
        hold on
        plot(0:100,y,'green','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==3
        subplot(7+1,synergy,24)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'g','EdgeColor','none')
        hold on
        plot(0:100,y,'green','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==4
        subplot(7+1,synergy,25)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'g','EdgeColor','none')
        hold on
        plot(0:100,y,'green','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==5
        subplot(7+1,synergy,26)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'g','EdgeColor','none')
        hold on
        plot(0:100,y,'green','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==6
        subplot(7+1,synergy,27)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'g','EdgeColor','none')
        hold on
        plot(0:100,y,'green','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==7
        subplot(7+1,synergy,28)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'g','EdgeColor','none')
        hold on
        plot(0:100,y,'green','LineWidth',1.2); alpha(0.3);
    end
    
%         if id_all{1,i}(j)==8
%             subplot(7+1,synergy,35)
%             temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
%             temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
%             x=0:100';
%             y=S_mean_all_cell{1,i}(:,j)';
%     
%             patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'g','EdgeColor','none')
%             hold on
%             plot(0:100,y,'green','LineWidth',1.2); alpha(0.3);
%         end
%     
%         if id_all{1,i}(j)==9
%             subplot(7+1,synergy,36)
%             temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
%             temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
%             x=0:100';
%             y=S_mean_all_cell{1,i}(:,j)';
%     
%             patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'g','EdgeColor','none')
%             hold on
%             plot(0:100,y,'green','LineWidth',1.2); alpha(0.3);
%         end
%     
    %     if id_all{1,i}(j)==10
    %         subplot(7+1,synergy,37)
    %         temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
    %         temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
    %         x=0:100';
    %         y=S_mean_all_cell{1,i}(:,j)';
    %
    %         patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'g','EdgeColor','none')
    %         hold on
    %         plot(0:100,y,'green','LineWidth',1.2); alpha(0.3);
    %     end
    %
%     if id_all{1,i}(j)==0
%         subplot(7+1,synergy,17)
%         temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
%         temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
%         x=0:100';
%         y=S_mean_all_cell{1,i}(:,j)';
%         
%         patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'g','EdgeColor','none')
%         hold on
%         plot(0:100,y,'green','LineWidth',1.2); alpha(0.3);
%     end
end
i=5;
for j=1:length(id_all{1,i})
    if id_all{1,i}(j)==1
        subplot(7+1,synergy,29)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'g','EdgeColor','none')
        hold on
        plot(0:100,y,'green','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==2
        subplot(7+1,synergy,30)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'g','EdgeColor','none')
        hold on
        plot(0:100,y,'green','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==3
        subplot(7+1,synergy,31)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'g','EdgeColor','none')
        hold on
        plot(0:100,y,'green','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==4
        subplot(7+1,synergy,32)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'g','EdgeColor','none')
        hold on
        plot(0:100,y,'green','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==5
        subplot(7+1,synergy,33)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'g','EdgeColor','none')
        hold on
        plot(0:100,y,'green','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==6
        subplot(7+1,synergy,34)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'g','EdgeColor','none')
        hold on
        plot(0:100,y,'green','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==7
        subplot(7+1,synergy,35)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'g','EdgeColor','none')
        hold on
        plot(0:100,y,'green','LineWidth',1.2); alpha(0.3);
    end
    
%         if id_all{1,i}(j)==8
%             subplot(7+1,synergy,44)
%             temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
%             temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
%             x=0:100';
%             y=S_mean_all_cell{1,i}(:,j)';
%     
%             patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'g','EdgeColor','none')
%             hold on
%             plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
%         end
%     
%         if id_all{1,i}(j)==9
%             subplot(7+1,synergy,45)
%             temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
%             temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
%             x=0:100';
%             y=S_mean_all_cell{1,i}(:,j)';
%     
%             patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')],'g','EdgeColor','none')
%             hold on
%             plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
%         end
%     
    %     if id_all{1,i}(j)==10
    %         subplot(7+1,synergy,46)
    %         temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
    %         temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
    %         x=0:100';
    %         y=S_mean_all_cell{1,i}(:,j)';
    %
    %         patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'g','EdgeColor','none')
    %         hold on
    %         plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
    %     end
    %
%     if id_all{1,i}(j)==0
%         subplot(7+1,synergy,47)
%         temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
%         temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
%         x=0:100';
%         y=S_mean_all_cell{1,i}(:,j)';
%         
%         patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'm','EdgeColor','none')
%         hold on
%         plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
%     end
end
i=6;
for j=1:length(id_all{1,i})
    if id_all{1,i}(j)==1
        subplot(7+1,synergy,36)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'm','EdgeColor','none')
        hold on
        plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==2
        subplot(7+1,synergy,37)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'm','EdgeColor','none')
        hold on
        plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==3
        subplot(7+1,synergy,38)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'm','EdgeColor','none')
        hold on
        plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==4
        subplot(7+1,synergy,39)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'm','EdgeColor','none')
        hold on
        plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==5
        subplot(7+1,synergy,40)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'm','EdgeColor','none')
        hold on
        plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==6
        subplot(7+1,synergy,41)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'm','EdgeColor','none')
        hold on
        plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==7
        subplot(7+1,synergy,42)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'm','EdgeColor','none')
        hold on
        plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
    end
    
%         if id_all{1,i}(j)==8
%             subplot(7+1,synergy,44)
%             temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
%             temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
%             x=0:100';
%             y=S_mean_all_cell{1,i}(:,j)';
%     
%             patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'm','EdgeColor','none')
%             hold on
%             plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
%         end
%     
%         if id_all{1,i}(j)==9
%             subplot(7+1,synergy,45)
%             temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
%             temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
%             x=0:100';
%             y=S_mean_all_cell{1,i}(:,j)';
%     
%             patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')],'m','EdgeColor','none')
%             hold on
%             plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
%         end
%     
    %     if id_all{1,i}(j)==10
    %         subplot(7+1,synergy,46)
    %         temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
    %         temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
    %         x=0:100';
    %         y=S_mean_all_cell{1,i}(:,j)';
    %
    %         patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'm','EdgeColor','none')
    %         hold on
    %         plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
    %     end
    %
%     if id_all{1,i}(j)==0
%         subplot(7+1,synergy,47)
%         temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
%         temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
%         x=0:100';
%         y=S_mean_all_cell{1,i}(:,j)';
%         
%         patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'm','EdgeColor','none')
%         hold on
%         plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
%     end
end
i=7;
for j=1:length(id_all{1,i})
    if id_all{1,i}(j)==1
        subplot(7+1,synergy,43)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'm','EdgeColor','none')
        hold on
        plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==2
        subplot(7+1,synergy,44)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'm','EdgeColor','none')
        hold on
        plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==3
        subplot(7+1,synergy,45)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'm','EdgeColor','none')
        hold on
        plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==4
        subplot(7+1,synergy,46)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'm','EdgeColor','none')
        hold on
        plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==5
        subplot(7+1,synergy,47)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'm','EdgeColor','none')
        hold on
        plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==6
        subplot(7+1,synergy,48)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'm','EdgeColor','none')
        hold on
        plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
    end
    
    if id_all{1,i}(j)==7
        subplot(7+1,synergy,49)
        temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
        temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
        x=0:100';
        y=S_mean_all_cell{1,i}(:,j)';
        
        patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'm','EdgeColor','none')
        hold on
        plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
    end
    
%         if id_all{1,i}(j)==8
%             subplot(7+1,synergy,44)
%             temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
%             temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
%             x=0:100';
%             y=S_mean_all_cell{1,i}(:,j)';
%     
%             patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'm','EdgeColor','none')
%             hold on
%             plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
%         end
%     
%         if id_all{1,i}(j)==9
%             subplot(7+1,synergy,45)
%             temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
%             temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
%             x=0:100';
%             y=S_mean_all_cell{1,i}(:,j)';
%     
%             patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')],'m','EdgeColor','none')
%             hold on
%             plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
%         end
%     
    %     if id_all{1,i}(j)==10
    %         subplot(7+1,synergy,46)
    %         temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
    %         temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
    %         x=0:100';
    %         y=S_mean_all_cell{1,i}(:,j)';
    %
    %         patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'm','EdgeColor','none')
    %         hold on
    %         plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
    %     end
    %
%     if id_all{1,i}(j)==0
%         subplot(7+1,synergy,47)
%         temp1=S_mean_all_cell{1,i}(:,j)+S_std_all_cell{1,i}(:,j) ;
%         temp2=S_mean_all_cell{1,i}(:,j)-S_std_all_cell{1,i}(:,j);
%         x=0:100';
%         y=S_mean_all_cell{1,i}(:,j)';
%         
%         patch([x fliplr(x)], [y-S_std_all_cell{1,i}(:,j)'  fliplr(y+S_std_all_cell{1,i}(:,j)')], 'm','EdgeColor','none')
%         hold on
%         plot(0:100,y,'magenta','LineWidth',1.2); alpha(0.3);
%     end
end