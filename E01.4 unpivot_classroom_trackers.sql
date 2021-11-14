--[step 01.4] unpivot classroom trackers
--add a new code block below for each new unit

----unpivot ela: reading data (all units)----
--unpivot ela: reading grade 1 unit 1
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_reading_grade1_unit1` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_reading_grade1_unit1` UNPIVOT(points_earned FOR question_id IN (reading_grade1_unit1_01,
reading_grade1_unit1_02,
reading_grade1_unit1_03

      )) ;
--add the next ela: reading unit below


----unpivot ela: writing data (all units)----
--unpivot ela: writing grade 1 unit 1
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_writing_grade1_unit1` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_writing_grade1_unit1` UNPIVOT(points_earned FOR question_id IN (writing_grade1_unit1_01,
writing_grade1_unit1_02,
writing_grade1_unit1_03,
writing_grade1_unit1_04,
writing_grade1_unit1_05,
writing_grade1_unit1_06,
writing_grade1_unit1_07

      )) ;

--add the next ela: writing unit below


----unpivot ela: fundations data (all assessments)----
--unpivot ela: fundations grade 1 assessment #1
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_fundations_grade1_assessment1` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_fundations_grade1_assessment1` UNPIVOT(points_earned FOR question_id IN (write_lowercase_a,
write_lowercase_b,
write_lowercase_c,
write_lowercase_d,
write_lowercase_e,
write_lowercase_f,
write_lowercase_g,
write_lowercase_h,
write_lowercase_i,
write_lowercase_j,
write_lowercase_k,
write_lowercase_l,
write_lowercase_m,
write_lowercase_n,
write_lowercase_o,
write_lowercase_p,
write_lowercase_q,
write_lowercase_r,
write_lowercase_s,
write_lowercase_t,
write_lowercase_u,
write_lowercase_v,
write_lowercase_w,
write_lowercase_x,
write_lowercase_y,
write_lowercase_z

      )) ;

--unpivot ela: fundations grade 1 assessment #2
CREATE OR REPLACE TABLE
  `harlemlinksy2122.unpivots.ela_fundations_grade1_assessment2` AS
SELECT
  osis,
  question_id,
  points_earned
FROM
  `harlemlinksy2122.trackers.ela_fundations_grade1_assessment2` UNPIVOT(points_earned FOR question_id IN (hear_the_sound_write_the_letter_that_matches_the_sound_f,
hear_the_sound_write_the_letter_that_matches_the_sound_m,
hear_the_sound_write_the_letter_that_matches_the_sound_h,
hear_the_sound_write_the_letter_that_matches_the_sound_p,
hear_the_sound_write_the_letter_that_matches_the_sound_t,
hear_the_sound_write_the_letter_that_matches_the_sound_i,
hear_the_sound_write_the_letter_that_matches_the_sound_v,
hear_the_sound_write_the_letter_that_matches_the_sound_a,
hear_the_sound_write_the_letter_that_matches_the_sound_z
      )) ;