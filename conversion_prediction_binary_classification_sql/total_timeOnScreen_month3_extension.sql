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
  *
FROM (
  SELECT
    Users_Selected.User_ID,
    Total_timeOnScreen_month3.Total_timeOnScreen
  FROM
    `caramel-howl-182418.ConversionPrediction_BinaryClassification.Total_timeOnScreen_month3` Total_timeOnScreen_month3
  FULL OUTER JOIN
    `caramel-howl-182418.ConversionPrediction_BinaryClassification.Users_Selected` Users_Selected
  ON
    Total_timeOnScreen_month3.User_ID = Users_Selected.User_ID)
WHERE
  User_ID IS NOT NULL