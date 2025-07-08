version 13
clear

import delimited record_id study_id school_name grade_form dob today_date gender age live_home___1 live_home___2 live_home___3 live_home___4 live_home___5 live_home___6 live_home___7 live_home___8 live_home___9 live_home___10 parent_status parent_living_status parents_seperate_status mother_education father_education household_ammenities___1 household_ammenities___2 household_ammenities___3 household_ammenities___4 household_ammenities___5 household_ammenities___6 household_ammenities___7 household_ammenities___8 household_ammenities___9 household_ammenities___10 household_ammenities___11 household_ammenities___12 household_ammenities___13 household_ammenities___14 household_ammenities___15 household_ammenities___16 toilet_facility toilet_specify water_supply_main live_type social_media_sites___1 social_media_sites___2 social_media_sites___3 social_media_sites___4 social_media_sites___5 social_media_sites___6 social_media_sites___7 social_media_sites___8 social_media_sites___9 social_media_sites___10 social_media_sites___11 social_media_sites___12 social_media_sites_other top_social_media_site second_social_media_site bottom_social_media_site social_media_freq social_media_time social_media_supervison device_password parent_password social_media_pressure social_media_23a social_media_23b social_media_23c social_media_24a___1 social_media_24a___2 social_media_24a___3 social_media_24a___4 social_media_24a___5 social_media_24a___6 social_media_24a___7 specify_24a social_media_24b___1 social_media_24b___2 social_media_24b___3 social_media_24b___4 social_media_24b___5 body_25a body_25b body_25c body_25d body_25e body_25f body_25g body_25h body_25i body_25j body_25k body_25l body_25m body_25n body_25o body_25p body_25q body_25r body_25s body_25t body_25u body_25v body_25w diet_crash_weight self_weight_perception others_weight_perception body_per_face body_per_hair body_per_ubody body_per_mbody body_per_lbody body_per_muscle body_per_weight body_per_height body_per_overall body_image_29a body_image_29b body_image_29c body_image_29d body_image_29e body_image_29f skin_bleach skin_bleach_freq skin_tattoo body_piercing self_esteem_1 self_esteem_2 self_esteem_3 self_esteem_4 self_esteem_5 self_esteem_6 self_esteem_7 self_esteem_8 self_esteem_9 self_esteem_10 depress_1 depress_2 depress_3 depress_4 depress_5 depress_6 depress_7 phq_9_1 phq_9_2 phq_9_3 phq_9_4 phq_9_5 phq_9_6 phq_9_7 phq_9_8 phq_9_9 depress_year diffculty_problems suicide_month suicide_ever parent_figure parent_con_a parent_con_b parent_con_c parent_con_d parent_con_e parent_con_f parent_con_g parent_con_h parent_con_i parent_con_j parent_con_k parent_con_l close_friend_a close_friend_b close_friend_c close_friend_d close_friend_e close_friend_f close_friend_g close_friend_h close_friend_i close_friend_j close_friend_k close_friend_l sataq_f_1 sataq_f_2 sataq_f_3 sataq_f_4 sataq_f_5 sataq_f_6 sataq_f_7 sataq_f_8 sataq_f_9 sataq_f_10 sataq_f_11 sataq_f_12 sataq_f_13 sataq_f_14 sataq_f_15 sataq_f_16 sataq_f_17 sataq_f_18 sataq_f_19 sataq_f_20 sataq_f_21 sataq_f_22 sataq_f_23 sataq_f_24 sataq_f_25 sataq_f_26 sataq_f_27 sataq_f_28 sataq_f_29 sataq_f_30 sataq_f_31 sataq_m_1 sataq_m_2 sataq_m_3 sataq_m_4 sataq_m_5 sataq_m_6 sataq_m_7 sataq_m_8 sataq_m_9 sataq_m_10 sataq_m_11 sataq_m_12 sataq_m_13 sataq_m_14 sataq_m_15 sataq_m_16 sataq_m_17 sataq_m_18 sataq_m_19 sataq_m_20 sataq_m_21 sataq_m_22 sataq_m_23 sataq_m_24 sataq_m_25 sataq_m_26 sataq_m_27 sataq_m_28 comment comments_share adol_form_complete using "BodySatisfactionInJa_DATA_NOHDRS_2025-07-07_1921.csv", varnames(nonames)

label data "BodySatisfactionInJa_DATA_NOHDRS_2025-07-07_1921.csv"

