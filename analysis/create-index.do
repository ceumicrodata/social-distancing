clear all
import delimited "../data/derived/crosswalk/industry.csv", varnames(1) clear case(preserve)
tempfile industry
save `industry', replace

import delimited "../data/derived/occupation/naics_risk.csv", varnames(1) clear
tempfile occupation
save `occupation', replace

import delimited "../data/derived/agglomeration/high_density_employment.csv", varnames(1) clear

merge 1:1 industry_code using `occupation', nogen
merge 1:1 industry_code using `industry', nogen keep(master match)
merge 1:1 industry_code using "../data/clean/industry-employment/industry-employment.dta", nogen keep(master match)

* check correlation betwen CES and CBP employment estimates
replace cbp_employment = cbp_employment / 1000
rename employment ces_employment

corr cbp_employment ces_employment 
assert r(rho)>0.95

* median employment density in manufacturing
summarize average_density if industry_code>=311 & industry_code<=339 [aw=ces_employment], d
scalar median_density = r(p50)

generate social_distancing_exposure = (average_density / median_density) ^ (high_communication/100)

local vars industry_code industry_label high_communication high_infection average_density social_distancing_exposure ces_employment
keep `vars'
order `vars'

* trim variables for presentation
replace social_distancing_exposure = round(social_distancing_exposure*100)
replace average_density = round(average_density)
rename high_communication communication_share
rename high_infection infection_share
rename average_density average_employment_density
rename ces_employment employment

label variable communication_share "Share of workers in communication-intensive occupations (percent)"
label variable infection_share "Share of workers in infection-prone occupations (percent)"
label variable average_employment_density "Employment density in the average ZIP code of business (person/km2)"
label variable social_distancing_exposure "Combined index of social distancing exposure (manufacturing=100)"
label variable employment "Industry employment (thousand persons)"

gsort -social_distancing_exposure

save "../data/derived/industry-index.dta", replace
export delimited "../data/derived/industry-index.csv", replace
