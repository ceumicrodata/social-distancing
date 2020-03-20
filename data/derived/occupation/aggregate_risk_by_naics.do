clear all
use "../../clean/employment-matrix/matrix.dta"

merge m:1 SOCCode using "risks.dta", keep(master match) nogen
* a few cases are missing the risk, take these to be low risk
mvencode communication infection, mv(0) override

replace Employment = round(Employment*1000)
compress

foreach X of var communication infection {
	summarize `X' [fw=Employment], detail
	generate double high_`X' = (`X' > r(p75)) * Employment
}

collapse (sum) Employment high_communication high_infection, by(industry_code)
foreach X in communication infection {
	replace high_`X' = round(high_`X' / Employment * 100)
}
drop Employment

export delimited "naics_risk.csv", replace
