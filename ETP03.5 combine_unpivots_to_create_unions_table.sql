--[step 01.5] combines all unpivoted trackers into a single table
--add a new code block below for each new unit


----combine points earned for grade 3 ela test prep quizzes
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_test_prep_grade3` AS
--pull unpivoted data from grade 3 ela test prep quiz 1.1
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.unpivots.ela_test_prep_grade3_quiz_1_1` 
--pull unpivoted data from grade 3 ela test prep quiz 1.2b
UNION ALL
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.unpivots.ela_test_prep_grade3_quiz_1_2b` 
--pull unpivoted data from grade 3 ela test prep quiz 1.3
UNION ALL
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.unpivots.ela_test_prep_grade3_quiz_1_3` 
--pull unpivoted data from grade 3 ela test prep quiz 1.4
UNION ALL
SELECT
  osis,
  question_id,
  points_earned
FROM
 `harlemlinksy2122.unpivots.ela_test_prep_grade3_quiz_1_4` 
  --insert UNION ALL code block here for the next quiz 
  
  ;



----combine multiple choice responses for grade 3 ela test prep quizzes
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_test_prep_grade3_responses` AS
--pull unpivoted data from grade 3 ela test prep quiz 1.1 responses
SELECT
  osis,
  question_id,
  student_answer
FROM
  `harlemlinksy2122.unpivots.ela_test_prep_grade3_quiz_1_1_responses` 
--pull unpivoted data from grade 3 ela test prep quiz 1.2b responses
UNION ALL
SELECT
  osis,
  question_id,
  student_answer
FROM
  `harlemlinksy2122.unpivots.ela_test_prep_grade3_quiz_1_2b_responses` 
--pull unpivoted data from grade 3 ela test prep quiz 1.3 responses
UNION ALL
SELECT
  osis,
  question_id,
  student_answer
FROM
  `harlemlinksy2122.unpivots.ela_test_prep_grade3_quiz_1_3_responses` 
--pull unpivoted data from grade 3 ela test prep quiz 1.4 responses
UNION ALL
SELECT
  osis,
  question_id,
  student_answer
FROM
 `harlemlinksy2122.unpivots.ela_test_prep_grade3_quiz_1_4_responses` 
  --insert UNION ALL code block here for the next quiz 
  
  ;