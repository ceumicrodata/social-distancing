clear all
use "../data/derived/occupation/risks.dta", clear


cap drop label_occup2
gen label_occup2=""
*replace label_occup2="Shoe machine operator" if SOCCode=="51-6042"
replace label_occup=Description if SOCCode=="35-2013"
replace label_occup2="Fine artists" if SOCCode=="27-1013"
replace label_occup2="Physicians" if SOCCode=="29-1062"
*replace label_occup2="Psychiatric aides" if SOCCode=="31-1013"
*replace label_occup2="Personal care aides" if SOCCode=="39-9021"
replace label_occup2="PR managers" if SOCCode=="11-2031"
replace label_occup2="Meat cutters" if SOCCode=="51-3022"
replace label_occup2="Dental hygienists" if SOCCode=="29-2021"
replace label_occup2="Logging equipment operators" if SOCCode=="45-4022"
replace label_occup2="Fire inspectors" if SOCCode=="33-2021"
replace label_occup2="Police officers" if SOCCode=="33-3051"
replace label_occup2="Dancers" if SOCCode=="27-2031"
replace label_occup2="Manicurists" if SOCCode=="39-5092"


scatter  infection communication, graphregion(color(white)) msymbol(circle_hollow) ///
ytitle("Infection Index") xtitle("Communication Index") mlabel(label_occup2) graphregion(margin(3 15 1 3))
graph export "../text/overleaf/fig3.eps", replace
graph export "../text/overleaf/fig3.pdf", replace
