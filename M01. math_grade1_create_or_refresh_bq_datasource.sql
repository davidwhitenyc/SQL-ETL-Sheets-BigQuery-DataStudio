-----------------------------------------------------------------------------
--run this combined script to refresh the Math Grade 1 BigQuery Datasource---
-----------------------------------------------------------------------------


--[step 01.1] import data from classroom trackers

--import grade 1 math unit 1 data
SELECT *
FROM `harlemlinksy2122.trackers.math_grade1_unit1`;

--add a data pull for the next unit below






--[step 01.2] import data from the math level 3 question bank

SELECT * 
FROM `harlemlinksy2122.questions.math` ;






--[step 01.3] import data from the students (subgroups and demographics) table

SELECT * 
FROM `harlemlinksy2122.demographics.students` ;






--[step 01.4] unpivot classroom trackers
--add a new code block below for each new unit

--unpivot math grade 1 unit 1 data
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.math_grade1_unit1` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.math_grade1_unit1` UNPIVOT(points_earned FOR question_id IN (math_grade1_unit1_q01,
math_grade1_unit1_q02,
math_grade1_unit1_q03,
math_grade1_unit1_q04,
math_grade1_unit1_q05,
math_grade1_unit1_q06

      )) ;
--add unpivots for new units below






--[step 01.5] combines all unpivoted trackers into a single table
--add a new code block below for each new unit


CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.math_grade1` AS
--pull unpivoted data from math grade 1 unit 1
SELECT
  osis,
  question_id,
  points_earned,
FROM
  `harlemlinksy2122.unpivots.math_grade1_unit1` 
--insert UNION ALL code block here for the next unit  
  
  ;






--[step 01.6] join questions table to unions table to create results table

CREATE OR REPLACE TABLE
--the results is used to calculate benchmarks grouped by students.osis and questions.unit
  `harlemlinksy2122.results.math_grade1` AS
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
  `harlemlinksy2122.unions.math_grade1` unions
LEFT JOIN
  `harlemlinksy2122.questions.math` questions
ON
  unions.question_id = questions.question_id
WHERE 
  unions.osis IS NOT NULL ;






--[step 01.7] use the results table to calculate benchmarks using CASE WHEN
   
CREATE OR REPLACE TABLE
  `harlemlinksy2122.benchmarks.math_grade1` AS
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
  `harlemlinksy2122.results.math_grade1`
WHERE
  osis IS NOT NULL
GROUP BY
  1,
  2 ;






--[step 01.8] creates or replaces table `harlemlinksy2122.datasources.math_grade1`
--this table is linked directly to Google Data Studio as a datasource
--it serves as the datasouse for the math level 3 grade 1 dashboard

CREATE OR REPLACE TABLE
  `harlemlinksy2122.datasources.math_grade1` AS

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
  `harlemlinksy2122.results.math_grade1` results

LEFT JOIN 
`harlemlinksy2122.demographics.students` students

ON results.osis = students.osis

LEFT JOIN
`harlemlinksy2122.benchmarks.math_grade1` benchmarks

ON results.osis = benchmarks.osis AND results.unit = benchmarks.unit

WHERE results.osis IS NOT NULL ;

---END----------------------------------------------------------------------------