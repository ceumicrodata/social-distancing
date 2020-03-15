clear all
* introduce short names for all risk factors
local risks proximity infections group face2face customers contact
local proximity Physical_Proximity
local infections Exposed_to_Disease_or_Infections
local group Exposed_to_Disease_or_Infections
local face2face Face-to-Face_Discussions
local customers Deal_With_External_Customers
local contact Contact_With_Others

tempfile rsk
generate str Code = ""
save `rsk', replace emptyok

foreach risk in `risks' {
	import delimited "../../raw/onet/``risk''.csv", clear case(preserve) varnames(1) numericcols(1)
	rename Context `risk'
	merge 1:1 Code using `rsk', nogen
	save `rsk', replace
}

merge 1:1 Code using "crosswalk.dta", nogen keep(master match)
* official crosswalk missing for 1 occuopation
replace SOCCode = substr(Code, 1, 7) if missing(SOCCode)

* average with SOC occupation
collapse (mean) `risks', by(SOCCode Description)
foreach X of var `risks' {
	replace `X' = round(`X')
}

order SOCCode Description
export delimited "risks.csv", replace
