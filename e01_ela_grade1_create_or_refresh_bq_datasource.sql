-----------------------------------------------------------------------------
--run this combined script to refresh the ELA Grade 1 BigQuery Datasource---
-----------------------------------------------------------------------------

--[step 01.1] import data from classroom trackers


----import grade 1 ela: reading data (all units)----
--import ela: reading unit 1
SELECT *
FROM `harlemlinksy2122.trackers.ela_reading_grade1_unit1`;
--add the next ela: reading unit below


----import grade 1 ela: writing data (all units)----
--import ela: writing grade 1 unit 1
SELECT *
FROM `harlemlinksy2122.trackers.ela_writing_grade1_unit1`;
--add the next ela: writing unit below


----import grade 1 ela: f&p data (all windows)----
--import ela: f&p grade 1 september
SELECT *
FROM `harlemlinksy2122.trackers.ela_fp_grade1_september`;
--add the next ela: f&p window below


----import grade 1 ela: fundations data (all units)----
--import ela: fundations unit 1
SELECT *
FROM `harlemlinksy2122.trackers.ela_fundations_grade1_assessment1`;

--import ela: fundations unit 2
SELECT *
FROM `harlemlinksy2122.trackers.ela_fundations_grade1_assessment2`;
--add a data pull for the next ela: fundations unit below


--import ela: heggerty assessment 1
SELECT *
FROM `harlemlinksy2122.trackers.ela_heggerty_grade1_assessment1`;

--import ela: heggerty assessment 2
SELECT *
FROM `harlemlinksy2122.trackers.ela_heggerty_grade1_assessment2`;
--add a data pull for the next ela: heggerty assessment below





--[step 01.2] import data from the ela level 3 question bank

SELECT * 
FROM `harlemlinksy2122.questions.ela` ;






--[step 01.3] import data from the students (subgroups and demographics) table

SELECT * 
FROM `harlemlinksy2122.demographics.students` ;






--[step 01.4] unpivot classroom trackers
--add a new code block below for each new unit

----unpivot ela: reading data (all units)----
--unpivot ela: reading grade 1 unit 1
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_reading_grade1_unit1` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_reading_grade1_unit1` UNPIVOT(points_earned FOR question_id IN (
   reading_grade1_unit1_01,
   reading_grade1_unit1_02,
   reading_grade1_unit1_03

      )) ;
--add the next ela: reading unit below


----unpivot ela: writing data (all units)----
--unpivot ela: writing grade 1 unit 1
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.math_gradek_unit1` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_writing_grade1_unit1` UNPIVOT(points_earned FOR question_id IN (
   writing_grade1_unit1_01,
   writing_grade1_unit1_02,
   writing_grade1_unit1_03,
   writing_grade1_unit1_04,
   writing_grade1_unit1_05,
   writing_grade1_unit1_06,
   writing_grade1_unit1_07

      )) ;

--add the next ela: writing unit below


----unpivot ela: fundations data (all assessments)----
--unpivot ela: fundations grade 1 assessment #1
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_fundations_grade1_assessment1` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_fundations_grade1_assessment1` UNPIVOT(points_earned FOR question_id IN (
   write_lowercase_a,
   write_lowercase_b,
   write_lowercase_c,
   write_lowercase_d,
   write_lowercase_e,
   write_lowercase_f,
   write_lowercase_g,
   write_lowercase_h,
   write_lowercase_i,
   write_lowercase_j,
   write_lowercase_k,
   write_lowercase_l,
   write_lowercase_m,
   write_lowercase_n,
   write_lowercase_o,
   write_lowercase_p,
   write_lowercase_q,
   write_lowercase_r,
   write_lowercase_s,
   write_lowercase_t,
   write_lowercase_u,
   write_lowercase_v,
   write_lowercase_w,
   write_lowercase_x,
   write_lowercase_y,
   write_lowercase_z

      )) ;

