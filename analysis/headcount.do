clear all
use "../data/derived/industry-index.dta"

* drop hospitals and clinics
drop if inlist(industry_code, 621, 622)

* cumulate employment
gsort -social_distancing_exposure
generate sum_employment = sum(employment)
* the 10 most exposed sectors employ
list sum_employment in 10

generate naics_2d = industry_code if industry_code<100
replace naics_2d = int(industry_code/10) if industry_code>=100

* employment-weighted average
foreach X of var *_share social {
	replace `X' = `X' * employment
	replace employment = . if missing(`X')
}
collapse (sum) employment (sum) communication_share infection_share social_distancing (firstnm) industry_label, by(naics_2d)
foreach X of var *_share social {
	replace `X' = `X' / employment
}
gsort -social_distancing_exposure
generate sum_employment = sum(employment)
list industry_label sum_employment in 1/3
