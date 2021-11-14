--[step 01.5] combines all unpivoted trackers into a single table
--add a new code block below for each new unit

----create unions table for all grade 2 ela: reading level 3 assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_reading_grade2` AS
--pull unpivoted data from ela: reading grade 1 unit 1
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_reading_grade2_unit1` ;
--insert UNION ALL code block here for the next unit 




----create unions table for all grade 1 ela: writing level 3 assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_writing_grade2` AS
--pull unpivoted data from ela: reading grade 2 unit 1
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_writing_grade2_unit1` ;
--insert UNION ALL code block here for the next unit 




----create unions table for all grade 2 ela: fundations assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_fundations_grade2` AS
--pull unpivoted data from ela: fundations grade 2 assessment 1
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_fundations_grade2_assessment1`
--pull unpivoted data from ela: fundations grade 2 assessment 2
UNION ALL
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.unpivots.ela_fundations_grade2_assessment2` ;
--insert UNION ALL code block here for the next assessment




----create unions table for all grade 2 ela: heggerty assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_heggerty_grade2` AS
--pull unpivoted data from ela: heggerty grade 2 assessment 1
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_heggerty_grade2_assessment1`;

--insert UNION ALL code block here for the next assessment
