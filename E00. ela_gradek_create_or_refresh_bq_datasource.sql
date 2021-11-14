-----------------------------------------------------------------------------
--run this combined script to refresh the ELA Grade K BigQuery Datasource---
-----------------------------------------------------------------------------
--[step 01.1] import data from classroom trackers


----import grade k ela: reading data (all areas, all units and/or assessments)----
--import ela: reading unit 1
SELECT *
FROM `harlemlinksy2122.trackers.ela_reading_gradek_unit1`;


--import ela: reading unit 2
SELECT *
FROM `harlemlinksy2122.trackers.ela_reading_gradek_unit2`;
--add the next ela: reading unit below


----import grade k ela: writing data (all units)----
--import ela: writing grade k baseline
SELECT *
FROM `harlemlinksy2122.trackers.ela_writing_gradek_baseline`;
--add the next ela: writing unit below


-- ----import grade k ela: f&p data (all windows)----
-- --import ela: f&p grade 2 september
-- SELECT *
-- FROM `harlemlinksy2122.trackers.ela_fp_grade2_september`;
-- --add the next ela: f&p window below



----import grade k ela: fundations data (all assessments)----
--import ela: fundations assessment 1
SELECT *
FROM `harlemlinksy2122.trackers.ela_fundations_gradek_assessment1`;
--add a data pull for the next ela: fundations assessment below



----import grade k ela: heggerty data (all assessments)----
--import ela: heggerty baseline assessment
SELECT *
FROM `harlemlinksy2122.trackers.ela_heggerty_gradek_baseline`;

--import ela: heggerty assessment 1
SELECT *
FROM `harlemlinksy2122.trackers.ela_heggerty_gradek_assessment1`;
--add a data pull for the next ela: heggerty assessment below



----import grade k ela: uppercase letter recognition data (all assessments)----
--import ela: uppercase letter recognition baseline assessment
SELECT *
FROM `harlemlinksy2122.trackers.ela_uppercase_letters_gradek_baseline`;

--import ela: uppercase letter recognition winter assessment
SELECT *
FROM `harlemlinksy2122.trackers.ela_uppercase_letters_gradek_winter`;
--add a data pull for the next ela: uppercase letter recognition assessment below



----import grade k ela: lowercase letter recognition data (all assessments)----
--import ela: lowercase letter recognition baseline assessment
SELECT *
FROM `harlemlinksy2122.trackers.ela_lowercase_letters_gradek_baseline`;

--import ela: lowercase letter recognition winter assessment
SELECT *
FROM `harlemlinksy2122.trackers.ela_lowercase_letters_gradek_winter`;
--add a data pull for the next ela: lowercase letter recognition assessment below



----import grade k ela: letter sounds data (all assessments)----
--import ela: lowercase letter sounds baseline assessment
SELECT *
FROM `harlemlinksy2122.trackers.ela_letter_sounds_gradek_baseline`;

--import ela: letter sounds winter assessment
SELECT *
FROM `harlemlinksy2122.trackers.ela_letter_sounds_gradek_winter`;
--add a data pull for the next ela: letter sounds assessment below





--[step 01.2] import data from the ela assessments question bank

SELECT * 
FROM `harlemlinksy2122.questions.ela` ;





--[step 01.3] import data from the students (subgroups and demographics) table

SELECT * 
FROM `harlemlinksy2122.demographics.students` ;





--[step 01.4] unpivot classroom trackers
--add a new code block below for each new unit

----unpivot ela: reading data (all units)----
--unpivot ela: reading grade k unit 1
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_reading_gradek_unit1` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_reading_gradek_unit1` UNPIVOT(points_earned FOR question_id IN (reading_gradek_unit1_01,
    reading_gradek_unit1_02,
    reading_gradek_unit1_03,
    reading_gradek_unit1_04,
    reading_gradek_unit1_05,
    reading_gradek_unit1_06,
    reading_gradek_unit1_07,
    reading_gradek_unit1_08,
    reading_gradek_unit1_09,
    reading_gradek_unit1_10,
    reading_gradek_unit1_11,
    reading_gradek_unit1_12

      )) ;

--unpivot ela: reading grade k unit 2
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_reading_gradek_unit2` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_reading_gradek_unit2` UNPIVOT(points_earned FOR question_id IN (reading_gradek_unit2_01,
    reading_gradek_unit2_02,
    reading_gradek_unit2_03,
    reading_gradek_unit2_04,
    reading_gradek_unit2_05,
    reading_gradek_unit2_06,
    reading_gradek_unit2_07,
    reading_gradek_unit2_08,
    reading_gradek_unit2_09,
    reading_gradek_unit2_10

      )) ;
