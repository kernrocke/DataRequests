
** HEADER -----------------------------------------------------
**  STATA file METADATA
**  algorithm name          covid_19_hesistancy_brb
**  project:                COVID-BRB SDate
**  analysts:               Kern Rocke
**  date first created      12-MAR-2025
**  date last modified      01-SEPT-2025
**  algorithm task          Data Cleaning, Analysis and Report Generation
**  status                  Completed

cls

import spss "/Users/kernrocke/Downloads/COVID-19 and a New Vaccine.sav", clear
replace q0002 = "30" if q0002 == "30 years old"
replace q0002 = "33" if q0002 == "33 years old"
replace q0002 = "40" if q0002 == "40+"
replace q0002 = "48" if q0002 == "48 YEARS"
replace q0002 = "51" if q0002 == "51 year old"
replace q0002 = "52" if q0002 == "52 years"
replace q0002 = "58" if q0002 == "58 years"
replace q0002 = "58" if q0002 == "58 years old"
replace q0002 = "64" if q0002 == "64 yrs"
replace q0002 = "65" if q0002 == "65yrs"
replace q0002 = "68" if q0002 == "68 yrars old"
replace q0002 = "87" if q0002 == "87 years"
replace q0002 = "55" if q0002 == "Fifty five"
destring q0002, replace

gen age_cat = .
replace age_cat = 1 if q0002<40
replace age_cat = 2 if q0002>=40 & q0002!=.
label var age_cat "Age Category"
label define age_cat 1"<40" 2">=40"
label value age_cat age_cat

gen educ_cat = .
replace educ_cat = 1 if q0005==1 | q0005==2
replace educ_cat = 2 if q0005==3
replace educ_cat = 3 if q0005==4 | q0005==5 
replace educ_cat = 3 if q0005==0
replace educ_cat = 1 if q0005_other == "O and a level standard"
replace educ_cat = 1 if q0005_other == "Associate Degree" | q0005_other == "Associate degree" | q0005_other == "Associate's Degree"
label var educ_cat "Education Categories"
label define educ_cat 1"Less than teritary" 2"Undergraduate" 3"Graduate"
label value educ_cat educ_cat

rename q0006 religion

gen income=.
replace income = 1 if q0007 == 1 | q0007 == 2
replace income = 2 if q0007 == 3 | q0007 == 4 | q0007 == 5
label var income "Income categories"
label define income 1"<$50000" 2">=$50000"
label value income income

gen marital = .
replace marital = 1 if q0008 == 1
replace marital = 2 if q0008 == 2
replace marital = 3 if q0008 == 3
replace marital = 4 if q0008 == 4
replace marital = 4 if q0008 == 5
label var marital "Martial status"
label define marital 1"Single" 2"Cohbiting" 3"Married" 4"Widow/Divorced/Seperated"
label value marital marital

gen living=.
replace living = 1 if q0010==2
replace living = 2 if q0010==3
replace living = 3 if q0010==4
replace living = 4 if q0010==5
replace living = 5 if q0010==6
label var living "Living status"
label define living 1"Live alone" 2"Live with spouse" 3"Nuclear family" 4"Extended" 5"Blended"
label value living living

gen employ = .
replace employ = 1 if q0011 == 1 | q0011 == 6 | q0011 == 7
replace employ = 2 if q0011 == 2 | q0011 == 3 | q0011 == 4
replace employ = 3 if q0011 == 5
label var employ "Employment prior to COVID-19"
label define employ 1"Unemployed" 2"Employed" 3"Retired"
label value employ employ

*Socio-demographics
mean q0002
tab1 q0003 q0004 q0005 q0006 q0007 q0008 q0009 q0010

egen hes = rowtotal (q0027_0001-q0027_0013 q0027_0015)
gen hesistant = .
replace hesistant = 0 if q0027_0014 == 1
replace hesistant = 1 if hes >=1 & hes!=.
keep if hesistant !=.
label var hesistant "Vaccine hesitancy"
label define hesistant 0"Non-hesistant" 1"Hesistant"
label values hesistant hesistant

rename q0003 gender

ttest q0002, by(hesistant)

********************************************************************************

