clear all
local indexes teamwork_share customer_share presence_share communication_share affected_share face2face_share
use "../data/derived/industry_location_panel.dta", clear

foreach X of var `indexes' {
	replace `X' = `X' * employment_weight
	replace employment_weight = 0 if missing(`X')
}
collapse (first) population_density employment_density (sum) `indexes' establishments employment employment_weight, by(zip)
foreach X of var `indexes' {
	replace `X' = `X' / employment_weight
}
generate plant_size = employment / establishments

* merge coordinates
merge 1:1 zip using "../data/clean/geonames/us-zip-codes.dta", nogen keep(master match)

local vars zip latitude longitude population_density employment_density plant_size employment `indexes' 
keep `vars'
order `vars'
* round values for presentation
replace plant_size = plant_size*10
foreach X of var population_density employment_density plant_size `indexes' {
	replace `X' = round(`X')
}
replace plant_size = plant_size/10
foreach X of var latitude longitude {
	replace `X' = round(`X'*10000)/10000
}

sort zip
generate zip_code = string(zip,"%05.0f")
drop zip
order zip_code
export delimited "../data/derived/location-index.csv", replace

*drop rural areas, CBP is not representative for these
drop if population_density<10 | employment<50

generate ln_density = ln(population_density)
foreach X of var *_share {
	lowess `X' ln_density, bw(0.5) generate(`X'_hat)
}

* FIXME: verify figure with new indexes
do "fig4.do"