--add the next ela: reading unit below


----unpivot ela: writing data (all units)----
--unpivot ela: writing grade k baseline
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_writing_gradek_baseline` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_writing_gradek_baseline` UNPIVOT(points_earned FOR question_id IN (writing_gradek_baseline_01,
    writing_gradek_baseline_02,
    writing_gradek_baseline_03

      )) ;
--add the next ela: writing unit below


----unpivot ela: fundations data (all assessments)----
--unpivot ela: fundations grade k assessment #1
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_fundations_gradek_assessment1` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_fundations_gradek_assessment1` UNPIVOT(points_earned FOR question_id IN (fundations_gradek_assessment1_01,
    fundations_gradek_assessment1_02,
    fundations_gradek_assessment1_03,
    fundations_gradek_assessment1_04,
    fundations_gradek_assessment1_05,
    fundations_gradek_assessment1_06,
    fundations_gradek_assessment1_07,
    fundations_gradek_assessment1_08,
    fundations_gradek_assessment1_09,
    fundations_gradek_assessment1_10,
    fundations_gradek_assessment1_11,
    fundations_gradek_assessment1_12,
    fundations_gradek_assessment1_13,
    fundations_gradek_assessment1_14,
    fundations_gradek_assessment1_15,
    fundations_gradek_assessment1_16,
    fundations_gradek_assessment1_17,
    fundations_gradek_assessment1_18,
    fundations_gradek_assessment1_19,
    fundations_gradek_assessment1_20,
    fundations_gradek_assessment1_21,
    fundations_gradek_assessment1_22,
    fundations_gradek_assessment1_23,
    fundations_gradek_assessment1_24,
    fundations_gradek_assessment1_25,
    fundations_gradek_assessment1_26,
    fundations_gradek_assessment1_27,
    fundations_gradek_assessment1_28,
    fundations_gradek_assessment1_29,
    fundations_gradek_assessment1_30,
    fundations_gradek_assessment1_31,
    fundations_gradek_assessment1_32,
    fundations_gradek_assessment1_33,
    fundations_gradek_assessment1_34,
    fundations_gradek_assessment1_35,
    fundations_gradek_assessment1_36,
    fundations_gradek_assessment1_37,
    fundations_gradek_assessment1_38,
    fundations_gradek_assessment1_39,
    fundations_gradek_assessment1_40

      )) ;
--add the next ela: fundations assessment below




----unpivot ela: heggerty data (all assessments)----
--unpivot ela: heggerty grade k baseline assessment
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_heggerty_gradek_baseline` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_heggerty_gradek_baseline` UNPIVOT(points_earned FOR question_id IN (heggerty_gradek_baseline_01,
    heggerty_gradek_baseline_02,
    heggerty_gradek_baseline_03,
    heggerty_gradek_baseline_04,
    heggerty_gradek_baseline_05,
    heggerty_gradek_baseline_06

      )) ;
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_heggerty_gradek_assessment1` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_heggerty_gradek_assessment1` UNPIVOT(points_earned FOR question_id IN (heggerty_gradek_assessment1_01,
    heggerty_gradek_assessment1_02,
    heggerty_gradek_assessment1_03,
    heggerty_gradek_assessment1_04,
    heggerty_gradek_assessment1_05,
    heggerty_gradek_assessment1_06,
    heggerty_gradek_assessment1_07,
    heggerty_gradek_assessment1_08

      )) ;
--add the next ela: heggerty assessment below




----unpivot grade k ela: uppercase letter recognition data (all assessments)----
--unpivot ela: uppercase letter recognition baseline assessment
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_uppercase_letters_gradek_baseline` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_uppercase_letters_gradek_baseline` UNPIVOT(points_earned FOR question_id IN (letter_recognition_uppercase_baseline_H,
    letter_recognition_uppercase_baseline_E,
    letter_recognition_uppercase_baseline_M,
    letter_recognition_uppercase_baseline_T,
    letter_recognition_uppercase_baseline_I,
    letter_recognition_uppercase_baseline_P,
    letter_recognition_uppercase_baseline_Q,
    letter_recognition_uppercase_baseline_U,
    letter_recognition_uppercase_baseline_O,
    letter_recognition_uppercase_baseline_C,
    letter_recognition_uppercase_baseline_W,
    letter_recognition_uppercase_baseline_B,
    letter_recognition_uppercase_baseline_X,
    letter_recognition_uppercase_baseline_V,
    letter_recognition_uppercase_baseline_J,
    letter_recognition_uppercase_baseline_S,
    letter_recognition_uppercase_baseline_G,
    letter_recognition_uppercase_baseline_N,
    letter_recognition_uppercase_baseline_Y,
    letter_recognition_uppercase_baseline_K,
    letter_recognition_uppercase_baseline_Z,
    letter_recognition_uppercase_baseline_R,
    letter_recognition_uppercase_baseline_A,
    letter_recognition_uppercase_baseline_F,
    letter_recognition_uppercase_baseline_L,
    letter_recognition_uppercase_baseline_D

      )) ;
