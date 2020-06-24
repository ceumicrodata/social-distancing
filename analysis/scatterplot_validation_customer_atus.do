clear all
use "../data/derived/occupation/risks.dta", clear

gen label_customer=""
replace label_customer="Education administrators" if SOCCode=="11-9032"

replace label_customer="Genetic counselors" if SOCCode=="29-9092"
replace label_customer="Fundraisers" if SOCCode=="13-1131"

replace label_customer="Software developers" if SOCCode=="15-1133"


gen label_customer_interact=""
*replace label_customer_interact="Industrial machinery mechanics"  if SOCCode=="49-9041"
replace label_customer_interact="Cleaners of vehicles and equipment"  if SOCCode=="53-7061"
replace label_customer_interact="Healthcare social workers"  if SOCCode=="21-1022"
*replace label_customer_interact="Oral and maxillofacial surgeons"  if SOCCode=="29-1022"
replace label_customer_interact="Dentists"  if SOCCode=="29-1021"
replace label_customer_interact="Directors, religious activities and education"  if SOCCode=="21-2021"

twoway (scatter customer_index can_wh if customer_index>0, mlabel(label_customer) )|| ///
	(scatter customer_interact_index can_wh if customer_interact_index>0, mlabel( label_customer_interact)), graphregion(color(white))  ///
	legend(order(1 "customer" 2 "customer * face-to-face"))  graphregion(margin(3 15 1 3)) ytitle("Customer") xtitle("Share of workers who are able to work from home")


graph export "../text/customer_atus_validation.eps", replace
graph export "../text/customer_atus_validation.pdf", replace
