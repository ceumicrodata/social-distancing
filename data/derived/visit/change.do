clear all
use "../industry_location_panel.dta"

* add safegraph visits data
* only use visits to plants in CBP
* if not found, assume 0 visits
merge 1:1 industry_code zip using "visit-naics-zip.dta", nogen keep(master match)
mvencode visit*, mv(0) override

* compute employment-weighted averages for each industry
foreach X of var visit* {
	egen local_`X' = sum(`X'), by(zip)
	replace local_`X' = employment_weight * local_`X'
}

collapse (sum) local_* visit* employment_weight establishments, by(industry_code)
foreach X of var local* visit* {
	replace `X' =  `X' / employment_weight
}

generate visit_change = visits_apr / visits_feb * 100 - 100
generate local_visit_change = local_visits_apr / local_visits_feb * 100 - 100

keep industry_code *_change *_feb
save "visit-change.dta"
