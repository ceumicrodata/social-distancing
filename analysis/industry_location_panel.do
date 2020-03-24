import delimited "../data/derived/occupation/naics_risk.csv", varnames(1) clear
tempfile occupation
save `occupation', replace

use "../data/clean/cbp/zip_code_business_patterns.dta", clear
merge m:1 industry_code using `occupation', keep(match) nogen
