--[step 01.6] join questions table to unions table to create results table

CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_test_prep_grade3_responses_str` AS

SELECT 
osis,
question_id AS response_id,
student_answer,
--convert the item analysis question id to match the points earned question id
--this field will be used to join the multiple choice responses to the points earned results
SUBSTRING(question_id, 10) AS question_id
FROM `harlemlinksy2122.unions.ela_test_prep_grade3_responses`;





CREATE OR REPLACE TABLE
--the results is used to calculate benchmarks grouped by students.osis and questions.unit
  `harlemlinksy2122.results.ela_test_prep_grade3` AS
SELECT
  unions.osis,
  unions.question_id,
--pulls in columns for questions.points_available and questions.unit
  grade_level,
  quiz,
  ccls_standard,
  standard_description,
  question_text,
  points_earned,
  points_available,
  student_answer,
  SUBSTRING(responses.question_id, 10) AS substr_question_id
FROM
  `harlemlinksy2122.unions.ela_test_prep_grade3_responses_str` responses
  
LEFT JOIN
  `harlemlinksy2122.unions.ela_test_prep_grade3` unions
ON
  unions.osis = responses.osis AND 
  unions.question_id = responses.question_id 
LEFT JOIN
  `harlemlinksy2122.questions.test_prep_ela` questions
ON
  unions.question_id = questions.question_id

WHERE 
  unions.osis IS NOT NULL ;