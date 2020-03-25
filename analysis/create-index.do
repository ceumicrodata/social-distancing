clear all

import delimited "../data/derived/crosswalk/industry.csv", varnames(1) clear case(preserve)
merge 1:1 industry_code using "../data/clean/industry-employment/industry-employment.dta", nogen keep(master match)
rename employment ces_employment
tempfile industry
save `industry', replace


do "industry_location_panel.do"
do "calculate-exposure.do"

merge m:1 industry_code using `industry', nogen keep(master match)

* check correlation betwen CES and CBP employment estimates
egen cbp_employment = sum(employment / 1000), by(industry_code)

corr cbp_employment ces_employment 
assert r(rho)>0.98

local vars  teamwork_share customer_share presence_share communication_share affected_share teamwork_exposure customer_exposure presence_exposure population_density employment_density plant_size
keep industry_code industry_label `vars'
order industry_code industry_label `vars'

collapse (mean) `vars' [aw=employment], by(industry_code industry_label)

* merge on CES employment to be able to calculate weighted statistics
merge 1:1 industry_code using `industry', nogen keep(master match) keepusing(ces_employment)

foreach X of var *_share *_exposure {
	replace `X' = round(`X')
	format `X' %10.0f
}
foreach X of var *_density plant_size ces_employment {
	replace `X' = round(`X'*10)/10
	format `X' %11.1f
}

label variable teamwork_share "Workers in teamwork-intensive occupations (percent)"
label variable customer_share "Workers in customer-facing occupations (percent)"
label variable presence_share "Workers in occupations requiring physical presence (percent)"
label variable communication_share "Workers in communication-intensive occupations (percent)"
label variable affected_share "Workers in any of the three groups (percent)"

label variable teamwork_exposure "Teamwork exposure to social distancing"
label variable customer_exposure "Customer contact exposure to social distancing"
label variable presence_exposure "Physical presence exposure to social distancing"

label variable population_density "Population density in the average ZIP code of business (person/km2)"
label variable employment_density "Employment density in the average ZIP code of business (person/km2)"
label variable plant_size "Average plant size (person)"
label variable ces_employment "Industry employment (thousand persons)"

gsort -teamwork_exposure

save "../data/derived/industry-index.dta", replace
export delimited "../data/derived/industry-index.csv", replace
