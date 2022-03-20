-----------------------------------------------------------------------------
--run this combined script to refresh the Math Test Prep Grade 5 BigQuery Datasource---
-----------------------------------------------------------------------------

--[step 01.1] import data from classroom trackers

--import grade 5 math test prep quiz 1.1 data
SELECT *
FROM `harlemlinksy2122.trackers.math_test_prep_grade5_quiz_1_1`;


--import grade 5 math test prep quiz 1.2 data
SELECT *
FROM `harlemlinksy2122.trackers.math_test_prep_grade5_quiz_1_2`;


--import grade 5 math test prep quiz 1.3 data
SELECT *
FROM `harlemlinksy2122.trackers.math_test_prep_grade5_quiz_1_3`;

--import grade 5 math test prep quiz 1.4 data
SELECT *
FROM `harlemlinksy2122.trackers.math_test_prep_grade5_quiz_1_4`;

--import grade 5 math test prep quiz 1.5 data
SELECT *
FROM `harlemlinksy2122.trackers.math_test_prep_grade5_quiz_1_5`;

--import grade 5 math practice test data
SELECT *
FROM `harlemlinksy2122.trackers.math_test_prep_grade5_math_practice_test`;
--add a data pull for the next unit below






--[step 01.2] import data from the math test prep question bank

SELECT * 
FROM `harlemlinksy2122.questions.test_prep_math` ;





--[step 01.3] import data from the students (subgroups and demographics) table

SELECT * 
FROM `harlemlinksy2122.demographics.students` ;






--[step 01.4] unpivot classroom trackers
--add a new code block below for each new unit

----unpivot grade 5 math test prep quiz 1.1
--unpivot points earned for grade 5 math test prep quiz 1.1
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.math_test_prep_grade5_quiz_1_1` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.math_test_prep_grade5_quiz_1_1` UNPIVOT(points_earned FOR question_id IN (
    test_prep_math_grade5_quiz_1_1_q01,
    test_prep_math_grade5_quiz_1_1_q02,
    test_prep_math_grade5_quiz_1_1_q03,
    test_prep_math_grade5_quiz_1_1_q04,
    test_prep_math_grade5_quiz_1_1_q05,
    test_prep_math_grade5_quiz_1_1_q06,
    test_prep_math_grade5_quiz_1_1_q07,
    test_prep_math_grade5_quiz_1_1_q08

      )) ;
--unpivot multiple choice responses for grade 5 math test prep quiz 1.1
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.math_test_prep_grade5_quiz_1_1_responses` AS
SELECT
  osis,
  question_id,
  student_answer
FROM
  `harlemlinksy2122.trackers.math_test_prep_grade5_quiz_1_1` UNPIVOT(student_answer FOR question_id IN (
    response_test_prep_math_grade5_quiz_1_1_q01,
    response_test_prep_math_grade5_quiz_1_1_q02,
    response_test_prep_math_grade5_quiz_1_1_q03,
    response_test_prep_math_grade5_quiz_1_1_q04,
    response_test_prep_math_grade5_quiz_1_1_q05,
    response_test_prep_math_grade5_quiz_1_1_q06,
    response_test_prep_math_grade5_quiz_1_1_q07,
    response_test_prep_math_grade5_quiz_1_1_q08

      )) ;




----unpivot grade 5 math test prep quiz 1.2
--unpivot points earned for grade 5 math test prep quiz 1.2
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.math_test_prep_grade5_quiz_1_2` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.math_test_prep_grade5_quiz_1_2` UNPIVOT(points_earned FOR question_id IN (
    test_prep_math_grade5_quiz_1_2_q01,
    test_prep_math_grade5_quiz_1_2_q02,
    test_prep_math_grade5_quiz_1_2_q03,
    test_prep_math_grade5_quiz_1_2_q04,
    test_prep_math_grade5_quiz_1_2_q05,
    test_prep_math_grade5_quiz_1_2_q06,
    test_prep_math_grade5_quiz_1_2_q07,
    test_prep_math_grade5_quiz_1_2_q08

      )) ;
--unpivot multiple choice responses for grade 5 math test prep quiz 1.2
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.math_test_prep_grade5_quiz_1_2_responses` AS
SELECT
  osis,
  question_id,
  student_answer