label define grade_form_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 
label define gender_ 1 "Male" 2 "Female" 
label define live_home___1_ 0 "Unchecked" 1 "Checked" 
label define live_home___2_ 0 "Unchecked" 1 "Checked" 
label define live_home___3_ 0 "Unchecked" 1 "Checked" 
label define live_home___4_ 0 "Unchecked" 1 "Checked" 
label define live_home___5_ 0 "Unchecked" 1 "Checked" 
label define live_home___6_ 0 "Unchecked" 1 "Checked" 
label define live_home___7_ 0 "Unchecked" 1 "Checked" 
label define live_home___8_ 0 "Unchecked" 1 "Checked" 
label define live_home___9_ 0 "Unchecked" 1 "Checked" 
label define live_home___10_ 0 "Unchecked" 1 "Checked" 
label define parent_status_ 1 "Living together most of the time (at least 3 days out of the week for most weeks)" 2 "Living separately" 3 "One of my parents is dead" 4 "Both of my parents are dead" 5 "Dont know where my parents are" 
label define parent_living_status_ 1 "Married" 2 "Common-Law" 
label define parents_seperate_status_ 1 "Married" 2 "Visiting" 3 "No relationship" 
label define mother_education_ 1 "Primary school" 2 "She did not finish secondary/high school" 3 "She finished secondary/high school" 4 "University/College" 5 "Do not know" 
label define father_education_ 1 "Primary school" 2 "She did not finish secondary/high school" 3 "She finished secondary/high school" 4 "University/College" 5 "Do not know" 
label define household_ammenities___1_ 0 "Unchecked" 1 "Checked" 
label define household_ammenities___2_ 0 "Unchecked" 1 "Checked" 
label define household_ammenities___3_ 0 "Unchecked" 1 "Checked" 
label define household_ammenities___4_ 0 "Unchecked" 1 "Checked" 
label define household_ammenities___5_ 0 "Unchecked" 1 "Checked" 
label define household_ammenities___6_ 0 "Unchecked" 1 "Checked" 
label define household_ammenities___7_ 0 "Unchecked" 1 "Checked" 
label define household_ammenities___8_ 0 "Unchecked" 1 "Checked" 
label define household_ammenities___9_ 0 "Unchecked" 1 "Checked" 
label define household_ammenities___10_ 0 "Unchecked" 1 "Checked" 
label define household_ammenities___11_ 0 "Unchecked" 1 "Checked" 
label define household_ammenities___12_ 0 "Unchecked" 1 "Checked" 
label define household_ammenities___13_ 0 "Unchecked" 1 "Checked" 
label define household_ammenities___14_ 0 "Unchecked" 1 "Checked" 
label define household_ammenities___15_ 0 "Unchecked" 1 "Checked" 
label define household_ammenities___16_ 0 "Unchecked" 1 "Checked" 
label define toilet_facility_ 1 "Own inside flush toilet" 2 "Inside flush toilet (shared with another" 3 "Own outside flush toilet" 4 "Shared outside flush toilet" 5 "Pit latrine, only for your house" 6 "Pit latrine, shared with another household" 7 "Other" 
label define water_supply_main_ 1 "Pipe inside of house" 2 "Own yard pipe (only for your house)" 3 "Pipe in yard shared with other households" 4 "Pipe outside of yard but near (less than 100yards)" 5 "Pipe outside of yard but far (more than 100yards)" 6 "River" 7 "Tank/Well" 
label define live_type_ 1 "Rural" 2 "Urban" 
label define social_media_sites___1_ 0 "Unchecked" 1 "Checked" 
label define social_media_sites___2_ 0 "Unchecked" 1 "Checked" 
label define social_media_sites___3_ 0 "Unchecked" 1 "Checked" 
label define social_media_sites___4_ 0 "Unchecked" 1 "Checked" 
label define social_media_sites___5_ 0 "Unchecked" 1 "Checked" 
label define social_media_sites___6_ 0 "Unchecked" 1 "Checked" 
label define social_media_sites___7_ 0 "Unchecked" 1 "Checked" 
label define social_media_sites___8_ 0 "Unchecked" 1 "Checked" 
label define social_media_sites___9_ 0 "Unchecked" 1 "Checked" 
label define social_media_sites___10_ 0 "Unchecked" 1 "Checked" 
label define social_media_sites___11_ 0 "Unchecked" 1 "Checked" 
label define social_media_sites___12_ 0 "Unchecked" 1 "Checked" 
label define top_social_media_site_ 1 "Facebook" 2 "WhatsApp" 3 "Instagram" 4 "Snapchat" 5 "TikTok" 6 "Twitter" 7 "YouTube" 8 "Pinterest" 9 "LinkedIn" 10 "Reddit" 11 "BeReal" 12 "Other" 
label define second_social_media_site_ 1 "Facebook" 2 "WhatsApp" 3 "Instagram" 4 "Snapchat" 5 "TikTok" 6 "Twitter" 7 "YouTube" 8 "Pinterest" 9 "LinkedIn" 10 "Reddit" 11 "BeReal" 12 "Other" 
label define bottom_social_media_site_ 1 "Facebook" 2 "WhatsApp" 3 "Instagram" 4 "Snapchat" 5 "TikTok" 6 "Twitter" 7 "YouTube" 8 "Pinterest" 9 "LinkedIn" 10 "Reddit" 11 "BeReal" 12 "Other" 
label define social_media_freq_ 1 "1-2/week" 2 "3-4/week" 3 "5-7/week" 
label define social_media_time_ 1 "< 1 hour" 2 "1-3 hours" 3 "4-6 hours" 4 "7-10 hours" 
label define social_media_supervison_ 0 "No" 1 "Yes" 2 "Sometimes" 
label define device_password_ 1 "Yes" 0 "No" 
label define parent_password_ 1 "Yes" 0 "No" 
label define social_media_pressure_ 1 "Never" 2 "Hardly ever" 3 "Sometimes" 4 "Most of the time" 5 "Always" 
label define social_media_23a_ 1 "0-1hr" 2 "1-3 hours" 3 "3-5 hours" 4 ">5 hours" 
label define social_media_23b_ 1 "Never" 2 "Hardly ever" 3 "Sometimes" 4 "Most of the time" 5 "Always" 
label define social_media_23c_ 1 "Never" 2 "Hardly ever" 3 "Sometimes" 4 "Most of the time" 5 "Always" 
label define social_media_24a___1_ 0 "Unchecked" 1 "Checked" 
label define social_media_24a___2_ 0 "Unchecked" 1 "Checked" 
label define social_media_24a___3_ 0 "Unchecked" 1 "Checked" 
label define social_media_24a___4_ 0 "Unchecked" 1 "Checked" 
label define social_media_24a___5_ 0 "Unchecked" 1 "Checked" 
label define social_media_24a___6_ 0 "Unchecked" 1 "Checked" 
label define social_media_24a___7_ 0 "Unchecked" 1 "Checked" 
label define social_media_24b___1_ 0 "Unchecked" 1 "Checked" 
label define social_media_24b___2_ 0 "Unchecked" 1 "Checked" 
label define social_media_24b___3_ 0 "Unchecked" 1 "Checked" 
label define social_media_24b___4_ 0 "Unchecked" 1 "Checked" 
label define social_media_24b___5_ 0 "Unchecked" 1 "Checked" 
label define body_25a_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define body_25b_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define body_25c_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define body_25d_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define body_25e_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define body_25f_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define body_25g_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define body_25h_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define body_25i_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define body_25j_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define body_25k_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define body_25l_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define body_25m_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define body_25n_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define body_25o_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define body_25p_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define body_25q_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define body_25r_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define body_25s_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define body_25t_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define body_25u_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define body_25v_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define body_25w_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define diet_crash_weight_ 1 "Never" 2 "Rarely" 3 "Sometimes" 4 "Often" 5 "Very Often" 
label define self_weight_perception_ 1 "Very Underweight" 2 "Somewhat Underweight" 3 "Normal Weight" 4 "Somewhat Overweight" 5 "Very Overweight" 
label define others_weight_perception_ 1 "Very Underweight" 2 "Somewhat Underweight" 3 "Normal Weight" 4 "Somewhat Overweight" 5 "Very Overweight" 
label define body_per_face_ 1 "Very unhappy" 2 "Mostly unhappy" 3 "Neither happy or unhappy" 4 "Mostly happy" 5 "Very happy" 
label define body_per_hair_ 1 "Very unhappy" 2 "Mostly unhappy" 3 "Neither happy or unhappy" 4 "Mostly happy" 5 "Very happy" 
label define body_per_ubody_ 1 "Very unhappy" 2 "Mostly unhappy" 3 "Neither happy or unhappy" 4 "Mostly happy" 5 "Very happy" 
label define body_per_mbody_ 1 "Very unhappy" 2 "Mostly unhappy" 3 "Neither happy or unhappy" 4 "Mostly happy" 5 "Very happy" 
label define body_per_lbody_ 1 "Very unhappy" 2 "Mostly unhappy" 3 "Neither happy or unhappy" 4 "Mostly happy" 5 "Very happy" 
label define body_per_muscle_ 1 "Very unhappy" 2 "Mostly unhappy" 3 "Neither happy or unhappy" 4 "Mostly happy" 5 "Very happy" 
label define body_per_weight_ 1 "Very unhappy" 2 "Mostly unhappy" 3 "Neither happy or unhappy" 4 "Mostly happy" 5 "Very happy" 
label define body_per_height_ 1 "Very unhappy" 2 "Mostly unhappy" 3 "Neither happy or unhappy" 4 "Mostly happy" 5 "Very happy" 
label define body_per_overall_ 1 "Very unhappy" 2 "Mostly unhappy" 3 "Neither happy or unhappy" 4 "Mostly happy" 5 "Very happy" 
label define body_image_29a_ 1 "Disagree a lot" 2 "Disagree a little" 3 "Do not agree or disagree" 4 "Agree a little" 5 "Agree a lot" 
label define body_image_29b_ 1 "Disagree a lot" 2 "Disagree a little" 3 "Do not agree or disagree" 4 "Agree a little" 5 "Agree a lot" 
label define body_image_29c_ 1 "Disagree a lot" 2 "Disagree a little" 3 "Do not agree or disagree" 4 "Agree a little" 5 "Agree a lot" 
label define body_image_29d_ 1 "Disagree a lot" 2 "Disagree a little" 3 "Do not agree or disagree" 4 "Agree a little" 5 "Agree a lot" 
label define body_image_29e_ 1 "Disagree a lot" 2 "Disagree a little" 3 "Do not agree or disagree" 4 "Agree a little" 5 "Agree a lot" 
label define body_image_29f_ 1 "Disagree a lot" 2 "Disagree a little" 3 "Do not agree or disagree" 4 "Agree a little" 5 "Agree a lot" 
label define skin_bleach_ 1 "I already have" 2 "I am seriously thinking about it" 3 "Maybe" 4 "I would never do it" 
label define skin_bleach_freq_ 1 "Never" 2 "1-2 times per year" 3 "3-10 times per year" 4 "More than 10 times per year" 5 "Dont know/Not sure" 
label define skin_tattoo_ 1 "I already have" 2 "I am seriously thinking about it" 3 "Maybe" 4 "I would never do it" 
label define body_piercing_ 1 "I already have" 2 "I am seriously thinking about it" 3 "Maybe" 4 "I would never do it" 
label define self_esteem_1_ 1 "Agree a lot" 2 "Agree" 3 "Disagree" 4 "Disagree a lot" 
label define self_esteem_2_ 1 "Agree a lot" 2 "Agree" 3 "Disagree" 4 "Disagree a lot" 
label define self_esteem_3_ 1 "Agree a lot" 2 "Agree" 3 "Disagree" 4 "Disagree a lot" 
label define self_esteem_4_ 1 "Agree a lot" 2 "Agree" 3 "Disagree" 4 "Disagree a lot" 
label define self_esteem_5_ 1 "Agree a lot" 2 "Agree" 3 "Disagree" 4 "Disagree a lot" 
label define self_esteem_6_ 1 "Agree a lot" 2 "Agree" 3 "Disagree" 4 "Disagree a lot" 
label define self_esteem_7_ 1 "Agree a lot" 2 "Agree" 3 "Disagree" 4 "Disagree a lot" 
label define self_esteem_8_ 1 "Agree a lot" 2 "Agree" 3 "Disagree" 4 "Disagree a lot" 
label define self_esteem_9_ 1 "Agree a lot" 2 "Agree" 3 "Disagree" 4 "Disagree a lot" 
label define self_esteem_10_ 1 "Agree a lot" 2 "Agree" 3 "Disagree" 4 "Disagree a lot" 
label define depress_1_ 0 "Not at all" 1 "Several Days" 2 "More than half the days" 3 "Nearly every day" 
label define depress_2_ 0 "Not at all" 1 "Several Days" 2 "More than half the days" 3 "Nearly every day" 
label define depress_3_ 0 "Not at all" 1 "Several Days" 2 "More than half the days" 3 "Nearly every day" 
label define depress_4_ 0 "Not at all" 1 "Several Days" 2 "More than half the days" 3 "Nearly every day" 
label define depress_5_ 0 "Not at all" 1 "Several Days" 2 "More than half the days" 3 "Nearly every day" 
label define depress_6_ 0 "Not at all" 1 "Several Days" 2 "More than half the days" 3 "Nearly every day" 
label define depress_7_ 0 "Not at all" 1 "Several Days" 2 "More than half the days" 3 "Nearly every day" 
label define phq_9_1_ 0 "Not at all" 1 "Several Days" 2 "More than half the days" 3 "Nearly every day" 
label define phq_9_2_ 0 "Not at all" 1 "Several Days" 2 "More than half the days" 3 "Nearly every day" 
label define phq_9_3_ 0 "Not at all" 1 "Several Days" 2 "More than half the days" 3 "Nearly every day" 
label define phq_9_4_ 0 "Not at all" 1 "Several Days" 2 "More than half the days" 3 "Nearly every day" 
label define phq_9_5_ 0 "Not at all" 1 "Several Days" 2 "More than half the days" 3 "Nearly every day" 
label define phq_9_6_ 0 "Not at all" 1 "Several Days" 2 "More than half the days" 3 "Nearly every day" 
label define phq_9_7_ 0 "Not at all" 1 "Several Days" 2 "More than half the days" 3 "Nearly every day" 
label define phq_9_8_ 0 "Not at all" 1 "Several Days" 2 "More than half the days" 3 "Nearly every day" 
label define phq_9_9_ 0 "Not at all" 1 "Several Days" 2 "More than half the days" 3 "Nearly every day" 
label define depress_year_ 1 "Yes" 0 "No" 
label define diffculty_problems_ 1 "Not difficult at all" 2 "Somewhat difficult" 3 "Very difficult" 4 "Extremely difficult" 
label define suicide_month_ 1 "Yes" 0 "No" 
label define suicide_ever_ 1 "Yes" 0 "No" 
label define parent_con_a_ 1 "Almost never or never true" 2 "Sometimes true" 3 "Often true" 4 "Almost always or always true" 
label define parent_con_b_ 1 "Almost never or never true" 2 "Sometimes true" 3 "Often true" 4 "Almost always or always true" 
label define parent_con_c_ 1 "Almost never or never true" 2 "Sometimes true" 3 "Often true" 4 "Almost always or always true" 
label define parent_con_d_ 1 "Almost never or never true" 2 "Sometimes true" 3 "Often true" 4 "Almost always or always true" 
label define parent_con_e_ 1 "Almost never or never true" 2 "Sometimes true" 3 "Often true" 4 "Almost always or always true" 
label define parent_con_f_ 1 "Almost never or never true" 2 "Sometimes true" 3 "Often true" 4 "Almost always or always true" 
label define parent_con_g_ 1 "Almost never or never true" 2 "Sometimes true" 3 "Often true" 4 "Almost always or always true" 
label define parent_con_h_ 1 "Almost never or never true" 2 "Sometimes true" 3 "Often true" 4 "Almost always or always true" 
label define parent_con_i_ 1 "Almost never or never true" 2 "Sometimes true" 3 "Often true" 4 "Almost always or always true" 
label define parent_con_j_ 1 "Almost never or never true" 2 "Sometimes true" 3 "Often true" 4 "Almost always or always true" 
label define parent_con_k_ 1 "Almost never or never true" 2 "Sometimes true" 3 "Often true" 4 "Almost always or always true" 
label define parent_con_l_ 1 "Almost never or never true" 2 "Sometimes true" 3 "Often true" 4 "Almost always or always true" 
label define close_friend_a_ 1 "Almost never or never true" 2 "Sometimes true" 3 "Often true" 4 "Almost always or always true" 
label define close_friend_b_ 1 "Almost never or never true" 2 "Sometimes true" 3 "Often true" 4 "Almost always or always true" 
label define close_friend_c_ 1 "Almost never or never true" 2 "Sometimes true" 3 "Often true" 4 "Almost always or always true" 
label define close_friend_d_ 1 "Almost never or never true" 2 "Sometimes true" 3 "Often true" 4 "Almost always or always true" 
label define close_friend_e_ 1 "Almost never or never true" 2 "Sometimes true" 3 "Often true" 4 "Almost always or always true" 
label define close_friend_f_ 1 "Almost never or never true" 2 "Sometimes true" 3 "Often true" 4 "Almost always or always true" 
label define close_friend_g_ 1 "Almost never or never true" 2 "Sometimes true" 3 "Often true" 4 "Almost always or always true" 
label define close_friend_h_ 1 "Almost never or never true" 2 "Sometimes true" 3 "Often true" 4 "Almost always or always true" 
label define close_friend_i_ 1 "Almost never or never true" 2 "Sometimes true" 3 "Often true" 4 "Almost always or always true" 
label define close_friend_j_ 1 "Almost never or never true" 2 "Sometimes true" 3 "Often true" 4 "Almost always or always true" 
label define close_friend_k_ 1 "Almost never or never true" 2 "Sometimes true" 3 "Often true" 4 "Almost always or always true" 
label define close_friend_l_ 1 "Almost never or never true" 2 "Sometimes true" 3 "Often true" 4 "Almost always or always true" 
label define sataq_f_1_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_2_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_3_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_4_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_5_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_6_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_7_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_8_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_9_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_10_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_11_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_12_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_13_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_14_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_15_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_16_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_17_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_18_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_19_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_20_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_21_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_22_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_23_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_24_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_25_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_26_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_27_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_28_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_29_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_30_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_f_31_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_1_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_2_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_3_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_4_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_5_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_6_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_7_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_8_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_9_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_10_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_11_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_12_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_13_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_14_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_15_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_16_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_17_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_18_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_19_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_20_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_21_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_22_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_23_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_24_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_25_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_26_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_27_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define sataq_m_28_ 1 "Definitely Disagree" 2 "Mostly Disagree" 3 "Neither Agree or Disagree" 4 "Mostly Agree" 5 "Definitely Agree" 
label define comment_ 0 "No" 1 "Yes" 
label define adol_form_complete_ 0 "Incomplete" 1 "Unverified" 2 "Complete" 

