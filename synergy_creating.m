%% Computing synergies For level walEMGg T01-1
clc;clear;close all;
%% Left Limb
load('CAMS_SUT.mat')
        p_L=CAMS_SUT.K5R.EMG.LevelWalking.T02_1.dataset_mean_resampled.Left;
%         p_L=kinProcess(p_L);   
        p_L_prime = [];
        p_L_max = max(abs(p_L)');
        s_p_L = size(p_L,1);
        for i = 1:s_p_L
            if p_L_max(i) ~= 0
                p_L_prime = [p_L_prime; p_L(i,:)/p_L_max(i)];
            else
                p_L_prime = [p_L_prime; p_L(i,:)];
            end
        end
        p_L = p_L_prime;
        for s=1:5 % s is number of synergies
            clear W S S_p;  
            
            [W0,S0]=nnmf(p_L,s,'algorithm','mult');
            [W1,S1]=nnmf(p_L,s,'w0',W0,'h0',S0,'replicate',500,'algorithm','als');
            W1_max=max(W1,[],2);
            S1_max=max(S1,[],2);
            for ws=1:size(W1,1)
                W(ws,:)=W1(ws,:)/W1_max(ws);
            end
            for ws=1:size(S1,1)
                S(ws,:)=S1(ws,:)/S1_max(ws);
                S_p(ws,:)=S(ws,:);
            end
%             if s == 4 || 5
%             figure()
%             for i=1:s
%                 subplot(s,2,2*i-1);
%                 bar(W(:,i))
%                 subplot(s,2,2*i)
%                 plot(1:length(CAMS_SUT.K5R.EMG.LevelWalking.T07_1.dataset_mean_resampled.Left),S_p(i,:))
%             end
%             end
            VAF(s)=1-((norm(p_L-W1*S1,2))/norm(p_L,2));
            M = W1*S1;
            for i = 1:8
                VAF_Local.Left(i)=1-((norm(p_L(i,:)-M(i,:),2))/norm(p_L(i,:),2));
            end
            if s == 4
                a = max(W1);
                b = max(S1');
                a_prime = [];
                b_prime = [];
                for j = 1:s
                    a_prime = [a_prime, W1(:,j)/a(j)];
                    b_prime = [b_prime; S1(j,:)/b(j)];
                end
               CAMS_SUT.K5R.EMG.LevelWalking.T02_1.Synergy_4.Weight.Left = a_prime;
               CAMS_SUT.K5R.EMG.LevelWalking.T02_1.Synergy_4.Profile.Left = b_prime;
            elseif s == 5
                a = max(W1);
                b = max(S1');
                a_prime = [];
                b_prime = [];
                for j = 1:5
                    a_prime = [a_prime, W1(:,j)/a(j)];
                    b_prime = [b_prime; S1(j,:)/b(j)];
                end
                CAMS_SUT.K5R.EMG.LevelWalking.T02_1.Synergy_5.Weight.Left = a_prime;
                CAMS_SUT.K5R.EMG.LevelWalking.T02_1.Synergy_5.Profile.Left = b_prime;
            end
        end
        CAMS_SUT.K5R.EMG.LevelWalking.T02_1.VAF.Left = VAF;
%         figure
%         plot(Synergy_2) 
        %% Right Limb
        clear S1 W1 s W0 S0 W1_max S1_max W S S_p ws Synergy_2;
        p_L=CAMS_SUT.K5R.EMG.LevelWalking.T02_1.dataset_mean_resampled.Right;
%         p_L=kinProcess(p_L);
        p_L_prime = [];
        p_L_max = max(abs(p_L)');
        s_p_L = size(p_L,1);
        for i = 1:s_p_L
            if p_L_max(i) ~= 0
                p_L_prime = [p_L_prime; p_L(i,:)/p_L_max(i)];
            else
                p_L_prime = [p_L_prime; p_L(i,:)];
            end
        end
        p_L = p_L_prime;
        for s=1:5% s is number of synergies
            clear W S S_p; 
            [W0,S0]=nnmf(p_L,s,'algorithm','mult');
            [W1,S1]=nnmf(p_L,s,'w0',W0,'h0',S0,'replicate',500,'algorithm','als');
            W1_max=max(W1,[],2);
            S1_max=max(S1,[],2);
            for ws=1:size(W1,1)
                W(ws,:)=W1(ws,:)/W1_max(ws);
            end
            for ws=1:size(S1,1)
                S(ws,:)=S1(ws,:)/S1_max(ws);
                S_p(ws,:)=S(ws,:);
            end
%             if s == 4 || 5
%                 figure()
%             for i = 1:s
%                 subplot(s,2,2*i-1);
%                 bar(W(:,i))
%                 subplot(s,2,2*i)
%                 plot(1:length(CAMS_SUT.K5R.EMG.LevelWalking.T07_1.dataset_mean_resampled.Right),S_p(i,:))
%             end
            VAF(s)=1-((norm(p_L-W1*S1,2))/norm(p_L,2));
            M = W1*S1;
            for i = 1:8
                VAF_Local.Right(i)=1-((norm(p_L(i,:)-M(i,:),2))/norm(p_L(i,:),2));
            end
            if s == 3
                a = max(W1);
                b = max(S1');
                a_prime = [];
                b_prime = [];
%                 for j = 1:s
%                     a_prime = [a_prime, W1(:,j)/a(j)];
%                     b_prime = [b_prime; S1(j,:)/b(j)];
%                 end
               CAMS_SUT.K5R.EMG.LevelWalking.T02_1.Synergy_3.Weight.Right = W1;
               CAMS_SUT.K5R.EMG.LevelWalking.T02_1.Synergy_3.Profile.Right = S1;
            elseif s == 5
                a = max(W1);
                b = max(S1');
                a_prime = [];
                b_prime = [];
%                 for j = 1:5
%                     a_prime = [a_prime, W1(:,j)/a(j)];
%                     b_prime = [b_prime; S1(j,:)/b(j)];
%                 end
                CAMS_SUT.K5R.EMG.LevelWalking.T02_1.Synergy_5.Weight.Right = W1;
                CAMS_SUT.K5R.EMG.LevelWalking.T02_1.Synergy_5.Profile.Right = S1;
            end
            
        end
        CAMS_SUT.K5R.EMG.LevelWalking.T02_1.VAF.Right = VAF;
%         figure
%         plot(Synergy_2)
        save('CAMS_SUT.mat','CAMS_SUT')