clear all
use "../../clean/cbp/zip_code_business_patterns.dta"

generate average_density = ln(employment_density) * employment
replace employment = 0 if missing(employment_density)

collapse (sum) employment average_density, by(industry_code)
replace average_density = exp(average_density/employment)
rename employment cbp_employment
compress

label variable average_density "Average employment density (person/km2)"

export delimited "high_density_employment.csv", replace
save "high_density_employment.dta", replace