label values grade_form grade_form_
label values gender gender_
label values live_home___1 live_home___1_
label values live_home___2 live_home___2_
label values live_home___3 live_home___3_
label values live_home___4 live_home___4_
label values live_home___5 live_home___5_
label values live_home___6 live_home___6_
label values live_home___7 live_home___7_
label values live_home___8 live_home___8_
label values live_home___9 live_home___9_
label values live_home___10 live_home___10_
label values parent_status parent_status_
label values parent_living_status parent_living_status_
label values parents_seperate_status parents_seperate_status_
label values mother_education mother_education_
label values father_education father_education_
label values household_ammenities___1 household_ammenities___1_
label values household_ammenities___2 household_ammenities___2_
label values household_ammenities___3 household_ammenities___3_
label values household_ammenities___4 household_ammenities___4_
label values household_ammenities___5 household_ammenities___5_
label values household_ammenities___6 household_ammenities___6_
label values household_ammenities___7 household_ammenities___7_
label values household_ammenities___8 household_ammenities___8_
label values household_ammenities___9 household_ammenities___9_
label values household_ammenities___10 household_ammenities___10_
label values household_ammenities___11 household_ammenities___11_
label values household_ammenities___12 household_ammenities___12_
label values household_ammenities___13 household_ammenities___13_
label values household_ammenities___14 household_ammenities___14_
label values household_ammenities___15 household_ammenities___15_
label values household_ammenities___16 household_ammenities___16_
label values toilet_facility toilet_facility_
label values water_supply_main water_supply_main_
label values live_type live_type_
label values social_media_sites___1 social_media_sites___1_
label values social_media_sites___2 social_media_sites___2_
label values social_media_sites___3 social_media_sites___3_
label values social_media_sites___4 social_media_sites___4_
label values social_media_sites___5 social_media_sites___5_
label values social_media_sites___6 social_media_sites___6_
label values social_media_sites___7 social_media_sites___7_
label values social_media_sites___8 social_media_sites___8_
label values social_media_sites___9 social_media_sites___9_
label values social_media_sites___10 social_media_sites___10_
label values social_media_sites___11 social_media_sites___11_
label values social_media_sites___12 social_media_sites___12_
label values top_social_media_site top_social_media_site_
label values second_social_media_site second_social_media_site_
label values bottom_social_media_site bottom_social_media_site_
label values social_media_freq social_media_freq_
label values social_media_time social_media_time_
label values social_media_supervison social_media_supervison_
label values device_password device_password_
label values parent_password parent_password_
label values social_media_pressure social_media_pressure_
label values social_media_23a social_media_23a_
label values social_media_23b social_media_23b_
label values social_media_23c social_media_23c_
label values social_media_24a___1 social_media_24a___1_
label values social_media_24a___2 social_media_24a___2_
label values social_media_24a___3 social_media_24a___3_
label values social_media_24a___4 social_media_24a___4_
label values social_media_24a___5 social_media_24a___5_
label values social_media_24a___6 social_media_24a___6_
label values social_media_24a___7 social_media_24a___7_
label values social_media_24b___1 social_media_24b___1_
label values social_media_24b___2 social_media_24b___2_
label values social_media_24b___3 social_media_24b___3_
label values social_media_24b___4 social_media_24b___4_
label values social_media_24b___5 social_media_24b___5_
label values body_25a body_25a_
label values body_25b body_25b_
label values body_25c body_25c_
label values body_25d body_25d_
label values body_25e body_25e_
label values body_25f body_25f_
label values body_25g body_25g_
label values body_25h body_25h_
label values body_25i body_25i_
label values body_25j body_25j_
label values body_25k body_25k_
label values body_25l body_25l_
label values body_25m body_25m_
label values body_25n body_25n_
label values body_25o body_25o_
label values body_25p body_25p_
label values body_25q body_25q_
label values body_25r body_25r_
label values body_25s body_25s_
label values body_25t body_25t_
label values body_25u body_25u_
label values body_25v body_25v_
label values body_25w body_25w_
label values diet_crash_weight diet_crash_weight_
label values self_weight_perception self_weight_perception_
label values others_weight_perception others_weight_perception_
label values body_per_face body_per_face_
label values body_per_hair body_per_hair_
label values body_per_ubody body_per_ubody_
label values body_per_mbody body_per_mbody_
label values body_per_lbody body_per_lbody_
label values body_per_muscle body_per_muscle_
label values body_per_weight body_per_weight_
label values body_per_height body_per_height_
label values body_per_overall body_per_overall_
label values body_image_29a body_image_29a_
label values body_image_29b body_image_29b_
label values body_image_29c body_image_29c_
label values body_image_29d body_image_29d_
label values body_image_29e body_image_29e_
label values body_image_29f body_image_29f_
label values skin_bleach skin_bleach_
label values skin_bleach_freq skin_bleach_freq_
label values skin_tattoo skin_tattoo_
label values body_piercing body_piercing_
label values self_esteem_1 self_esteem_1_
label values self_esteem_2 self_esteem_2_
label values self_esteem_3 self_esteem_3_
label values self_esteem_4 self_esteem_4_
label values self_esteem_5 self_esteem_5_
label values self_esteem_6 self_esteem_6_
label values self_esteem_7 self_esteem_7_
label values self_esteem_8 self_esteem_8_
label values self_esteem_9 self_esteem_9_
label values self_esteem_10 self_esteem_10_
label values depress_1 depress_1_
label values depress_2 depress_2_
label values depress_3 depress_3_
label values depress_4 depress_4_
label values depress_5 depress_5_
label values depress_6 depress_6_
label values depress_7 depress_7_
label values phq_9_1 phq_9_1_
label values phq_9_2 phq_9_2_
label values phq_9_3 phq_9_3_
label values phq_9_4 phq_9_4_
label values phq_9_5 phq_9_5_
label values phq_9_6 phq_9_6_
label values phq_9_7 phq_9_7_
label values phq_9_8 phq_9_8_
label values phq_9_9 phq_9_9_
label values depress_year depress_year_
label values diffculty_problems diffculty_problems_
label values suicide_month suicide_month_
label values suicide_ever suicide_ever_
label values parent_con_a parent_con_a_
label values parent_con_b parent_con_b_
label values parent_con_c parent_con_c_
label values parent_con_d parent_con_d_
label values parent_con_e parent_con_e_
label values parent_con_f parent_con_f_
label values parent_con_g parent_con_g_
label values parent_con_h parent_con_h_
label values parent_con_i parent_con_i_
label values parent_con_j parent_con_j_
label values parent_con_k parent_con_k_
label values parent_con_l parent_con_l_
label values close_friend_a close_friend_a_
label values close_friend_b close_friend_b_
label values close_friend_c close_friend_c_
label values close_friend_d close_friend_d_
label values close_friend_e close_friend_e_
label values close_friend_f close_friend_f_
label values close_friend_g close_friend_g_
label values close_friend_h close_friend_h_
label values close_friend_i close_friend_i_
label values close_friend_j close_friend_j_
label values close_friend_k close_friend_k_
label values close_friend_l close_friend_l_
label values sataq_f_1 sataq_f_1_
label values sataq_f_2 sataq_f_2_
label values sataq_f_3 sataq_f_3_
label values sataq_f_4 sataq_f_4_
label values sataq_f_5 sataq_f_5_
label values sataq_f_6 sataq_f_6_
label values sataq_f_7 sataq_f_7_
label values sataq_f_8 sataq_f_8_
label values sataq_f_9 sataq_f_9_
label values sataq_f_10 sataq_f_10_
label values sataq_f_11 sataq_f_11_
label values sataq_f_12 sataq_f_12_
label values sataq_f_13 sataq_f_13_
label values sataq_f_14 sataq_f_14_
label values sataq_f_15 sataq_f_15_
label values sataq_f_16 sataq_f_16_
label values sataq_f_17 sataq_f_17_
label values sataq_f_18 sataq_f_18_
label values sataq_f_19 sataq_f_19_
label values sataq_f_20 sataq_f_20_
label values sataq_f_21 sataq_f_21_
label values sataq_f_22 sataq_f_22_
label values sataq_f_23 sataq_f_23_
label values sataq_f_24 sataq_f_24_
label values sataq_f_25 sataq_f_25_
label values sataq_f_26 sataq_f_26_
label values sataq_f_27 sataq_f_27_
label values sataq_f_28 sataq_f_28_
label values sataq_f_29 sataq_f_29_
label values sataq_f_30 sataq_f_30_
label values sataq_f_31 sataq_f_31_
label values sataq_m_1 sataq_m_1_
label values sataq_m_2 sataq_m_2_
label values sataq_m_3 sataq_m_3_
label values sataq_m_4 sataq_m_4_
label values sataq_m_5 sataq_m_5_
label values sataq_m_6 sataq_m_6_
label values sataq_m_7 sataq_m_7_
label values sataq_m_8 sataq_m_8_
label values sataq_m_9 sataq_m_9_
label values sataq_m_10 sataq_m_10_
label values sataq_m_11 sataq_m_11_
label values sataq_m_12 sataq_m_12_
label values sataq_m_13 sataq_m_13_
label values sataq_m_14 sataq_m_14_
label values sataq_m_15 sataq_m_15_
label values sataq_m_16 sataq_m_16_
label values sataq_m_17 sataq_m_17_
label values sataq_m_18 sataq_m_18_
label values sataq_m_19 sataq_m_19_
label values sataq_m_20 sataq_m_20_
label values sataq_m_21 sataq_m_21_
label values sataq_m_22 sataq_m_22_
label values sataq_m_23 sataq_m_23_
label values sataq_m_24 sataq_m_24_
label values sataq_m_25 sataq_m_25_
label values sataq_m_26 sataq_m_26_
label values sataq_m_27 sataq_m_27_
label values sataq_m_28 sataq_m_28_
label values comment comment_
label values adol_form_complete adol_form_complete_



