*==============================================================================
*==============================================================================
*==============================================================================
* CREATING FULL DATASET
*==============================================================================
*==============================================================================
*==============================================================================

** Use global for filepath
global build "/Users/Noah/Library/Mobile Documents/com~apple~CloudDocs/PhD prep/RA-guide-example-project/build"


*==============================================================================
*==============================================================================
* Start with factory data and merge in other information
*==============================================================================
*==============================================================================

** Load in factory data
use "$build/temp/normalized_raw_city_year_factory_data.dta", clear

** Merge in hospital data
merge 1:1 city year using "$build/temp/normalized_raw_city_year_hospital_data.dta", nogen

** Merge in city data
merge m:1 city using "$build/temp/normalized_raw_city_data.dta", nogen


*==============================================================================
*==============================================================================
* Cleaning
*==============================================================================
*==============================================================================

** Generate treatment variable
gen treatment = 1 if lawchange == "TRUE" & year >= 2007
replace treatment = 0 if lawchange != "TRUE" | year < 2007
label var treatment "An indicator for whether the city was in a state that was eligible to receive subsidies for opening Pokeball factories"
label define treatment 1 "Treatment" 0 "No Treatment"
label values treatment treatment

** Encode city 
encode city, gen(city_encoded)
drop city
rename city_encoded city


*==============================================================================
*==============================================================================
* Save .dta file
*==============================================================================
*==============================================================================

save "/Users/Noah/Library/Mobile Documents/com~apple~CloudDocs/PhD prep/RA-guide-example-project/build/output/full_dataset.dta", replace
save "/Users/Noah/Library/Mobile Documents/com~apple~CloudDocs/PhD prep/RA-guide-example-project/analysis/input/full_dataset.dta", replace