FROM
  `harlemlinksy2122.trackers.math_test_prep_grade5_quiz_1_2` UNPIVOT(student_answer FOR question_id IN (
    response_test_prep_math_grade5_quiz_1_2_q01,
    response_test_prep_math_grade5_quiz_1_2_q02,
    response_test_prep_math_grade5_quiz_1_2_q03,
    response_test_prep_math_grade5_quiz_1_2_q04,
    response_test_prep_math_grade5_quiz_1_2_q05,
    response_test_prep_math_grade5_quiz_1_2_q06,
    response_test_prep_math_grade5_quiz_1_2_q07,
    response_test_prep_math_grade5_quiz_1_2_q08

      )) ;



----unpivot grade 5 math test prep quiz 1.3
--unpivot points earned for grade 5 math test prep quiz 1.3
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.math_test_prep_grade5_quiz_1_3` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.math_test_prep_grade5_quiz_1_3` UNPIVOT(points_earned FOR question_id IN (
    test_prep_math_grade5_quiz_1_3_q01,
    test_prep_math_grade5_quiz_1_3_q02,
    test_prep_math_grade5_quiz_1_3_q03,
    test_prep_math_grade5_quiz_1_3_q04,
    test_prep_math_grade5_quiz_1_3_q05,
    test_prep_math_grade5_quiz_1_3_q06,
    test_prep_math_grade5_quiz_1_3_q07,
    test_prep_math_grade5_quiz_1_3_q08

      )) ;
--unpivot multiple choice responses for grade 5 math test prep quiz 1.3
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.math_test_prep_grade5_quiz_1_3_responses` AS
SELECT
  osis,
  question_id,
  student_answer
FROM
  `harlemlinksy2122.trackers.math_test_prep_grade5_quiz_1_3` UNPIVOT(student_answer FOR question_id IN (
    response_test_prep_math_grade5_quiz_1_3_q01,
    response_test_prep_math_grade5_quiz_1_3_q02,
    response_test_prep_math_grade5_quiz_1_3_q03,
    response_test_prep_math_grade5_quiz_1_3_q04,
    response_test_prep_math_grade5_quiz_1_3_q05,
    response_test_prep_math_grade5_quiz_1_3_q06,
    response_test_prep_math_grade5_quiz_1_3_q07,
    response_test_prep_math_grade5_quiz_1_3_q08

      )) ;



----unpivot grade 5 math test prep quiz 1.4
--unpivot points earned for grade 5 math test prep quiz 1.4
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.math_test_prep_grade5_quiz_1_4` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.math_test_prep_grade5_quiz_1_4` UNPIVOT(points_earned FOR question_id IN (
    test_prep_math_grade5_quiz_1_4_q01,
    test_prep_math_grade5_quiz_1_4_q02,
    test_prep_math_grade5_quiz_1_4_q03,
    test_prep_math_grade5_quiz_1_4_q04,
    test_prep_math_grade5_quiz_1_4_q05,
    test_prep_math_grade5_quiz_1_4_q06,
    test_prep_math_grade5_quiz_1_4_q07,
    test_prep_math_grade5_quiz_1_4_q08

      )) ;
--unpivot multiple choice responses for grade 5 math test prep quiz 1.4
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.math_test_prep_grade5_quiz_1_4_responses` AS
SELECT
  osis,
  question_id,
  student_answer
FROM
  `harlemlinksy2122.trackers.math_test_prep_grade5_quiz_1_4` UNPIVOT(student_answer FOR question_id IN (
    response_test_prep_math_grade5_quiz_1_4_q01,
    response_test_prep_math_grade5_quiz_1_4_q02,
    response_test_prep_math_grade5_quiz_1_4_q03,
    response_test_prep_math_grade5_quiz_1_4_q04,
    response_test_prep_math_grade5_quiz_1_4_q05,
    response_test_prep_math_grade5_quiz_1_4_q06,
    response_test_prep_math_grade5_quiz_1_4_q07,
    response_test_prep_math_grade5_quiz_1_4_q08

      )) ;