*Table 1
foreach x of varlist gender age_cat educ_cat religion income marital living employ {
	
	tab `x' hesistant, col chi2
}

********************************************************************************
*Table 2
tab q0012, gen(media_)

foreach x of varlist media_2 media_3 media_4 media_5 media_6 media_7 {
	
	tab `x' hesistant, col chi2
}
cls
foreach x of varlist q0013_0001 q0013_0002 q0013_0003 q0013_0004 q0013_0005 q0013_0006 q0013_0007 q0013_0008 q0013_0009 q0013_0010{
	
	recode `x' (1/3=0) (4/5=1)
	label define `x' 0"Distrust/Unsure" 1"Trust", modify
	label value `x' `x'
	
	tab `x' hesistant, row chi2
}

********************************************************************************
*Table 4
preserve

foreach x of varlist q0028_0001 q0028_0002 q0028_0003 q0028_0004 q0028_0005 q0028_0006 q0028_0007 q0028_0008 {
	
	recode `x' (1/3=0) (4/5=1)
	label define `x' 0"Disagree/Unsure" 1"Agree", modify
	label value `x' `x'
	
	tab `x' hesistant, row chi2
	}
restore

*Create attitude score
egen attitude_score = rowtotal(q0028_0001 q0028_0002 q0028_0003 q0028_0004 q0028_0005 q0028_0006 q0028_0007 q0028_0008)	

ttest attitude_score, by(hesistant)

*Create attitude score categories based on tertiles
xtile attitude_cat = attitude_score, nq(3)

tab attitude_cat hesistant, row chi2

********************************************************************************

*Logistic Regression models

** Bivariate models

*Attitude
logistic hesistant attitude_score, vce(robust) cformat(%9.2f)
logistic hesistant i.attitude_cat, vce(robust) cformat(%9.2f) allbaselevels


*Media
foreach x of varlist media_2 media_3 media_4 media_5 media_6 media_7 {
	
	logistic hesistant i.`x', vce(robust) cformat(%9.2f) allbaselevels
}

*Type of information
foreach x of varlist q0013_0001 q0013_0002 q0013_0003 q0013_0004 q0013_0005 q0013_0006 q0013_0007 q0013_0008 q0013_0009 q0013_0010 {
	
	logistic hesistant i.`x', vce(robust) cformat(%9.2f) allbaselevels
}


*Socio-demographics

foreach x of varlist gender age_cat educ_cat religion income marital living employ {
	
	logistic hesistant i.`x', vce(robust) cformat(%9.2f) allbaselevels
}
********************************************************************************

** Multivariate models - Demographic adjusted

cls
*Attitude
logistic hesistant attitude_score i.gender i.age_cat i.educ_cat i.income i.employ if gender<=2, cformat(%9.2f) allbaselevels
logistic hesistant i.attitude_cat i.gender i.age_cat i.educ_cat i.income i.employ if gender<=2, cformat(%9.2f) allbaselevels

*Media
foreach x of varlist media_2 media_3 media_4 media_5 media_6 media_7 {
	
	logistic hesistant i.`x' i.gender i.age_cat i.educ_cat i.income i.employ if gender<=2, vce(robust) cformat(%9.2f) allbaselevels
}

*Type of information
foreach x of varlist q0013_0001 q0013_0002 q0013_0003 q0013_0004 q0013_0005 q0013_0006 q0013_0007 q0013_0008 q0013_0009 q0013_0010 {
	
	logistic hesistant i.`x' i.gender i.age_cat i.educ_cat i.income i.employ if gender<=2, vce(robust) cformat(%9.2f) allbaselevels
}

*Knowledge Questions
*q0014 q0015 q0016_0001-q0016_0006 q0017_0001-q0017_other q0018_0001 - q0018_other q0019 q0020_0001 - q0020_other q0021_0001 - q0021_0009 q0022


*Creating knowledge variables. 
gen kno_001 = .
replace kno_001 = 1 if q0014 == 1
replace kno_001 = 0 if q0014 != 1 & q0014 != .

gen kno_002 = .
replace kno_002 = 1 if q0015 == 2
replace kno_002 = 0 if q0015 != 2 & q0015 != .

gen kno_003 = . 
replace kno_003 = 1 if q0016_0005 == 1
replace kno_003 = 0 if q0016_0005 != 1

egen kno_004 = rowtotal(q0017_0001 q0017_0002 q0017_0003 q0017_0004 q0017_0005 q0017_0006 q0017_0007 q0017_0008 q0017_0009)

gen kno_005 = . 
replace kno_005 = 1 if q0018_0001 == 1 | q0018_0004 == 1
replace kno_005 = 0 if kno_005==.

gen kno_006 = .
replace kno_006 = 1 if q0019 == 2
replace kno_006 = 0 if q0019 != 2 & q0019 != .

gen kno_007 = . 
replace kno_007 = 1 if q0020_0001 == 1 | q0020_0002 == 1 | q0020_0003 == 1 | q0020_0004 == 1
replace kno_007 = 0 if kno_007==.

gen kno_008 = .
replace kno_008 = 1 if q0021_0008 == 1
replace kno_008 = 0 if kno_008 == .

gen kno_009 = .
replace kno_009 = 1 if q0022 == 5
replace kno_009 = 0 if kno_009 == .


