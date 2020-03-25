clear all
* calculate urban density cutoff

use "../data/derived/industry-index.dta", clear

* drop hospitals and clinics
drop if inlist(industry_code, 621, 622)

replace ces_employment = int(ces_employment*1000)
foreach X of var *_share {
	summarize `X' [fw=ces_employment]
	display "Millions of workers: " r(mean)/100 * r(sum_w) / 1e+6
}

generate naics_2d = industry_code if industry_code<100
replace naics_2d = int(industry_code/10) if industry_code>=100

* employment-weighted average
foreach X of var *_share {
	replace `X' = `X' * employment
	replace employment = . if missing(`X')
}
collapse (sum) employment (sum) teamwork_share customer_share presence_share customer_exposure (firstnm) industry_label, by(naics_2d)
foreach X of var *_share {
	replace `X' = `X' / employment
}
gsort -customer_exposure
generate sum_employment = sum(employment)
list industry_label sum_employment in 1/5

clear all

do "industry_location_panel.do"
do "calculate-exposure.do"

* of which urban
drop if population_density < 1000
* drop hospitals and clinics
drop if inlist(industry_code, 621, 622)
foreach X of var *_share {
	replace `X' = `X' * employment
	replace employment = . if missing(`X')
}
collapse (sum) teamwork_share customer_share presence_share employment, by(industry_code)
foreach X of var *_share {
	replace `X' = `X' / employment
}
replace employment = int(employment)

foreach X of var *_share {
	summarize `X' [fw=employment]
	display "Millions of workers: " r(mean)/100 * r(sum_w) / 1e+6
}