--unpivot ela: fundations grade 1 assessment #2
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_fundations_grade1_assessment2` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_fundations_grade1_assessment2` UNPIVOT(points_earned FOR question_id IN (
   hear_the_sound_write_the_letter_that_matches_the_sound_f,
   hear_the_sound_write_the_letter_that_matches_the_sound_m,
   hear_the_sound_write_the_letter_that_matches_the_sound_h,
   hear_the_sound_write_the_letter_that_matches_the_sound_p,
   hear_the_sound_write_the_letter_that_matches_the_sound_t,
   hear_the_sound_write_the_letter_that_matches_the_sound_i,
   hear_the_sound_write_the_letter_that_matches_the_sound_v,
   hear_the_sound_write_the_letter_that_matches_the_sound_a,
   hear_the_sound_write_the_letter_that_matches_the_sound_z
      )) ;


----unpivot ela: heggerty data (all assessments)----
--unpivot ela: heggerty grade 1 assessment #1
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_heggerty_grade1_assessment1` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_heggerty_grade1_assessment1` UNPIVOT(points_earned FOR question_id IN (
   heggerty_grade1_assessment1_01,
   heggerty_grade1_assessment1_02,
   heggerty_grade1_assessment1_03,
   heggerty_grade1_assessment1_04,
   heggerty_grade1_assessment1_05,
   heggerty_grade1_assessment1_06,
   heggerty_grade1_assessment1_07,
   heggerty_grade1_assessment1_08

      )) ;


--unpivot ela: heggerty grade 1 assessment #2
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_heggerty_grade1_assessment2` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_heggerty_grade1_assessment2` UNPIVOT(points_earned FOR question_id IN (
   heggerty_grade1_assessment2_01,
   heggerty_grade1_assessment2_02,
   heggerty_grade1_assessment2_03,
   heggerty_grade1_assessment2_04,
   heggerty_grade1_assessment2_05,
   heggerty_grade1_assessment2_06,
   heggerty_grade1_assessment2_07,
   heggerty_grade1_assessment2_08

      )) ;
--add the next ela: heggerty assessment below



--[step 01.5] combines all unpivoted trackers into consolidated tables
--add a new code block below for each new unit

----create unions table for all grade 1 ela: reading level 3 assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_reading_grade1` AS
--pull unpivoted data from ela: reading grade 1 unit 1
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_reading_grade1_unit1` ;
--insert UNION ALL code block here for the next unit 




----create unions table for all grade 1 ela: writing level 3 assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_writing_grade1` AS
--pull unpivoted data from ela: reading grade 1 unit 1
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_writing_grade1_unit1` ;
--insert UNION ALL code block here for the next unit 




----create unions table for all grade 1 ela: fundations assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_fundations_grade1` AS
--pull unpivoted data from ela: fundations grade 1 assessment 1
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_fundations_grade1_assessment1`
--pull unpivoted data from ela: fundations grade 1 assessment 2
UNION ALL
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.unpivots.ela_fundations_grade1_assessment2` ;
--insert UNION ALL code block here for the next assessment


----create unions table for all grade 1 ela: heggerty assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_heggerty_grade1` AS
--pull unpivoted data from ela: heggerty grade 1 assessment 1
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_heggerty_grade1_assessment1`

--pull unpivoted data from ela: heggerty grade 1 assessment 2
UNION ALL
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_heggerty_grade1_assessment2`;

--insert UNION ALL code block here for the next assessment




--[step 01.6] join questions table to unions table to create results table


----create a results table for ela: reading grade 1----
CREATE OR REPLACE TABLE
--the results is used to calculate benchmarks grouped by students.osis and questions.unit
  `harlemlinksy2122.results.ela_reading_grade1` AS
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
  `harlemlinksy2122.unions.ela_reading_grade1` unions
LEFT JOIN
  `harlemlinksy2122.questions.ela` questions
ON
  unions.question_id = questions.question_id
WHERE 
  unions.osis IS NOT NULL ;




