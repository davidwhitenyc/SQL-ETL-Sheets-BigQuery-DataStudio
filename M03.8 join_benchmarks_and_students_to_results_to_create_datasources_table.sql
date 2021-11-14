--[step 01.8] creates or replaces table `harlemlinksy2122.datasources.math_grade3`
--this table is linked directly to Google Data Studio as a datasource
--it serves as the datasouse for the math level 3 grade 3 dashboard

CREATE OR REPLACE TABLE
  `harlemlinksy2122.datasources.math_grade3` AS

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
  math_benchmark

FROM
  `harlemlinksy2122.results.math_grade3` results

LEFT JOIN 
`harlemlinksy2122.demographics.students` students

ON results.osis = students.osis

LEFT JOIN
`harlemlinksy2122.benchmarks.math_grade3` benchmarks

ON results.osis = benchmarks.osis AND results.unit = benchmarks.unit

WHERE results.osis IS NOT NULL ;
