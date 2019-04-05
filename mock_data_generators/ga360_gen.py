'''
Copyright 2019 Google LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

This script creates the random GA data using the random normal distribution function in python.
'''


import numpy as np
from itertools import groupby
import matplotlib.pyplot as plt
import pandas as pd


#data = pd.read_csv("CRM - User.csv")
columns = ['Visit ID', 'User ID', 'visitStartTime', 'timeOnScreen', 'timeOnSite', 'UniqueScreenViews', 'Medium', 'screenResolution']
data = pd.DataFrame(columns=columns)
#Visit_ID
data['Visit ID'] = range(1, 1000001)
#User ID
mu = 25000
sigma = 6250
lv = np.random.normal(mu, sigma, 1000000)
lv = [int(i) for i in lv]
data['User ID'] = lv
#visitStartTime
data['visitStartTime'] = range(1, 1000001)
#timeOnScreen
mu = 500
sigma = 125
lv = np.random.normal(mu, sigma, 1000000)
lv = [int(i) for i in lv]
data['timeOnScreen'] = lv
#timeOnSite
mu = 100
sigma = 25
lv = np.random.normal(mu, sigma, 1000000)
lv = [int(i) for i in lv]
data['timeOnSite'] = lv
#UniqueScreenViews
mu = 3
sigma = 0.75
lv = np.random.normal(mu, sigma, 1000000)
lv = [int(i) for i in lv]
data['UniqueScreenViews'] = lv
#Medium
mu = 2
sigma = 0.5
lv = np.random.normal(mu, sigma, 1000000)
lv = [int(i) for i in lv]
data['Medium'] = lv
#screenResolution
mu = 4
sigma = 1
lv = np.random.normal(mu, sigma, 1000000)
lv = [int(i) for i in lv]
data['screenResolution'] = lv
data.to_csv("ga360_1000000.csv")
