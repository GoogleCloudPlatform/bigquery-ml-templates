/*
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
*/
SELECT
  m1.User_ID,
  m1.Total_timeOnScreen Total_timeOnScreen_month1,
  m2.Total_timeOnScreen Total_timeOnScreen_month2,
  m3.Total_timeOnScreen Total_timeOnScreen_month3,
  UniqueScreenViews,
  Lifetime_Value,
  Age,
  Label
FROM
  `caramel-howl-182418.ConversionPrediction_BinaryClassification.Total_timeOnScreen_month1_Extended` m1,
  `caramel-howl-182418.ConversionPrediction_BinaryClassification.Total_timeOnScreen_month2_Extended` m2,
  `caramel-howl-182418.ConversionPrediction_BinaryClassification.Total_timeOnScreen_month3_Extended` m3,
  `caramel-howl-182418.ConversionPrediction_BinaryClassification.Users_Selected` Users_Selected,
  `caramel-howl-182418.ConversionPrediction_BinaryClassification.Aggregated_GA360` GA360,
  `caramel-howl-182418.ConversionPrediction_BinaryClassification.Users` Users
WHERE
  m1.User_ID = m2.User_ID
  AND m2.User_ID = m3.User_ID
  AND m3.User_ID = Users_Selected.User_ID
  AND Users_Selected.USer_ID = GA360.User_ID
  AND GA360.User_ID = Users.USer_ID