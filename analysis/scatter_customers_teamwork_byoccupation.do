clear all
use "../data/derived/occupation/risks.dta", clear


cap drop label_occup2
gen label_occup2=""
*replace label_occup2="Tire builders" if SOCCode=="51-9197"
*replace label_occup2="Cutters and trimmers" if SOCCode=="51-9031"
*replace label_occup2="PR managers" if  SOCCode=="11-2031"
replace label_occup2="HR managers" if   SOCCode=="11-3121"
*replace label_occup2="Educational counselors" if   SOCCode=="21-1012"
*replace label_occup2="Nurse midwives" if   SOCCode=="29-1161"
*replace label_occup2="Healthcare social workers"  if   SOCCode=="21-1022"
replace label_occup2="Software developers"   if   SOCCode=="15-1132"
replace label_occup2="Petroleum engineers"   if   SOCCode=="17-2171"
*replace label_occup2="Chemical engineers" if  SOCCode=="17-2041"
*replace label_occup2="Aerospace engineers" if  SOCCode=="17-2011"
replace label_occup2="Architects" if  SOCCode=="17-1011"
*replace label_occup2="Training and specialists" if  SOCCode=="13-1151"
*replace label_occup2="Statisticians" if  SOCCode=="15-2041"
*replace label_occup2="Mathematicians" if  SOCCode=="15-2021"
*replace label_occup2="Lawyers" if  SOCCode=="23-1011" 
*replace label_occup2="Sewing machine operators" if SOCCode=="51-6031"
*replace label_occup2="Fine artists" if SOCCode=="27-1013"
*replace label_occup2="Shoe machine operators" if SOCCode=="51-6042"
*replace label_occup2="Textile machine operators" if SOCCode=="51-6061"
*replace label_occup2="Mining machine operators" if SOCCode=="47-5041"
*replace label_occup2="Models"  if SOCCode=="41-9012"
*replace label_occup2="Postal service mail carriers" if  SOCCode=="43-5052"
*replace label_occup2="Agricultural equipment operators" if   SOCCode=="45-2091"
*replace label_occup2="Chemical equipment operators" if    SOCCode=="51-9011"
*replace label_occup2="Insurance sales agents" if   SOCCode=="41-3021"
*replace label_occup2="Police officers" if SOCCode=="33-3051"

*replace label_occup2="Orthodontists" if SOCCode=="29-1023"
*replace label_occup2="Nurse anesthetists" if SOCCode=="29-1151"
*replace label_occup2="Surgeons" if SOCCode=="29-1067"
*replace label_occup2="Marriage and family therapists" if SOCCode=="21-1013"
*replace label_occup2="Education administrators" if SOCCode=="11-9032"
replace label_occup2="Dentists" if SOCCode=="29-1021"

*replace label_occup2="Registered nurses"  if SOCCode=="29-1141"
*replace label_occup2="Nurse practitioners"  if SOCCode=="29-1171"

replace label_occup2="Psychiatrists"  if SOCCode=="29-1066"
*replace label_occup2="Firefighters"  if SOCCode=="33-2011"
*replace label_occup2="Firefighters"  if SOCCode=="33-2011"

replace label_occup2="Supervisors of non-retail sales workers" if  SOCCode=="41-1012"
replace label_occup2="Construction managers"  if  SOCCode=="11-9021"
*replace label_occup2="Distribution managers"  if  SOCCode=="11-3071"
replace label_occup2="Nuclear power reactor operators" if  SOCCode=="51-8011"
replace label_occup2="Couriers" if  SOCCode=="43-5021"

replace label_occup2="Industrial machinery mechanics"  if  SOCCode=="49-9041"
*replace label_occup2="Pediatricians"   if  SOCCode=="29-1065"


scatter customer_index teamwork_index if customer_index>0 & teamwork_index>0, graphregion(color(white)) msymbol(circle_hollow) ///
ytitle("Customer contact") xtitle("Teamwork") mlabel(label_occup2) graphregion(margin(3 15 1 3))
graph export "../text/fig3.eps", replace
graph export "../text/fig3.pdf", replace