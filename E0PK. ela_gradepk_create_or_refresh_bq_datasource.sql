-----------------------------------------------------------------------------
--run this combined script to refresh the ELA Grade PK BigQuery Datasource---
-----------------------------------------------------------------------------

--[step 01.1] import data from classroom trackers




--import ela: heggerty assessment 1
SELECT *
FROM `harlemlinksy2122.trackers.ela_heggerty_gradepk_assessment1`;
--add a data pull for the next ela: heggerty assessment below




--[step 01.2] import data from the ela level 3 question bank

SELECT * 
FROM `harlemlinksy2122.questions.ela` ;





--[step 01.3] import data from the students (subgroups and demographics) table

SELECT * 
FROM `harlemlinksy2122.demographics.students` ;





----unpivot ela: heggerty data (all assessments)----
--unpivot ela: heggerty grade 1 assessment #1
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_heggerty_gradepk_assessment1` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_heggerty_gradepk_assessment1` UNPIVOT(points_earned FOR question_id IN (heggerty_gradepk_assessment1_01,
    heggerty_gradepk_assessment1_02,
    heggerty_gradepk_assessment1_03,
    heggerty_gradepk_assessment1_04,
    heggerty_gradepk_assessment1_05,
    heggerty_gradepk_assessment1_06

      )) ;
--add the next ela: heggerty assessment below





----create unions table for all grade 1 ela: heggerty assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_heggerty_gradepk` AS
--pull unpivoted data from ela: heggerty grade 1 assessment 1
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_heggerty_gradepk_assessment1`;
--insert UNION ALL code block here for the next assessment




--[step 01.6] join questions table to unions table to create results table




----create a results table for ela: heggerty grade 1----
CREATE OR REPLACE TABLE
--the results is used to calculate benchmarks grouped by students.osis and questions.unit
  `harlemlinksy2122.results.ela_heggerty_gradepk` AS
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
  `harlemlinksy2122.unions.ela_heggerty_gradepk` unions
LEFT JOIN
  `harlemlinksy2122.questions.ela` questions
ON
  unions.question_id = questions.question_id
WHERE 
  unions.osis IS NOT NULL ;




-- --[step 01.7] use the results table to calculate benchmarks using CASE WHEN
   
-- CREATE OR REPLACE TABLE
--   `harlemlinksy2122.benchmarks.math_gradek` AS
-- SELECT
--   osis,
--   unit,
--   SUM(points_earned)/SUM(points_available) AS math_pct_points,
-- --used to add student-assessment-level benchmarks to tables with student-question level granularity
--   CASE
--     WHEN SUM(points_earned)/SUM(points_available) >= .75 THEN "Achieved Benchmark"
--     WHEN SUM(points_earned)/SUM(points_available) BETWEEN .5
--   AND .74999999 THEN "Approaching Benchmark"
--     WHEN SUM(points_earned)/SUM(points_available) < .5 THEN "Below Benchmark"
--   ELSE
--   ""
-- END
--   AS math_benchmark
-- FROM
--   `harlemlinksy2122.results.math_gradek`
-- WHERE
--   osis IS NOT NULL
-- GROUP BY
--   1,
--   2 ;


----create a datasource table for ela: heggerty grade pk----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.datasources.ela_heggerty_gradepk` AS

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
  points_available
  --  ela_pct_points,
  --  ela_benchmark

FROM
  `harlemlinksy2122.results.ela_heggerty_gradepk` results

LEFT JOIN 
`harlemlinksy2122.demographics.students` students

ON results.osis = students.osis

WHERE results.osis IS NOT NULL ;

---END----------------------------------------------------------------------------