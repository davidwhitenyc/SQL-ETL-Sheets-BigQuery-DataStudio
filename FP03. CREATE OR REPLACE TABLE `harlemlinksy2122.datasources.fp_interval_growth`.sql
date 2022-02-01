------------------------------------------------------------------------------
--run this combined script to refresh the client-initiated F&P growth table---
------------------------------------------------------------------------------

--[step 1] combine fp staging tables (these tables contain letter levels)
CREATE OR REPLACE TABLE
`harlemlinksy2122.whole_school_fp.windows_letters` AS

SELECT
osis,
window_0,
window_1,
window_2,
window_3,
window_4,
window_5,
window_6

FROM
`harlemlinksy2122.datasources.fp_staging_grades1_5`

UNION ALL
SELECT
osis,
window_0,
window_1,
window_2,
window_3,
window_4,
window_5,
window_6

FROM
`harlemlinksy2122.datasources.fp_staging_gradek` ;




--[step 2] convert all letters levels to numeric; use a seperate CASE WHEN for each window;
CREATE OR REPLACE TABLE 
`harlemlinksy2122.whole_school_fp.windows_numeric` AS
SELECT 
osis,

CASE  
  WHEN window_0 = 'AA' THEN 0
  WHEN window_0 = 'A' THEN 1
  WHEN window_0 = 'B' THEN 2
  WHEN window_0 = 'C' THEN 3
  WHEN window_0 = 'D' THEN 4
  WHEN window_0 = 'E' THEN 5
  WHEN window_0 = 'F' THEN 6
  WHEN window_0 = 'G' THEN 7
  WHEN window_0 = 'H' THEN 8
  WHEN window_0 = 'I' THEN 9
  WHEN window_0 = 'J' THEN 10
  WHEN window_0 = 'K' THEN 11
  WHEN window_0 = 'L' THEN 12
  WHEN window_0 = 'M' THEN 13
  WHEN window_0 = 'N' THEN 14
  WHEN window_0 = 'O' THEN 15
  WHEN window_0 = 'P' THEN 16
  WHEN window_0 = 'Q' THEN 17
  WHEN window_0 = 'R' THEN 18
  WHEN window_0 = 'S' THEN 19
  WHEN window_0 = 'T' THEN 20
  WHEN window_0 = 'U' THEN 21
  WHEN window_0 = 'V' THEN 22
  WHEN window_0 = 'W' THEN 23
  WHEN window_0 = 'X' THEN 24
  WHEN window_0 = 'Y' THEN 25
  WHEN window_0 = 'Z' THEN 26
END AS window_0_numeric,


CASE  
  WHEN window_1 = 'AA' THEN 0
  WHEN window_1 = 'A' THEN 1
  WHEN window_1 = 'B' THEN 2
  WHEN window_1 = 'C' THEN 3
  WHEN window_1 = 'D' THEN 4
  WHEN window_1 = 'E' THEN 5
  WHEN window_1 = 'F' THEN 6
  WHEN window_1 = 'G' THEN 7
  WHEN window_1 = 'H' THEN 8
  WHEN window_1 = 'I' THEN 9
  WHEN window_1 = 'J' THEN 10
  WHEN window_1 = 'K' THEN 11
  WHEN window_1 = 'L' THEN 12
  WHEN window_1 = 'M' THEN 13
  WHEN window_1 = 'N' THEN 14
  WHEN window_1 = 'O' THEN 15
  WHEN window_1 = 'P' THEN 16
  WHEN window_1 = 'Q' THEN 17
  WHEN window_1 = 'R' THEN 18
  WHEN window_1 = 'S' THEN 19
  WHEN window_1 = 'T' THEN 20
  WHEN window_1 = 'U' THEN 21
  WHEN window_1 = 'V' THEN 22
  WHEN window_1 = 'W' THEN 23
  WHEN window_1 = 'X' THEN 24
  WHEN window_1 = 'Y' THEN 25
  WHEN window_1 = 'Z' THEN 26
END AS window_1_numeric,


