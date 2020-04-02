clear all
use "../data/derived/occupation/risks.dta", clear


cap drop label_occup2
gen label_occup2=""

replace label_occup2="Healthcare social workers"  if   SOCCode=="21-1022"

replace label_occup2="Textile machine operators" if SOCCode=="51-6061"

replace label_occup2="Postal service mail carriers" if  SOCCode=="43-5052"
replace label_occup2="Chemical equipment operators" if    SOCCode=="51-9011"
replace label_occup2="Insurance sales agents" if   SOCCode=="41-3021"
*replace label_occup2="Police officers" if SOCCode=="33-3051"

replace label_occup2="Surgeons" if SOCCode=="29-1067"
replace label_occup2="Dentists" if SOCCode=="29-1021"


replace label_occup2="Psychiatrists"  if SOCCode=="29-1066"
replace label_occup2="Firefighters"  if SOCCode=="33-2011"
replace label_occup2="Nuclear power reactor operators" if  SOCCode=="51-8011"
replace label_occup2="Couriers" if  SOCCode=="43-5021"

replace label_occup2="Chefs and head cooks"   if  SOCCode=="35-1011"
replace label_occup2="Athletic trainers"  if  SOCCode=="29-9091"
replace label_occup2="Elementary school teachers"  if  SOCCode=="25-2021"







scatter customer_index teamwork_index if (customer_index>0 & teamwork_index>0), graphregion(color(white)) msymbol(circle_hollow) ///
ytitle("Customer contact") xtitle("Teamwork") mlabel(label_occup2) graphregion(margin(3 15 1 3))


graph export "../text/fig3.eps", replace
graph export "../text/fig3.pdf", replace
