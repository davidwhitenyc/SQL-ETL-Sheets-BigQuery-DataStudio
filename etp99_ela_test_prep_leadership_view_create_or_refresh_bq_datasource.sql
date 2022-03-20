--refresh each grade level datasource

SELECT * FROM `harlemlinksy2122.datasources.ela_tp_grade3`  ;

SELECT * FROM `harlemlinksy2122.datasources.ela_tp_grade4`  ;

SELECT * FROM `harlemlinksy2122.datasources.ela_tp_grade5`  ; 



--create ela test prep leadership view datasource

CREATE OR REPLACE TABLE 
`harlemlinksy2122.datasources.ela_tp_leadership` AS

SELECT 
  --start by pulling the osis on the combined results table
  osis,
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
  quiz,
  points_earned,
  points_available,
  student_answer,
  correct_answer,
  ela_tp_pct_points,
  ela_tp_benchmark,
  genre,
  question_type,
  ela_cusp_status

FROM `harlemlinksy2122.datasources.ela_tp_grade3`
UNION ALL
SELECT 
  --start by pulling the osis on the combined results table
  osis,
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
  quiz,
  points_earned,
  points_available,
  student_answer,
  correct_answer,
  ela_tp_pct_points,
  ela_tp_benchmark,
  genre,
  question_type,
  ela_cusp_status

FROM `harlemlinksy2122.datasources.ela_tp_grade4`
UNION ALL
SELECT 
  --start by pulling the osis on the combined results table
  osis,
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
  quiz,
  points_earned,
  points_available,
  student_answer,
  correct_answer,
  ela_tp_pct_points,
  ela_tp_benchmark,
  genre,
  question_type,
  ela_cusp_status


FROM `harlemlinksy2122.datasources.ela_tp_grade5`  ;


--END------------------------------------------------------------------------------------------


