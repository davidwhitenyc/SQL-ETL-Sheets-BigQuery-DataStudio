--[step 01.5] combines all unpivoted trackers into a single table
--add a new code block below for each new unit


CREATE OR REPLACE TABLE
  `harlemlinksy2122.unions.math_grade2` AS
--pull unpivoted data from math grade 2 unit 1
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.unpivots.math_grade2_unit1` 
--pull unpivoted data from math grade 2 unit 2
UNION ALL
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.unpivots.math_grade2_unit2` 
  
--insert UNION ALL code block here for the next unit  
  
  ;