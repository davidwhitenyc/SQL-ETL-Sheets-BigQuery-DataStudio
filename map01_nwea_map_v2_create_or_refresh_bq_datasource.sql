-----------------------------------------------------------------------------
--run this combined script to refresh the v2 NWEA MAP BigQuery Datasource---
-----------------------------------------------------------------------------

--[step 1] import test results

--import fall 2021–22 test results
SELECT * 
FROM `harlemlinksy2122.nwea_map.nwea_map_fall_2021_22` ;


--import winter 2021–22 test results
SELECT * 
FROM `harlemlinksy2122.nwea_map.nwea_map_winter_2021_22` ;
--insert import for spring 2021–22 test results below





--[step 2] import testing locations tracker
SELECT *
FROM
`harlemlinksy2122.nwea_map.testing_locations` ;





--[step 3] combine all test results into a single table
CREATE OR REPLACE TABLE
`harlemlinksy2122.nwea_map.union_all` AS 

--select columns from the fall testing window
SELECT
academic_year,
student_id,
student_last_name,
student_first_name,
student_middle_initial,
term_tested,
term_rostered,
school,
grade,
subject,
course,
rit_score,
rapid_guessing_pct,
rit_score_10_point_range,
lexilescore,
lexilerange,
quantilescore,
quantilerange,
test_name,
mathematics_geometry,
mathematics_measurement_and_data,
mathematics_number_and_operations,
mathematics_operations_and_algebraic_thinking,
language_arts_foundational_skills,
language_arts_literary_and_informational_text,
language_arts_understand_key_ideas_details_and_connections,
language_arts_understand_language_craft_and_structure,
language_arts_vocabulary_acquisition_and_use1,
language_arts_vocabulary_acquisition_and_use2,
language_arts_writing_and_conventions_of_academic_english

FROM
`harlemlinksy2122.nwea_map.nwea_map_fall_2021_22` 


UNION ALL
--select columns from the winter testing window
SELECT
academic_year,
student_id,
student_last_name,
student_first_name,
student_middle_initial,
term_tested,
term_rostered,
school,
grade,
subject,
course,
rit_score,
rapid_guessing_pct,
rit_score_10_point_range,
lexilescore,
lexilerange,
quantilescore,
quantilerange,
test_name,
mathematics_geometry,
mathematics_measurement_and_data,
mathematics_number_and_operations,
mathematics_operations_and_algebraic_thinking,
language_arts_foundational_skills,
language_arts_literary_and_informational_text,
language_arts_understand_key_ideas_details_and_connections,
language_arts_understand_language_craft_and_structure,
language_arts_vocabulary_acquisition_and_use1,
language_arts_vocabulary_acquisition_and_use2,
language_arts_writing_and_conventions_of_academic_english

FROM `harlemlinksy2122.nwea_map.nwea_map_winter_2021_22` ;
--insert pull for spring testing window below






--[step 4] create mini-tables containing the rit score for each individual subject-testing window


--fall 2021–22 reading rit
CREATE OR REPLACE TABLE
`harlemlinksy2122.nwea_map.rit_fall_21_22_reading` AS

SELECT
student_id,
rit_score AS rit_fall_21_22_reading 

FROM
`harlemlinksy2122.nwea_map.union_all`

WHERE term_tested = 'Fall 2021-2022' AND subject = 'Language Arts' ;


--winter 2021–22 reading rit
CREATE OR REPLACE TABLE
`harlemlinksy2122.nwea_map.rit_winter_21_22_reading` AS

SELECT
student_id,
rit_score AS rit_winter_21_22_reading

FROM
`harlemlinksy2122.nwea_map.union_all`

WHERE term_tested = 'Winter 2021-2022' AND subject = 'Language Arts' ;




--fall 2021–22 math rit
CREATE OR REPLACE TABLE
`harlemlinksy2122.nwea_map.rit_fall_21_22_math` AS

SELECT
student_id,
rit_score AS rit_fall_21_22_math

FROM
`harlemlinksy2122.nwea_map.union_all`

WHERE term_tested = 'Fall 2021-2022' AND subject = 'Mathematics' ;



--winter 2021–22 math rit
CREATE OR REPLACE TABLE
`harlemlinksy2122.nwea_map.rit_winter_21_22_math` AS

SELECT
student_id,
rit_score AS rit_winter_21_22_math

FROM
`harlemlinksy2122.nwea_map.union_all`

WHERE term_tested = 'Winter 2021-2022' AND subject = 'Mathematics' ;





--[step 6] join student demograpic data to create google data studio datasource table

CREATE OR REPLACE TABLE
`harlemlinksy2122.datasources.nwea_map` AS

--selecrt columns from the combined map test results table (alias: results)
SELECT
academic_year,
results.student_id,
student_last_name,
student_first_name,
student_middle_initial,
results.term_tested,
term_rostered,
school,
grade,
results.subject,
course,
rit_score,
rapid_guessing_pct,
rit_score_10_point_range,
lexilescore,
lexilerange,
quantilescore,
quantilerange,
test_name,
mathematics_geometry,
mathematics_measurement_and_data,
mathematics_number_and_operations,
mathematics_operations_and_algebraic_thinking,
language_arts_foundational_skills,
language_arts_literary_and_informational_text,
language_arts_understand_key_ideas_details_and_connections,
language_arts_understand_language_craft_and_structure,
language_arts_vocabulary_acquisition_and_use1,
language_arts_vocabulary_acquisition_and_use2,
language_arts_writing_and_conventions_of_academic_english,



--select columns from subject-testing window specific mini-tables
rit_fall_21_22_reading,
rit_winter_21_22_reading,
rit_fall_21_22_math,
rit_winter_21_22_math,


--calculate growth between testing windows
rit_winter_21_22_reading - rit_fall_21_22_reading AS v2_growth_reading_fall_to_winter ,
rit_winter_21_22_math - rit_fall_21_22_math AS v2_growth_math_fall_to_winter ,


--selecet columns from the 'students' datasource (alias: students)
students.student,
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
ais,


--import 'Virtual' or 'In-person' testing from testing locations tracker (alias: locations)
testing_location,

--import test completion columns
took_math,
took_reading

FROM
`harlemlinksy2122.nwea_map.union_all` results


--join the mini-tables
LEFT JOIN
`harlemlinksy2122.nwea_map.rit_fall_21_22_reading` fall_reading 
ON
results.student_id = fall_reading.student_id

LEFT JOIN
`harlemlinksy2122.nwea_map.rit_winter_21_22_reading` winter_reading 
ON
results.student_id = winter_reading.student_id

LEFT JOIN
`harlemlinksy2122.nwea_map.rit_fall_21_22_math` fall_math
ON
results.student_id = fall_math.student_id

LEFT JOIN
`harlemlinksy2122.nwea_map.rit_winter_21_22_math` winter_math
ON
results.student_id = winter_math.student_id




LEFT JOIN
`harlemlinksy2122.demographics.students` students

ON results.student_id = students.osis 

LEFT JOIN
`harlemlinksy2122.nwea_map.testing_locations` locations

ON results.student_id = locations.osis AND results.term_tested = locations.term_tested AND results.subject = locations.subject 


LEFT JOIN
`harlemlinksy2122.nwea_map.test_completion` completion 
ON results.student_id = completion.osis ;



--END------------------------------------------------------------------------