----unpivot grade 5 math test prep quiz 1.5
--unpivot points earned for grade 5 math test prep quiz 1.5
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.math_test_prep_grade5_quiz_1_5` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.math_test_prep_grade5_quiz_1_5` UNPIVOT(points_earned FOR question_id IN (
    test_prep_math_grade5_quiz_1_5_q01,
    test_prep_math_grade5_quiz_1_5_q02,
    test_prep_math_grade5_quiz_1_5_q03,
    test_prep_math_grade5_quiz_1_5_q04,
    test_prep_math_grade5_quiz_1_5_q05,
    test_prep_math_grade5_quiz_1_5_q06,
    test_prep_math_grade5_quiz_1_5_q07,
    test_prep_math_grade5_quiz_1_5_q08

      )) ;
--unpivot multiple choice responses for grade 5 math test prep quiz 1.5
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.math_test_prep_grade5_quiz_1_5_responses` AS
SELECT
  osis,
  question_id,
  student_answer
FROM
  `harlemlinksy2122.trackers.math_test_prep_grade5_quiz_1_5` UNPIVOT(student_answer FOR question_id IN (
    response_test_prep_math_grade5_quiz_1_5_q01,
    response_test_prep_math_grade5_quiz_1_5_q02,
    response_test_prep_math_grade5_quiz_1_5_q03,
    response_test_prep_math_grade5_quiz_1_5_q04,
    response_test_prep_math_grade5_quiz_1_5_q05,
    response_test_prep_math_grade5_quiz_1_5_q06,
    response_test_prep_math_grade5_quiz_1_5_q07,
    response_test_prep_math_grade5_quiz_1_5_q08

      )) ;





----unpivot grade 5 math practice test
--unpivot points earned for grade 5 math practice test
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.math_test_prep_grade5_math_practice_test` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.math_test_prep_grade5_math_practice_test` UNPIVOT(points_earned FOR question_id IN (
   test_prep_math_grade5_math_practice_test_q01,
   test_prep_math_grade5_math_practice_test_q02,
   test_prep_math_grade5_math_practice_test_q03,
   test_prep_math_grade5_math_practice_test_q04,
   test_prep_math_grade5_math_practice_test_q05,
   test_prep_math_grade5_math_practice_test_q06,
   test_prep_math_grade5_math_practice_test_q07,
   test_prep_math_grade5_math_practice_test_q08,
   test_prep_math_grade5_math_practice_test_q09,
   test_prep_math_grade5_math_practice_test_q10,
   test_prep_math_grade5_math_practice_test_q11,
   test_prep_math_grade5_math_practice_test_q12,
   test_prep_math_grade5_math_practice_test_q13,
   test_prep_math_grade5_math_practice_test_q14,
   test_prep_math_grade5_math_practice_test_q15,
   test_prep_math_grade5_math_practice_test_q16,
   test_prep_math_grade5_math_practice_test_q17,
   test_prep_math_grade5_math_practice_test_q18,
   test_prep_math_grade5_math_practice_test_q19,
   test_prep_math_grade5_math_practice_test_q20,
   test_prep_math_grade5_math_practice_test_q21,
   test_prep_math_grade5_math_practice_test_q22,
   test_prep_math_grade5_math_practice_test_q23,
   test_prep_math_grade5_math_practice_test_q24,
   test_prep_math_grade5_math_practice_test_q25,
   test_prep_math_grade5_math_practice_test_q26,
   test_prep_math_grade5_math_practice_test_q27,
   test_prep_math_grade5_math_practice_test_q28,
   test_prep_math_grade5_math_practice_test_q29

      )) ;
--unpivot multiple choice responses for grade 5 math practice test
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.math_test_prep_grade5_math_practice_test_responses` AS
SELECT
  osis,
  question_id,
  student_answer
