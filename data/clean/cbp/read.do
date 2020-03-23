clear all

* read industry aggregator
import delimited "../../derived/crosswalk/naics2industry.csv", varnames(1) clear
tempfile naics2industry
save `naics2industry', replace

* read zip-level population
tempfile zippop
import delimited "../../raw/census/cbp/zcta_county_rel_10.txt", varnames(1) clear
collapse (mean) zpop zarealand, by(zcta5)
rename zcta5 zip
replace zarealand = zarealand/1e+6
rename zarealand area
rename zpop population
sort zip 
save `zippop', replace

import delimited "../../raw/census/cbp/zbp17detail.txt", varnames(1) clear
* keep total and 3-digit NAICS
keep if naics=="------" | regexm(naics, "[0-9][0-9][0-9]///")
destring n5-n1000, force replace

* aggregate by industry
generate naics_3d = real(substr(naics, 1, 3)) if regexm(naics, "[0-9][0-9][0-9]///")

merge m:1 naics_3d using `naics2industry', keep(master match) nogen
replace industry_code = 0 if naics=="------"
collapse (sum) n5-n1000 est, by(zip industry_code)
 
do estimate_employment

merge m:1 zip using `zippop', keepusing(population area) keep(master match) nogen

egen total_employment = sum(cond(industry_code==0, employment, 0)), by(zip)
drop if industry_code==0

generate population_density = population/area
generate employment_density = total_employment/area

keep industry_code zip establishments employment large_plant_employment population population_density employment_density

label variable industry_code "Industry code (based on NAICS 2017)"
label variable zip "2010 Zip-code Tabulation Area"
label variable establishments "Number of establishments"
label variable employment "Total employment"
label variable large_plant_employment "Employment in plants larger than 99 workers"
label variable population "Population of ZIP-code"
label variable population_density "Population density of ZIP-code (person/km2)"
label variable employment_density "Employment density of ZIP-code (person/km2)"

save "zip_code_business_patterns.dta", replace


