clear all
use "../../clean/employment-matrix/matrix.dta"

local indexes teamwork customer presence

merge m:1 SOCCode using "risks.dta", keep(master match) nogen
* a few cases are missing the risk, take these to be low risk
mvencode `indexes', mv(0) override

replace Employment = round(Employment*1000)
compress

foreach X of var `indexes' {
	summarize `X' [fw=Employment], detail
	* use absolute cutoff: high if task/context is used "most of the time"
	generate double high_`X' = (`X' >= 75) * Employment
}

collapse (sum) Employment high_teamwork high_customer high_presence, by(industry_code)
foreach X in `indexes' {
	replace high_`X' = round(high_`X' / Employment * 100)
}
drop Employment

export delimited "naics_risk.csv", replace