FROM
  `harlemlinksy2122.trackers.math_test_prep_grade5_math_practice_test` UNPIVOT(student_answer FOR question_id IN (
   response_test_prep_math_grade5_math_practice_test_q01,
   response_test_prep_math_grade5_math_practice_test_q02,
   response_test_prep_math_grade5_math_practice_test_q03,
   response_test_prep_math_grade5_math_practice_test_q04,
   response_test_prep_math_grade5_math_practice_test_q05,
   response_test_prep_math_grade5_math_practice_test_q06,
   response_test_prep_math_grade5_math_practice_test_q07,
   response_test_prep_math_grade5_math_practice_test_q08,
   response_test_prep_math_grade5_math_practice_test_q09,
   response_test_prep_math_grade5_math_practice_test_q10,
   response_test_prep_math_grade5_math_practice_test_q11,
   response_test_prep_math_grade5_math_practice_test_q12,
   response_test_prep_math_grade5_math_practice_test_q13,
   response_test_prep_math_grade5_math_practice_test_q14,
   response_test_prep_math_grade5_math_practice_test_q15,
   response_test_prep_math_grade5_math_practice_test_q16,
   response_test_prep_math_grade5_math_practice_test_q17,
   response_test_prep_math_grade5_math_practice_test_q18,
   response_test_prep_math_grade5_math_practice_test_q19,
   response_test_prep_math_grade5_math_practice_test_q20,
   response_test_prep_math_grade5_math_practice_test_q21,
   response_test_prep_math_grade5_math_practice_test_q22,
   response_test_prep_math_grade5_math_practice_test_q23,
   response_test_prep_math_grade5_math_practice_test_q24,
   response_test_prep_math_grade5_math_practice_test_q25,
   response_test_prep_math_grade5_math_practice_test_q26,
   response_test_prep_math_grade5_math_practice_test_q27,
   response_test_prep_math_grade5_math_practice_test_q28,
   response_test_prep_math_grade5_math_practice_test_q29

      )) ;
--add unpivots for new quizzes below







--[step 01.5] combines all unpivoted trackers into a single table
--add a new code block below for each new unit


----combine points earned for grade 5 math test prep quizzes
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.math_test_prep_grade5` AS
--pull unpivoted data from grade 5 math test prep quiz 1.1
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.unpivots.math_test_prep_grade5_quiz_1_1` 
--pull unpivoted data from grade 5 math test prep quiz 1.2
UNION ALL
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.unpivots.math_test_prep_grade5_quiz_1_2` 
--pull unpivoted data from grade 5 math test prep quiz 1.3
UNION ALL
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.unpivots.math_test_prep_grade5_quiz_1_3` 
--pull unpivoted data from grade 5 math test prep quiz 1.4
UNION ALL
SELECT
  osis,
  question_id,
  points_earned
FROM
 `harlemlinksy2122.unpivots.math_test_prep_grade5_quiz_1_4` 
--pull unpivoted data from grade 5 math test prep quiz 1.5
UNION ALL
SELECT
  osis,
  question_id,
  points_earned
FROM
 `harlemlinksy2122.unpivots.math_test_prep_grade5_quiz_1_5` 
--pull unpivoted data from grade 5 math practice test
UNION ALL
SELECT
  osis,
  question_id,
  points_earned
FROM
 `harlemlinksy2122.unpivots.math_test_prep_grade5_math_practice_test`
  --insert UNION ALL code block here for the next quiz 
  
  ;



----combine multiple choice responses for grade 5 math test prep quizzes
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.math_test_prep_grade5_responses` AS
--pull unpivoted data from grade 5 math test prep quiz 1.1 responses
SELECT
  osis,
  question_id,
  student_answer
FROM
  `harlemlinksy2122.unpivots.math_test_prep_grade5_quiz_1_1_responses` 
--pull unpivoted data from grade 5 math test prep quiz 1.2 responses
UNION ALL
SELECT
  osis,
  question_id,
  student_answer
FROM
  `harlemlinksy2122.unpivots.math_test_prep_grade5_quiz_1_2_responses` 
--pull unpivoted data from grade 5 math test prep quiz 1.3 responses
UNION ALL
SELECT
  osis,
  question_id,
  student_answer
FROM
  `harlemlinksy2122.unpivots.math_test_prep_grade5_quiz_1_3_responses` 
--pull unpivoted data from grade 5 math test prep quiz 1.4 responses
UNION ALL
SELECT
  osis,
  question_id,
  student_answer
FROM
 `harlemlinksy2122.unpivots.math_test_prep_grade5_quiz_1_4_responses` 
--pull unpivoted data from grade 5 math test prep quiz 1.5 responses
UNION ALL
SELECT
  osis,
  question_id,
  student_answer
FROM
 `harlemlinksy2122.unpivots.math_test_prep_grade5_quiz_1_5_responses` 
--pull unpivoted data from grade 5 math practice test responses
UNION ALL
SELECT
  osis,
  question_id,
  student_answer
FROM
 `harlemlinksy2122.unpivots.math_test_prep_grade5_math_practice_test_responses` 
  --insert UNION ALL code block here for the next quiz 
  
  ;






--[step 01.6] join questions table to unions table to create results table

CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.math_test_prep_grade5_responses_str` AS

