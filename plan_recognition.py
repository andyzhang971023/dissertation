import json
import pandas as pd
import time

def match_observed2dict(observed, dict):
    count = {}
    for item in dict:
        index = 0
        count[item] = 0
        for i in range(len(observed)):
            if observed[i] in dict[item][index:]:
                index = dict[item].index(observed[i])
                count[item] += 1
    return count

def get_count(countl, countr):
    count = {}
    for item in countl:
        count[item] = countl[item] + countr[item]
    return count

def get_goal(count):
    max_val = -1
    for key in count:
        max_val = max(max_val, count[key])
    print(max_val)
    goal = []
    for key in count:
        if count[key] == max_val:
            goal.append(key)
    print(goal)

with open('config.json') as load_f:
    all_dict = json.load(load_f)

plan_dict = all_dict["plan dict"]
observed_path = all_dict["observed path"]
observed_index = all_dict["observed index"]
dataFrame = pd.read_csv(observed_path)

# observedl = dataFrame["LeftActions"][observed_index[0]:observed_index[1]]
# observedr = dataFrame["RightActions"][observed_index[0]:observed_index[1]]
# observedr = observedr.tolist()
# observedl = observedl.tolist()
# print(observedl)
# print(observedr)

start = time.time()
observedl = []
observedr = ["5-23"]
count = get_count(match_observed2dict(observedl, plan_dict), match_observed2dict(observedr, plan_dict))
get_goal(count)
print((time.time() - start) * 1000000)