clear all
use "../../clean/cbp/zip_code_business_patterns.dta"

local measures population_density employment_density plant_size

* when no population data, assume population=0
mvencode population_density, mv(0) override
* employment-weighted measures across zip codes
foreach X of var `measures' {
	replace `X' = `X' * employment
	replace employment = 0 if missing(`X')
}
collapse (sum) employment `measures', by(industry_code)
foreach X of var `measures' {
	replace `X' = round(`X' / employment, 0.1)

}
rename employment cbp_employment
compress

label variable population_density "Average population density (person/km2)"
label variable employment_density "Average employment density (person/km2)"
label variable plant_size "Average plant size (person)"

export delimited "high_density_employment.csv", replace
save "high_density_employment.dta", replace
