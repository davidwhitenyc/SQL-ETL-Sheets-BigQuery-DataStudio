-----------------------------------------------------------------------------------------------------
--run this combined script to refresh the ENL Benchmark Assessments Dashboard--
-----------------------------------------------------------------------------------------------------


--[step 01.1] import data from Google Sheets staging area

SELECT * 
FROM
`harlemlinksy2122.enl_benchmark.enl_benchmark_questions` ;

SELECT *
FROM
`harlemlinksy2122.enl_benchmark.enl_performance_levels_fall_2021` ;

SELECT *
FROM
`harlemlinksy2122.enl_benchmark.items_enl_benchmark_fall_2021_gradek` ;

SELECT *
FROM
`harlemlinksy2122.enl_benchmark.points_enl_benchmark_fall_2021_gradek` ;

SELECT *
FROM
`harlemlinksy2122.enl_benchmark.items_enl_benchmark_fall_2021_grade1` ;

SELECT *
FROM
`harlemlinksy2122.enl_benchmark.points_enl_benchmark_fall_2021_grade1` ;

SELECT *
FROM
`harlemlinksy2122.enl_benchmark.items_enl_benchmark_fall_2021_grade2` ;

SELECT *
FROM
`harlemlinksy2122.enl_benchmark.points_enl_benchmark_fall_2021_grade2` ;

SELECT *
FROM
`harlemlinksy2122.enl_benchmark.items_enl_benchmark_fall_2021_grade3` ;

SELECT *
FROM
`harlemlinksy2122.enl_benchmark.points_enl_benchmark_fall_2021_grade3` ;

SELECT *
FROM
`harlemlinksy2122.enl_benchmark.items_enl_benchmark_fall_2021_grade4` ;

SELECT *
FROM
`harlemlinksy2122.enl_benchmark.points_enl_benchmark_fall_2021_grade4` ;

SELECT *
FROM
`harlemlinksy2122.enl_benchmark.items_enl_benchmark_fall_2021_grade5` ;

SELECT *
FROM
`harlemlinksy2122.enl_benchmark.points_enl_benchmark_fall_2021_grade5` ;






--[step 01.2] unpivot each wide-format 'items' table
--grade k
CREATE OR REPLACE TABLE 
`harlemlinksy2122.enl_benchmark.unpivot_items_gradek` AS

SELECT
  osis,
  question_id,
  student_answer
FROM
  `harlemlinksy2122.enl_benchmark.items_enl_benchmark_fall_2021_gradek` UNPIVOT(student_answer FOR question_id IN (
   fall_2021_gradek_01,
fall_2021_gradek_02,
fall_2021_gradek_03,
fall_2021_gradek_04,
fall_2021_gradek_05,
fall_2021_gradek_06,
fall_2021_gradek_07,
fall_2021_gradek_08,
fall_2021_gradek_09,
fall_2021_gradek_10,
fall_2021_gradek_11,
fall_2021_gradek_12,
fall_2021_gradek_13,
fall_2021_gradek_14,
fall_2021_gradek_15,
fall_2021_gradek_16,
fall_2021_gradek_17,
fall_2021_gradek_18,
fall_2021_gradek_19,
fall_2021_gradek_20,
fall_2021_gradek_21,
fall_2021_gradek_22,
fall_2021_gradek_23,
fall_2021_gradek_24,
fall_2021_gradek_25,
fall_2021_gradek_26,
fall_2021_gradek_27,
fall_2021_gradek_28,
fall_2021_gradek_29,
fall_2021_gradek_30


  )) ;




--grade 1
CREATE OR REPLACE TABLE 
`harlemlinksy2122.enl_benchmark.unpivot_items_grade1` AS

SELECT
  osis,
  question_id,
  student_answer
FROM
  `harlemlinksy2122.enl_benchmark.items_enl_benchmark_fall_2021_grade1` UNPIVOT(student_answer FOR question_id IN (
   fall_2021_grade1_01,
fall_2021_grade1_02,
fall_2021_grade1_03,
fall_2021_grade1_04,
fall_2021_grade1_05,
fall_2021_grade1_06,
fall_2021_grade1_07,
fall_2021_grade1_08,
fall_2021_grade1_09,
fall_2021_grade1_10,
fall_2021_grade1_11,
fall_2021_grade1_12,
fall_2021_grade1_13,
fall_2021_grade1_14,
fall_2021_grade1_15,
fall_2021_grade1_16,
fall_2021_grade1_17,
fall_2021_grade1_18,
fall_2021_grade1_19,
fall_2021_grade1_20,
fall_2021_grade1_21,
fall_2021_grade1_22,
fall_2021_grade1_23,
fall_2021_grade1_24,
fall_2021_grade1_25,
fall_2021_grade1_26,
fall_2021_grade1_27


  )) ;