tostring dob, replace
gen _date_ = date(dob,"YMD")
drop dob
rename _date_ dob
format dob %dM_d,_CY

tostring today_date, replace
gen _date_ = date(today_date,"YMD")
drop today_date
rename _date_ today_date
format today_date %dM_d,_CY

label variable record_id "Record ID"
label variable study_id "Study ID"
label variable school_name "School Name"
label variable grade_form "Grade/Form"
label variable dob "Date of birth"
label variable today_date "Todays Date"
label variable gender "Are you male or female?"
label variable age "How old are you?"
label variable live_home___1 "Who lives at home with you? (choice=Father)"
label variable live_home___2 "Who lives at home with you? (choice=Stepfather or mothers partner)"
label variable live_home___3 "Who lives at home with you? (choice=Mother)"
label variable live_home___4 "Who lives at home with you? (choice=Stepmother or fathers partner)"
label variable live_home___5 "Who lives at home with you? (choice=Grandparents/Great grandparents)"
label variable live_home___6 "Who lives at home with you? (choice=Aunt(s)/Uncles)"
label variable live_home___7 "Who lives at home with you? (choice=Brother(s))"
label variable live_home___8 "Who lives at home with you? (choice=Sister(s))"
label variable live_home___9 "Who lives at home with you? (choice=Other relative(s))"
label variable live_home___10 "Who lives at home with you? (choice=Other non-relative(s))"
label variable parent_status "Are your parents?"
label variable parent_living_status "If living together, are you parents?"
label variable parents_seperate_status "If living separately, are your parents?"
label variable mother_education "What was the last school your mother attended?"
label variable father_education "What was the last school your father attended?"
label variable household_ammenities___1 "Which of the following items do you have at your house that are working?  (choice=Gas stove/Electric stove)"
label variable household_ammenities___2 "Which of the following items do you have at your house that are working?  (choice=Refrigerator or freezer)"
label variable household_ammenities___3 "Which of the following items do you have at your house that are working?  (choice=Microwave oven)"
label variable household_ammenities___4 "Which of the following items do you have at your house that are working?  (choice=Telephone (landline))"
label variable household_ammenities___5 "Which of the following items do you have at your house that are working?  (choice=Telephone (cell phone))"
label variable household_ammenities___6 "Which of the following items do you have at your house that are working?  (choice=Radio)"
label variable household_ammenities___7 "Which of the following items do you have at your house that are working?  (choice=Stereo equipment/component set)"
label variable household_ammenities___8 "Which of the following items do you have at your house that are working?  (choice=DVD player)"
label variable household_ammenities___9 "Which of the following items do you have at your house that are working?  (choice=TV set)"
label variable household_ammenities___10 "Which of the following items do you have at your house that are working?  (choice=Cable TV)"
label variable household_ammenities___11 "Which of the following items do you have at your house that are working?  (choice=Computer/ laptop)"
label variable household_ammenities___12 "Which of the following items do you have at your house that are working?  (choice=Internet access)"
label variable household_ammenities___13 "Which of the following items do you have at your house that are working?  (choice=Adult Bicycle)"
label variable household_ammenities___14 "Which of the following items do you have at your house that are working?  (choice=Motorbike)"
label variable household_ammenities___15 "Which of the following items do you have at your house that are working?  (choice=Car/ other vehicle)"
label variable household_ammenities___16 "Which of the following items do you have at your house that are working?  (choice=Washing machine)"
label variable toilet_facility "What type of toilet facilities do you have at home?"
label variable toilet_specify "Please specify"
label variable water_supply_main "What is your main water supply at home? "
label variable live_type "Would you describe where you live as being"
label variable social_media_sites___1 "What sites do you use? (choice=Facebook)"
label variable social_media_sites___2 "What sites do you use? (choice=WhatsApp)"
label variable social_media_sites___3 "What sites do you use? (choice=Instagram)"
label variable social_media_sites___4 "What sites do you use? (choice=Snapchat)"
label variable social_media_sites___5 "What sites do you use? (choice=TikTok)"
label variable social_media_sites___6 "What sites do you use? (choice=Twitter)"
label variable social_media_sites___7 "What sites do you use? (choice=YouTube)"
label variable social_media_sites___8 "What sites do you use? (choice=Pinterest)"
label variable social_media_sites___9 "What sites do you use? (choice=LinkedIn)"
label variable social_media_sites___10 "What sites do you use? (choice=Reddit)"
label variable social_media_sites___11 "What sites do you use? (choice=BeReal)"
label variable social_media_sites___12 "What sites do you use? (choice=Other)"
label variable social_media_sites_other "Please specify"
label variable top_social_media_site "Please name your top used sites, based on frequency of use (most used)"
label variable second_social_media_site "Please name your 2nd most used sites, based on frequency of use (2nd most used)"
label variable bottom_social_media_site "Please name your least used site, based on frequency of use (least used)"
label variable social_media_freq "How many days per week do you use social media?"
label variable social_media_time "How many hours do you spend on social media per day?"
label variable social_media_supervison "Do your parents supervise your social media use?"
label variable device_password "Is your device (phone, laptop, etc.) password protected?"
label variable parent_password "Does your parent/guardian know the password?"
label variable social_media_pressure "Do you feel pressure to post things your peers like?"
label variable social_media_23a "On a regular day how much time do you spend posting pictures, comments etc. on your social media accounts? "
label variable social_media_23b "Do you monitor the likes and comments your own posts get?"
label variable social_media_23c "Do you monitor the likes and comments your friends/ peers posts get?"
label variable social_media_24a___1 "What is your purpose for using social media websites?  (choice=To make friends)"
label variable social_media_24a___2 "What is your purpose for using social media websites?  (choice=To socialize casually)"
label variable social_media_24a___3 "What is your purpose for using social media websites?  (choice=To find a suitable date)"
label variable social_media_24a___4 "What is your purpose for using social media websites?  (choice=To promote products/services)"
label variable social_media_24a___5 "What is your purpose for using social media websites?  (choice=Event planning)"
label variable social_media_24a___6 "What is your purpose for using social media websites?  (choice=To find employment)"
label variable social_media_24a___7 "What is your purpose for using social media websites?  (choice=Other)"
label variable specify_24a "Please specify"
label variable social_media_24b___1 "When do you access social media websites?  (choice=During my free time)"
label variable social_media_24b___2 "When do you access social media websites?  (choice=While at school)"
label variable social_media_24b___3 "When do you access social media websites?  (choice=During social occasions)"
label variable social_media_24b___4 "When do you access social media websites?  (choice=During mealtimes)"
label variable social_media_24b___5 "When do you access social media websites?  (choice=Any spare time)"
label variable body_25a "Before going out in public, I always check how I look."
label variable body_25b "I take time to choose clothes that will make me look my best."
label variable body_25c "My body is sexually appealing."
label variable body_25d "I am always worrying about being or getting fat."
label variable body_25e "I like my looks just the way they are."
label variable body_25f "I check how I look in a mirror whenever I get a chance."
label variable body_25g "Before going out, I usually take a long time to get ready."
label variable body_25h "I am very conscious (aware) of even small changes in my weight."
label variable body_25i "Most people would consider me good-looking"
label variable body_25j "It is important that I always look good."
label variable body_25k "I use very few grooming products."
label variable body_25l "I like the way I look without my clothes on."
label variable body_25m "I am self-conscious if Im not well dressed (groomed)."
label variable body_25n "I usually wear whatever is quickest without worrying about how it looks."
label variable body_25o "I like the way my clothes fit me."
label variable body_25p "I dont care what people think about how I look."
label variable body_25q "I take special care with fixing my hair."
label variable body_25r "I dont like my body."
label variable body_25s "I am physically unattractive. (People dont think I look good)"
label variable body_25t "I never think about how I look."
label variable body_25u "I am always trying to make myself look better."
label variable body_25v "I am on a diet to lose weight."
label variable body_25w "I am on a diet to gain weight"
label variable diet_crash_weight "I have tried to lose weight by fasting (starving myself) or going on a crash (quick) diet."
label variable self_weight_perception "I think I am"
label variable others_weight_perception "From looking at me, most other people would think I am:"
label variable body_per_face "Face (facial features, complexion)"
label variable body_per_hair "Hair (color, thickness, texture)"
label variable body_per_ubody "Upper body (chest or breasts, shoulders, arms)"
label variable body_per_mbody "Mid-body (waist, stomach)"
label variable body_per_lbody "Lower body (hips, bottom, thighs, legs)"
label variable body_per_muscle "Muscle tone (how firm your muscles are)"
label variable body_per_weight "Weight"
label variable body_per_height "Height"
label variable body_per_overall "Overall appearance"
label variable body_image_29a "I would be happier if I were thinner"
label variable body_image_29b "I would be happier if I were more muscular"
label variable body_image_29c "I would be happier if I were taller"
label variable body_image_29d "I would be happier if I were of lighter skin tone/colour"
label variable body_image_29e "I would be happier if I were of darker skin tone/colour"
label variable body_image_29f "I like the way my body looks now"
label variable skin_bleach "Would you bleach your skin to change how your skin looks?"
label variable skin_bleach_freq "How often have you used skin lighteners (or bleachers) in the past year?"
label variable skin_tattoo "Would you get a tattoo?"
label variable body_piercing "Would you get body piercings?"
label variable self_esteem_1 "In general I am satisfied with myself"
label variable self_esteem_2 "At times I think I am no good at all."
label variable self_esteem_3 "I feel that I have many good qualities."
label variable self_esteem_4 "I can do things as well as most other people."
label variable self_esteem_5 "I feel I do not have much to be proud of in my life"
label variable self_esteem_6 "I certainly feel useless at times"
label variable self_esteem_7 "I feel I am just as good as other people."
label variable self_esteem_8 "I wish I could have more respect for myself."
label variable self_esteem_9 "All in all I tend to feel like I am a failure"
label variable self_esteem_10 "I think positively about myself"
label variable depress_1 "Feeling nervous, anxious, or on edge"
label variable depress_2 "Not being able to stop or control worrying"
label variable depress_3 "Worrying too much about different things"
label variable depress_4 "Trouble relaxing"
label variable depress_5 "Being so restless that it is hard to sit still"
label variable depress_6 "Becoming easily annoyed or irritable"
label variable depress_7 "Feeling afraid, as if something awful might happen"
label variable phq_9_1 "Little interest or pleasure in doing things"
label variable phq_9_2 "Feeling down, depressed, or hopeless"
label variable phq_9_3 "Trouble falling or staying asleep, or sleeping too much"
label variable phq_9_4 "Feeling tired or having little energy"
label variable phq_9_5 "Poor appetite or overeating"
label variable phq_9_6 "Feeling bad about yourself or that you are a failure or have let yourself or your family down"
label variable phq_9_7 "Trouble concentrating on things, such as schoolwork, reading or watching television"
label variable phq_9_8 "Moving or speaking so slowly that other people could have noticed. Or the opposite being so fidgety or restless that you have been moving around a lot more than usual"
label variable phq_9_9 "Thoughts that you would be better off dead, or of hurting yourself in some way"
label variable depress_year "In the past year have you felt depressed or sad most days, even if you felt okay sometimes?"
label variable diffculty_problems "If you are experiencing any of the problems on this form, how difficult have these problems made it for you to do your work, take care of things at home or get along with other people?"
label variable suicide_month "Has there been a time in the past month when you have had serious thoughts about ending your life?                             "
label variable suicide_ever "Have you EVER, in your WHOLE LIFE, tried to kill yourself or made a suicide attempt?"
label variable parent_figure "Who is the main parent figure in your life? "
label variable parent_con_a "My parent respects my feelings."
label variable parent_con_b "I wish I had a different parent."
label variable parent_con_c "My parent accepts me as I am."
label variable parent_con_d "Talking over my problems with my parent makes me feel ashamed or foolish."
label variable parent_con_e "I get easily upset around my parent."
label variable parent_con_f "My parent has their own problems, so I dont bother them with mine."
label variable parent_con_g "My parent helps me to understand myself better."
label variable parent_con_h "I tell my parent about my problems and troubles."
label variable parent_con_i "I feel angry with my parent."
label variable parent_con_j "I dont get much attention from my parent."
label variable parent_con_k "When I am angry about something, my parent tries to be understanding."
label variable parent_con_l "If my parent knows something is bothering me, they ask me about it."
label variable close_friend_a "My friends encourage me to talk about my difficulties."
label variable close_friend_b "I wish I had different friends."
label variable close_friend_c "My friends are concerned about my well-being."
label variable close_friend_d "Talking over my problems with my friends makes me feel ashamed or foolish."
label variable close_friend_e "I get upset a lot more than my friends know about."
label variable close_friend_f "I like to get my friends point of view on things Im concerned about."
label variable close_friend_g "My friends listen to what I have to say."
label variable close_friend_h "I tell my friends about my problems and troubles."
label variable close_friend_i "I feel alone or apart when I am with my friends."
label variable close_friend_j "I feel my friends are good friends."
label variable close_friend_k "It seems as if my friends are irritated/ annoyed with me for no reason."
label variable close_friend_l "When I am angry about something, my friends try to be understanding."
label variable sataq_f_1 "It is important for me to look muscular."
label variable sataq_f_2 "It is important for me to look good in the clothes I wear."
label variable sataq_f_3 "I want my body to look very thin."
label variable sataq_f_4 "I think a lot about looking muscular"
label variable sataq_f_5 "I think a lot about my appearance."
label variable sataq_f_6 "I think a lot about looking thin."
label variable sataq_f_7 "I want to be good looking."
label variable sataq_f_8 "I want my body to look muscular."
label variable sataq_f_9 "I dont really think much about my appearance."
label variable sataq_f_10 "I dont want my body to look muscular."
label variable sataq_f_11 "I want my body to look very lean."
label variable sataq_f_12 "It is important to me to be attractive."
label variable sataq_f_13 "I think a lot about having very little body fat."
label variable sataq_f_14 "I dont think much about how I look."
label variable sataq_f_15 "I would like to have a body that looks very muscular."
label variable sataq_f_16 "I feel pressure from family members to look thinner."
label variable sataq_f_17 "I feel pressure from family members to improve my appearance."
label variable sataq_f_18 "Family members encouraged me to decrease my level of body fat."
label variable sataq_f_19 "Family members encourage me to get in better shape."
label variable sataq_f_20 "My peers encourage me to get thinner."
label variable sataq_f_21 "I feel pressure from my peers to improve my appearance."
label variable sataq_f_22 "I feel pressure from my peers to look in better shape."
label variable sataq_f_23 "I get pressure from my peers to decrease my level of body fat."
label variable sataq_f_24 "Significant others encourage me to get thinner."
label variable sataq_f_25 "I feel pressure from significant others to improve my appearance."
label variable sataq_f_26 "I feel pressure from significant others to look in better shape."
label variable sataq_f_27 "I get pressure from significant others to decrease my level of body fat."
label variable sataq_f_28 "I feel pressure from the media to look in better shape."
label variable sataq_f_29 "I feel pressure from the media to look thinner."
label variable sataq_f_30 "I feel pressure from the media to improve my appearance."
label variable sataq_f_31 "I feel pressure from the media to decrease my level of body fat."
label variable sataq_m_1 "It is important for me to look muscular."
label variable sataq_m_2 "I want my body to look very thin"
label variable sataq_m_3 "I think a lot about looking muscular"
label variable sataq_m_4 "I think a lot about looking thin."
label variable sataq_m_5 "I want my body to look muscular."
label variable sataq_m_6 "I dont really think much about my appearance."
label variable sataq_m_7 "I dont think much about how I look."
label variable sataq_m_8 "I would like to have a body that looks very muscular."
label variable sataq_m_9 "I feel pressure from family members to look thinner."
label variable sataq_m_10 "I feel pressure from family members to improve my appearance."
label variable sataq_m_11 "Family members encourage me to get in better shape."
label variable sataq_m_12 "I feel pressure from family members to be more muscular."
label variable sataq_m_13 "Family members encourage me to increase the size or definition of my muscles."
label variable sataq_m_14 "I feel pressure from my peers to improve my appearance."
label variable sataq_m_15 "I feel pressure from my peers to look in better shape"
label variable sataq_m_16 "I feel pressure from my peers to be more muscular."
label variable sataq_m_17 "My peers encourage me to increase the size or definition of my muscles"
label variable sataq_m_18 "I feel pressure from significant others to improve my appearance."
label variable sataq_m_19 "I feel pressure from significant others to look in better shape."
label variable sataq_m_20 "I get pressure from significant others to decrease my level of body fat."
label variable sataq_m_21 "I feel pressure from significant others to be more muscular."
label variable sataq_m_22 "I feel pressure from significant others to increase the size or definition of my muscles."
label variable sataq_m_23 "I feel pressure from the media to look in better shape."
label variable sataq_m_24 "I feel pressure from the media to look thinner."
label variable sataq_m_25 "I feel pressure from the media to improve my appearance."
label variable sataq_m_26 "I feel pressure from the media to decrease my level of body fat."
label variable sataq_m_27 "I feel pressure from the media to be more muscular."
label variable sataq_m_28 "I feel pressure from the media to increase the size or definition of my muscles."
label variable comment "Comments?"
label variable comments_share "Please share your comments with us"
label variable adol_form_complete "Complete?"

