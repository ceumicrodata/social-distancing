clear all

import delimited "../data/derived/crosswalk/industry.csv", varnames(1) clear case(preserve)
merge 1:1 industry_code using "../data/clean/industry-employment/industry-employment.dta", nogen keep(master match)
rename employment ces_employment
tempfile industry
save `industry', replace


import delimited "../data/derived/occupation/naics_risk.csv", varnames(1) clear
merge m:1 industry_code using `industry', nogen keep(master match)

local vars teamwork_share customer_share presence_share communication_share affected_share face2face_share
keep industry_code industry_label `vars'
order industry_code industry_label `vars'

* merge on CES employment to be able to calculate weighted statistics
merge 1:1 industry_code using `industry', nogen keep(master match) keepusing(ces_employment)

foreach X of var *_share {
	replace `X' = round(`X')
	format `X' %10.0f
}
foreach X of var ces_employment {
	replace `X' = round(`X'*10)/10
	format `X' %11.1f
}

label variable teamwork_share "Workers in teamwork-intensive occupations (percent)"
label variable customer_share "Workers in customer-facing occupations (percent)"
label variable presence_share "Workers in occupations requiring physical presence (percent)"
label variable communication_share "Workers in communication-intensive occupations (percent)"
label variable affected_share "Workers in any of the three groups (percent)"
label variable face2face_share "Workers in face-to-face-intensive occupations (percent)"

label variable ces_employment "Industry employment (thousand persons)"

gsort -affected_share

save "../data/derived/industry-index.dta", replace
export delimited "../data/derived/industry-index.csv", replace
