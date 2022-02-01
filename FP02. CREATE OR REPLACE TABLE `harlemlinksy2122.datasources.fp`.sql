------------------------------------------------------------------------------------------
--run this combined script to refresh the v2 F&P (all grade levels) BigQuery Datasource---
------------------------------------------------------------------------------------------

--[step 01] import data from staging area trackers

--import data from grade k staging area tracker
SELECT *
FROM 
 `harlemlinksy2122.datasources.fp_staging_gradek` ;

--import data from grades 1–5 staging area tracker
SELECT *
FROM 
`harlemlinksy2122.datasources.fp_staging_grades1_5` ;





--[step 02] unpivot grade k staging area trackers
CREATE OR REPLACE TABLE
  `harlemlinksy2122.datasources.unpivot_fp_gradek` AS
SELECT
  osis,
  window_txt,
  instructional_level
FROM
  `harlemlinksy2122.datasources.fp_staging_gradek` UNPIVOT(instructional_level FOR window_txt IN (
window_0,
window_1,
window_2,
window_3,
window_4,
window_5,
window_6

      )) ;





--[step 03] unpivot grades 1–5 staging area trackers
CREATE OR REPLACE TABLE
  `harlemlinksy2122.datasources.unpivot_fp_grades1_5` AS
SELECT
  osis,
  window_txt,
  instructional_level
FROM
  `harlemlinksy2122.datasources.fp_staging_grades1_5` UNPIVOT(instructional_level FOR window_txt IN (
window_0,
window_1,
window_2,
window_3,
window_4,
window_5,
window_6

      )) ;





--[step 04] combine unpivoted data
CREATE OR REPLACE TABLE
  `harlemlinksy2122.datasources.unpivot_fp_all_grades` AS
SELECT
  osis,
  window_txt,
  instructional_level
FROM
`harlemlinksy2122.datasources.unpivot_fp_gradek`
UNION ALL 
SELECT
  osis,
  window_txt,
  instructional_level
FROM
`harlemlinksy2122.datasources.unpivot_fp_grades1_5` ;




--[step 05] create v2 F&P whole-school datasource table
CREATE OR REPLACE TABLE 
`harlemlinksy2122.datasources.fp_benchmark_staging` AS 
SELECT
fp.osis,
fp.window_txt,
--convert string windows to integer
CASE 
  WHEN fp.window_txt = 'window_0' THEN 0
  WHEN fp.window_txt = 'window_1' THEN 1
  WHEN fp.window_txt = 'window_2' THEN 2
  WHEN fp.window_txt = 'window_3' THEN 3
  WHEN fp.window_txt = 'window_4' THEN 4
  WHEN fp.window_txt = 'window_5' THEN 5
  WHEN fp.window_txt = 'window_6' THEN 6
END AS window_num,

instructional_level,

--convert instructional levels to numeric values
CASE  
  WHEN instructional_level = 'AA' THEN 0
  WHEN instructional_level = 'A' THEN 1
  WHEN instructional_level = 'B' THEN 2
  WHEN instructional_level = 'C' THEN 3
  WHEN instructional_level = 'D' THEN 4
  WHEN instructional_level = 'E' THEN 5
  WHEN instructional_level = 'F' THEN 6
  WHEN instructional_level = 'G' THEN 7
  WHEN instructional_level = 'H' THEN 8
  WHEN instructional_level = 'I' THEN 9
  WHEN instructional_level = 'J' THEN 10
  WHEN instructional_level = 'K' THEN 11
  WHEN instructional_level = 'L' THEN 12
  WHEN instructional_level = 'M' THEN 13
  WHEN instructional_level = 'N' THEN 14
  WHEN instructional_level = 'O' THEN 15
  WHEN instructional_level = 'P' THEN 16
  WHEN instructional_level = 'Q' THEN 17
  WHEN instructional_level = 'R' THEN 18
  WHEN instructional_level = 'S' THEN 19
  WHEN instructional_level = 'T' THEN 20
  WHEN instructional_level = 'U' THEN 21
  WHEN instructional_level = 'V' THEN 22
  WHEN instructional_level = 'W' THEN 23
  WHEN instructional_level = 'X' THEN 24
  WHEN instructional_level = 'Y' THEN 25
  WHEN instructional_level = 'Z' THEN 26
END AS instructional_level_numeric,

--pull columns from the students table
student,
sy21_22_grade_level,
sy_21_22_class,
sped,
enl,
hl_upk,
holdovers,
new_students,
ais,

--pull columns from benchmarks table
window_description,
instructional_benchmark,

--convert benchmarks to numeric values
CASE  
  WHEN instructional_benchmark = 'AA' THEN 0
  WHEN instructional_benchmark = 'A' THEN 1
  WHEN instructional_benchmark = 'B' THEN 2
  WHEN instructional_benchmark = 'C' THEN 3
  WHEN instructional_benchmark = 'D' THEN 4
  WHEN instructional_benchmark = 'E' THEN 5
  WHEN instructional_benchmark = 'F' THEN 6
  WHEN instructional_benchmark = 'G' THEN 7
  WHEN instructional_benchmark = 'H' THEN 8
  WHEN instructional_benchmark = 'I' THEN 9
  WHEN instructional_benchmark = 'J' THEN 10
  WHEN instructional_benchmark = 'K' THEN 11
  WHEN instructional_benchmark = 'L' THEN 12
  WHEN instructional_benchmark = 'M' THEN 13
  WHEN instructional_benchmark = 'N' THEN 14
  WHEN instructional_benchmark = 'O' THEN 15
  WHEN instructional_benchmark = 'P' THEN 16
  WHEN instructional_benchmark = 'Q' THEN 17
  WHEN instructional_benchmark = 'R' THEN 18
  WHEN instructional_benchmark = 'S' THEN 19
  WHEN instructional_benchmark = 'T' THEN 20
  WHEN instructional_benchmark = 'U' THEN 21
  WHEN instructional_benchmark = 'V' THEN 22
  WHEN instructional_benchmark = 'W' THEN 23
  WHEN instructional_benchmark = 'X' THEN 24
  WHEN instructional_benchmark = 'Y' THEN 25
  WHEN instructional_benchmark = 'Z' THEN 26
END AS instructional_benchmark_numeric,



FROM 
`harlemlinksy2122.datasources.unpivot_fp_all_grades` fp

LEFT JOIN
`harlemlinksy2122.demographics.students` students

ON 
fp.osis = students.osis 


LEFT JOIN
`harlemlinksy2122.datasources.fp_benchmarks` benchmarks

ON 
students.sy21_22_grade_level = benchmarks.grade_level AND fp.window_txt = benchmarks.window_txt ;





--[step 06] create v2 F&P whole-school datasource table
CREATE OR REPLACE TABLE 
`harlemlinksy2122.datasources.fp` AS

SELECT *,

--calculate distance from benchmark
(instructional_level_numeric - instructional_benchmark_numeric) AS distance_from_benchmark,

--characterize distance from benchmark as above, achieved,approaching or below
CASE 
  WHEN (instructional_level_numeric - instructional_benchmark_numeric) >0 THEN 'Above Benchmark'
  WHEN (instructional_level_numeric - instructional_benchmark_numeric) =0 THEN 'Achieved Benchmark'
  WHEN (instructional_level_numeric - instructional_benchmark_numeric) =-1 THEN 'Approaching Benchmark'
  WHEN (instructional_level_numeric - instructional_benchmark_numeric) <-1 THEN 'Below Benchmark'
END AS student_benchmark

FROM
`harlemlinksy2122.datasources.fp_benchmark_staging` ;



--END-------------------------------------------------------------------------------------