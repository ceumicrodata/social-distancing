clear all
use "wage_subsidy.dta"
drop _*

merge 1:1 industry_code zip using "../data/clean/safegraph/visit-naics-zip.dta", nogen 
*keep(master match)
