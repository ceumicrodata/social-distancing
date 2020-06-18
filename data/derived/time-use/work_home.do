cd "C:\Users\Dell\Dropbox\social_distance\social-distancing-master\data\derived\atus"

use "..\..\raw\bls\atus\atus.dta", clear

gen can_wh=0
replace can_wh=1 if lujf_10==1
label var can_wh "as part of the (main) job, can you work at home?"
*all not "yes" answered are considered as no (NA as well)

gen count=1

gen ever_wh=0
replace ever_wh=1 if lejf_11==1
label var ever_wh "Do you ever work at home?"

gen full_day_wh=0
replace full_day_wh=1 if lejf_14==1
label var full_day_wh "Are there days when you work only at home?"

gen wh_5days=0
replace wh_5days=1 if lejf_15==1
label var wh_5days "work home 5 or more days a week"
 
gen wh_3days=0
replace wh_3days=1 if lejf_15==1
replace wh_3days=1 if lejf_15==2
label var wh_3days "work home 3 or more days a week"

gen wh_1days=0
replace wh_1days=1 if lejf_15==1
replace wh_1days=1 if lejf_15==2
replace wh_1days=1 if lejf_15==3
replace wh_1days=1 if lejf_15==4
label var wh_1days "work home 1 or more days a week"


gen wh_2weeks=0
replace wh_2weeks=1 if lejf_15==1
replace wh_2weeks=1 if lejf_15==2
replace wh_2weeks=1 if lejf_15==3
replace wh_2weeks=1 if lejf_15==4
replace wh_2weeks=1 if lejf_15==5
label var wh_2weeks "work home at least once in every 2 weeks or more"


gen wh_1month=0
replace wh_1month=1 if lejf_15==1
replace wh_1month=1 if lejf_15==2
replace wh_1month=1 if lejf_15==3
replace wh_1month=1 if lejf_15==4
replace wh_1month=1 if lejf_15==5
replace wh_1month=1 if lejf_15==6
label var wh_1month "work home at least once a month or more"

collapse (mean) can_wh ever_wh full_day_wh wh_5days wh_3days wh_1days ///
wh_2weeks wh_1month (sum) count , by(teio1icd) 
label var can_wh "as part of the (main) job, can you work at home?"
label var ever_wh "Do you ever work at home?"
label var full_day_wh "Are there days when you work only at home?"
label var wh_5days "work home 5 or more days a week"
label var wh_3days "work home 3 or more days a week"
label var wh_1days "work home 1 or more days a week"
label var wh_2weeks "work home at least once in every 2 weeks or more"
label var wh_1month "work home at least once a month or more"
label var count "the number of individual"
label var teio1icd "occupation code, census 2010"

save "atus_working_at_home_occupationlevel.dta", replace
