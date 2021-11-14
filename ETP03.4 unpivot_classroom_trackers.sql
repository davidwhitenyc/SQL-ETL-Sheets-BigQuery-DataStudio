--[step 01.4] unpivot classroom trackers
--add a new code block below for each new unit

----unpivot grade 3 ela test prep quiz 1.1
--unpivot points earned for grade 3 ela test prep quiz 1.1
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_test_prep_grade3_quiz_1_1` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_test_prep_grade3_quiz_1_1` UNPIVOT(points_earned FOR question_id IN (test_prep_ela_grade3_quiz_1_1_q01,
    test_prep_ela_grade3_quiz_1_1_q02,
    test_prep_ela_grade3_quiz_1_1_q03,
    test_prep_ela_grade3_quiz_1_1_q04,
    test_prep_ela_grade3_quiz_1_1_q05,
    test_prep_ela_grade3_quiz_1_1_q06

      )) ;
--unpivot multiple choice responses for grade 3 ela test prep quiz 1.1
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_test_prep_grade3_quiz_1_1_responses` AS
SELECT
  osis,
  question_id,
  student_answer
FROM
  `harlemlinksy2122.trackers.ela_test_prep_grade3_quiz_1_1` UNPIVOT(student_answer FOR question_id IN (response_test_prep_ela_grade3_quiz_1_1_q01,
    response_test_prep_ela_grade3_quiz_1_1_q02,
    response_test_prep_ela_grade3_quiz_1_1_q03,
    response_test_prep_ela_grade3_quiz_1_1_q04,
    response_test_prep_ela_grade3_quiz_1_1_q05,
    response_test_prep_ela_grade3_quiz_1_1_q06

      )) ;




----unpivot grade 3 ela test prep quiz 1.2b
--unpivot points earned for grade 3 ela test prep quiz 1.2b
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_test_prep_grade3_quiz_1_2b` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_test_prep_grade3_quiz_1_2b` UNPIVOT(points_earned FOR question_id IN (test_prep_ela_grade3_quiz_1_2b_q01,
    test_prep_ela_grade3_quiz_1_2b_q02,
    test_prep_ela_grade3_quiz_1_2b_q03,
    test_prep_ela_grade3_quiz_1_2b_q04,
    test_prep_ela_grade3_quiz_1_2b_q05,
    test_prep_ela_grade3_quiz_1_2b_q06

      )) ;
--unpivot multiple choice responses for grade 3 ela test prep quiz 1.2b
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_test_prep_grade3_quiz_1_2b_responses` AS
SELECT
  osis,
  question_id,
  student_answer
FROM
  `harlemlinksy2122.trackers.ela_test_prep_grade3_quiz_1_2b` UNPIVOT(student_answer FOR question_id IN (response_test_prep_ela_grade3_quiz_1_2b_q01,
    response_test_prep_ela_grade3_quiz_1_2b_q02,
    response_test_prep_ela_grade3_quiz_1_2b_q03,
    response_test_prep_ela_grade3_quiz_1_2b_q04,
    response_test_prep_ela_grade3_quiz_1_2b_q05,
    response_test_prep_ela_grade3_quiz_1_2b_q06

      )) ;



----unpivot grade 3 ela test prep quiz 1.3
--unpivot points earned for grade 3 ela test prep quiz 1.3
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_test_prep_grade3_quiz_1_3` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_test_prep_grade3_quiz_1_3` UNPIVOT(points_earned FOR question_id IN (test_prep_ela_grade3_quiz_1_3_q01,
    test_prep_ela_grade3_quiz_1_3_q02,
    test_prep_ela_grade3_quiz_1_3_q03,
    test_prep_ela_grade3_quiz_1_3_q04,
    test_prep_ela_grade3_quiz_1_3_q05,
    test_prep_ela_grade3_quiz_1_3_q06

      )) ;
--unpivot multiple choice responses for grade 3 ela test prep quiz 1.3
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_test_prep_grade3_quiz_1_3_responses` AS
SELECT
  osis,
  question_id,
  student_answer
FROM
  `harlemlinksy2122.trackers.ela_test_prep_grade3_quiz_1_3` UNPIVOT(student_answer FOR question_id IN (response_test_prep_ela_grade3_quiz_1_3_q01,
    response_test_prep_ela_grade3_quiz_1_3_q02,
    response_test_prep_ela_grade3_quiz_1_3_q03,
    response_test_prep_ela_grade3_quiz_1_3_q04,
    response_test_prep_ela_grade3_quiz_1_3_q05,
    response_test_prep_ela_grade3_quiz_1_3_q06

      )) ;



----unpivot grade 3 ela test prep quiz 1.4
--unpivot points earned for grade 3 ela test prep quiz 1.4
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_test_prep_grade3_quiz_1_4` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_test_prep_grade3_quiz_1_4` UNPIVOT(points_earned FOR question_id IN (test_prep_ela_grade3_quiz_1_4_q01,
    test_prep_ela_grade3_quiz_1_4_q02,
    test_prep_ela_grade3_quiz_1_4_q03,
    test_prep_ela_grade3_quiz_1_4_q04,
    test_prep_ela_grade3_quiz_1_4_q05,
    test_prep_ela_grade3_quiz_1_4_q06

      )) ;
--unpivot multiple choice responses for grade 3 ela test prep quiz 1.4
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_test_prep_grade3_quiz_1_4_responses` AS
SELECT
  osis,
  question_id,
  student_answer
FROM
  `harlemlinksy2122.trackers.ela_test_prep_grade3_quiz_1_4` UNPIVOT(student_answer FOR question_id IN (response_test_prep_ela_grade3_quiz_1_4_q01,
    response_test_prep_ela_grade3_quiz_1_4_q02,
    response_test_prep_ela_grade3_quiz_1_4_q03,
    response_test_prep_ela_grade3_quiz_1_4_q04,
    response_test_prep_ela_grade3_quiz_1_4_q05,
    response_test_prep_ela_grade3_quiz_1_4_q06

      )) ;
--add unpivots for new quizzes below