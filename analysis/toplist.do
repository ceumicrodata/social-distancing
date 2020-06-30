use "../data/derived/industry-index.dta", clear

* drop hospitals and clinics
drop if inlist(industry_code, 621, 622)

* aggregate up to 2 digits
do "aggregate2digit.do"

collapse (mean) teamwork_interact_share customer_interact_share presence_interact_share communication_interact_share [aw=ces_employment], by(naics_2d)
foreach X of var *_share {
	replace `X' = round(`X')
}

* NB: this is a comment
*gsort -face2face_share

*drop healthcare
drop if naics_2d==62

gsort -communication_interact_share
keep if (_n<=5) | (_n>=_N-4)

export delimited "../data/derived/top-industries.csv", replace