--unpivot ela: uppercase letter recognition winter assessment
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_uppercase_letters_gradek_winter` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_uppercase_letters_gradek_winter` UNPIVOT(points_earned FOR question_id IN (letter_recognition_uppercase_winter_H,
    letter_recognition_uppercase_winter_E,
    letter_recognition_uppercase_winter_M,
    letter_recognition_uppercase_winter_T,
    letter_recognition_uppercase_winter_I,
    letter_recognition_uppercase_winter_P,
    letter_recognition_uppercase_winter_Q,
    letter_recognition_uppercase_winter_U,
    letter_recognition_uppercase_winter_O,
    letter_recognition_uppercase_winter_C,
    letter_recognition_uppercase_winter_W,
    letter_recognition_uppercase_winter_B,
    letter_recognition_uppercase_winter_X,
    letter_recognition_uppercase_winter_V,
    letter_recognition_uppercase_winter_J,
    letter_recognition_uppercase_winter_S,
    letter_recognition_uppercase_winter_G,
    letter_recognition_uppercase_winter_N,
    letter_recognition_uppercase_winter_Y,
    letter_recognition_uppercase_winter_K,
    letter_recognition_uppercase_winter_Z,
    letter_recognition_uppercase_winter_R,
    letter_recognition_uppercase_winter_A,
    letter_recognition_uppercase_winter_F,
    letter_recognition_uppercase_winter_L,
    letter_recognition_uppercase_winter_D

      )) ;
--add the next ela: uppercase letter recognition assessment below




----unpivot grade k ela: lowercase letter recognition data (all assessments)----
--unpivot ela: lowercase letter recognition baseline assessment
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_lowercase_letters_gradek_baseline` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_lowercase_letters_gradek_baseline` UNPIVOT(points_earned FOR question_id IN (letter_recognition_lowercase_baseline_h,
    letter_recognition_lowercase_baseline_e,
    letter_recognition_lowercase_baseline_m,
    letter_recognition_lowercase_baseline_t,
    letter_recognition_lowercase_baseline_i,
    letter_recognition_lowercase_baseline_p,
    letter_recognition_lowercase_baseline_q,
    letter_recognition_lowercase_baseline_u,
    letter_recognition_lowercase_baseline_o,
    letter_recognition_lowercase_baseline_c,
    letter_recognition_lowercase_baseline_w,
    letter_recognition_lowercase_baseline_b,
    letter_recognition_lowercase_baseline_x,
    letter_recognition_lowercase_baseline_v,
    letter_recognition_lowercase_baseline_j,
    letter_recognition_lowercase_baseline_s,
    letter_recognition_lowercase_baseline_g,
    letter_recognition_lowercase_baseline_n,
    letter_recognition_lowercase_baseline_y,
    letter_recognition_lowercase_baseline_k,
    letter_recognition_lowercase_baseline_z,
    letter_recognition_lowercase_baseline_r,
    letter_recognition_lowercase_baseline_a,
    letter_recognition_lowercase_baseline_f,
    letter_recognition_lowercase_baseline_l,
    letter_recognition_lowercase_baseline_d

      )) ;
