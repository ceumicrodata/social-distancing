graph drop _all

line teamwork_share_hat customer_share_hat presence_share_hat population_density, sort ///
caption("(A)", position(6)) ytitle("Share of workers (percent)") xtitle("Population density (person/km2, log scale)") ///
scheme(s2mono) graphregion(color(white)) xscale(log) xlabel(10 100 1000 10000 100000) ///
legend(region(lstyle(none)) bplacement(5) order(1 "Teamwork" 2 "Customer contact")) ///
name(fig4a)

line teamwork_exposure_hat customer_exposure_hat presence_exposure_hat population_density, sort ///
caption("(B)", position(6)) ytitle("Social distancing exposure (max=100)") xtitle("Population density (person/km2, log scale)") ///
scheme(s2mono) graphregion(color(white)) xscale(log) xlabel(10 100 1000 10000 100000) ///
legend(region(lstyle(none)) bplacement(7) order(3 "Physical presence")) ///
name(fig4b)

graph combine fig4a fig4b, iscale(1.0) scheme(s2mono) graphregion(color(white)) xsize(9)

graph export "../text/overleaf/fig4.eps", replace
graph export "../text/overleaf/fig4.pdf", replace
