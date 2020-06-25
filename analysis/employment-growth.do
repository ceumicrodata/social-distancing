clear all

use "../data/derived/industry_location_panel.dta", clear

collapse (firstnm) ces_employment growth customer_* teamwork_* presence_*, by(industry_code industry_label)

merge 1:1 industry_code using "../data/derived/visit/visit-change.dta", nogen keep(master match)
* if industry is not in SafeGraph, replace with average visit change in ZIP code of industry establishments
replace visit_change = local_visit_change if missing(visit_change)

generate str label = ""
replace label = industry_label if inlist(industry_code, 487, 722, 442, 448, 452, 519, 486, 113, 451, 721, 446)

tw ///
(scatter growth customer_interact_share,  msymbol(circle_hollow) mlabel(label)), ///
scheme(s2mono) graphregion(color(white)) ///
ytitle("Change in employment between Feb and May (%)" ) ///
xtitle("Share of workers in customer facing occupations (%)") ///
legend(off) ///
graphregion(margin(1 40 1 1)) aspect(1)

graph export "../text/fig5b.eps", replace
graph export "../text/fig5b.pdf", replace

foreach X in customer teamwork presence {
	generate `X'_resilient_share = `X'_share - `X'_interact_share
	generate visit_X_`X'_res = visit_change * `X'_resilient_share / 100
	generate visit_X_`X'_aff = visit_change * `X'_interact_share / 100
}
	
regress growth customer_share teamwork_share presence_share, robust
regress growth customer_interact_share teamwork_interact_share presence_interact_share, robust

regress growth visit_change visit_X_*, robust
