import numpy as np
import pandas as pd
from pandas import DataFrame
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
import time

row = time.time()

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

dfLMdata = df[[16, 17, 18, 37, 38, 39, 40, 41, 42, 43, 44, 45]]
LMdata = np.array(dfLMdata.values.tolist())
LMtarget = np.array(df[243].tolist())
dic = {}
dic.setdefault('LMdata', LMdata)
dic.setdefault('LMtarget', LMtarget)

dfLAdata = df[
    [7, 8, 9, 28, 29, 30, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98,
     99, 100, 101]]
LAdata = np.array(dfLAdata.values.tolist())
LAtarget = np.array(df[245].tolist())
dic.setdefault('LAdata', LAdata)
dic.setdefault('LAtarget', LAtarget)

dfRAdata = df[
    [10, 11, 12, 25, 26, 27, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72,
     73, 74, 75]]
RAdata = np.array(dfRAdata.values.tolist())
RAtarget = np.array(df[247].tolist())
dic.setdefault('RAdata', RAdata)
dic.setdefault('RAtarget', RAtarget)

begin = time.time()
print((begin - row) * 1000)

# ----------------------------------
x_train,x_test,y_train,y_test=train_test_split(dic['LMdata'], dic['LMtarget'],random_state=0)

knn = KNeighborsClassifier(n_neighbors=5)
knn.fit(x_train, y_train)

a = time.time()
print((a - begin) * 1000)

prediction= knn.predict(x_test)
print("prediction :{0}  ,classifier:{1}".format(prediction, dic['LMtarget'][prediction]))

b = time.time()
print((b - a) * 1000)

assess_model_socre=knn.score(x_test,y_test)
print('Test set score:{:2f}'.format(assess_model_socre))
# ----------------------------------
# x_train,x_test,y_train,y_test=train_test_split(dic['LAdata'], dic['LAtarget'],random_state=0)
#
# knn = KNeighborsClassifier(n_neighbors=5)
# knn.fit(x_train, y_train)
#
# a = time.time()
# print((a - begin) * 1000)
#
# prediction= knn.predict(x_test)
# print("prediction :{0}  ,classifier:{1}".format(prediction,dic['LAtarget'][prediction]))
#
# b = time.time()
# print((b - a) * 1000)
#
# assess_model_socre=knn.score(x_test,y_test)
# print('Test set score:{:2f}'.format(assess_model_socre))
# -----------------------------------
# x_train, x_test, y_train, y_test = train_test_split(dic['RAdata'], dic['RAtarget'], random_state=0)
#
# knn = KNeighborsClassifier(n_neighbors=5)
# knn.fit(x_train, y_train)
#
# a = time.time()
# print((a - begin) * 1000)
#
# prediction = knn.predict(x_test)
# print("prediction :{0}  ,classifier:{1}".format(prediction, dic['RAtarget'][prediction]))
#
# b = time.time()
# print((b - a) * 1000)
#
# assess_model_socre = knn.score(x_test, y_test)
# print('Test set score:{:2f}'.format(assess_model_socre))
# ------------------------------------

print((time.time() - b) * 1000)
