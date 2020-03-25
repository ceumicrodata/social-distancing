clear all
use "../data/derived/occupation/risks.dta", clear


cap drop label_occup2
gen label_occup2=""
replace label_occup2="Tire builders" if SOCCode=="51-9197"
replace label_occup2="Cutters and trimmers" if SOCCode=="51-9031"
replace label_occup2="PR managers" if  SOCCode=="11-2031"
replace label_occup2="HR managers" if   SOCCode=="11-3121"
replace label_occup2="Educational counselors" if   SOCCode=="21-1012"
*replace label_occup2="Nurse midwives" if   SOCCode=="29-1161"
replace label_occup2="Healthcare social workers"  if   SOCCode=="21-1022"
replace label_occup2="Software developers"   if   SOCCode=="15-1132"
*replace label_occup2="Petroleum engineers"   if   SOCCode=="17-2171"
replace label_occup2="Chemical engineers" if  SOCCode=="17-2041"
*replace label_occup2="Aerospace engineers" if  SOCCode=="17-2011"
*replace label_occup2="Architects" if  SOCCode=="17-1011"
replace label_occup2="Training and development specialists" if  SOCCode=="13-1151"
replace label_occup2="Statisticians" if  SOCCode=="15-2041"
replace label_occup2="Mathematicians" if  SOCCode=="15-2021"
replace label_occup2="Lawyers" if  SOCCode=="23-1011" 
*replace label_occup2="Sewing machine operators" if SOCCode=="51-6031"
replace label_occup2="Fine artists" if SOCCode=="27-1013"
replace label_occup2="Shoe machine operators" if SOCCode=="51-6042"


scatter customer teamwork, graphregion(color(white)) msymbol(circle_hollow) ///
ytitle("Customer contact") xtitle("Coworker contact") mlabel(label_occup2) graphregion(margin(3 15 1 3))
graph export "../text/overleaf/fig3.eps", replace
graph export "../text/overleaf/fig3.pdf", replace
