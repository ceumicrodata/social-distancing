clear all
use "../../clean/cbp/zip_code_business_patterns.dta"

local density_cutoff 1000
generate byte high_density = (population_density>`density_cutoff' & !missing(population_density)) | (employment_density>`density_cutoff' & !missing(employment_density))

generate high_density_employment = high_density * employment

collapse (sum) employment large_plant_employment high_density_employment, by(naics)
foreach X of var *_employment {
	replace `X' = int(`X' / employment * 100)
}
drop employment
compress

label variable large_plant_employment "Share of workers in plants larger than 99 (percent)"
label variable high_density_employment "Share of workers in ZIP codes above `density_cutoff' person/km2 density (percent)"

export delimited "high_density_employment.csv", replace
save "high_density_employment.dta", replace
