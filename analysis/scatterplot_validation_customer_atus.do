clear all
use "../data/derived/occupation/risks.dta", clear

* aggregate to ATUS occupation categories
collapse (mean) customer_index customer_interact_index can_wh (firstnm) SOCCode, by(census2010)

* use percent everywhere
replace can_wh = 100 * can_wh
* add random noise so more can be seen in figure
set seed 1
replace can_wh = can_wh + 2 * (uniform() - 0.5)

generate label_customer=""
*replace label_customer="Education administrators" if SOCCode=="11-9032"
*replace label_customer="Genetic counselors" if SOCCode=="29-9092"
replace label_customer="Fundraisers" if SOCCode=="13-1131"
replace label_customer="Morticians, Undertakers, and Funeral Directors" if SOCCode=="39-4031"
replace label_customer="Proofreaders and Copy Markers" if SOCCode=="43-9081"
*replace label_customer="Software developers" if SOCCode=="15-1133"


generate label_customer_interact=""
*replace label_customer_interact="Industrial machinery mechanics"  if SOCCode=="49-9041"
replace label_customer_interact="Cleaners of vehicles and equipment"  if SOCCode=="53-7061"
replace label_customer_interact="Healthcare social workers"  if SOCCode=="21-1022"
*replace label_customer_interact="Oral and maxillofacial surgeons"  if SOCCode=="29-1022"
replace label_customer_interact="Dentists"  if SOCCode=="29-1021"
replace label_customer_interact="Directors, religious act. and educ."  if SOCCode=="21-2021"

twoway (scatter customer_interact_index can_wh if customer_interact_index>0, msymbol(O) mlabel(label_customer_interact)) ///
	(scatter customer_index can_wh if customer_index>0 & customer_interact_index==0, msymbol(Oh) mlabel(label_customer) ) ///
	, graphregion(color(white)) scheme(s2mono)  ///
	legend(order(1 "Face to face" 2 "Emails and memos"))  graphregion(margin(3 15 1 3)) ytitle("Customer interaction index") xtitle("Share of workers who are able to work from home") 


graph export "../text/customer_atus_validation.eps", replace
graph export "../text/customer_atus_validation.pdf", replace
