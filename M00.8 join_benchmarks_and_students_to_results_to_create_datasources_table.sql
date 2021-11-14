--[step 01.8] creates or replaces table `harlemlinksy2122.datasources.math_gradek`
--this table is linked directly to Google Data Studio as a datasource
--it serves as the datasouse for the math level 3 grade k dashboard

CREATE OR REPLACE TABLE
  `harlemlinksy2122.datasources.math_gradek` AS

SELECT
  --start by pulling the osis on the combined results table
  results.osis,
  --pull these columns from the .demographics.students table
  student,
  sy_21_22_class,
  sped,
  enl,
  hl_upk,
  holdovers,
  new_students,
  ais,
  --also pull these test-related columns from the results table
  question_id,
  ccls_standard,
  standard_description,
  question_text,
  results.unit,
  points_earned,
  points_available,
  math_pct_points,
  math_benchmark,
--pull in qualitative and helper data from baseline
  baseline_count_as_high_as_you_can,
  raw_baseline_count_as_high_as_you_can,
--pull in qualitative data from unit 1
  unit1_count_as_high_as_you_can,
  raw_unit1_count_as_high_as_you_can

 

FROM
  `harlemlinksy2122.results.math_gradek` results

LEFT JOIN 
`harlemlinksy2122.demographics.students` students

ON results.osis = students.osis

LEFT JOIN
`harlemlinksy2122.benchmarks.math_gradek` benchmarks

ON results.osis = benchmarks.osis AND results.unit = benchmarks.unit

LEFT JOIN
  `harlemlinksy2122.trackers.math_gradek_baseline` baseline

ON results.osis = baseline.osis

LEFT JOIN
  `harlemlinksy2122.trackers.math_gradek_unit1` unit1

ON results.osis = unit1.osis

WHERE results.osis IS NOT NULL ;
