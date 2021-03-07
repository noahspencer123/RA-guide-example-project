*==============================================================================
*==============================================================================
*==============================================================================
* REGRESSIONS
*==============================================================================
*==============================================================================
*==============================================================================


*==============================================================================
*==============================================================================
* LOAD IN DATA
*==============================================================================
*==============================================================================

use "/Users/Noah/Library/Mobile Documents/com~apple~CloudDocs/PhD prep/RA-guide-example-project/analysis/input/full_dataset.dta", clear



*==============================================================================
*==============================================================================
* Run IV regression
*==============================================================================
*==============================================================================

** No controls, no fixed effects
ivregress 2sls cases (factory = treatment), vce(robust)
estat firststage

** Controlling for population, no fixed effects
ivregress 2sls cases population (factory = treatment), vce(robust) 
estat firststage

** Controlling for population and including fixed effects
ivregress 2sls cases population i.city i.year (factory = treatment), vce(robust)
estat firststage





** Next steps: store these regression results to a latex table where the ///
** first column is the no controls-no fixed effects estimates, the second 
** is the controlling for population estimate, and so on
** Include first stage F statistic at bottom + number of observations