order record_id study_id school_name grade_form dob today_date gender age live_home___1 live_home___2 live_home___3 live_home___4 live_home___5 live_home___6 live_home___7 live_home___8 live_home___9 live_home___10 parent_status parent_living_status parents_seperate_status mother_education father_education household_ammenities___1 household_ammenities___2 household_ammenities___3 household_ammenities___4 household_ammenities___5 household_ammenities___6 household_ammenities___7 household_ammenities___8 household_ammenities___9 household_ammenities___10 household_ammenities___11 household_ammenities___12 household_ammenities___13 household_ammenities___14 household_ammenities___15 household_ammenities___16 toilet_facility toilet_specify water_supply_main live_type social_media_sites___1 social_media_sites___2 social_media_sites___3 social_media_sites___4 social_media_sites___5 social_media_sites___6 social_media_sites___7 social_media_sites___8 social_media_sites___9 social_media_sites___10 social_media_sites___11 social_media_sites___12 social_media_sites_other top_social_media_site second_social_media_site bottom_social_media_site social_media_freq social_media_time social_media_supervison device_password parent_password social_media_pressure social_media_23a social_media_23b social_media_23c social_media_24a___1 social_media_24a___2 social_media_24a___3 social_media_24a___4 social_media_24a___5 social_media_24a___6 social_media_24a___7 specify_24a social_media_24b___1 social_media_24b___2 social_media_24b___3 social_media_24b___4 social_media_24b___5 body_25a body_25b body_25c body_25d body_25e body_25f body_25g body_25h body_25i body_25j body_25k body_25l body_25m body_25n body_25o body_25p body_25q body_25r body_25s body_25t body_25u body_25v body_25w diet_crash_weight self_weight_perception others_weight_perception body_per_face body_per_hair body_per_ubody body_per_mbody body_per_lbody body_per_muscle body_per_weight body_per_height body_per_overall body_image_29a body_image_29b body_image_29c body_image_29d body_image_29e body_image_29f skin_bleach skin_bleach_freq skin_tattoo body_piercing self_esteem_1 self_esteem_2 self_esteem_3 self_esteem_4 self_esteem_5 self_esteem_6 self_esteem_7 self_esteem_8 self_esteem_9 self_esteem_10 depress_1 depress_2 depress_3 depress_4 depress_5 depress_6 depress_7 phq_9_1 phq_9_2 phq_9_3 phq_9_4 phq_9_5 phq_9_6 phq_9_7 phq_9_8 phq_9_9 depress_year diffculty_problems suicide_month suicide_ever parent_figure parent_con_a parent_con_b parent_con_c parent_con_d parent_con_e parent_con_f parent_con_g parent_con_h parent_con_i parent_con_j parent_con_k parent_con_l close_friend_a close_friend_b close_friend_c close_friend_d close_friend_e close_friend_f close_friend_g close_friend_h close_friend_i close_friend_j close_friend_k close_friend_l sataq_f_1 sataq_f_2 sataq_f_3 sataq_f_4 sataq_f_5 sataq_f_6 sataq_f_7 sataq_f_8 sataq_f_9 sataq_f_10 sataq_f_11 sataq_f_12 sataq_f_13 sataq_f_14 sataq_f_15 sataq_f_16 sataq_f_17 sataq_f_18 sataq_f_19 sataq_f_20 sataq_f_21 sataq_f_22 sataq_f_23 sataq_f_24 sataq_f_25 sataq_f_26 sataq_f_27 sataq_f_28 sataq_f_29 sataq_f_30 sataq_f_31 sataq_m_1 sataq_m_2 sataq_m_3 sataq_m_4 sataq_m_5 sataq_m_6 sataq_m_7 sataq_m_8 sataq_m_9 sataq_m_10 sataq_m_11 sataq_m_12 sataq_m_13 sataq_m_14 sataq_m_15 sataq_m_16 sataq_m_17 sataq_m_18 sataq_m_19 sataq_m_20 sataq_m_21 sataq_m_22 sataq_m_23 sataq_m_24 sataq_m_25 sataq_m_26 sataq_m_27 sataq_m_28 comment comments_share adol_form_complete 
set more off
describe


replace study_id = "AIK26" if study_id == "AIK 26"
replace study_id = "JC06" if study_id == "Jco6 "
replace study_id = "AIK33" if study_id== "AIK 33"
replace study_id = "JC53" if study_id == "53"
replace study_id = "HA03" if study_id == "HAO3"
replace study_id = "JC05" if study_id == "JCO5"
replace study_id = "SAG3" if study_id == "SAG03"


duplicates drop study_id, force
drop if study_id == "Test 1"
drop if study_id == "Test2"
count

save "Body_Dissatifaction_data_20250707.dta", replace


preserve
import excel "/Users/kernrocke/Downloads/Body Measurements  .xlsx", sheet("Sheet1") firstrow clear
rename HeightMeters height
rename WeightKg weight
rename BMIkgm2 bmi
rename ID study_id
replace study_id = "JC12" if study_id == "JC12 "
save "Body_Measurements_Body_Dissatisfaction", replace
restore


merge 1:1 study_id using "/Users/kernrocke/Downloads/Body_Measurements_Body_Dissatisfaction.dta", force

drop _merge

save "Body_Dissatifaction_data_20250707.dta", replace

savespss "Body_Dissatifaction_data_20250707.sav", replace
