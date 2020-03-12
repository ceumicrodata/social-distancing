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
order Code Occupation
export delimited "risks.csv", replace
