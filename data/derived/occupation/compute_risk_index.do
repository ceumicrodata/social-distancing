clear
import delimited "../../clean/onet/risks.csv", case(preserve) varnames(1)

**************
*generating summery indexes: communication and infection measures
*************

* interaction for teamwork
egen teamwork = rowmean(group consult interpersonal peers coordinate team guide)
* customer communication
egen customer = rowmean(contact customers public care coach interpersonal)
* are these contacts face to face? This is a multiplier because if F2F=0, then none of the above is relevant
foreach X of var teamwork customer {
	replace `X' = round(`X' * face2face / 100)
}

* require physical presence in close proximity to others
egen presence = rowmean(move control operate repair* inspect)
* Does this require proximity to others? Otherwise not subject to social distancing 
replace presence = round(presence * proximity / 100)

label variable group "Group communication index [0,100]"
label variable customer "Customer communication index [0,100]"
label variable presence "Physical presence index [0,100]"

keep SOCCode Description teamwork customer presence
compress

save "risks.dta", replace