--grade 2
CREATE OR REPLACE TABLE 
`harlemlinksy2122.enl_benchmark.unpivot_items_grade2` AS

SELECT
  osis,
  question_id,
  student_answer
FROM
  `harlemlinksy2122.enl_benchmark.items_enl_benchmark_fall_2021_grade2` UNPIVOT(student_answer FOR question_id IN (
  fall_2021_grade2_01,
fall_2021_grade2_02,
fall_2021_grade2_03,
fall_2021_grade2_04,
fall_2021_grade2_05,
fall_2021_grade2_06,
fall_2021_grade2_07,
fall_2021_grade2_08,
fall_2021_grade2_09,
fall_2021_grade2_10,
fall_2021_grade2_11,
fall_2021_grade2_12,
fall_2021_grade2_13,
fall_2021_grade2_14,
fall_2021_grade2_15,
fall_2021_grade2_16,
fall_2021_grade2_17,
fall_2021_grade2_18,
fall_2021_grade2_19,
fall_2021_grade2_20,
fall_2021_grade2_21,
fall_2021_grade2_22,
fall_2021_grade2_23,
fall_2021_grade2_24,
fall_2021_grade2_25,
fall_2021_grade2_26,
fall_2021_grade2_27

  )) ;

--grade 3
CREATE OR REPLACE TABLE 
`harlemlinksy2122.enl_benchmark.unpivot_items_grade3` AS

SELECT
  osis,
  question_id,
  student_answer
FROM
  `harlemlinksy2122.enl_benchmark.items_enl_benchmark_fall_2021_grade3` UNPIVOT(student_answer FOR question_id IN (
   fall_2021_grade3_01,
fall_2021_grade3_02,
fall_2021_grade3_03,
fall_2021_grade3_04,
fall_2021_grade3_05,
fall_2021_grade3_06,
fall_2021_grade3_07,
fall_2021_grade3_08,
fall_2021_grade3_09,
fall_2021_grade3_10,
fall_2021_grade3_11,
fall_2021_grade3_12,
fall_2021_grade3_13,
fall_2021_grade3_14,
fall_2021_grade3_15,
fall_2021_grade3_16,
fall_2021_grade3_17,
fall_2021_grade3_18,
fall_2021_grade3_19,
fall_2021_grade3_20,
fall_2021_grade3_21,
fall_2021_grade3_22,
fall_2021_grade3_23,
fall_2021_grade3_24,
fall_2021_grade3_25,
fall_2021_grade3_26,
fall_2021_grade3_27

  )) ;


--grade 4
CREATE OR REPLACE TABLE 
`harlemlinksy2122.enl_benchmark.unpivot_items_grade4` AS

SELECT
  osis,
  question_id,
  student_answer
FROM
  `harlemlinksy2122.enl_benchmark.items_enl_benchmark_fall_2021_grade4` UNPIVOT(student_answer FOR question_id IN (
   fall_2021_grade4_01,
fall_2021_grade4_02,
fall_2021_grade4_03,
fall_2021_grade4_04,
fall_2021_grade4_05,
fall_2021_grade4_06,
fall_2021_grade4_07,
fall_2021_grade4_08,
fall_2021_grade4_09,
fall_2021_grade4_10,
fall_2021_grade4_11,
fall_2021_grade4_12,
fall_2021_grade4_13,
fall_2021_grade4_14,
fall_2021_grade4_15,
fall_2021_grade4_16,
fall_2021_grade4_17,
fall_2021_grade4_18,
fall_2021_grade4_19,
fall_2021_grade4_20,
fall_2021_grade4_21,
fall_2021_grade4_22,
fall_2021_grade4_23,
fall_2021_grade4_24,
fall_2021_grade4_25,
fall_2021_grade4_26,
fall_2021_grade4_27

  )) ;




--grade 5
CREATE OR REPLACE TABLE 
`harlemlinksy2122.enl_benchmark.unpivot_items_grade5` AS

SELECT
  osis,
  question_id,
  student_answer
