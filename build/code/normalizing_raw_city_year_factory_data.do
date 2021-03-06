*==============================================================================
*==============================================================================
*==============================================================================
* NORMALIZING RAW CITY-YEAR FACTORY DATA
*==============================================================================
*==============================================================================
*==============================================================================

*==============================================================================
*==============================================================================
* Import data
*==============================================================================
*==============================================================================

import delimited "/Users/Noah/Library/Mobile Documents/com~apple~CloudDocs/PhD prep/RA-guide-example-project/build/input/city.csv", clear


*==============================================================================
*==============================================================================
* Clean data
*==============================================================================
*==============================================================================

** Drop variables that don't change over time
drop population lawchange

** Reshape from wide to long
reshape long factory_ production_, i(city) j(year)

** Adjust variable names
rename factory_ factory
rename production_ production

** Convert year to actual year values
replace year = year + 2000

** Add labels
label var city "City"
label var year "Year"
label var factory "Number of Pokeball factories in the city in year"
label var production "Number of Pokeballs produced in the city in year"



*==============================================================================
*==============================================================================
* Save .dta file
*==============================================================================
*==============================================================================

save "/Users/Noah/Library/Mobile Documents/com~apple~CloudDocs/PhD prep/RA-guide-example-project/build/temp/normalized_raw_city_year_factory_data.dta", replace
