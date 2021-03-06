*==============================================================================
*==============================================================================
*==============================================================================
* RUN DIRECTORY
*==============================================================================
*==============================================================================
*==============================================================================

** This script executes all other scripts in the /build directory
** (At some point, try to convert this to a .bat file)

** Use global for filepath
global build "/Users/Noah/Library/Mobile Documents/com~apple~CloudDocs/PhD prep/RA-guide-example-project/build"

** Execute scripts
do "$build/code/normalizing_raw_city_data.do"
do "$build/code/normalizing_raw_city_year_factory_data.do"
do "$build/code/normalizing_raw_city_year_hospital_data.do"
do "$build/code/creating_full_dataset.do"
