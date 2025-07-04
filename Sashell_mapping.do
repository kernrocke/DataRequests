

cls

cls
** HEADER -----------------------------------------------------
**  DO-FILE METADATA
    //  algorithm name          JAM_mapping.do
    //  project:                Prevalence Data Mapping
    //  analysts:               Sashell NELSON & Kern Rocke
    //  date first created      03-JULY-2025
    // 	date last modified      03-JULY-2025
    //  algorithm task          Spatial Mapping of Prevalence Data
    //  status                  In-Progress

    
    ** General algorithm set-up
    version 17.0
    clear all
    macro drop _all
    set more off

    ** Initialising the STATA log and allow automatic page scrolling
    capture {
            program drop _all
    	drop _all
    	log close
    	}

    ** Set working directories: this is for DATASET and LOGFILE import and export
	local datapath "/Users/kernrocke/Downloads" // Kern encrypted local machine

*Setting working directory
cd "`datapath'"

*Load in excel data
import excel "`datapath'/Cases per parish.xlsx", sheet("Sheet1") cellrange(A1:C15) firstrow clear

*Prepare data for merging 
gen ADM1_PCODE = ""
replace ADM1_PCODE = "JM02" if Parish == "Hanover"
replace ADM1_PCODE = "JM01" if Parish == "Clarendon"
replace ADM1_PCODE = "JM04" if Parish == "Manchester"
replace ADM1_PCODE = "JM03" if Parish == "Kingston"
replace ADM1_PCODE = "JM14" if Parish == "Westmoreland"
replace ADM1_PCODE = "JM13" if Parish == "Trelawny"
replace ADM1_PCODE = "JM10" if Parish == "St. James"
replace ADM1_PCODE = "JM09" if Parish == "St. Elizabeth"
replace ADM1_PCODE = "JM12" if Parish == "St. Thomas"
replace ADM1_PCODE = "JM11" if Parish == "St. Mary"
replace ADM1_PCODE = "JM06" if Parish == "St. Andrew"
replace ADM1_PCODE = "JM05" if Parish == "Portland"
replace ADM1_PCODE = "JM08" if Parish == "St. Catherine"
replace ADM1_PCODE = "JM07" if Parish == "St. Ann"

*Save dataset for merging
save "`datapath'/Sashell_cases_mapping.dta", replace

*Prepare shapefile for integration in STATA
spshape2dta `datapth'/jam_adm_sdc_20240802_ab_shp/jam_admbnda_adm1_sdc_20240802.shp, saving(jamaica_parish)

*Load in shapefile dataset
use "`datapath'/jamaica_parish.dta", clear

*Merge in Prevalence data
merge 1:1 ADM1_PCODE using "`datapath'/Sashell_cases_mapping.dta"

*Prepare shapefile with parish labels for STATA integration
preserve 
import excel using "JAM_centroid", firstrow clear
rename x ycoord
rename y xcoord
save "JAM_centroid", replace 
restore

*Merge in centroid geocoordinates for later mapping
merge 1:1 ADM1_PCODE using "`datapath'/JAM_centroid.dta", nogenerate

*Minor cleaning for better label representation on map
replace ADM1_EN = "St.Elizabeth" if ADM1_EN == "Saint Elizabeth"
replace ADM1_EN = "St.Catherine" if ADM1_EN == "Saint Catherine"
replace ADM1_EN = "St.Thomas" if ADM1_EN == "Saint Thomas"
replace ADM1_EN = "St.James" if ADM1_EN == "Saint James"
replace ADM1_EN = "St.Ann" if ADM1_EN == "Saint Ann"
replace ADM1_EN = "St.Mary" if ADM1_EN == "Saint Mary"
replace ADM1_EN = "St.Andrew" if ADM1_EN == "Saint Andrew"

*Save dataset
save "`datapath'/jamaica_parish.dta", replace

*Format prevalence estimates
replace Prevalence = Prevalence*100
format %6.1f Prevalence


*Create spatial map
#delimit;
	grmap Prevalence , 
		fcolor(YlOrRd) clmethod(quantile) clnumber(4) 
		legenda(on) legtitle(Key) legorder(lohi) legstyle(2)
		graphregion(fcolor(white) ifcolor(white) lcolor(black) ilcolor(black) ilpattern(solid))
		
		name(prevalence_map, replace)
		label(data("jamaica_parish.dta") xcoord(ycoord)
        ycoord(xcoord) label(ADM1_EN) color(black) size(*0.9))


;
#delimit cr

*Remove unneccessary files
erase "/Users/kernrocke/Downloads/jamaica_parish.dta"
erase "/Users/kernrocke/Downloads/jamaica_parish_shp.dta"
erase "/Users/kernrocke/Downloads/JAM_centroid.dta"

*-------------------END-------------------------------------