--unpivot ela: lowercase letter recognition winter assessment
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_lowercase_letters_gradek_winter` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_lowercase_letters_gradek_winter` UNPIVOT(points_earned FOR question_id IN (letter_recognition_lowercase_winter_h,
    letter_recognition_lowercase_winter_e,
    letter_recognition_lowercase_winter_m,
    letter_recognition_lowercase_winter_t,
    letter_recognition_lowercase_winter_i,
    letter_recognition_lowercase_winter_p,
    letter_recognition_lowercase_winter_q,
    letter_recognition_lowercase_winter_u,
    letter_recognition_lowercase_winter_o,
    letter_recognition_lowercase_winter_c,
    letter_recognition_lowercase_winter_w,
    letter_recognition_lowercase_winter_b,
    letter_recognition_lowercase_winter_x,
    letter_recognition_lowercase_winter_v,
    letter_recognition_lowercase_winter_j,
    letter_recognition_lowercase_winter_s,
    letter_recognition_lowercase_winter_g,
    letter_recognition_lowercase_winter_n,
    letter_recognition_lowercase_winter_y,
    letter_recognition_lowercase_winter_k,
    letter_recognition_lowercase_winter_z,
    letter_recognition_lowercase_winter_r,
    letter_recognition_lowercase_winter_a,
    letter_recognition_lowercase_winter_f,
    letter_recognition_lowercase_winter_l,
    letter_recognition_lowercase_winter_d

      )) ;
--add the next ela: lowercase letter recognition assessment below



----unpivot grade k ela: letter sounds data (all assessments)----
--unpivot ela: letter sounds baseline assessment
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_letter_sounds_gradek_baseline` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_letter_sounds_gradek_baseline` UNPIVOT(points_earned FOR question_id IN (letter_sounds_baseline_h,
    letter_sounds_baseline_e,
    letter_sounds_baseline_m,
    letter_sounds_baseline_t,
    letter_sounds_baseline_i,
    letter_sounds_baseline_p,
    letter_sounds_baseline_q,
    letter_sounds_baseline_u,
    letter_sounds_baseline_o,
    letter_sounds_baseline_c,
    letter_sounds_baseline_w,
    letter_sounds_baseline_b,
    letter_sounds_baseline_x,
    letter_sounds_baseline_v,
    letter_sounds_baseline_j,
    letter_sounds_baseline_s,
    letter_sounds_baseline_g,
    letter_sounds_baseline_n,
    letter_sounds_baseline_y,
    letter_sounds_baseline_k,
    letter_sounds_baseline_z,
    letter_sounds_baseline_r,
    letter_sounds_baseline_a,
    letter_sounds_baseline_f,
    letter_sounds_baseline_l,
    letter_sounds_baseline_d

      )) ;
--unpivot ela: letter sounds winter assessment
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_letter_sounds_gradek_winter` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_letter_sounds_gradek_winter` UNPIVOT(points_earned FOR question_id IN (letter_sounds_winter_h,
    letter_sounds_winter_e,
    letter_sounds_winter_m,
    letter_sounds_winter_t,
    letter_sounds_winter_i,
    letter_sounds_winter_p,
    letter_sounds_winter_q,
    letter_sounds_winter_u,
    letter_sounds_winter_o,
    letter_sounds_winter_c,
    letter_sounds_winter_w,
    letter_sounds_winter_b,
    letter_sounds_winter_x,
    letter_sounds_winter_v,
    letter_sounds_winter_j,
    letter_sounds_winter_s,
    letter_sounds_winter_g,
    letter_sounds_winter_n,
    letter_sounds_winter_y,
    letter_sounds_winter_k,
    letter_sounds_winter_z,
    letter_sounds_winter_r,
    letter_sounds_winter_a,
    letter_sounds_winter_f,
    letter_sounds_winter_l,
    letter_sounds_winter_d

      )) ;
--add the next ela: letter sounds assessment below






--[step 01.5] combines all unpivoted trackers into a single table
--add a new code block below for each new unit

----create unions table for all grade k ela: reading level 3 assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_reading_gradek` AS
--pull unpivoted data from ela: reading grade k unit 1
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_reading_gradek_unit1`
--pull unpivoted data from ela: reading grade k unit 2
UNION ALL
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_reading_gradek_unit2`

 ;
--insert UNION ALL code block here for the next unit 




----create unions table for all grade k ela: writing level 3 assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_writing_gradek` AS
--pull unpivoted data from ela: reading grade k unit 1
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_writing_gradek_baseline` ;
--insert UNION ALL code block here for the next unit 




----create unions table for all grade k ela: fundations assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_fundations_gradek` AS
--pull unpivoted data from ela: fundations grade k assessment 1
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_fundations_gradek_assessment1`;
--insert UNION ALL code block here for the next assessment



----create unions table for all grade k ela: heggerty assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_heggerty_gradek` AS
--pull unpivoted data from ela: heggerty grade k baseline
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_heggerty_gradek_baseline`
--pull unpivoted data from ela: heggerty grade k assessment 1
UNION ALL
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.unpivots.ela_heggerty_gradek_assessment1` ;
--insert UNION ALL code block here for the next assessment



