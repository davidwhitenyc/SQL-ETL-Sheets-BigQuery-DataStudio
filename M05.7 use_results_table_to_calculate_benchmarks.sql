--[step 01.7] use the results table to calculate benchmarks using CASE WHEN
   
CREATE OR REPLACE TABLE
  `harlemlinksy2122.benchmarks.math_grade5` AS
SELECT
  osis,
  unit,
  SUM(points_earned)/SUM(points_available) AS math_pct_points,
--used to add student-assessment-level benchmarks to tables with student-question level granularity
  CASE
    WHEN SUM(points_earned)/SUM(points_available) >= .75 THEN "Achieved Benchmark"
    WHEN SUM(points_earned)/SUM(points_available) BETWEEN .5
  AND .74999999 THEN "Approaching Benchmark"
    WHEN SUM(points_earned)/SUM(points_available) < .5 THEN "Below Benchmark"
  ELSE
  ""
END
  AS math_benchmark
FROM
  `harlemlinksy2122.results.math_grade5`
WHERE
  osis IS NOT NULL
GROUP BY
  1,
  2 ;