egen kno_score = rowtotal(kno_001 kno_002 kno_003 kno_004 kno_005 kno_006 kno_007 kno_008 kno_009)
sum kno_score
replace kno_score = (kno_score/17)*100
label var kno_score "Knowledge Score"

gen kno_cat = .
replace kno_cat = 0 if kno_score <75
replace kno_cat = 1 if kno_score >=75 & kno_score!=.
label var kno_cat "Knowledge Category"
label define kno_cat 0"Not knowledgeable" 1"Knowledgeable"
label value kno_cat kno_cat
tab kno_cat


* Create Word document
putdocx begin, pagesize(letter) font("Times New Roman", 12)

* Add title
putdocx paragraph, style(Title)
putdocx text ("COVID-19 Vaccine Hesitancy Study Analysis Results")

********************************************************************************
* TABLE 1: SOCIODEMOGRAPHICS
********************************************************************************

putdocx paragraph
putdocx text ("Table 1 - Sociodemographics of Participants"), bold

* Create table structure for sociodemographics
putdocx table tbl1 = (20, 4), border(all) headerrow(1)

* Add headers
putdocx table tbl1(1,1) = ("Characteristic"), bold
putdocx table tbl1(1,2) = ("Vaccine Hesitant"), bold  
putdocx table tbl1(1,3) = ("Non-Vaccine Hesitant"), bold
putdocx table tbl1(1,4) = ("p-value"), bold

* Fill in sociodemographic data
local row = 2

