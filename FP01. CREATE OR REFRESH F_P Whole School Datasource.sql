----this script creates or refreshes the data source that powers the whole-school f&p results dashboard

--pull in all f&p results from classroom trackers via the F&P consolidated tracker A.K.A. "the big tracker"
SELECT
  *
FROM
  `harlemlinksy2122.whole_school_fp.fp_results_sy_2021_22` ;

--pull in the f&p benchmark levels for each grade level


--combine f&p results and f&p benchmark levels
CREATE OR REPLACE TABLE
`harlemlinksy2122.whole_school_fp.fp_results_and_benchmark_levels` AS
SELECT
 osis,
 jun_2021_independent_benchmark,
 jun_2021_instructional_benchmark,
 sep_2021_independent_benchmark,
 sep_2021_instructional_benchmark,
 nov_2021_independent_benchmark,
 nov_2021_instructional_benchmark,
 mar_2022_independent_benchmark,
 mar_2022_instructional_benchmark,
 jun_2022_independent_benchmark,
 jun_2022_instructional_benchmark

FROM 
`harlemlinksy2122.demographics.students` s 

LEFT JOIN
`harlemlinksy2122.whole_school_fp.fp_benchmark_levels`  b

ON s.sy21_22_grade_level = b.grade_level;



--combine f&p results, f&p benchmark levels and, student demographic information
CREATE OR REPLACE TABLE
`harlemlinksy2122.whole_school_fp.fp_datasourcev1` AS

SELECT
--pull these columns from the fp results table
  fpr.osis,
  jun_2021_instructional_level,
  jun_2021_student_vs_benchmark,
  nov_2021_instructional_level,
  nov_2021_student_vs_benchmark,
  growth_jun_2021_to_nov_2021,
--pull these columns from the .demographics.students table
  student,
  sy_21_22_class,
  sy21_22_grade_level,
  sped,
  enl,
  hl_upk,
  holdovers,
  new_students,
  ais,
--pull these columns from the fp benchmark levels table
  jun_2021_independent_benchmark,
  jun_2021_instructional_benchmark,
  sep_2021_independent_benchmark,
  sep_2021_instructional_benchmark,
  nov_2021_independent_benchmark,
  nov_2021_instructional_benchmark,
  mar_2022_independent_benchmark,
  mar_2022_instructional_benchmark,
  jun_2022_independent_benchmark,
  jun_2022_instructional_benchmark

FROM 
`harlemlinksy2122.whole_school_fp.fp_results_sy_2021_22` fpr

LEFT JOIN
`harlemlinksy2122.demographics.students` s

ON s.osis = fpr.osis

LEFT JOIN
`harlemlinksy2122.whole_school_fp.fp_results_and_benchmark_levels` fpb

ON s.osis = fpb.osis ;