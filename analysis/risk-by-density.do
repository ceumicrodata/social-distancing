clear all
use "../data/derived/industry-index.dta", clear

tempfile sector_risk
save  `sector_risk'

use "../data/clean/cbp/zip_code_business_patterns.dta", clear
merge m:1 industry_code using  `sector_risk', keep(match) nogen

collapse (first) population_density employment_density median_density (mean) communication_share infection_share [fw=employment], by(zip)

* merge coordinates
merge 1:1 zip using "../data/clean/geonames/us-zip-codes.dta", nogen keep(master match)

*drop rural areas, CBP is not representative for these
drop if population_density<5

* compute zip-level exposure index
clonevar average_population_density = population_density
do "calculate-exposure.do"

local vars zip latitude longitude population_density employment_density communication_share infection_share social_distancing_exposure
keep `vars'
order `vars'
* round values for presentation
foreach X of var population_density employment_density communication_share infection_share social_distancing {
	replace `X' = round(`X')
}
foreach X of var latitude longitude {
	replace `X' = round(`X'*10000)/10000
}

gsort -social_distancing_exposure
list in 1/10
export delimited "../data/derived/location-index.csv", replace

generate ln_density = ln(population_density)
foreach X of var *_share social_distancing_exposure {
	lowess `X' ln_density, bw(0.5) generate(`X'_hat)
}

line communication_share_hat infection_share_hat social_distancing_exposure_hat population_density, sort ///
ytitle("Average occupation index (log scale)") xtitle("Population density (person/km2, log scale)") ///
scheme(s2mono) graphregion(color(white)) xscale(log) xlabel(10 100 1000 10000 100000) ///
yscale(log) ylabel(10 20 40 80 160 320) ///
legend(order(1 "Communication" 2 "Infection" 3 "Social distancing"))

graph export "../text/overleaf/fig4.eps", replace
graph export "../text/overleaf/fig4.pdf", replace
