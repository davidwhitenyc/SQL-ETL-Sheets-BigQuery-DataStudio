--[step 01.5] combines all unpivoted trackers into a single table
--add a new code block below for each new unit

----create unions table for all grade 1 ela: reading level 3 assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_reading_grade1` AS
--pull unpivoted data from ela: reading grade 1 unit 1
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_reading_grade1_unit1` ;
--insert UNION ALL code block here for the next unit 




----create unions table for all grade 1 ela: writing level 3 assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_writing_grade1` AS
--pull unpivoted data from ela: reading grade 1 unit 1
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_writing_grade1_unit1` ;
--insert UNION ALL code block here for the next unit 




----create unions table for all grade 1 ela: fundations assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_fundations_grade1` AS
--pull unpivoted data from ela: fundations grade 1 assessment 1
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_fundations_grade1_assessment1`
--pull unpivoted data from ela: fundations grade 1 assessment 2
UNION ALL
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.unpivots.ela_fundations_grade1_assessment2` ;
--insert UNION ALL code block here for the next assessment