CASE  
  WHEN window_2 = 'AA' THEN 0
  WHEN window_2 = 'A' THEN 1
  WHEN window_2 = 'B' THEN 2
  WHEN window_2 = 'C' THEN 3
  WHEN window_2 = 'D' THEN 4
  WHEN window_2 = 'E' THEN 5
  WHEN window_2 = 'F' THEN 6
  WHEN window_2 = 'G' THEN 7
  WHEN window_2 = 'H' THEN 8
  WHEN window_2 = 'I' THEN 9
  WHEN window_2 = 'J' THEN 10
  WHEN window_2 = 'K' THEN 11
  WHEN window_2 = 'L' THEN 12
  WHEN window_2 = 'M' THEN 13
  WHEN window_2 = 'N' THEN 14
  WHEN window_2 = 'O' THEN 15
  WHEN window_2 = 'P' THEN 16
  WHEN window_2 = 'Q' THEN 17
  WHEN window_2 = 'R' THEN 18
  WHEN window_2 = 'S' THEN 19
  WHEN window_2 = 'T' THEN 20
  WHEN window_2 = 'U' THEN 21
  WHEN window_2 = 'V' THEN 22
  WHEN window_2 = 'W' THEN 23
  WHEN window_2 = 'X' THEN 24
  WHEN window_2 = 'Y' THEN 25
  WHEN window_2 = 'Z' THEN 26
END AS window_2_numeric,


CASE  
  WHEN window_3 = 'AA' THEN 0
  WHEN window_3 = 'A' THEN 1
  WHEN window_3 = 'B' THEN 2
  WHEN window_3 = 'C' THEN 3
  WHEN window_3 = 'D' THEN 4
  WHEN window_3 = 'E' THEN 5
  WHEN window_3 = 'F' THEN 6
  WHEN window_3 = 'G' THEN 7
  WHEN window_3 = 'H' THEN 8
  WHEN window_3 = 'I' THEN 9
  WHEN window_3 = 'J' THEN 10
  WHEN window_3 = 'K' THEN 11
  WHEN window_3 = 'L' THEN 12
  WHEN window_3 = 'M' THEN 13
  WHEN window_3 = 'N' THEN 14
  WHEN window_3 = 'O' THEN 15
  WHEN window_3 = 'P' THEN 16
  WHEN window_3 = 'Q' THEN 17
  WHEN window_3 = 'R' THEN 18
  WHEN window_3 = 'S' THEN 19
  WHEN window_3 = 'T' THEN 20
  WHEN window_3 = 'U' THEN 21
  WHEN window_3 = 'V' THEN 22
  WHEN window_3 = 'W' THEN 23
  WHEN window_3 = 'X' THEN 24
  WHEN window_3 = 'Y' THEN 25
  WHEN window_3 = 'Z' THEN 26
END AS window_3_numeric,


CASE  
  WHEN window_4 = 'AA' THEN 0
  WHEN window_4 = 'A' THEN 1
  WHEN window_4 = 'B' THEN 2
  WHEN window_4 = 'C' THEN 3
  WHEN window_4 = 'D' THEN 4
  WHEN window_4 = 'E' THEN 5
  WHEN window_4 = 'F' THEN 6
  WHEN window_4 = 'G' THEN 7
  WHEN window_4 = 'H' THEN 8
  WHEN window_4 = 'I' THEN 9
  WHEN window_4 = 'J' THEN 10
  WHEN window_4 = 'K' THEN 11
  WHEN window_4 = 'L' THEN 12
  WHEN window_4 = 'M' THEN 13
  WHEN window_4 = 'N' THEN 14
  WHEN window_4 = 'O' THEN 15
  WHEN window_4 = 'P' THEN 16
  WHEN window_4 = 'Q' THEN 17
  WHEN window_4 = 'R' THEN 18
  WHEN window_4 = 'S' THEN 19
  WHEN window_4 = 'T' THEN 20
  WHEN window_4 = 'U' THEN 21
  WHEN window_4 = 'V' THEN 22
  WHEN window_4 = 'W' THEN 23
  WHEN window_4 = 'X' THEN 24
  WHEN window_4 = 'Y' THEN 25
  WHEN window_4 = 'Z' THEN 26
END AS window_4_numeric,


