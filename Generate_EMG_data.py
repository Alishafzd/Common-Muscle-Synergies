
# Import packages
import numpy as np
import pandas as pd
import os

# Find all muscles' names
Muscles = 'RectFemL_01, VastusMedL_02, VastusLatL_03, TibAntL_04, HamMedL_05, HamLatL_06, GastroMedL_07, GastroLatL_08, '\
          'RectFemR_09, VastusMedR_10, VastusLatR_11, TibAntR_12, HamMedR_13, HamLatR_14, GastroMedR_15, GastroLatR_16'

Muscles = Muscles.split(', ')

# Finding *.csv files in the "CAMS_Knee_Full" folder
files = [file for file in os.listdir('CAMS_Knee_Full') if file.endswith('.csv')]


# Obtaining start and stop times, name, and subject of each trial in the file "Cycles_kinetics.csv"
def read_cycles():
    # Obtaining data frequency (CAMS dataset has a frequency of 2kHZ)
    frequency = 2000

    # Reading cycles times
    data = pd.read_csv(r'Docs/Cycles_kinetics.csv')
    start_times = (data['start']).map(lambda x: int(float(x) * frequency))
    stop_times = (data['stop']).map(lambda x: int(float(x) * frequency))

    # Reading subjects and tasks
    cache = {'subjects': data['subject'],
             'task': data['task'],
             'name': data['name'],
             'tag': data['tag']}

    return start_times, stop_times, cache


start_times, stop_times, cache = read_cycles()


# For each file, read the data from start to stop time
def read_csv(file_id, start_time, stop_time):
    x = 'NaN'
    while x[0] != 'TIME':
        x = file_id.readline()
        x = x.split(',')

    headers_csv = x
    labels_csv = file_id.readline().split(',')
    file_id.readline()

    y = file_id.readline().split(',')
    while int(y[1]) != start_time:
        y = file_id.readline().split(',')

    data_csv = []
    data_csv.append(list(map(lambda x: float(x), y)))
    while int(y[1]) != stop_time:
        y = list(map(lambda x: float(x), file_id.readline().split(',')))
        data_csv.append(y)

    csv_file = pd.DataFrame(np.array(data_csv), columns=labels_csv)
    file_id.close()

    cache = {'data_csv': data_csv,
             'labels_csv': labels_csv,
             'headers_csv': headers_csv}

    return csv_file, cache


# Seperating GRF and In-vivo forces into different groups
def EMG_find(csv_file, Muscles):

    EMG = pd.DataFrame()
    TIME = csv_file.iloc[:, csv_file.columns.get_level_values(0) == "time"]

    for muscle in Muscles:
        EMG[f"{muscle[:-3]}"] = csv_file.iloc[:, csv_file.columns.get_level_values(0) == f"{muscle}"]

    return EMG, TIME


# for-loop below gathers the kinetic data of all the trials exist in "Cycles_kinetics.xlsx",
# and save them as a .csv file in the "Kinetic data" folder.
for i in range(len(start_times)):

    for n_file in range(0, len(files)):
        if cache['subjects'][i] in files[n_file] and cache['task'][i] in files[n_file]:
            file = files[n_file]
            file_id = open("CAMS_Knee_Full/"+file, "r")
            name = cache['subjects'][i] + '_' + cache['name'][i]
            leg = cache['subjects'][i][2]
            tag = cache['tag'][i]

    if "file" in globals():
        temp, cache_read_csv = read_csv(file_id, start_times[i], stop_times[i])

        EMG, Time = EMG_find(temp, Muscles)

        # first_frame = EMG.first_valid_index()
        # main_plate_data_resampled = EMG.iloc[first_frame::20, :]
        # Time_resampled = Time.iloc[first_frame::20, :]

        EMG_data = pd.concat([Time, EMG], axis=1)
        EMG_data.to_csv("EMG data/"+name+"_EMG.csv", index=False)

        del file_id, file, name