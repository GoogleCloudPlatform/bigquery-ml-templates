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
  * EXCEPT(LifeTime_Value),
  Loyalty_Program/Age Normalized_Loyalty_Program,
  CASE
    WHEN LifeTime_Value < Boundary1 THEN "Small"
    WHEN LifeTime_Value >= Boundary1
  AND LifeTime_value < Boundary2 THEN "Medium"
    ELSE "Large"
  END Class
FROM
  `caramel-howl-182418.LTV_Classification.Users_Age_Cleaned`,
  `caramel-howl-182418.LTV_Classification.Classification_Boundaries`
