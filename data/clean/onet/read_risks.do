clear all
* introduce short names for all risk factors
local risks proximity infections group face2face customers contact move control operate repair_elect repair_mechanic inspect coach interpersonal care public consult
local proximity Physical_Proximity
local infections Exposed_to_Disease_or_Infections
local group Work_With_Work_Group_or_Team
local face2face Face-to-Face_Discussions
local customers Deal_With_External_Customers
local contact Contact_With_Others

* proxies for onsite work
local move Handling_and_Moving_Objects
local control Controlling_Machines_and_Processes
local operate Operating_Vehicles_Mechanized_Devices_or_Equipment
local repair_elect Repairing_and_Maintaining_Electronic_Equipment
local repair_mechanic Repairing_and_Maintaining_Mechanical_Equipment
local inspect Inspecting_Equipment_Structures_or_Material

* proxies for interpersonal skills
local coach Coaching_and_Developing_Others
local interpersonal Establishing_and_Maintaining_Interpersonal_Relationships
local care Assisting_and_Caring_for_Others
local public Performing_for_or_Working_Directly_with_the_Public
local consult Provide_Consultation_and_Advice_to_Others


tempfile rsk
generate str Code = ""
save `rsk', replace emptyok

foreach risk in `risks' {
	import delimited "../../raw/onet/``risk''.csv", clear case(preserve) varnames(1) numericcols(1)
	capture confirm variable Context
	if (_rc==0) {
		rename Context `risk'
	}
	else {
		* Importance and Level are highly correlated, only keep Importance
		rename Importance `risk'
		drop Level
	}
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
