graph drop _all

line teamwork_share_hat customer_share_hat presence_share_hat population_density, sort ///
ytitle("Share of workers (percent)") xtitle("Population density (person/km2, log scale)") ///
scheme(s2mono) graphregion(color(white)) xscale(log) xlabel(10 100 1000 10000 100000) ///
legend(region(lstyle(none)) bplacement(5) order(1 "Teamwork" 2 "Customer contact" 3 "Physical presence")) 

graph export "../text/fig4.eps", replace
graph export "../text/fig4.pdf", replace
