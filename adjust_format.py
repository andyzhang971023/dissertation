import numpy as np
import pandas as pd
import math
from pandas import DataFrame

dataFrame = pd.read_csv('/Users/andyzhang/Documents/MSc Robotics/Dissertation/code/py2.0/data/new_Action_data_1.csv')

dataFrame = dataFrame.drop([dataFrame.columns[0]],axis=1)

length = dataFrame.shape[0]
i = 0
stop = 0
while i < length-2 and stop == 0:
    flag = 1
    while flag != 0:
        if i + flag > length - 1:
            stop = 1
            break
        if dataFrame.LA[i] == dataFrame.LA[i + flag] and dataFrame.LAO[i] == dataFrame.LAO[i + flag] :
            dataFrame.LA[i + flag] = 0
            dataFrame.LAO[i + flag] = 0
            flag += 1
        else:
            i += flag
            break
i = 0
stop = 0
while i < length-2 and stop == 0:
    flag = 1
    while flag != 0:
        if i + flag > length - 1:
            stop = 1
            break
        if dataFrame.RA[i] == dataFrame.RA[i + flag] and dataFrame.RAO[i] == dataFrame.RAO[i + flag]:
            dataFrame.RA[i + flag] = 0
            dataFrame.RAO[i + flag] = 0
            flag += 1
        else:
            i += flag
            break

for j in range(length):
    if dataFrame.LA[j] == 0 and dataFrame.LAO[j] == 0 and dataFrame.RA[j] == 0 and dataFrame.RAO[j] == 0:
        dataFrame = dataFrame.drop(index = [j])

dataFrame = dataFrame.reset_index(drop=True)

for j in ['LA', 'LAO', 'RA', 'RAO']:
    for i in range(len(dataFrame[j])):
        dataFrame[j][i] = int(dataFrame[j][i]) % 100

dataFrame = dataFrame.astype('str')

dataFrame['LeftActions'] = dataFrame['LA'].str.cat( [dataFrame['LAO']], sep='-')
dataFrame['RightActions'] = dataFrame['RA'].str.cat( [dataFrame['RAO']], sep='-')
dataFrame.to_csv('/Users/andyzhang/Documents/MSc Robotics/Dissertation/code/py2.0/data/test_Action_data_1.csv')