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
  `caramel-howl-182418.LTV_Classification.Users_Calculated`.User_ID,
  `caramel-howl-182418.LTV_Classification.Aggregated_GA360`.timeOnScreen,
  `caramel-howl-182418.LTV_Classification.Aggregated_GA360`.UniqueScreenViews,
  `caramel-howl-182418.LTV_Classification.Users_Calculated`.Loyalty_Program,
  `caramel-howl-182418.LTV_Classification.Users_Calculated`.Age,
  `caramel-howl-182418.LTV_Classification.Users_Calculated`.Country_Code,
  `caramel-howl-182418.LTV_Classification.ScreenResolutionMode`.screenResolution,
  `caramel-howl-182418.LTV_Classification.Users_Calculated`.Normalized_Loyalty_Program,
  `caramel-howl-182418.LTV_Classification.Users_Calculated`.Class
FROM
  `caramel-howl-182418.LTV_Classification.Aggregated_GA360`,
  `caramel-howl-182418.LTV_Classification.Users_Calculated`,
  `caramel-howl-182418.LTV_Classification.Accounts`,
  `caramel-howl-182418.LTV_Classification.ScreenResolutionMode`
WHERE
  `caramel-howl-182418.LTV_Classification.Aggregated_GA360`.User_ID = `caramel-howl-182418.LTV_Classification.Users_Calculated`.User_ID
  AND `caramel-howl-182418.LTV_Classification.Accounts`.Account_Number = `caramel-howl-182418.LTV_Classification.Users_Calculated`.Account_ID
  AND `caramel-howl-182418.LTV_Classification.Aggregated_GA360`.User_ID = `caramel-howl-182418.LTV_Classification.ScreenResolutionMode`.User_ID