----create unions table for all grade k ela: uppercase letter recognition assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_uppercase_letters_gradek` AS
--pull unpivoted data from ela: uppercase letter recognition grade k baseline assessment
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_uppercase_letters_gradek_baseline`
--pull unpivoted data from ela: uppercase letter recognition grade k winter assessment
UNION ALL
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.unpivots.ela_uppercase_letters_gradek_winter` ;
--insert UNION ALL code block here for the next assessment



----create unions table for all grade k ela: lowercase letter recognition assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_lowercase_letters_gradek` AS
--pull unpivoted data from ela: lowercase letter recognition grade k baseline assessment
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_lowercase_letters_gradek_baseline`
--pull unpivoted data from ela: lowercase letter recognition grade k winter assessment
UNION ALL
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.unpivots.ela_lowercase_letters_gradek_winter` ;
--insert UNION ALL code block here for the next assessment


----create unions table for all grade k ela: letter sounds assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_letter_sounds_gradek` AS
--pull unpivoted data from ela: letter sounds grade k baseline assessment
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_letter_sounds_gradek_baseline`
--pull unpivoted data from ela: letter sounds grade k winter assessment
UNION ALL
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.unpivots.ela_letter_sounds_gradek_winter` ;
--insert UNION ALL code block here for the next assessment







--[step 01.6] join questions table to unions table to create results table


----create a results table for ela: reading grade k----
CREATE OR REPLACE TABLE
--the results is used to calculate benchmarks grouped by students.osis and questions.unit
  `harlemlinksy2122.results.ela_reading_gradek` AS
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
  `harlemlinksy2122.unions.ela_reading_gradek` unions
LEFT JOIN
  `harlemlinksy2122.questions.ela` questions
ON
  unions.question_id = questions.question_id
WHERE 
  unions.osis IS NOT NULL ;




----create a results table for ela: writing grade k----
CREATE OR REPLACE TABLE
--the results is used to calculate benchmarks grouped by students.osis and questions.unit
  `harlemlinksy2122.results.ela_writing_gradek` AS
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
  `harlemlinksy2122.unions.ela_writing_gradek` unions
LEFT JOIN
  `harlemlinksy2122.questions.ela` questions
ON
  unions.question_id = questions.question_id
WHERE 
  unions.osis IS NOT NULL ;



----create a results table for ela: fundations grade k----
CREATE OR REPLACE TABLE
--the results is used to calculate benchmarks grouped by students.osis and questions.unit
  `harlemlinksy2122.results.ela_fundations_gradek` AS
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
  `harlemlinksy2122.unions.ela_fundations_gradek` unions
LEFT JOIN
  `harlemlinksy2122.questions.ela` questions
ON
  unions.question_id = questions.question_id
WHERE 
  unions.osis IS NOT NULL ;




----create a results table for ela: heggerty grade k----
CREATE OR REPLACE TABLE
--the results is used to calculate benchmarks grouped by students.osis and questions.unit
  `harlemlinksy2122.results.ela_heggerty_gradek` AS
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
  `harlemlinksy2122.unions.ela_heggerty_gradek` unions
LEFT JOIN
  `harlemlinksy2122.questions.ela` questions
ON
  unions.question_id = questions.question_id
WHERE 
  unions.osis IS NOT NULL ;




----create a results table for ela: f&p grade k----


----create a results table for ela: uppercase letter recognition grade k----
CREATE OR REPLACE TABLE
--the results is used to calculate benchmarks grouped by students.osis and questions.unit
  `harlemlinksy2122.results.ela_uppercase_letters_gradek` AS
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
  `harlemlinksy2122.unions.ela_uppercase_letters_gradek` unions
LEFT JOIN
  `harlemlinksy2122.questions.ela` questions
ON
  unions.question_id = questions.question_id
WHERE 
  unions.osis IS NOT NULL ;




----create a results table for ela: lowercase letter recognition grade k----
CREATE OR REPLACE TABLE
--the results is used to calculate benchmarks grouped by students.osis and questions.unit
  `harlemlinksy2122.results.ela_lowercase_letters_gradek` AS
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
  `harlemlinksy2122.unions.ela_lowercase_letters_gradek` unions
LEFT JOIN
  `harlemlinksy2122.questions.ela` questions
ON
  unions.question_id = questions.question_id
WHERE 
  unions.osis IS NOT NULL ;




----create a results table for ela: letter sounds grade k----
CREATE OR REPLACE TABLE
--the results is used to calculate benchmarks grouped by students.osis and questions.unit
  `harlemlinksy2122.results.ela_letter_sounds_gradek` AS
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
  `harlemlinksy2122.unions.ela_letter_sounds_gradek` unions
LEFT JOIN
  `harlemlinksy2122.questions.ela` questions
ON
  unions.question_id = questions.question_id
WHERE 
  unions.osis IS NOT NULL ;






--[step 01.8] create or replace reading, writing, f&p, fundations and heggerty datasources
--these (5) components are the datasources for the ela grade k dashboard

----create a datasources table for ela: reading grade k----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.datasources.ela_reading_gradek` AS

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
  `harlemlinksy2122.results.ela_reading_gradek` results

