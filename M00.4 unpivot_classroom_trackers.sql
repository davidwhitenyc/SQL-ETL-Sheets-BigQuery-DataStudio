--[step 01.4] unpivot classroom trackers
--add a new code block below for each new unit

--unpivot math grade k baseline data
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.math_gradek_baseline` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.math_gradek_baseline` UNPIVOT(points_earned FOR question_id IN (math_gradek_baseline_q01,
math_gradek_baseline_q02,
math_gradek_baseline_q03,
math_gradek_baseline_q04,
math_gradek_baseline_q05,
math_gradek_baseline_q06,
math_gradek_baseline_q07,
math_gradek_baseline_q08,
math_gradek_baseline_q09,
math_gradek_baseline_q10

      )) ;

--unpivot math grade k unit 1 data
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.math_gradek_unit1` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.math_gradek_unit1` UNPIVOT(points_earned FOR question_id IN (math_gradek_unit1_q01,
math_gradek_unit1_q02,
math_gradek_unit1_q03,
math_gradek_unit1_q04,
math_gradek_unit1_q05,
math_gradek_unit1_q06,
math_gradek_unit1_q07,
math_gradek_unit1_q08

      )) ;

--add unpivots for new units below