clear all

* read zip-level population
tempfile zippop
import delimited "../../raw/census/cbp/zcta_county_rel_10.txt", varnames(1)
collapse (mean) zpop zarealand, by(zcta5)
rename zcta5 zip
replace zarealand = zarealand/1e+6
rename zarealand area
rename zpop population
sort zip 
save `zippop', replace

import delimited "../../raw/census/cbp/zbp17detail.txt", varnames(1) clear
* keep total and 4-digit NAICS
keep if naics=="------" | regexm(naics, "[0-9][0-9][0-9][0-9]//")
destring n5-n1000, force replace

do estimate_employment

merge m:1 zip using `zippop', keepusing(population area) keep(master match) nogen

egen total_employment = sum(cond(naics=="------", employment, 0)), by(zip)
drop if naics=="------"
replace naics = substr(naics, 1, 4)
destring naics, force replace

generate population_density = population/area
generate employment_density = total_employment/area

keep naics zip establishments employment large_plant_employment population_density employment_density

label variable naics "4-digit NAICS 2017 code"
label variable zip "2010 Zip-code Tabulation Area"
label variable establishments "Number of establishments"
label variable employment "Total employment"
label variable large_plant_employment "Employment in plants larger than 99 workers"
label variable population_density "Population density of ZIP-code (person/km2)"
label variable employment_density "Employment density of ZIP-code (person/km2)"

save "zip_code_business_patterns.dta", replace


