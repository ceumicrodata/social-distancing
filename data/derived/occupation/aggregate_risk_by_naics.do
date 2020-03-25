clear all
use "../../clean/employment-matrix/matrix.dta"

local indexes teamwork customer presence

merge m:1 SOCCode using "risks.dta", keep(master match) nogen
* a few cases are missing the risk, take these to be low risk
mvencode `indexes', mv(0) override

replace Employment = round(Employment*1000)
compress

* both or all three
generate byte communication = teamwork|customer
generate byte affected = communication|presence

foreach X of var `indexes'  communication affected {
	* index is high and context implies face2face
	generate double `X'_share = `X' * Employment
}
collapse (sum) Employment teamwork_share customer_share presence_share communication_share affected_share, by(industry_code)
foreach X in `indexes'  communication affected {
	replace `X'_share = round(`X'_share / Employment * 100)
}
drop Employment

export delimited "naics_risk.csv", replace
