clear all
* calculate urban density cutoff

use "../data/derived/industry-index.dta", clear

* drop hospitals and clinics
drop if inlist(industry_code, 621, 622)

replace ces_employment = int(ces_employment*1000)
foreach X of var *_interact_share {
	summarize `X' [fw=ces_employment]
	display "Millions of workers: " r(mean)/100 * r(sum_w) / 1e+6
}

generate naics_2d = industry_code if industry_code<100
replace naics_2d = int(industry_code/10) if industry_code>=100

* employment-weighted average
foreach X of var *_interact_share {
	replace `X' = `X' * employment
	replace employment = . if missing(`X')
}
collapse (sum) employment (sum) teamwork_share customer_share presence_share communication_share affected_share face2face_share (firstnm) industry_label, by(naics_2d)
foreach X of var *_share {
	replace `X' = `X' / employment
}
gsort -face2face_share
generate sum_employment = sum(employment)
list industry_label sum_employment in 1/5
