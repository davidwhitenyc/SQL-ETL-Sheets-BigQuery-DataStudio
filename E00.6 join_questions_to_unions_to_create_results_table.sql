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