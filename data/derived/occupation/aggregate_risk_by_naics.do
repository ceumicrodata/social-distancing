cd "C:\Users\Dell\Desktop\social-distance\data\derived\occupation"

clear all
use "../../clean/employment-matrix/matrix.dta"

local indexes teamwork customer presence teamwork_interact customer_interact presence_interact f2f_email f2f prox

merge m:1 SOCCode using "risks.dta", keep(master match) nogen
* a few cases are missing the risk, take these to be low risk
mvencode `indexes', mv(0) override

replace Employment = round(Employment*1000)
compress

* both or all three
generate byte communication = teamwork | customer
generate byte affected = communication | presence
* share of workers communicating but not remotely
*generate byte face2face = communication & !remote
* both or all three

generate byte communication_interact = teamwork_interact|customer_interact
generate byte affected_interact = communication_interact|presence_interact


foreach X of var `indexes'  communication affected  communication_interact affected_interact ///
can_wh ever_wh full_day_wh wh_5days wh_3days wh_1days wh_2weeks wh_1month  {
	generate double `X'_share = `X' * Employment
}

collapse (sum) Employment teamwork_share customer_share presence_share ///
communication_share affected_share  communication_interact_share affected_interact_share ///
teamwork_interact_share customer_interact_share presence_interact_share ///
can_wh_share ever_wh_share full_day_wh_share wh_5days_share wh_3days_share ///
wh_1days_share wh_2weeks_share wh_1month_share f2f_email_share f2f_share prox_share, by(industry_code)


foreach X in `indexes'  communication affected  communication_interact affected_interact ///
can_wh ever_wh full_day_wh wh_5days wh_3days wh_1days wh_2weeks wh_1month  {
	replace `X'_share = round(`X'_share / Employment * 100)
}
drop Employment


label variable teamwork_interact_share "Teamwork communication (dummy) with context cutoff - interaction"
label variable customer_interact_share "Customer communication (dummy) with context cutoff - interaction"
label variable presence_interact_share "Physical presence (dummy) with context cutoff - interaction"
label variable customer_interact_share "Customer communication (dummy) version 2 with context cutoff - interaction"

label variable teamwork_share "Teamwork communication (dummy)"
label variable customer_share "Customer communication (dummy)"
label variable presence_share "Physical presence (dummy)"
label variable customer_share "Customer communication (dummy)"


label var can_wh "as part of the (main) job, can you work at home?"
label var ever_wh "Do you ever work at home?"
label var full_day_wh "Are there days when you work only at home?"
label var wh_5days "work home 5 or more days a week"
label var wh_3days "work home 3 or more days a week"
label var wh_1days "work home 1 or more days a week"
label var wh_2weeks "work home at least once in every 2 weeks or more"
label var wh_1month "work home at least once a month or more"

label var f2f_email_share "((face2face > 75)&(face2face > email)&(face2face > memo))"
label var f2f_share "(face2face > 75)"
label var prox_share "(proximity > 25)"

export delimited "naics_risk.csv", replace
