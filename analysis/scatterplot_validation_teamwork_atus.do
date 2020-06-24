clear all
use "../data/derived/occupation/risks.dta", clear


gen label_teamwork=""
replace label_teamwork="Chief executives" if SOCCode=="11-1011"
replace label_teamwork="Marketing specialists" if SOCCode=="13-1161"
replace label_teamwork="Fundraisers" if SOCCode=="13-1131"
replace label_teamwork="Geographers" if SOCCode=="19-3092"
 
	
gen label_teamwork_interact="" 
replace label_teamwork_interact="Event planners" if SOCCode=="13-1121"
*replace label_teamwork_interact="Civil engineering technicians" if SOCCode=="17-3022"
replace label_teamwork_interact="Agricultural and food science technicians" if SOCCode=="19-4011"
*replace label_teamwork_interact="Chemical technicians" if SOCCode=="19-4031"
replace label_teamwork_interact="Healthcare social workers" if SOCCode=="21-1022"

*replace label_teamwork_interact="Oral and maxillofacial surgeons" if SOCCode=="29-1022"
replace label_teamwork_interact="Dentists, general" if SOCCode=="29-1021"
replace label_teamwork_interact="Postal service mail carriers" if SOCCode=="43-5052"


twoway (scatter teamwork_index can_wh if teamwork_index>0, mlabel(label_teamwork) )|| ///
	(scatter teamwork_interact_index can_wh if teamwork_interact_index>0, mlabel( label_teamwork_interact)), graphregion(color(white))  ///
	legend(order(1 "teamwork" 2 "teamwork * face-to-face"))  graphregion(margin(3 15 1 3)) ytitle("Teamwork") xtitle("Share of workers who are able to work from home")


graph export "../text/teamwork_atus_validation.eps", replace
graph export "../text/teamwork_atus_validation.pdf", replace