----create a results table for ela: writing grade 1----
CREATE OR REPLACE TABLE
--the results is used to calculate benchmarks grouped by students.osis and questions.unit
  `harlemlinksy2122.results.ela_writing_grade1` AS
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
  `harlemlinksy2122.unions.ela_writing_grade1` unions
LEFT JOIN
  `harlemlinksy2122.questions.ela` questions
ON
  unions.question_id = questions.question_id
WHERE 
  unions.osis IS NOT NULL ;



----create a results table for ela: fundations grade 1----
CREATE OR REPLACE TABLE
--the results is used to calculate benchmarks grouped by students.osis and questions.unit
  `harlemlinksy2122.results.ela_fundations_grade1` AS
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
  `harlemlinksy2122.unions.ela_fundations_grade1` unions
LEFT JOIN
  `harlemlinksy2122.questions.ela` questions
ON
  unions.question_id = questions.question_id
WHERE 
  unions.osis IS NOT NULL ;


----create a results table for ela: heggerty grade 1----
CREATE OR REPLACE TABLE
--the results is used to calculate benchmarks grouped by students.osis and questions.unit
  `harlemlinksy2122.results.ela_heggerty_grade1` AS
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
  `harlemlinksy2122.unions.ela_heggerty_grade1` unions
LEFT JOIN
  `harlemlinksy2122.questions.ela` questions
ON
  unions.question_id = questions.question_id
WHERE 
  unions.osis IS NOT NULL ;





--[step 01.8] create or update datasource tables for ela dashboard


----create a datasource table for ela: reading grade 1----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.datasources.ela_reading_grade1` AS

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
--  ela_pct_points,
--  ela_benchmark

FROM
  `harlemlinksy2122.results.ela_reading_grade1` results

LEFT JOIN 
`harlemlinksy2122.demographics.students` students

ON results.osis = students.osis


WHERE results.osis IS NOT NULL ;




----create a datasource table for ela: writing grade 1----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.datasources.ela_writing_grade1` AS

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
--  ela_pct_points,
--  ela_benchmark

FROM
  `harlemlinksy2122.results.ela_writing_grade1` results

LEFT JOIN 
`harlemlinksy2122.demographics.students` students

ON results.osis = students.osis


WHERE results.osis IS NOT NULL ;



----create a datasource table for ela: F&P grade 1----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.datasources.ela_fp_grade1` AS

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
  june_2021_independent_reading_level,
  june_2021_instructional_reading_level,
  september_2021_independent_reading_level_running_records,
  september_2021_instructional_reading_level_running_records,
  ref_june_2021_benchmark,
  num_ref_june2021_benchmark,
  num_june2021_ind_level,
  june2021_ind_level_minus_benchmarck,
  june_2021_benchmark,
  ref_september_2021_benchmark,
  num_ref_september_2021_benchmark,
  num_sept2021_ind_level,
  sept2021_ind_level_minus_benchmarck,
  september_2021_benchmark,
  raw_growth_june_sept2021,
  count_both_tests,
  growth_june_sept2021

FROM
  `harlemlinksy2122.results.ela_fp_grade1` results

LEFT JOIN 
`harlemlinksy2122.demographics.students` students

ON results.osis = students.osis


WHERE results.osis IS NOT NULL ;



----create a datasource table for ela: fundations grade 1----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.datasources.ela_fundations_grade1` AS

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
--  ela_pct_points,
--  ela_benchmark

FROM
  `harlemlinksy2122.results.ela_fundations_grade1` results

LEFT JOIN 
`harlemlinksy2122.demographics.students` students

ON results.osis = students.osis


WHERE results.osis IS NOT NULL ;





----create a datasource table for ela: heggerty grade 1----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.datasources.ela_heggerty_grade1` AS

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
  `harlemlinksy2122.results.ela_heggerty_grade1` results

LEFT JOIN 
`harlemlinksy2122.demographics.students` students

ON results.osis = students.osis

WHERE results.osis IS NOT NULL ;

---END----------------------------------------------------------------------------