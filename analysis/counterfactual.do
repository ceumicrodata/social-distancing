clear all

import delimited "../data/derived/crosswalk/2digit_names.csv", varnames(1) clear case(preserve)
tempfile digit2
save `digit2', replace

use "../data/derived/industry_location_panel.dta"

* add safegraph visits data
* only use visits to plants in CBP
* if not found, assume 0 visits
merge 1:1 industry_code zip using "../data/derived/visit/visit-naics-zip.dta", nogen keep(master match)
mvencode visit*, mv(0) override

merge m:1 industry_code using "../data/derived/visit/visit-change.dta", nogen keep(master match)

* when either is very small, do not use that cell, use zip code average
egen minvisit = rmin(visits_feb visits_may )
generate ln_visit_change = cond(minvisit > 10, ln(visits_may) - ln(visits_feb), ln(1 + visit_change / 100))

* winsorize change
summarize ln_visit_change, detail
replace ln_visit_change = r(p1) if ln_visit_change < r(p1)
replace ln_visit_change = r(p99) if ln_visit_change > r(p99)

* from employment regression, only F2F customer contact matters
generate chi = customer_interact_share/100
generate gamma = chi/(1-chi)
generate contact_ratio = exp(ln_visit_change)
* Eq 6 from the paper
generate labor_subsidy = 100 - 100 * (1 - chi*contact_ratio) * (contact_ratio)^gamma / (1-chi)
summarize labor_subsidy [aw=employment_weight]

save "wage_subsidy.dta", replace

do "aggregate2digit.do"
* weighted cost ratio
replace labor_subsidy = labor_subsidy * employment_weight

collapse (sum) labor_subsidy employment_weight, by(naics_2d)
* merge on names
merge 1:1 naics_2d using `digit2', nogen keep(master match)

replace labor_subsidy = round(labor_subsidy/employment_weight, 0.1)
rename employment_weight employment
replace employment = round(employment)

* calculate weighted average
summarize labor_subsidy [fw=employment], meanonly
scalar average = r(mean)
scalar N = r(N)

gsort -labor_subsidy

* add a row for average
set obs 20
replace industry_label = "Average" in 20
replace labor_subsidy = average in 20
replace employment = N in 20

order industry_label labor_subsidy employment
export delimited "cost_by_naics2.csv", replace