FROM
  `harlemlinksy2122.enl_benchmark.items_enl_benchmark_fall_2021_grade5` UNPIVOT(student_answer FOR question_id IN (
    fall_2021_grade5_01,
fall_2021_grade5_02,
fall_2021_grade5_03,
fall_2021_grade5_04,
fall_2021_grade5_05,
fall_2021_grade5_06,
fall_2021_grade5_07,
fall_2021_grade5_08,
fall_2021_grade5_09,
fall_2021_grade5_10,
fall_2021_grade5_11,
fall_2021_grade5_12,
fall_2021_grade5_13,
fall_2021_grade5_14,
fall_2021_grade5_15,
fall_2021_grade5_16,
fall_2021_grade5_17,
fall_2021_grade5_18,
fall_2021_grade5_19,
fall_2021_grade5_20,
fall_2021_grade5_21,
fall_2021_grade5_22,
fall_2021_grade5_23,
fall_2021_grade5_24,
fall_2021_grade5_25,
fall_2021_grade5_26,
fall_2021_grade5_27


  )) ;







--[step 01.3] unpivot each wide-format 'points' table
--grade k
CREATE OR REPLACE TABLE 
`harlemlinksy2122.enl_benchmark.unpivot_points_gradek` AS

SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.enl_benchmark.points_enl_benchmark_fall_2021_gradek` UNPIVOT(points_earned FOR question_id IN (
   fall_2021_gradek_01,
fall_2021_gradek_02,
fall_2021_gradek_03,
fall_2021_gradek_04,
fall_2021_gradek_05,
fall_2021_gradek_06,
fall_2021_gradek_07,
fall_2021_gradek_08,
fall_2021_gradek_09,
fall_2021_gradek_10,
fall_2021_gradek_11,
fall_2021_gradek_12,
fall_2021_gradek_13,
fall_2021_gradek_14,
fall_2021_gradek_15,
fall_2021_gradek_16,
fall_2021_gradek_17,
fall_2021_gradek_18,
fall_2021_gradek_19,
fall_2021_gradek_20,
fall_2021_gradek_21,
fall_2021_gradek_22,
fall_2021_gradek_23,
fall_2021_gradek_24,
fall_2021_gradek_25,
fall_2021_gradek_26,
fall_2021_gradek_27,
fall_2021_gradek_28,
fall_2021_gradek_29,
fall_2021_gradek_30


  ))  ;


--grade 1
CREATE OR REPLACE TABLE 
`harlemlinksy2122.enl_benchmark.unpivot_points_grade1` AS

SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.enl_benchmark.points_enl_benchmark_fall_2021_grade1` UNPIVOT(points_earned FOR question_id IN (
   fall_2021_grade1_01,
fall_2021_grade1_02,
fall_2021_grade1_03,
fall_2021_grade1_04,
fall_2021_grade1_05,
fall_2021_grade1_06,
fall_2021_grade1_07,
fall_2021_grade1_08,
fall_2021_grade1_09,
fall_2021_grade1_10,
fall_2021_grade1_11,
fall_2021_grade1_12,
fall_2021_grade1_13,
fall_2021_grade1_14,
fall_2021_grade1_15,
fall_2021_grade1_16,
fall_2021_grade1_17,
fall_2021_grade1_18,
fall_2021_grade1_19,
fall_2021_grade1_20,
fall_2021_grade1_21,
fall_2021_grade1_22,
fall_2021_grade1_23,
fall_2021_grade1_24,
fall_2021_grade1_25,
fall_2021_grade1_26,
fall_2021_grade1_27


  )) ;




--grade 2
CREATE OR REPLACE TABLE 
`harlemlinksy2122.enl_benchmark.unpivot_points_grade2` AS

SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.enl_benchmark.points_enl_benchmark_fall_2021_grade2` UNPIVOT(points_earned FOR question_id IN (
   fall_2021_grade2_01,
fall_2021_grade2_02,
fall_2021_grade2_03,
fall_2021_grade2_04,
fall_2021_grade2_05,
fall_2021_grade2_06,
fall_2021_grade2_07,
fall_2021_grade2_08,
fall_2021_grade2_09,
fall_2021_grade2_10,
fall_2021_grade2_11,
fall_2021_grade2_12,
fall_2021_grade2_13,
fall_2021_grade2_14,
fall_2021_grade2_15,
fall_2021_grade2_16,
fall_2021_grade2_17,
fall_2021_grade2_18,
fall_2021_grade2_19,
fall_2021_grade2_20,
fall_2021_grade2_21,
fall_2021_grade2_22,
fall_2021_grade2_23,
fall_2021_grade2_24,
fall_2021_grade2_25,
fall_2021_grade2_26,
fall_2021_grade2_27


  )) ;




--grade 3
CREATE OR REPLACE TABLE 
`harlemlinksy2122.enl_benchmark.unpivot_points_grade3` AS

SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.enl_benchmark.points_enl_benchmark_fall_2021_grade3` UNPIVOT(points_earned FOR question_id IN (
  fall_2021_grade3_01,
fall_2021_grade3_02,
fall_2021_grade3_03,
fall_2021_grade3_04,
fall_2021_grade3_05,
fall_2021_grade3_06,
fall_2021_grade3_07,
fall_2021_grade3_08,
fall_2021_grade3_09,
fall_2021_grade3_10,
fall_2021_grade3_11,
fall_2021_grade3_12,
fall_2021_grade3_13,
fall_2021_grade3_14,
fall_2021_grade3_15,
fall_2021_grade3_16,
fall_2021_grade3_17,
fall_2021_grade3_18,
fall_2021_grade3_19,
fall_2021_grade3_20,
fall_2021_grade3_21,
fall_2021_grade3_22,
fall_2021_grade3_23,
fall_2021_grade3_24,
fall_2021_grade3_25,
fall_2021_grade3_26,
fall_2021_grade3_27


  )) ;



