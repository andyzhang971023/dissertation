#!/usr/bin/env python
# coding: utf-8

# In[1]:
import numpy as np 
import pandas as pd 
import math
from pandas import DataFrame

datalist = []
with open('/Users/andyzhang/Documents/MSc Robotics/Dissertation/code/py2.0/data/S1-ADL1.dat.txt') as original:
    for line in original:        
        line = line.strip('\n').split()    
        linelist = []        
        for str in line:                       
            linelist = linelist + (str.strip(',').split(','))
        datalist.append(linelist)
df = DataFrame(datalist)
df = df.replace('NaN', 0)
df = df.astype('int')

dfLM = df[[16,17,18,37,38,39,40,41,42,43,44,45,243]]
dfLA = df[[7,8,9,28,29,30,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,245]]
dfRA = df[[10,11,12,25,26,27,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,247]]


# In[2]:


Label = df[[245,246,247,248]]
Label.columns = ['LA','LAO','RA','RAO']
#Label = Label.replace('0', 'NaN')

# In[3]:
Label.duplicated()
Label = Label.drop_duplicates().reset_index(drop=True)
#Label.to_csv('/Users/andyzhang/Documents/MSc Robotics/Dissertation/code/1.1/Label_data.csv')


# In[4]:
Label = Label.astype('str')
Label['Actions'] = Label['LA'].str.cat( [Label['LAO'], Label['RA'], Label['RAO']], sep='-')
Label.to_csv('/Users/andyzhang/Documents/MSc Robotics/Dissertation/code/py2.0/data/new_Action_data_1.csv')
