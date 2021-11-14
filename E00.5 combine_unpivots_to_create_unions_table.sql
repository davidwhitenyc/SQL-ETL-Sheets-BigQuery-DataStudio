--[step 01.5] combines all unpivoted trackers into a single table
--add a new code block below for each new unit

----create unions table for all grade k ela: reading level 3 assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_reading_gradek` AS
--pull unpivoted data from ela: reading grade k unit 1
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_reading_gradek_unit1`
--pull unpivoted data from ela: reading grade k unit 2
UNION ALL
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_reading_gradek_unit2`

 ;
--insert UNION ALL code block here for the next unit 




----create unions table for all grade k ela: writing level 3 assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_writing_gradek` AS
--pull unpivoted data from ela: reading grade k unit 1
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_writing_gradek_baseline` ;
--insert UNION ALL code block here for the next unit 




----create unions table for all grade k ela: fundations assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_fundations_gradek` AS
--pull unpivoted data from ela: fundations grade k assessment 1
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_fundations_gradek_assessment1`;
--insert UNION ALL code block here for the next assessment



----create unions table for all grade k ela: heggerty assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_heggerty_gradek` AS
--pull unpivoted data from ela: heggerty grade k baseline
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_heggerty_gradek_baseline`
--pull unpivoted data from ela: heggerty grade k assessment 1
UNION ALL
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.unpivots.ela_heggerty_gradek_assessment1` ;
--insert UNION ALL code block here for the next assessment



----create unions table for all grade k ela: uppercase letter recognition assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_uppercase_letters_gradek` AS
--pull unpivoted data from ela: uppercase letter recognition grade k baseline assessment
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_uppercase_letters_gradek_baseline`
--pull unpivoted data from ela: uppercase letter recognition grade k winter assessment
UNION ALL
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.unpivots.ela_uppercase_letters_gradek_winter` ;
--insert UNION ALL code block here for the next assessment



----create unions table for all grade k ela: lowercase letter recognition assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_lowercase_letters_gradek` AS
--pull unpivoted data from ela: lowercase letter recognition grade k baseline assessment
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_lowercase_letters_gradek_baseline`
--pull unpivoted data from ela: lowercase letter recognition grade k winter assessment
UNION ALL
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.unpivots.ela_lowercase_letters_gradek_winter` ;
--insert UNION ALL code block here for the next assessment


----create unions table for all grade k ela: letter sounds assessments----
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.ela_letter_sounds_gradek` AS
--pull unpivoted data from ela: letter sounds grade k baseline assessment
SELECT
  osis,
  question_id,
  points_earned,
FROM
`harlemlinksy2122.unpivots.ela_letter_sounds_gradek_baseline`
--pull unpivoted data from ela: letter sounds grade k winter assessment
UNION ALL
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.unpivots.ela_letter_sounds_gradek_winter` ;
--insert UNION ALL code block here for the next assessment
