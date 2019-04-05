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
  Signup.User_ID,
  CASE
    WHEN Signup_Date <= DATE_ADD(Activity_Date, INTERVAL 3 MONTH) THEN 1
    ELSE 0
  END Label
FROM
  `caramel-howl-182418.ConversionPrediction_BinaryClassification.Users_Signup_Dates` Signup,
  `caramel-howl-182418.ConversionPrediction_BinaryClassification.First_Activity` First_Activity
WHERE
  Signup.User_ID = First_Activity.User_ID