* Gender section
putdocx table tbl1(`row',1) = ("Gender"), bold
local ++row
tab gender hesistant, matcell(gender_freq) matrow(gender_val)
qui tab gender hesistant, chi2
local gender_p = r(p)
putdocx table tbl1(`row',1) = ("Male")
putdocx table tbl1(`row',2) = ("`=gender_freq[1,2]' (`=string(gender_freq[1,2]/(gender_freq[1,1]+gender_freq[1,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',3) = ("`=gender_freq[1,1]' (`=string(gender_freq[1,1]/(gender_freq[1,1]+gender_freq[1,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',4) = ("`=string(`gender_p', "%9.3f")'")
local ++row
putdocx table tbl1(`row',1) = ("Female")
putdocx table tbl1(`row',2) = ("`=gender_freq[2,2]' (`=string(gender_freq[2,2]/(gender_freq[2,1]+gender_freq[2,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',3) = ("`=gender_freq[2,1]' (`=string(gender_freq[2,1]/(gender_freq[2,1]+gender_freq[2,2])*100, "%9.1f")'%)")
local ++row

* Age section
putdocx table tbl1(`row',1) = ("Age"), bold
local ++row
qui sum q0002 if hesistant==1
local age_hes_mean = r(mean)
local age_hes_sd = r(sd)
qui sum q0002 if hesistant==0
local age_nonhes_mean = r(mean)
local age_nonhes_sd = r(sd)
qui ttest q0002, by(hesistant)
local age_p = r(p)
putdocx table tbl1(`row',1) = ("Mean (SD)")
putdocx table tbl1(`row',2) = ("`=string(`age_hes_mean', "%9.1f")' (`=string(`age_hes_sd', "%9.1f")')")
putdocx table tbl1(`row',3) = ("`=string(`age_nonhes_mean', "%9.1f")' (`=string(`age_nonhes_sd', "%9.1f")')")
putdocx table tbl1(`row',4) = ("`=string(`age_p', "%9.3f")'")
local ++row

* Age groups
putdocx table tbl1(`row',1) = ("Age group"), bold
local ++row
tab age_cat hesistant, matcell(age_freq) matrow(age_val)
qui tab age_cat hesistant, chi2
local age_cat_p = r(p)
putdocx table tbl1(`row',1) = ("<40")
putdocx table tbl1(`row',2) = ("`=age_freq[1,2]' (`=string(age_freq[1,2]/(age_freq[1,1]+age_freq[1,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',3) = ("`=age_freq[1,1]' (`=string(age_freq[1,1]/(age_freq[1,1]+age_freq[1,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',4) = ("`=string(`age_cat_p', "%9.3f")'")
local ++row
putdocx table tbl1(`row',1) = ("≥40")
putdocx table tbl1(`row',2) = ("`=age_freq[2,2]' (`=string(age_freq[2,2]/(age_freq[2,1]+age_freq[2,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',3) = ("`=age_freq[2,1]' (`=string(age_freq[2,1]/(age_freq[2,1]+age_freq[2,2])*100, "%9.1f")'%)")
local ++row

* Education section
putdocx table tbl1(`row',1) = ("Education"), bold
local ++row
tab educ_cat hesistant, matcell(educ_freq) matrow(educ_val)
qui tab educ_cat hesistant, chi2
local educ_p = r(p)
putdocx table tbl1(`row',1) = ("Less than tertiary")
putdocx table tbl1(`row',2) = ("`=educ_freq[1,2]' (`=string(educ_freq[1,2]/(educ_freq[1,1]+educ_freq[1,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',3) = ("`=educ_freq[1,1]' (`=string(educ_freq[1,1]/(educ_freq[1,1]+educ_freq[1,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',4) = ("`=string(`educ_p', "%9.3f")'")
local ++row
putdocx table tbl1(`row',1) = ("Undergraduate degree")
putdocx table tbl1(`row',2) = ("`=educ_freq[2,2]' (`=string(educ_freq[2,2]/(educ_freq[2,1]+educ_freq[2,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',3) = ("`=educ_freq[2,1]' (`=string(educ_freq[2,1]/(educ_freq[2,1]+educ_freq[2,2])*100, "%9.1f")'%)")
local ++row
putdocx table tbl1(`row',1) = ("Graduate degree")
putdocx table tbl1(`row',2) = ("`=educ_freq[3,2]' (`=string(educ_freq[3,2]/(educ_freq[3,1]+educ_freq[3,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',3) = ("`=educ_freq[3,1]' (`=string(educ_freq[3,1]/(educ_freq[3,1]+educ_freq[3,2])*100, "%9.1f")'%)")
local ++row

* Religious affiliations
putdocx table tbl1(`row',1) = ("Religious affiliations"), bold
local ++row
tab religion hesistant, matcell(rel_freq) matrow(rel_val)
qui tab religion hesistant, chi2
local rel_p = r(p)
putdocx table tbl1(`row',1) = ("No")
putdocx table tbl1(`row',2) = ("`=rel_freq[1,2]' (`=string(rel_freq[1,2]/(rel_freq[1,1]+rel_freq[1,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',3) = ("`=rel_freq[1,1]' (`=string(rel_freq[1,1]/(rel_freq[1,1]+rel_freq[1,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',4) = ("`=string(`rel_p', "%9.3f")'")
local ++row
putdocx table tbl1(`row',1) = ("Yes")
putdocx table tbl1(`row',2) = ("`=rel_freq[2,2]' (`=string(rel_freq[2,2]/(rel_freq[2,1]+rel_freq[2,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',3) = ("`=rel_freq[2,1]' (`=string(rel_freq[2,1]/(rel_freq[2,1]+rel_freq[2,2])*100, "%9.1f")'%)")
local ++row

* Household income
putdocx table tbl1(`row',1) = ("Household income"), bold
local ++row
tab income hesistant, matcell(income_freq) matrow(income_val)
qui tab income hesistant, chi2
local income_p = r(p)
putdocx table tbl1(`row',1) = ("<$50,000")
putdocx table tbl1(`row',2) = ("`=income_freq[1,2]' (`=string(income_freq[1,2]/(income_freq[1,1]+income_freq[1,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',3) = ("`=income_freq[1,1]' (`=string(income_freq[1,1]/(income_freq[1,1]+income_freq[1,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',4) = ("`=string(`income_p', "%9.3f")'")
local ++row
putdocx table tbl1(`row',1) = ("≥$50,000")
putdocx table tbl1(`row',2) = ("`=income_freq[2,2]' (`=string(income_freq[2,2]/(income_freq[2,1]+income_freq[2,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',3) = ("`=income_freq[2,1]' (`=string(income_freq[2,1]/(income_freq[2,1]+income_freq[2,2])*100, "%9.1f")'%)")
local ++row

* Marital status
putdocx table tbl1(`row',1) = ("Marital status"), bold
local ++row
tab marital hesistant, matcell(marital_freq) matrow(marital_val)
qui tab marital hesistant, chi2
local marital_p = r(p)
putdocx table tbl1(`row',1) = ("Single")
putdocx table tbl1(`row',2) = ("`=marital_freq[1,2]' (`=string(marital_freq[1,2]/(marital_freq[1,1]+marital_freq[1,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',3) = ("`=marital_freq[1,1]' (`=string(marital_freq[1,1]/(marital_freq[1,1]+marital_freq[1,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',4) = ("`=string(`marital_p', "%9.3f")'")
local ++row
putdocx table tbl1(`row',1) = ("Cohabiting")
putdocx table tbl1(`row',2) = ("`=marital_freq[2,2]' (`=string(marital_freq[2,2]/(marital_freq[2,1]+marital_freq[2,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',3) = ("`=marital_freq[2,1]' (`=string(marital_freq[2,1]/(marital_freq[2,1]+marital_freq[2,2])*100, "%9.1f")'%)")
local ++row
putdocx table tbl1(`row',1) = ("Married")
putdocx table tbl1(`row',2) = ("`=marital_freq[3,2]' (`=string(marital_freq[3,2]/(marital_freq[3,1]+marital_freq[3,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',3) = ("`=marital_freq[3,1]' (`=string(marital_freq[3,1]/(marital_freq[3,1]+marital_freq[3,2])*100, "%9.1f")'%)")
local ++row
putdocx table tbl1(`row',1) = ("Widow/Divorced/Separated")
putdocx table tbl1(`row',2) = ("`=marital_freq[4,2]' (`=string(marital_freq[4,2]/(marital_freq[4,1]+marital_freq[4,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',3) = ("`=marital_freq[4,1]' (`=string(marital_freq[4,1]/(marital_freq[4,1]+marital_freq[4,2])*100, "%9.1f")'%)")
local ++row

* Living accommodation status
putdocx table tbl1(`row',1) = ("Living accommodation status"), bold
local ++row
tab living hesistant, matcell(living_freq) matrow(living_val)
qui tab living hesistant, chi2
local living_p = r(p)
putdocx table tbl1(`row',1) = ("Live alone")
putdocx table tbl1(`row',2) = ("`=living_freq[1,2]' (`=string(living_freq[1,2]/(living_freq[1,1]+living_freq[1,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',3) = ("`=living_freq[1,1]' (`=string(living_freq[1,1]/(living_freq[1,1]+living_freq[1,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',4) = ("`=string(`living_p', "%9.3f")'")
local ++row
putdocx table tbl1(`row',1) = ("Nuclear family")
putdocx table tbl1(`row',2) = ("`=living_freq[3,2]' (`=string(living_freq[3,2]/(living_freq[3,1]+living_freq[3,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',3) = ("`=living_freq[3,1]' (`=string(living_freq[3,1]/(living_freq[3,1]+living_freq[3,2])*100, "%9.1f")'%)")
local ++row
putdocx table tbl1(`row',1) = ("Extended")
putdocx table tbl1(`row',2) = ("`=living_freq[4,2]' (`=string(living_freq[4,2]/(living_freq[4,1]+living_freq[4,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',3) = ("`=living_freq[4,1]' (`=string(living_freq[4,1]/(living_freq[4,1]+living_freq[4,2])*100, "%9.1f")'%)")
local ++row
putdocx table tbl1(`row',1) = ("Blended")
putdocx table tbl1(`row',2) = ("`=living_freq[5,2]' (`=string(living_freq[5,2]/(living_freq[5,1]+living_freq[5,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',3) = ("`=living_freq[5,1]' (`=string(living_freq[5,1]/(living_freq[5,1]+living_freq[5,2])*100, "%9.1f")'%)")
local ++row

* Employment status pre-COVID-19 pandemic
putdocx table tbl1(`row',1) = ("Employment status pre-COVID-19 pandemic"), bold
local ++row
tab employ hesistant, matcell(employ_freq) matrow(employ_val)
qui tab employ hesistant, chi2
local employ_p = r(p)
putdocx table tbl1(`row',1) = ("Unemployed")
putdocx table tbl1(`row',2) = ("`=employ_freq[1,2]' (`=string(employ_freq[1,2]/(employ_freq[1,1]+employ_freq[1,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',3) = ("`=employ_freq[1,1]' (`=string(employ_freq[1,1]/(employ_freq[1,1]+employ_freq[1,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',4) = ("`=string(`employ_p', "%9.3f")'")
local ++row
putdocx table tbl1(`row',1) = ("Employed")
putdocx table tbl1(`row',2) = ("`=employ_freq[2,2]' (`=string(employ_freq[2,2]/(employ_freq[2,1]+employ_freq[2,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',3) = ("`=employ_freq[2,1]' (`=string(employ_freq[2,1]/(employ_freq[2,1]+employ_freq[2,2])*100, "%9.1f")'%)")
local ++row
putdocx table tbl1(`row',1) = ("Retired")
putdocx table tbl1(`row',2) = ("`=employ_freq[3,2]' (`=string(employ_freq[3,2]/(employ_freq[3,1]+employ_freq[3,2])*100, "%9.1f")'%)")
putdocx table tbl1(`row',3) = ("`=employ_freq[3,1]' (`=string(employ_freq[3,1]/(employ_freq[3,1]+employ_freq[3,2])*100, "%9.1f")'%)")
local ++row

********************************************************************************
* TABLE 2: SOURCE OF INFORMATION
********************************************************************************

putdocx pagebreak
putdocx paragraph
putdocx text ("Table 2 - Source of information and vaccine hesitancy"), bold

putdocx table tbl2 = (20, 4), border(all) headerrow(1)

* Add headers
putdocx table tbl2(1,1) = ("Characteristic"), bold
putdocx table tbl2(1,2) = ("Vaccine Hesitant"), bold  
putdocx table tbl2(1,3) = ("Non-Vaccine Hesitant"), bold
putdocx table tbl2(1,4) = ("p-value"), bold

local row = 2

* Medium for access to information
putdocx table tbl2(`row',1) = ("Medium for access to information"), bold
local ++row

* Create media variables and analyze
local media_labels `" "Newspaper" "Television" "Radio" "Word of mouth" "Social media" "'
local media_num = 2
foreach label of local media_labels {
    local media_var = "media_`media_num'"
    cap tab `media_var' hesistant, matcell(media_freq) chi2
    if !_rc {
        putdocx table tbl2(`row',1) = ("`label'")
        putdocx table tbl2(`row',2) = ("`=media_freq[2,2]' (`=string(media_freq[2,2]/(media_freq[2,1]+media_freq[2,2])*100, "%9.1f")'%)")
        putdocx table tbl2(`row',3) = ("`=media_freq[2,1]' (`=string(media_freq[2,1]/(media_freq[2,1]+media_freq[2,2])*100, "%9.1f")'%)")
        putdocx table tbl2(`row',4) = ("`=string(r(p), "%9.3f")'")
    }
    local ++row
    local ++media_num
}

* Trust in information source
putdocx table tbl2(`row',1) = ("Trust in information source"), bold
local ++row

* Trust variables with proper labels
local trust_labels `" "Health professionals" "Announcements or news conferences" "Friends and family members" "News websites or apps" "Church leaders" "Employer" "Social media" "Radio" "Television" "Other" "'

local trust_num = 1
foreach label of local trust_labels {
    if `trust_num' <= 10 {
        local trust_var = "q0013_000`trust_num'"
        if `trust_num' == 10 {
            local trust_var = "q0013_00`trust_num'"
        }
        cap tab `trust_var' hesistant, matcell(trust_freq) chi2
        if !_rc {
            putdocx table tbl2(`row',1) = ("`label'")
            putdocx table tbl2(`row',2) = ("`=trust_freq[2,2]' (`=string(trust_freq[2,2]/(trust_freq[2,1]+trust_freq[2,2])*100, "%9.1f")'%)")
            putdocx table tbl2(`row',3) = ("`=trust_freq[2,1]' (`=string(trust_freq[2,1]/(trust_freq[2,1]+trust_freq[2,2])*100, "%9.1f")'%)")
            putdocx table tbl2(`row',4) = ("`=string(r(p), "%9.3f")'")
        }
    }
    local ++row
    local ++trust_num
}

********************************************************************************
* TABLE 3: KNOWLEDGE
********************************************************************************

putdocx pagebreak
putdocx paragraph
putdocx text ("Table 3 - Participants correct knowledge of the COVID-19 virus"), bold

putdocx table tbl3 = (12, 4), border(all) headerrow(1)

* Add headers
putdocx table tbl3(1,1) = ("Knowledge characteristic"), bold
putdocx table tbl3(1,2) = ("Vaccine Hesitant"), bold  
putdocx table tbl3(1,3) = ("Non-Vaccine Hesitant"), bold
putdocx table tbl3(1,4) = ("p-value"), bold

local row = 2

* Knowledge items with mean and SD
local kno_labels `" "Possible for COVID-19 patient to show symptoms" "Time taken to show symptoms of COVID-19 after disease infection" "Persons who can get infected with COVID-19" "Common symptoms of COVID-19" "COVID-19 virus spread" "Length of time for hand washing" "Protective measures to COVID-19 infection" "Personnel wearing face masks" "Distance for social distancing" "'

local kno_num = 1
foreach label of local kno_labels {
    local kno_var = "kno_00`kno_num'"
    if `kno_num' < 10 {
        local kno_var = "kno_00`kno_num'"
    }
    else {
        local kno_var = "kno_0`kno_num'"
    }
    
    * Calculate means and SDs for each group
    qui sum `kno_var' if hesistant==1
    local kno_hes_mean = r(mean)
    local kno_hes_sd = r(sd)
    qui sum `kno_var' if hesistant==0
    local kno_nonhes_mean = r(mean)
    local kno_nonhes_sd = r(sd)
    
    * Independent t-test
    qui ttest `kno_var', by(hesistant)
    local kno_p = r(p)
    
    putdocx table tbl3(`row',1) = ("`label'")
    putdocx table tbl3(`row',2) = ("`=string(`kno_hes_mean', "%9.3f")' (`=string(`kno_hes_sd', "%9.3f")')")
    putdocx table tbl3(`row',3) = ("`=string(`kno_nonhes_mean', "%9.3f")' (`=string(`kno_nonhes_sd', "%9.3f")')")
    putdocx table tbl3(`row',4) = ("`=string(`kno_p', "%9.3f")'")
    
    local ++row
    local ++kno_num
    if `kno_num' > 9 break
}

* Overall knowledge score
qui ttest kno_score, by(hesistant)
local kno_p = r(p)
qui sum kno_score if hesistant==1
local kno_hes_mean = r(mean)
local kno_hes_sd = r(sd)
qui sum kno_score if hesistant==0
local kno_nonhes_mean = r(mean)
local kno_nonhes_sd = r(sd)

putdocx table tbl3(`row',1) = ("Overall knowledge score"), bold
putdocx table tbl3(`row',2) = ("`=string(`kno_hes_mean', "%9.1f")' (`=string(`kno_hes_sd', "%9.1f")')")
putdocx table tbl3(`row',3) = ("`=string(`kno_nonhes_mean', "%9.1f")' (`=string(`kno_nonhes_sd', "%9.1f")')")
putdocx table tbl3(`row',4) = ("`=string(`kno_p', "%9.3f")'")

********************************************************************************
* TABLE 4: ATTITUDES
********************************************************************************

putdocx pagebreak
putdocx paragraph
putdocx text ("Table 4 - Participants attitude toward COVID-19 vaccine"), bold

putdocx table tbl4 = (10, 4), border(all) headerrow(1)

* Add headers
putdocx table tbl4(1,1) = ("Attitude Characteristic"), bold
putdocx table tbl4(1,2) = ("Vaccine Hesitant"), bold  
putdocx table tbl4(1,3) = ("Non-Vaccine Hesitant"), bold
putdocx table tbl4(1,4) = ("p-value"), bold

local row = 2

* Attitude items with frequencies and percentages (chi-square tests)
local att_labels `" "It is important to get a vaccine to protect people from COVID-19" "COVID-19 vaccines made in Europe or America are safer than those made in other countries" "The fear of side effects prevent me from getting the AstraZeneca vaccine" "Access to the AstraZeneca vaccine is preventing me from getting it" "I am concerned about the safety of the AstraZeneca vaccination" "I worry about the long term side effects of the AstraZeneca vaccine" "I will only take the AstraZeneca vaccine if it is taken by many in the Barbadian public" "Vaccination decreases my chance of getting COVID-19 or its complications" "'

local att_num = 1
foreach label of local att_labels {
    local att_var = "q0028_000`att_num'"
    cap tab `att_var' hesistant, matcell(att_freq) chi2
    if !_rc {
        putdocx table tbl4(`row',1) = ("`label'")
        * For agree responses (coded as 1 after recoding)
        putdocx table tbl4(`row',2) = ("`=att_freq[2,2]' (`=string(att_freq[2,2]/(att_freq[2,1]+att_freq[2,2])*100, "%9.1f")'%)")
        putdocx table tbl4(`row',3) = ("`=att_freq[2,1]' (`=string(att_freq[2,1]/(att_freq[2,1]+att_freq[2,2])*100, "%9.1f")'%)")
        putdocx table tbl4(`row',4) = ("`=string(r(p), "%9.3f")'")
    }
    local ++row
    local ++att_num
    if `att_num' > 8 break
}

* Overall attitude score (independent t-test with mean and SD)
qui ttest attitude_score, by(hesistant)
local att_score_p = r(p)
qui sum attitude_score if hesistant==1
local att_hes_mean = r(mean)
local att_hes_sd = r(sd)
qui sum attitude_score if hesistant==0
local att_nonhes_mean = r(mean)
local att_nonhes_sd = r(sd)

putdocx table tbl4(`row',1) = ("Overall attitude score"), bold
putdocx table tbl4(`row',2) = ("`=string(`att_hes_mean', "%9.1f")' (`=string(`att_hes_sd', "%9.1f")')")
putdocx table tbl4(`row',3) = ("`=string(`att_nonhes_mean', "%9.1f")' (`=string(`att_nonhes_sd', "%9.1f")')")
putdocx table tbl4(`row',4) = ("`=string(`att_score_p', "%9.3f")'")


********************************************************************************
* TABLE 5: KAP PREDICTORS (LOGISTIC REGRESSION)
********************************************************************************

putdocx pagebreak
putdocx paragraph
putdocx text ("Table 5 - KAP Predictors of COVID-19 vaccine hesitancy among participants"), bold

putdocx table tbl5 = (10, 4), border(all) headerrow(1)

* Add headers
putdocx table tbl5(1,1) = ("Characteristic"), bold
putdocx table tbl5(1,2) = ("OR"), bold  
putdocx table tbl5(1,3) = ("95% CI"), bold
putdocx table tbl5(1,4) = ("p-value"), bold

local row = 2

* Knowledge score (adjusted model)
qui logistic hesistant kno_score i.gender i.age_cat i.educ_cat i.income i.employ if gender<=2
matrix results = r(table)
local or = results[1,1]
local ci_low = results[5,1]
local ci_high = results[6,1]
local p_val = results[4,1]

putdocx table tbl5(`row',1) = ("Knowledge score"), bold
putdocx table tbl5(`row',2) = ("`=string(`or', "%9.2f")'")
putdocx table tbl5(`row',3) = ("`=string(`ci_low', "%9.2f")'-`=string(`ci_high', "%9.2f")'")
putdocx table tbl5(`row',4) = ("`=string(`p_val', "%9.3f")'")
local ++row

* Knowledge categories
qui logistic hesistant i.kno_cat i.gender i.age_cat i.educ_cat i.income i.employ if gender<=2
matrix results = r(table)

putdocx table tbl5(`row',1) = ("Knowledge categories"), bold
local ++row
putdocx table tbl5(`row',1) = ("Not knowledgeable")
putdocx table tbl5(`row',2) = ("Ref")
putdocx table tbl5(`row',3) = ("-")
putdocx table tbl5(`row',4) = ("-")
local ++row

local or = results[1,2]
local ci_low = results[5,2]
local ci_high = results[6,2]
local p_val = results[4,2]
putdocx table tbl5(`row',1) = ("Knowledgeable")
putdocx table tbl5(`row',2) = ("`=string(`or', "%9.2f")'")
putdocx table tbl5(`row',3) = ("`=string(`ci_low', "%9.2f")'-`=string(`ci_high', "%9.2f")'")
putdocx table tbl5(`row',4) = ("`=string(`p_val', "%9.3f")'")
local ++row

* Attitude score (adjusted model)
qui logistic hesistant attitude_score i.gender i.age_cat i.educ_cat i.income i.employ if gender<=2
matrix results = r(table)
local or = results[1,1]
local ci_low = results[5,1]
local ci_high = results[6,1]
local p_val = results[4,1]

putdocx table tbl5(`row',1) = ("Attitude score"), bold
putdocx table tbl5(`row',2) = ("`=string(`or', "%9.2f")'")
putdocx table tbl5(`row',3) = ("`=string(`ci_low', "%9.2f")'-`=string(`ci_high', "%9.2f")'")
putdocx table tbl5(`row',4) = ("`=string(`p_val', "%9.3f")'")
local ++row

* Attitude categories
qui logistic hesistant i.attitude_cat i.gender i.age_cat i.educ_cat i.income i.employ if gender<=2
matrix results = r(table)

putdocx table tbl5(`row',1) = ("Attitude categories"), bold
local ++row
putdocx table tbl5(`row',1) = ("Neutral Attitude")
putdocx table tbl5(`row',2) = ("Ref")
putdocx table tbl5(`row',3) = ("-")
putdocx table tbl5(`row',4) = ("-")
local ++row

local or = results[1,2]
local ci_low = results[5,2]
local ci_high = results[6,2]
local p_val = results[4,2]
putdocx table tbl5(`row',1) = ("Negative Attitude")
putdocx table tbl5(`row',2) = ("`=string(`or', "%9.2f")'")
putdocx table tbl5(`row',3) = ("`=string(`ci_low', "%9.2f")'-`=string(`ci_high', "%9.2f")'")
putdocx table tbl5(`row',4) = ("`=string(`p_val', "%9.3f")'")
local ++row

local or = results[1,3]
local ci_low = results[5,3]
local ci_high = results[6,3]
local p_val = results[4,3]
putdocx table tbl5(`row',1) = ("Positive Attitude")
putdocx table tbl5(`row',2) = ("`=string(`or', "%9.2f")'")
putdocx table tbl5(`row',3) = ("`=string(`ci_low', "%9.2f")'-`=string(`ci_high', "%9.2f")'")
putdocx table tbl5(`row',4) = ("`=string(`p_val', "%9.3f")'")

* Add note
putdocx paragraph
putdocx text ("Note: Models adjusted for Sociodemographic characteristics"), italic

********************************************************************************
* ADD SAMPLE SIZE INFORMATION
********************************************************************************

* Add sample sizes to document
qui count if hesistant==1
local n_hesitant = r(N)
qui count if hesistant==0
local n_nonhesitant = r(N)

putdocx paragraph
putdocx text ("Sample sizes: Vaccine Hesitant n=`n_hesitant', Non-Vaccine Hesitant n=`n_nonhesitant'"), italic

********************************************************************************
* SAVE WORD DOCUMENT
********************************************************************************

* Save the Word document
putdocx save "COVID_KAP_Study_Results.docx", replace

* Display completion message
display "Word document 'COVID_KAP_Study_Results.docx' has been created successfully!"
display "The document contains all formatted tables with your analysis results."

********************************************************************************
