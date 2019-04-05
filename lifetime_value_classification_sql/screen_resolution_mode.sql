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
  A.User_ID,
  MIN(A.screenResolution) AS screenResolution,
  MAX(A.Count) AS Count
FROM
  `caramel-howl-182418.LTV_Classification.ScreenResolutionCount` A,
  (
  SELECT
    User_ID,
    MAX(Count) AS Max_Count
  FROM
    `caramel-howl-182418.LTV_Classification.ScreenResolutionCount`
  GROUP BY
    User_ID) B
WHERE
  A.User_ID = B.User_ID
  AND A.Count = B.Max_Count
GROUP BY
  User_ID
ORDER BY
  User_ID