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

This script plots the CRM user data's Age field to help visualize the distribution.
'''


import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
from itertools import groupby

data = pd.read_csv("crm_user.csv")
lv = data["Age"].values
count, bins, ignored = plt.hist(lv, 30, normed=True)
plt.plot(bins, 1/(245 * np.sqrt(2 * np.pi)) * np.exp( - (bins - 255)**2 / (2 * 245**2)), linewidth=2, color='r')
plt.show()
