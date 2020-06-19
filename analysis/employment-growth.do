clear all

use "../data/derived/industry_location_panel.dta", clear

collapse (firstnm) ces_employment growth customer_share teamwork_share presence_share communication_share face2face_share affected_share , by(industry_code industry_label)

merge 1:1 industry_code using "../data/derived/visit/visit-change.dta", nogen keep(master match)

generate str label = ""
replace label = industry_label if inlist(industry_code, 487, 722, 442, 448, 452, 519, 486, 113, 451, 721, 446)

tw ///
(scatter growth face2face_share,  msymbol(circle_hollow) mlabel(label)), ///
scheme(s2mono) graphregion(color(white)) ///
ytitle("Change in employment between Feb and May (%)" ) ///
xtitle("Share of workers in face-to-face occupations (%)") ///
legend(off) ///
graphregion(margin(1 40 1 1)) aspect(1)

graph export "../text/fig5b.eps", replace
graph export "../text/fig5b.pdf", replace
	
regress growth customer_share teamwork_share presence_share, robust
regress growth customer_share teamwork_share presence_share face2face_share, robust
regress growth customer_share teamwork_share presence_share face2face_share visit_change, robust
regress growth customer_share teamwork_share presence_share face2face_share visit_change local_visit_change, robust
