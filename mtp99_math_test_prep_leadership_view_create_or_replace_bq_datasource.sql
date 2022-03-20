--refresh each grade level datasource

SELECT * FROM `harlemlinksy2122.datasources.math_tp_grade3`  ;

SELECT * FROM `harlemlinksy2122.datasources.math_tp_grade4`  ;

SELECT * FROM `harlemlinksy2122.datasources.math_tp_grade5`  ; 


--create math test prep leadership view datasource

CREATE OR REPLACE TABLE 
`harlemlinksy2122.datasources.math_tp_leadership` AS

SELECT *,
  CASE 
    WHEN student IS NOT NULL THEN 'SY 2021–22'
  END AS academic_year
FROM `harlemlinksy2122.datasources.math_tp_grade3`


UNION ALL
SELECT *,
 CASE 
    WHEN student IS NOT NULL THEN 'SY 2021–22'
  END AS academic_year
FROM `harlemlinksy2122.datasources.math_tp_grade4`


UNION ALL
SELECT *,
 CASE 
    WHEN student IS NOT NULL THEN 'SY 2021–22'
  END AS academic_year
FROM `harlemlinksy2122.datasources.math_tp_grade5`  ;


--END----------------------------------------------------------------------------------