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