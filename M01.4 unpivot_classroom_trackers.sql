--[step 01.4] unpivot classroom trackers
--add a new code block below for each new unit

--unpivot math grade 1 unit 1 data
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.math_grade1_unit1` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.math_grade1_unit1` UNPIVOT(points_earned FOR question_id IN (math_grade1_unit1_q01,
math_grade1_unit1_q02,
math_grade1_unit1_q03,
math_grade1_unit1_q04,
math_grade1_unit1_q05,
math_grade1_unit1_q06

      )) ;
--add unpivots for new units below