--grade 4
CREATE OR REPLACE TABLE 
`harlemlinksy2122.enl_benchmark.unpivot_points_grade4` AS

SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.enl_benchmark.points_enl_benchmark_fall_2021_grade4` UNPIVOT(points_earned FOR question_id IN (
  fall_2021_grade4_01,
fall_2021_grade4_02,
fall_2021_grade4_03,
fall_2021_grade4_04,
fall_2021_grade4_05,
fall_2021_grade4_06,
fall_2021_grade4_07,
fall_2021_grade4_08,
fall_2021_grade4_09,
fall_2021_grade4_10,
fall_2021_grade4_11,
fall_2021_grade4_12,
fall_2021_grade4_13,
fall_2021_grade4_14,
fall_2021_grade4_15,
fall_2021_grade4_16,
fall_2021_grade4_17,
fall_2021_grade4_18,
fall_2021_grade4_19,
fall_2021_grade4_20,
fall_2021_grade4_21,
fall_2021_grade4_22,
fall_2021_grade4_23,
fall_2021_grade4_24,
fall_2021_grade4_25,
fall_2021_grade4_26,
fall_2021_grade4_27


  )) ;





--grade 5
CREATE OR REPLACE TABLE 
`harlemlinksy2122.enl_benchmark.unpivot_points_grade5` AS

SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.enl_benchmark.points_enl_benchmark_fall_2021_grade5` UNPIVOT(points_earned FOR question_id IN (
   fall_2021_grade5_01,
fall_2021_grade5_02,
fall_2021_grade5_03,
fall_2021_grade5_04,
fall_2021_grade5_05,
fall_2021_grade5_06,
fall_2021_grade5_07,
fall_2021_grade5_08,
fall_2021_grade5_09,
fall_2021_grade5_10,
fall_2021_grade5_11,
fall_2021_grade5_12,
fall_2021_grade5_13,
fall_2021_grade5_14,
fall_2021_grade5_15,
fall_2021_grade5_16,
fall_2021_grade5_17,
fall_2021_grade5_18,
fall_2021_grade5_19,
fall_2021_grade5_20,
fall_2021_grade5_21,
fall_2021_grade5_22,
fall_2021_grade5_23,
fall_2021_grade5_24,
fall_2021_grade5_25,
fall_2021_grade5_26,
fall_2021_grade5_27


  )) ;


--[step 01.4] combine the unpivoted 'items' tables
CREATE OR REPLACE TABLE
 `harlemlinksy2122.enl_benchmark.all_items` AS

SELECT
 osis,
 question_id,
 student_answer
FROM 
`harlemlinksy2122.enl_benchmark.unpivot_items_gradek` 


UNION ALL
SELECT
 osis,
 question_id,
 student_answer
FROM 
`harlemlinksy2122.enl_benchmark.unpivot_items_grade1` 


UNION ALL
SELECT
 osis,
 question_id,
 student_answer
FROM 
`harlemlinksy2122.enl_benchmark.unpivot_items_grade2` 


UNION ALL
SELECT
 osis,
 question_id,
 student_answer
FROM 
`harlemlinksy2122.enl_benchmark.unpivot_items_grade3` 


UNION ALL
SELECT
 osis,
 question_id,
 student_answer
FROM 
`harlemlinksy2122.enl_benchmark.unpivot_items_grade4` 


UNION ALL
SELECT
 osis,
 question_id,
 student_answer
FROM 
`harlemlinksy2122.enl_benchmark.unpivot_items_grade5` ;






