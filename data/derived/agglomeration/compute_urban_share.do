clear all
use "../../clean/cbp/zip_code_business_patterns.dta"

* when no populaiton data, assume population=0
mvencode population_density, mv(0) override
generate average_density = population_density * employment
replace employment = 0 if missing(population_density)

* employment-weighted average density across zip codes
collapse (sum) employment average_density, by(industry_code)
replace average_density = average_density/employment
rename employment cbp_employment
compress

label variable average_density "Average population density (person/km2)"

export delimited "high_density_employment.csv", replace
save "high_density_employment.dta", replace
