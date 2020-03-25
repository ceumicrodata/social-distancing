clear all
local indexes teamwork_share customer_share presence_share teamwork_exposure customer_exposure presence_exposure

do "industry_location_panel.do"
do "calculate-exposure.do"

generate egy = 1
collapse (first) population_density employment_density (mean) `indexes' plant_size (sum) employment=egy [aw=employment], by(zip)
* merge coordinates
merge 1:1 zip using "../data/clean/geonames/us-zip-codes.dta", nogen keep(master match)

local vars zip latitude longitude population_density employment_density plant_size  `indexes' 
keep `vars'
order `vars'
* round values for presentation
replace plant_size = plant_size*10
foreach X of var population_density employment_density plant_size `indexes' {
	replace `X' = round(`X')
}
replace plant_size = plant_size/10
foreach X of var latitude longitude {
	replace `X' = round(`X'*10000)/10000
}

gsort -teamwork_exposure
list in 1/10
generate zip_code = string(zip,"%05.0f")
drop zip
order zip_code
export delimited "../data/derived/location-index.csv", replace

*drop rural areas, CBP is not representative for these
drop if population_density<10

generate ln_density = ln(population_density)
foreach X of var *_share *_exposure {
	lowess `X' ln_density, bw(0.5) generate(`X'_hat)
}

line teamwork_share_hat customer_share_hat presence_share_hat population_density, sort ///
b1title("(A)") ytitle("Share of workers (percent)") xtitle("Population density (person/km2, log scale)") ///
scheme(s2mono) graphregion(color(white)) xscale(log) xlabel(10 100 1000 10000 100000) ///
legend(order(1 "Teamwork" 2 "Customer contact" 3 "Physical presence")) ///
name(fig4a)

line teamwork_exposure_hat customer_exposure_hat presence_exposure_hat population_density, sort ///
b1title("(B)") ytitle("Social distancing exposure (max=100)") xtitle("Population density (person/km2, log scale)") ///
scheme(s2mono) graphregion(color(white)) xscale(log) xlabel(10 100 1000 10000 100000) ///
legend(order(1 "Teamwork" 2 "Customer contact" 3 "Physical presence")) ///
name(fig4b)

graph combine fig4a fig4b, scheme(s2mono) graphregion(color(white)) xsize(9)

graph export "../text/overleaf/fig4.eps", replace
graph export "../text/overleaf/fig4.pdf", replace