CASE  
  WHEN window_5 = 'AA' THEN 0
  WHEN window_5 = 'A' THEN 1
  WHEN window_5 = 'B' THEN 2
  WHEN window_5 = 'C' THEN 3
  WHEN window_5 = 'D' THEN 4
  WHEN window_5 = 'E' THEN 5
  WHEN window_5 = 'F' THEN 6
  WHEN window_5 = 'G' THEN 7
  WHEN window_5 = 'H' THEN 8
  WHEN window_5 = 'I' THEN 9
  WHEN window_5 = 'J' THEN 10
  WHEN window_5 = 'K' THEN 11
  WHEN window_5 = 'L' THEN 12
  WHEN window_5 = 'M' THEN 13
  WHEN window_5 = 'N' THEN 14
  WHEN window_5 = 'O' THEN 15
  WHEN window_5 = 'P' THEN 16
  WHEN window_5 = 'Q' THEN 17
  WHEN window_5 = 'R' THEN 18
  WHEN window_5 = 'S' THEN 19
  WHEN window_5 = 'T' THEN 20
  WHEN window_5 = 'U' THEN 21
  WHEN window_5 = 'V' THEN 22
  WHEN window_5 = 'W' THEN 23
  WHEN window_5 = 'X' THEN 24
  WHEN window_5 = 'Y' THEN 25
  WHEN window_5 = 'Z' THEN 26
END AS window_5_numeric,


CASE  
  WHEN window_6 = 'AA' THEN 0
  WHEN window_6 = 'A' THEN 1
  WHEN window_6 = 'B' THEN 2
  WHEN window_6 = 'C' THEN 3
  WHEN window_6 = 'D' THEN 4
  WHEN window_6 = 'E' THEN 5
  WHEN window_6 = 'F' THEN 6
  WHEN window_6 = 'G' THEN 7
  WHEN window_6 = 'H' THEN 8
  WHEN window_6 = 'I' THEN 9
  WHEN window_6 = 'J' THEN 10
  WHEN window_6 = 'K' THEN 11
  WHEN window_6 = 'L' THEN 12
  WHEN window_6 = 'M' THEN 13
  WHEN window_6 = 'N' THEN 14
  WHEN window_6 = 'O' THEN 15
  WHEN window_6 = 'P' THEN 16
  WHEN window_6 = 'Q' THEN 17
  WHEN window_6 = 'R' THEN 18
  WHEN window_6 = 'S' THEN 19
  WHEN window_6 = 'T' THEN 20
  WHEN window_6 = 'U' THEN 21
  WHEN window_6 = 'V' THEN 22
  WHEN window_6 = 'W' THEN 23
  WHEN window_6 = 'X' THEN 24
  WHEN window_6 = 'Y' THEN 25
  WHEN window_6 = 'Z' THEN 26
END AS window_6_numeric


FROM
`harlemlinksy2122.whole_school_fp.windows_letters` ;





--[step 3] create a new table containing only the interval calculations
CREATE OR REPLACE TABLE
`harlemlinksy2122.whole_school_fp.fp_growth` AS

SELECT
osis,

--growth starting from window 1 backwards
window_1_numeric - window_0_numeric AS growth_window_0_to_window_1 ,


--growth starting from window 2 backwards
window_2_numeric - window_1_numeric AS growth_window_1_to_window_2 ,
window_2_numeric - window_0_numeric AS growth_window_0_to_window_2 ,


--growth starting from window 3 backwards
window_3_numeric - window_2_numeric AS growth_window_2_to_window_3 ,
window_3_numeric - window_1_numeric AS growth_window_1_to_window_3 ,
window_3_numeric - window_0_numeric AS growth_window_0_to_window_3 ,


--growth starting from window 4 backwards
window_4_numeric - window_3_numeric AS growth_window_3_to_window_4 ,
window_4_numeric - window_2_numeric AS growth_window_2_to_window_4 ,
window_4_numeric - window_1_numeric AS growth_window_1_to_window_4 ,
window_4_numeric - window_0_numeric AS growth_window_0_to_window_4 ,


--growth starting from window 5 backwards
window_5_numeric - window_4_numeric AS growth_window_4_to_window_5 ,
window_5_numeric - window_3_numeric AS growth_window_3_to_window_5 ,
window_5_numeric - window_2_numeric AS growth_window_2_to_window_5 ,
window_5_numeric - window_1_numeric AS growth_window_1_to_window_5 ,
window_5_numeric - window_0_numeric AS growth_window_0_to_window_5 ,


--growth starting from window 6 backwards
window_6_numeric - window_5_numeric AS growth_window_5_to_window_6 ,
window_6_numeric - window_4_numeric AS growth_window_4_to_window_6 ,
window_6_numeric - window_3_numeric AS growth_window_3_to_window_6 ,
window_6_numeric - window_2_numeric AS growth_window_2_to_window_6 ,
window_6_numeric - window_1_numeric AS growth_window_1_to_window_6 ,
window_6_numeric - window_0_numeric AS growth_window_0_to_window_6 


