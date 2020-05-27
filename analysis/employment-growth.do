preserve
	generate wage_subsidy = employment_weight * labor_subsidy
	collapse (firstnm) ces_employment growth affected_share (sum) wage_subsidy employment_weight, by(industry_code industry_label)
	replace wage_subsidy =  wage_subsidy / employment_weight
	
	generate str label = ""
	replace label = industry_label if inlist(industry_code, 487, 722, 442, 448, 452, 519, 486, 113, 451, 721, 446)
	
	tw ///
	(lfitci growth wage_subsidy   ) ///
	(scatter growth wage_subsidy,  msymbol(circle_hollow) mlabel(label)), ///
	scheme(s2mono) graphregion(color(white)) ///
	ytitle("Change in employment between Feb and Apr (%)" ) ///
	xtitle("Wage subsidy to compensate drop in contacts (percent)") ///
	legend(region(lstyle(none)) order(2 "Regression line" 1 "Confidence interval")) ///
	graphregion(margin(1 40 1 1)) aspect(1)
	
	graph export "../text/fig5.eps", replace
	graph export "../text/fig5.pdf", replace

	tw ///
	(scatter growth affected_share,  msymbol(circle_hollow) mlabel(label)), ///
	scheme(s2mono) graphregion(color(white)) ///
	ytitle("Change in employment between Feb and Apr (%)" ) ///
	xtitle("Share of workers in affected occupations (%)") ///
	legend(off) ///
	graphregion(margin(1 40 1 1)) aspect(1)
	
	graph export "../text/fig5b.pdf", replace
	
restore 
