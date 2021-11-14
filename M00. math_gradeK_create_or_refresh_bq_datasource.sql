-----------------------------------------------------------------------------
--run this combined script to refresh the Math Grade K BigQuery Datasource---
-----------------------------------------------------------------------------


--[step 01.1] import data from classroom trackers

--import grade k math baseline data
SELECT *
FROM `harlemlinksy2122.trackers.math_gradek_baseline`;


--import grade k math unit 1 data
SELECT *
FROM `harlemlinksy2122.trackers.math_gradek_unit1`;

--add a data pull for the next unit below


--[step 01.2] import data from the math level 3 question bank

SELECT * 
FROM `harlemlinksy2122.questions.math` ;


--[step 01.3] import data from the students (subgroups and demographics) table

SELECT * 
FROM `harlemlinksy2122.demographics.students` ;


--[step 01.4] unpivot classroom trackers
--add a new code block below for each new unit

--unpivot math grade k baseline data
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.math_gradek_baseline` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.math_gradek_baseline` UNPIVOT(points_earned FOR question_id IN (math_gradek_baseline_q01,
math_gradek_baseline_q02,
math_gradek_baseline_q03,
math_gradek_baseline_q04,
math_gradek_baseline_q05,
math_gradek_baseline_q06,
math_gradek_baseline_q07,
math_gradek_baseline_q08,
math_gradek_baseline_q09,
math_gradek_baseline_q10

      )) ;

--unpivot math grade k unit 1 data
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.math_gradek_unit1` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.math_gradek_unit1` UNPIVOT(points_earned FOR question_id IN (math_gradek_unit1_q01,
math_gradek_unit1_q02,
math_gradek_unit1_q03,
math_gradek_unit1_q04,
math_gradek_unit1_q05,
math_gradek_unit1_q06,
math_gradek_unit1_q07,
math_gradek_unit1_q08

      )) ;

--add unpivots for new units below


--[step 01.5] combines all unpivoted trackers into a single table
--add a new code block below for each new unit


CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.math_gradek` AS
--pull unpivoted data from math grade k baseline
SELECT
  osis,
  question_id,
  points_earned,
FROM
  `harlemlinksy2122.unpivots.math_gradek_baseline` 
--pull unpivoted data from math grade k unit 1
UNION ALL
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.unpivots.math_gradek_unit1` 
  
--insert UNION ALL code block here for the next unit  
  
  ;


--[step 01.6] join questions table to unions table to create results table

CREATE OR REPLACE TABLE
--the results is used to calculate benchmarks grouped by students.osis and questions.unit
  `harlemlinksy2122.results.math_gradek` AS
SELECT
  unions.osis,
  unions.question_id,
--pulls in columns for questions.points_available and questions.unit
  grade_level,
  unit,
  ccls_standard,
  standard_description,
  question_text,
  points_earned,
  points_available
FROM
  `harlemlinksy2122.unions.math_gradek` unions
LEFT JOIN
  `harlemlinksy2122.questions.math` questions
ON
  unions.question_id = questions.question_id
WHERE 
  unions.osis IS NOT NULL ;


--[step 01.7] use the results table to calculate benchmarks using CASE WHEN
   
CREATE OR REPLACE TABLE
  `harlemlinksy2122.benchmarks.math_gradek` AS
SELECT
  osis,
  unit,
  SUM(points_earned)/SUM(points_available) AS math_pct_points,
--used to add student-assessment-level benchmarks to tables with student-question level granularity
  CASE
    WHEN SUM(points_earned)/SUM(points_available) >= .75 THEN "Achieved Benchmark"
    WHEN SUM(points_earned)/SUM(points_available) BETWEEN .5
  AND .74999999 THEN "Approaching Benchmark"
    WHEN SUM(points_earned)/SUM(points_available) < .5 THEN "Below Benchmark"
  ELSE
  ""
END
  AS math_benchmark
FROM
  `harlemlinksy2122.results.math_gradek`
WHERE
  osis IS NOT NULL
GROUP BY
  1,
  2 ;


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
--pull in qualitative data from
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

---END----------------------------------------------------------------------------