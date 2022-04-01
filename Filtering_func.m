function   EMG_filt_Mat = Filtering_func(EMG_raw_Mat, highPassFreq, lowPassFreq, timeBin)

% each column contains a signal to be filtered
n = size(EMG_raw_Mat,2);    % number of columns
%% design filter
sf=1200;   %Hz - Sampling Freqeuncy
fn=sf/2;        %Hz - Nyquist Frequency - 1/2 Sampling Frequency
bin = timeBin;

HP30=designfilt('highpassiir','FilterOrder',4,'HalfPowerFrequency',highPassFreq,'SampleRate',2000,'DesignMethod','butter');
LP10=designfilt('lowpassiir','FilterOrder',4,'HalfPowerFrequency',lowPassFreq,'SampleRate',2000,'DesignMethod','butter');


%% Applying Filters

for i = n:-1:1

    % 1)raw data
    temp1(:,i) = abs(EMG_raw_Mat(:,i));
    % 2)High pass filter
    temp2(:,i) = filtfilt(HP30,temp1(:,i));
    % 3)Detrend
    temp3(:,i) = detrend(temp2(:,i));
    % 4)Rectify
    temp4(:,i) = abs(temp3(:,i));
    % 5)Low pass filter
    temp5(:,i) = filtfilt(LP10,temp4(:,i));
    % 6)Non-negative
    temp6 = temp5(:,i);
    temp6(temp6 < 0) = 0;
    temp7(:,i) = temp6;
    % 7)Devide by max value
    max_amp = max(temp7(:,i));
    % max_amp=1;    % if division is not desired
    temp8(:,i) = temp7(:,i)/max_amp;
    
    

end
% Finally
EMG_filt_Mat = temp8;


