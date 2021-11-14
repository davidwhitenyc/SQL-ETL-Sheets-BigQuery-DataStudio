--[step 01.4] unpivot classroom trackers
--add a new code block below for each new unit

----unpivot ela: reading data (all units)----
--unpivot ela: reading grade 2 unit 1
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_reading_grade2_unit1` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_reading_grade2_unit1` UNPIVOT(points_earned FOR question_id IN (reading_grade2_unit1_01,
    reading_grade2_unit1_02,
    reading_grade2_unit1_03

      )) ;
--add the next ela: reading unit below


----unpivot ela: writing data (all units)----
--unpivot ela: writing grade 2 unit 1
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_writing_grade2_unit1` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_writing_grade2_unit1` UNPIVOT(points_earned FOR question_id IN (writing_grade2_unit1_01,
    writing_grade2_unit1_02,
    writing_grade2_unit1_03,
    writing_grade2_unit1_04,
    writing_grade2_unit1_05,
    writing_grade2_unit1_06,
    writing_grade2_unit1_07,
    writing_grade2_unit1_08

      )) ;

--add the next ela: writing unit below


----unpivot ela: fundations data (all assessments)----
--unpivot ela: fundations grade 1 assessment #1
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_fundations_grade2_assessment1` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_fundations_grade2_assessment1` UNPIVOT(points_earned FOR question_id IN (fundations_grade2_assessment1_01,
    fundations_grade2_assessment1_02,
    fundations_grade2_assessment1_03,
    fundations_grade2_assessment1_04,
    fundations_grade2_assessment1_05,
    fundations_grade2_assessment1_06,
    fundations_grade2_assessment1_07,
    fundations_grade2_assessment1_08,
    fundations_grade2_assessment1_09,
    fundations_grade2_assessment1_10,
    fundations_grade2_assessment1_11,
    fundations_grade2_assessment1_12,
    fundations_grade2_assessment1_13,
    fundations_grade2_assessment1_14

      )) ;

--unpivot ela: fundations grade 2 assessment #2
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_fundations_grade2_assessment2` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_fundations_grade2_assessment2` UNPIVOT(points_earned FOR question_id IN (fundations_grade2_assessment2_01,
    fundations_grade2_assessment2_02,
    fundations_grade2_assessment2_03,
    fundations_grade2_assessment2_04,
    fundations_grade2_assessment2_05,
    fundations_grade2_assessment2_06,
    fundations_grade2_assessment2_07,
    fundations_grade2_assessment2_08,
    fundations_grade2_assessment2_09,
    fundations_grade2_assessment2_10,
    fundations_grade2_assessment2_11,
    fundations_grade2_assessment2_12,
    fundations_grade2_assessment2_13,
    fundations_grade2_assessment2_14,
    fundations_grade2_assessment2_15,
    fundations_grade2_assessment2_16,
    fundations_grade2_assessment2_17,
    fundations_grade2_assessment2_18,
    fundations_grade2_assessment2_19,
    fundations_grade2_assessment2_20
      )) ;

--add the next ela: fundations assessment below




----unpivot ela: heggerty data (all assessments)----
--unpivot ela: heggerty grade 2 assessment #1
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_heggerty_grade2_assessment1` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_fundations_grade2_assessment1` UNPIVOT(points_earned FOR question_id IN (heggerty_grade2_assessment1_01,
    heggerty_grade2_assessment1_02,
    heggerty_grade2_assessment1_03,
    heggerty_grade2_assessment1_04,
    heggerty_grade2_assessment1_05,
    heggerty_grade2_assessment1_06,
    heggerty_grade2_assessment1_07,
    heggerty_grade2_assessment1_08

      )) ;

--add the next ela: heggerty assessment below