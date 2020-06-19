clear all

import delimited "crosswalk/industry.csv", varnames(1) clear case(preserve)
merge 1:1 industry_code using "../clean/industry-employment/industry-employment.dta", nogen keep(master match)
rename employment ces_employment
tempfile industry
save `industry', replace

import delimited "crosswalk/2digit_names.csv", varnames(1) clear case(preserve)
tempfile digit2
save `digit2', replace

import delimited "occupation/naics_risk.csv", varnames(1) clear
tempfile occupation
save `occupation', replace

use "../clean/cbp/zip_code_business_patterns.dta", clear
merge m:1 industry_code using `occupation', keep(match) nogen
merge m:1 industry_code using `industry', nogen keep(master match) keepusing(industry_label ces_employment growth)

* drop hospitals and clinics
drop if inlist(industry_code, 621, 622)

* regional employment weight from CBP, sectoral weight from CES
tempvar sum
egen `sum' = sum(cond(!missing(population_density,communication_share),employment,0)), by(industry_code)
generate employment_weight = cond(!missing(population_density,communication_share),employment,0)/`sum'*ces_employment

drop _*
save "industry_location_panel.dta", replace
