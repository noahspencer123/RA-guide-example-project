*==============================================================================
*==============================================================================
*==============================================================================
* NORMALIZING RAW CITY-YEAR HOSPITAL DATA
*==============================================================================
*==============================================================================
*==============================================================================

*==============================================================================
*==============================================================================
* Import data
*==============================================================================
*==============================================================================

import delimited "/Users/Noah/Library/Mobile Documents/com~apple~CloudDocs/PhD prep/RA-guide-example-project/build/input/hospital.csv", clear


*==============================================================================
*==============================================================================
* Clean data
*==============================================================================
*==============================================================================

** Extract city from hospital column
split hospital
gen city = hospital1 + " " + hospital2
replace city = hospital1 + " " + hospital2 + " " + hospital3 if hospital4 != ""
drop hospital1 hospital2 hospital3 hospital4
order city hospital

** Summarize totals by city
forvalues i = 0/15 {
	egen tot_cases`i' = sum(cases`i'), by(city)
}

** Drop individual hospital-level data and remove duplicates
drop hospital
forvalues i = 0/15 {
	drop cases`i'
}
duplicates drop

** Reshape from wide to long
reshape long tot_cases, i(city) j(year)

** Adjust variable names
rename tot_cases cases

** Convert year to actual year values
replace year = year + 2000

** Add labels
label var city "City"
label var year "Year"
label var cases "Total number of child hospital stays related to asthma in the city in the year"


*==============================================================================
*==============================================================================
* Save .dta file
*==============================================================================
*==============================================================================

save "/Users/Noah/Library/Mobile Documents/com~apple~CloudDocs/PhD prep/RA-guide-example-project/build/temp/normalized_raw_city_year_hospital_data.dta", replace
