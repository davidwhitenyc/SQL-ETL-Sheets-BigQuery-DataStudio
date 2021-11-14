--[step 01.8] creates or replaces table `harlemlinksy2122.datasources.ela_tp_grade3`
--this table is linked directly to Google Data Studio as a datasource
--it serves as the datasouse for the grade 3 ela test prep dashboard

CREATE OR REPLACE TABLE
  `harlemlinksy2122.datasources.ela_tp_grade3` AS

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
  results.quiz,
  points_earned,
  points_available,
  student_answer,
  ela_tp_pct_points,
  ela_tp_benchmark

FROM
  `harlemlinksy2122.results.ela_test_prep_grade3` results

LEFT JOIN 
`harlemlinksy2122.demographics.students` students

ON results.osis = students.osis

LEFT JOIN
`harlemlinksy2122.benchmarks.ela_test_prep_grade3` benchmarks

ON results.osis = benchmarks.osis AND results.quiz = benchmarks.quiz

WHERE results.osis IS NOT NULL ;