SELECT 
osis,
question_id AS response_id,
student_answer,
--convert the item analysis question id to match the points earned question id
--this field will be used to join the multiple choice responses to the points earned results
SUBSTRING(question_id, 10) AS question_id
FROM `harlemlinksy2122.unions.math_test_prep_grade5_responses`;





CREATE OR REPLACE TABLE
--the results is used to calculate benchmarks grouped by students.osis and questions.unit
  `harlemlinksy2122.results.math_test_prep_grade5` AS
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
  correct_answer,
  category,
  SUBSTRING(responses.question_id, 10) AS substr_question_id,
  question_type
FROM
  `harlemlinksy2122.unions.math_test_prep_grade5_responses_str` responses
  
LEFT JOIN
  `harlemlinksy2122.unions.math_test_prep_grade5` unions
ON
  unions.osis = responses.osis AND 
  unions.question_id = responses.question_id 
LEFT JOIN
  `harlemlinksy2122.questions.test_prep_math` questions
ON
  unions.question_id = questions.question_id

WHERE 
  unions.osis IS NOT NULL ;






--[step 01.7] use the results table to calculate benchmarks using CASE WHEN
   
CREATE OR REPLACE TABLE
  `harlemlinksy2122.benchmarks.math_test_prep_grade5` AS
SELECT
  osis,
  quiz,
  SUM(points_earned)/SUM(points_available) AS math_tp_pct_points,
--used to add student-assessment-level benchmarks to tables with student-question level granularity
  CASE
    WHEN SUM(points_earned)/SUM(points_available) >= .83 THEN "Level 4"
    WHEN SUM(points_earned)/SUM(points_available) BETWEEN .66
  AND .82999999 THEN "Level 3"
    WHEN SUM(points_earned)/SUM(points_available) BETWEEN .46
  AND .65999999 THEN "Level 2"
    WHEN SUM(points_earned)/SUM(points_available) < .46 THEN "Level 1"
  ELSE
  ""
END
  AS math_tp_benchmark
FROM
  `harlemlinksy2122.results.math_test_prep_grade5`
WHERE
  osis IS NOT NULL
GROUP BY
  1,
  2 ;






--[step 01.8] creates or replaces table `harlemlinksy2122.datasources.math_tp_grade5`
--this table is linked directly to Google Data Studio as a datasource
--it serves as the datasouse for the grade 5 math test prep dashboard

CREATE OR REPLACE TABLE
  `harlemlinksy2122.datasources.math_tp_grade5` AS

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
  --also pull these test-rmathted columns from the results table
  question_id,
  ccls_standard,
  standard_description,
  question_text,
  results.quiz,
  points_earned,
  points_available,
  student_answer,
  correct_answer,
  category,
  math_tp_pct_points,
  math_tp_benchmark,
  question_type

FROM
  `harlemlinksy2122.results.math_test_prep_grade5` results

LEFT JOIN 
`harlemlinksy2122.demographics.students` students

ON results.osis = students.osis

LEFT JOIN
`harlemlinksy2122.benchmarks.math_test_prep_grade5` benchmarks

ON results.osis = benchmarks.osis AND results.quiz = benchmarks.quiz

WHERE results.osis IS NOT NULL ;

---END----------------------------------------------------------------------------