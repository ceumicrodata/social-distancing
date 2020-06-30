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

* transformations for regressions
foreach X of var growth visit_change {
	generate ln_`X' = ln(1 + `X' / 100)
}

foreach X of var *share {
	replace `X' = `X' / 100
}

foreach X in customer teamwork {
	generate `X'_wfh_share = (`X'_share - `X'_interact_share) / `X'_share
	generate visit_X_`X' = ln_visit_change * `X'_interact_share
}

label variable ln_growth "Employment change (log)"

label variable customer_share "Customer-facing workers (share, [0,1])"
label variable teamwork_share "Teamwork-intensive workers (share, [0,1])"
label variable presence_interact_share "Presence-intensive workers (share, [0,1])"

label variable customer_interact_share "--of which face-to-face intensive"
label variable teamwork_interact_share "--of which face-to-face intensive"

label variable ln_visit_change "Change in number of monthly visits (log)"
label variable visit_X_customer "--times customer-facing share"
label variable visit_X_teamwork "--times teamwork-intensive share"

eststo: regress ln_growth customer_share teamwork_share presence_interact_share, robust
eststo: regress ln_growth customer_interact_share teamwork_interact_share presence_interact_share, robust
eststo: regress ln_growth customer_interact_share teamwork_interact_share presence_interact_share ln_visit_change, robust
eststo: regress ln_growth customer_interact_share teamwork_interact_share presence_interact_share ln_visit_change visit_X_*, robust

esttab using "../text/regression.tex", r2 star(* .1 ** .05 *** .01) se b(3) order(customer_share customer_interact_share teamwork_share teamwork_interact_share presence_interact_share ln_visit_change visit_X_customer visit_X_customer) noconstant nonote alignment(D{.}{.}{-1}) mtitles("" "" "" "") replace label
