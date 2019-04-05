''''
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

This script generated activity dates and signup dates.
'''


import pandas as pd
import random
from datetime import *


df = pd.read_csv("mock_data.csv")
ad = []
sd = []
lbl = []
sdu = {}
count = 15000
for index, d in df.iterrows():
    year_started = d['Year_Started']
    user_id = d['User_ID']
    year1 = random.randint(year_started, 2019)
    month1 = random.randint(1, 12)
    date1 = random.randint(1, 28)
    d1 = date(year1, month1, date1)
    if user_id not in sdu.keys():
        year2 = random.randint(year_started, 2019)
        month2 = random.randint(1, 12)
        date2 = random.randint(1, 28)
        d2 = date(year2, month2, date2)
        a = d1
        b = d2
        if a > b:
            a = d2
            b = d1
        if len(sdu.keys()) < count:
            ad.append(a)
            sd.append(b)
            sdu[user_id] = a
        else:
            ad.append(b)
            sd.append(a)
            sdu[user_id] = b
    else:
        sd.append(sdu[user_id])
        ad.append(d1)

df['Activity_Date'] = ad
df['Signup_Date'] = sd

df.to_csv("date_appended_data.csv")
