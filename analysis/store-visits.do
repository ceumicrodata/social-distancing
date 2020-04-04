clear all
use "../data/clean/safegraph/visit-naics-zip.dta",

* keep 2020-02 and 2020-03-22
keep if inlist(day_of_year, 60, 88)

* proportional change in daily visits between month of February and last week of March
keep industry_code zip visits day_of_year
reshape wide visits, i(industry_code zip) j(day_of_year)

generate gr_visits = (visits88 - visits60)/visits60
* only look at reduction in traffic due to social distancing
replace gr_visits = 0 if gr_visits>0
* model cannot accommodate 100% drop in traffic, winsorize
replace gr_visits = -0.95 if gr_visits<-0.95

keep industry_code zip gr_visits
save "../data/derived/change-in-visits.dta", replace