--[step 01.5] combine the unpivoted 'points' tables
CREATE OR REPLACE TABLE
 `harlemlinksy2122.enl_benchmark.all_points` AS

SELECT
 osis,
 question_id,
 points_earned
FROM 
`harlemlinksy2122.enl_benchmark.unpivot_points_gradek` 


UNION ALL
SELECT
 osis,
 question_id,
 points_earned
FROM 
`harlemlinksy2122.enl_benchmark.unpivot_points_grade1` 


UNION ALL
SELECT
 osis,
 question_id,
 points_earned
FROM 
`harlemlinksy2122.enl_benchmark.unpivot_points_grade2`


UNION ALL
SELECT
 osis,
 question_id,
 points_earned
FROM 
`harlemlinksy2122.enl_benchmark.unpivot_points_grade3`


UNION ALL
SELECT
 osis,
 question_id,
 points_earned
FROM 
`harlemlinksy2122.enl_benchmark.unpivot_points_grade4`


UNION ALL
SELECT
 osis,
 question_id,
 points_earned
FROM 
`harlemlinksy2122.enl_benchmark.unpivot_points_grade5`  ;





--[step 01.6] join to the 'items' tables to demographic information and student-level benchmark columns
CREATE OR REPLACE TABLE
`harlemlinksy2122.enl_benchmark.enl_datasource_items` AS
SELECT
--select columns from the combined 'items' table (alias: items)
items.osis,
items.question_id,
student_answer,

--selecet columns from the 'students' datasource (alias: students)
student,
gender,
sy21_22_grade_level,
sy_21_22_class,
sy20_21_grade_level,
sy_20_21_class,
sped,
enl,
hl_upk,
holdovers,
new_students,
ais,

--select columns from the questions table (alias: questions)
question_number,
modality,
question_text,
question_type,
correct_answer,
points_available,

--select columns from the student-level performance levels table (alias: levels)
speaking_score,
speaking_performance_level,
listening_score,
listening_performance_level,
reading_score,
reading_performance_level,
writing_score,
writing_performance_level,
current_speaking_level_of_performance,
speaking_goal_met,
current_listening_level_of_performance,
listening_goal_met,
current_reading_level_of_performance,
reading_goal_met,
current_writing_level_of_performance,
writing_goal_met,
actual_goals_met,
possible_goals_met


FROM
`harlemlinksy2122.enl_benchmark.all_items` items

LEFT JOIN
`harlemlinksy2122.demographics.students` students

ON items.osis = students.osis 


LEFT JOIN
`harlemlinksy2122.enl_benchmark.enl_benchmark_questions` questions

ON items.question_id = questions.question_id


LEFT JOIN 
`harlemlinksy2122.enl_benchmark.enl_performance_levels_fall_2021` levels

ON items.osis = levels.osis  ;





--[step 01.7] join to the 'points' tables to demographic information and student-level benchmark columns
CREATE OR REPLACE TABLE
`harlemlinksy2122.enl_benchmark.enl_datasource_points` AS
SELECT
--select columns from the combined 'points' table (alias: points)
points.osis,
points.question_id,
points_earned,

--selecet columns from the 'students' datasource (alias: students)
student,
gender,
sy21_22_grade_level,
sy_21_22_class,
sy20_21_grade_level,
sy_20_21_class,
sped,
enl,
hl_upk,
holdovers,
new_students,
ais,

--select columns from the questions table (alias: questions)
question_number,
modality,
question_text,
question_type,
correct_answer,
points_available,

--select columns from the student-level performance levels table (alias: levels)
speaking_score,
speaking_performance_level,
listening_score,
listening_performance_level,
reading_score,
reading_performance_level,
writing_score,
writing_performance_level,
current_speaking_level_of_performance,
speaking_goal_met,
current_listening_level_of_performance,
listening_goal_met,
current_reading_level_of_performance,
reading_goal_met,
current_writing_level_of_performance,
writing_goal_met,
actual_goals_met,
possible_goals_met,
met_listening_goal,
met_reading_goal,
met_speaking_goal,
met_writing_goal


FROM
`harlemlinksy2122.enl_benchmark.all_points` points

LEFT JOIN
`harlemlinksy2122.demographics.students` students

ON  points.osis = students.osis 


LEFT JOIN
`harlemlinksy2122.enl_benchmark.enl_benchmark_questions` questions

ON points.question_id = questions.question_id


LEFT JOIN 
`harlemlinksy2122.enl_benchmark.enl_performance_levels_fall_2021` levels

ON points.osis = levels.osis  ;


--END----------------------------------------------------------------------------