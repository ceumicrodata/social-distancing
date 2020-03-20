clear all
use "../data/derived/industry-index.dta", clear

tempfile sector_risk
save  `sector_risk'

use "../data/clean/cbp/zip_code_business_patterns.dta", clear
merge m:1 industry_code using  `sector_risk', keep(match) nogen

collapse (first) population_density employment_density (mean) communication_share infection_share [fw=employment], by(zip)
*drop rural areas, CBP is not representative for these
drop if population_density<5

generate ln_density = ln(population_density)
foreach X of var *_share {
	lowess `X' ln_density, bw(0.5) generate(`X'_hat)
}

line communication_share_hat infection_share_hat population_density, sort ///
ytitle("Average occupation index of industries") xtitle("Population density (person/km2, log scale)") ///
scheme(s2mono) graphregion(color(white)) xscale(log) xlabel(10 100 1000 10000 100000) ///
legend(order(1 "Communication" 2 "Infection"))

graph export "../text/overleaf/fig4.eps", replace
graph export "../text/overleaf/fig4.pdf", replace
