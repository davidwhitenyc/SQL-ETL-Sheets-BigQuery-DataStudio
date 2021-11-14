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




----create a results table for ela: f&p grade 1----
--this data pull will likely change in the future
--for now, we'll pull in the entire grade 1 f&p tracker
CREATE OR REPLACE TABLE
  `harlemlinksy2122.results.ela_fp_grade1` AS
SELECT *
FROM
`harlemlinksy2122.trackers.ela_fp_grade1_september`;