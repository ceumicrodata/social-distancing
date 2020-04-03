preserve
	generate wage_subsidy = employment_weight * labor_subsidy
	collapse (firstnm) ces_employment growth (sum) wage_subsidy employment_weight, by(industry_code industry_label)
	replace wage_subsidy =  wage_subsidy / employment_weight
	
	generate str label = ""
	replace label = industry_label if inlist(industry_code, 487, 722, 442, 448, 452, 519, 486, 113, 451, 721, 446)
	
	tw ///
	(lfitci growth wage_subsidy [aw=ces_employment]  ) ///
	(scatter growth wage_subsidy [aw=ces_employment],  msymbol(circle_hollow) mlabel(label)), ///
	scheme(s2mono) graphregion(color(white)) ///
	ytitle("Change in monthly employment (%)" ) ///
	xtitle("Wage subsidy to compensate drop in contacts (percent)") ///
	legend(region(lstyle(none)) order(2 "Regression line" 1 "Confidence interval")) ///
	graphregion(margin(1 40 1 1)) aspect(1)
	
	graph export "../text/fig5.eps", replace
	graph export "../text/fig5.pdf", replace
restore 