FROM
`harlemlinksy2122.whole_school_fp.windows_numeric` ;




--[step 4] UNPIVOT the interval calculations allow the use of a filter to select the desired interval
CREATE OR REPLACE TABLE
`harlemlinksy2122.whole_school_fp.unpivot_windows_numeric` AS

SELECT
  osis,
  window_interval,
  growth
FROM
  `harlemlinksy2122.whole_school_fp.fp_growth` UNPIVOT(growth FOR window_interval IN (
growth_window_0_to_window_1,
growth_window_1_to_window_2,
growth_window_0_to_window_2,
growth_window_2_to_window_3,
growth_window_1_to_window_3,
growth_window_0_to_window_3,
growth_window_3_to_window_4,
growth_window_2_to_window_4,
growth_window_1_to_window_4,
growth_window_0_to_window_4,
growth_window_4_to_window_5,
growth_window_3_to_window_5,
growth_window_2_to_window_5,
growth_window_1_to_window_5,
growth_window_0_to_window_5,
growth_window_5_to_window_6,
growth_window_4_to_window_6,
growth_window_3_to_window_6,
growth_window_2_to_window_6,
growth_window_1_to_window_6,
growth_window_0_to_window_6

      )) ;







--[step 5] join the unpivoted data to the demographic table
CREATE OR REPLACE TABLE
`harlemlinksy2122.datasources.fp_interval_growth` AS

--select columns from the unpivoted growth table (alias: unpivots)
SELECT
unpivots.osis,
window_interval,
growth,

--convert the contents of the window_interval column to more user-friendly output 
CASE
  WHEN window_interval = 'growth_window_0_to_window_1' THEN 'Growth: Window 0 to Window 1'
  WHEN window_interval = 'growth_window_1_to_window_2' THEN 'Growth: Window 1 to Window 2'
  WHEN window_interval = 'growth_window_0_to_window_2' THEN 'Growth: Window 0 to Window 2'
  WHEN window_interval = 'growth_window_2_to_window_3' THEN 'Growth: Window 2 to Window 3'
  WHEN window_interval = 'growth_window_1_to_window_3' THEN 'Growth: Window 1 to Window 3'
  WHEN window_interval = 'growth_window_0_to_window_3' THEN 'Growth: Window 0 to Window 3'
  WHEN window_interval = 'growth_window_3_to_window_4' THEN 'Growth: Window 3 to Window 4'
  WHEN window_interval = 'growth_window_2_to_window_4' THEN 'Growth: Window 2 to Window 4'
  WHEN window_interval = 'growth_window_1_to_window_4' THEN 'Growth: Window 1 to Window 4'
  WHEN window_interval = 'growth_window_0_to_window_4' THEN 'Growth: Window 0 to Window 4'
  WHEN window_interval = 'growth_window_4_to_window_5' THEN 'Growth: Window 4 to Window 5'
  WHEN window_interval = 'growth_window_3_to_window_5' THEN 'Growth: Window 3 to Window 5'
  WHEN window_interval = 'growth_window_2_to_window_5' THEN 'Growth: Window 2 to Window 5'
  WHEN window_interval = 'growth_window_1_to_window_5' THEN 'Growth: Window 1 to Window 5'
  WHEN window_interval = 'growth_window_0_to_window_5' THEN 'Growth: Window 0 to Window 5'
  WHEN window_interval = 'growth_window_5_to_window_6' THEN 'Growth: Window 5 to Window 6'
  WHEN window_interval = 'growth_window_4_to_window_6' THEN 'Growth: Window 4 to Window 6'
  WHEN window_interval = 'growth_window_3_to_window_6' THEN 'Growth: Window 3 to Window 6'
  WHEN window_interval = 'growth_window_2_to_window_6' THEN 'Growth: Window 2 to Window 6'
  WHEN window_interval = 'growth_window_1_to_window_6' THEN 'Growth: Window 1 to Window 6'
  WHEN window_interval = 'growth_window_0_to_window_6' THEN 'Growth: Window 0 to Window 6' 
END AS growth_interval,

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
ais


FROM 
`harlemlinksy2122.whole_school_fp.unpivot_windows_numeric` unpivots 

LEFT JOIN 
`harlemlinksy2122.demographics.students` students

ON 
unpivots.osis = students.osis ;


--END---------------------------------------------------------------------