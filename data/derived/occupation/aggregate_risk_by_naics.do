clear all
use "../../clean/employment-matrix/matrix.dta"

local indexes teamwork customer presence
* face2face daily
local teamwork_context (face2face >= 0.5*(75+100))
local customer_context (face2face >= 0.5*(75+100))
* share office or more desne
local presence_context (proximity >= 0.5*(25+50))
* for tasks
local cutoff = 0.5*(50+75)

merge m:1 SOCCode using "risks.dta", keep(master match) nogen
* a few cases are missing the risk, take these to be low risk
mvencode `indexes', mv(0) override

replace Employment = round(Employment*1000)
compress

foreach X of var `indexes' {
	* index is high and context implies face2face
	generate double `X'_share = ``X'_context' * (`X' >= `cutoff') * Employment
}
collapse (sum) Employment teamwork_share customer_share presence_share, by(industry_code)
foreach X in `indexes' {
	replace `X'_share = round(`X'_share / Employment * 100)
}
drop Employment

export delimited "naics_risk.csv", replace