LEFT JOIN 
`harlemlinksy2122.demographics.students` students

ON results.osis = students.osis

WHERE results.osis IS NOT NULL ;




----create a datasources table for ela: writing grade k----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.datasources.ela_writing_gradek` AS

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
  `harlemlinksy2122.results.ela_writing_gradek` results

LEFT JOIN 
`harlemlinksy2122.demographics.students` students

ON results.osis = students.osis

WHERE results.osis IS NOT NULL ;



-- ----create a datasources table for ela: F&P grade k----
-- CREATE OR REPLACE TABLE
--   `harlemlinksy2122.datasources.ela_fp_gradek` AS

-- SELECT
--   --start by pulling the osis on the combined results table
--   results.osis,
--   --pull these columns from the .demographics.students table
--   student,
--   sy_21_22_class,
--   sped,
--   enl,
--   hl_upk,
--   holdovers,
--   new_students,
--   ais,
--   --also pull these test-related columns from the results table
--   june_2021_independent_reading_level,
--   june_2021_instructional_reading_level,
--   september_2021_independent_reading_level_running_records,
--   september_2021_instructional_reading_level_running_records,
--   ref_june_2021_benchmark,
--   num_ref_june2021_benchmark,
--   num_june2021_ind_level,
--   june2021_ind_level_minus_benchmarck,
--   june_2021_benchmark,
--   ref_september_2021_benchmark,
--   num_ref_september_2021_benchmark,
--   num_sept2021_ind_level,
--   sept2021_ind_level_minus_benchmarck,
--   september_2021_benchmark,
--   raw_growth_june_sept2021,
--   count_both_tests,
--   growth_june_sept2021

-- FROM
--   `harlemlinksy2122.results.ela_fp_gradek` results

-- LEFT JOIN 
-- `harlemlinksy2122.demographics.students` students

-- ON results.osis = students.osis

-- WHERE results.osis IS NOT NULL ;



----create a datasources table for ela: fundations grade k----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.datasources.ela_fundations_gradek` AS

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
  `harlemlinksy2122.results.ela_fundations_gradek` results

LEFT JOIN 
`harlemlinksy2122.demographics.students` students

ON results.osis = students.osis

WHERE results.osis IS NOT NULL ;




----create a datasources table for ela: heggerty grade k----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.datasources.ela_heggerty_gradek` AS

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
  `harlemlinksy2122.results.ela_heggerty_gradek` results

LEFT JOIN 
`harlemlinksy2122.demographics.students` students

ON results.osis = students.osis

WHERE results.osis IS NOT NULL ;




----create a datasources table for ela: uppercase letter recognition grade k----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.datasources.ela_uppercase_letters_gradek` AS

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
  `harlemlinksy2122.results.ela_uppercase_letters_gradek` results

LEFT JOIN 
`harlemlinksy2122.demographics.students` students

ON results.osis = students.osis

WHERE results.osis IS NOT NULL ;




----create a datasources table for ela: lowercase letter recognition grade k----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.datasources.ela_lowercase_letters_gradek` AS

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
  `harlemlinksy2122.results.ela_lowercase_letters_gradek` results

LEFT JOIN 
`harlemlinksy2122.demographics.students` students

ON results.osis = students.osis

WHERE results.osis IS NOT NULL ;




----create a datasources table for ela: letter sounds grade k----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.datasources.ela_letter_sounds_gradek` AS

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
  `harlemlinksy2122.results.ela_letter_sounds_gradek` results

LEFT JOIN 
`harlemlinksy2122.demographics.students` students

ON results.osis = students.osis

WHERE results.osis IS NOT NULL ;


---END----------------------------------------------------------------------------