clear all

import delimited "../data/derived/crosswalk/industry.csv", varnames(1) clear case(preserve)
merge 1:1 industry_code using "../data/clean/industry-employment/industry-employment.dta", nogen keep(master match)
rename employment ces_employment
tempfile industry
save `industry', replace

import delimited "../data/derived/crosswalk/2digit_names.csv", varnames(1) clear case(preserve)
tempfile digit2
save `digit2', replace

do "industry_location_panel.do"
merge m:1 industry_code using `industry', nogen keep(master match) keepusing(industry_label ces_employment)

* drop hospitals and clinics
drop if inlist(industry_code, 621, 622)

* regional employment weight from CBP, sectoral weight from CES
tempvar sum
egen `sum' = sum(cond(!missing(population_density,communication_share),employment,0)), by(industry_code)
generate employment_weight = cond(!missing(population_density,communication_share),employment,0)/`sum'*ces_employment

/* 
Calibrate epsilon to gamma=1.04 in

Ciccone, Antonio, and Robert Hall. 1996. “Productivity and the Density of Economic Activity.” 
The American Economic Review 86 (1): 54–70.

page 62.

density^agglomeration = density^(epsilon * chi)
*/
scalar agglomeration = 0.04
generate LHS = agglomeration * ln(population_density)
generate RHS = (communication_share/100) * ln(population_density)

regress LHS RHS [aw=employment_weight]
scalar epsilon = _b[RHS]
generate chi = communication_share/100
generate gamma = chi/(1-chi)

* Eq 4
generate contact = population_density^(epsilon*(1-chi))

* current number of contacts
summarize contact [aw=employment_weight]
scalar current_contact = r(mean)

* target contact is half
scalar target_contact = current_contact * 0.5

* loop to find the cap
scalar cap = 10000
scalar average = current_contact 
generate counterfactual = .
while average > target_contact {
	quietly replace counterfactual = min(contact, min(population_density, cap)^(epsilon*(1-chi)))
	quietly summarize counterfactual [aw=employment_weight]
	scalar average = r(mean)
	scalar cap = 0.90*cap
}

generate contact_ratio = counterfactual / contact
* Eq 6 from the paper
generate labor_subsidy = 100 - 100 * (1 - chi*contact_ratio) * (contact_ratio)^gamma / (1-chi)
summarize labor_subsidy [aw=employment_weight]

* compute for nyc
merge m:1 zip using "nyc_zip.dta", keep(master match)
generate nyc = (_m==3)
summarize population_density if nyc==1 [aw=employment_weight]
summarize labor_subsidy if nyc==1 [aw=employment_weight]

save "wage_subsidy.dta", replace

do "aggregate2digit.do"
* weighted cost ratio
replace labor_subsidy = labor_subsidy * employment_weight
* only add up ces_employment once per industry
egen tag = tag(industry_code)

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
