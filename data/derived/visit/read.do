clear all

local months 02 05
local variables raw_visitor_counts raw_visit_counts

* read industry aggregator
import delimited "../../derived/crosswalk/naics2industry.csv", varnames(1) clear
tempfile naics2industry
save `naics2industry', replace

clear
tempfile patterns
save `patterns', replace emptyok
foreach m in `months' {
	import delimited "../../../input/safegraph-industry-location/naics-zip-`m'.csv", clear varnames(1)
	
	generate month = `m'
	
	append using `patterns'	
	save `patterns', replace
}

* aggregate to 3-digit naics
generate naics_3d = int(naics_code/1000)
keep if iso_country_code == "US"
drop iso_country_code
rename postal_code zip

* missing values
inspect naics_3d zip
drop if missing(naics_3d, zip)

* convert to our industries
merge m:1 naics_3d using `naics2industry', keep(match) nogen

collapse (sum) `variables', by(industry_code zip month)

* balance panel
reshape wide `variables', i(industry_code zip) j(month)
reshape long
* assume missing data means no visitors
mvencode `variables', mv(0) override

rename raw_visitor_counts visitors
rename raw_visit_counts visits

generate time = cond(month == 5, "_may", "_feb")
drop month
reshape wide visitors visits, i(industry_code zip) j(time) string

save "visit-naics-zip.dta", replace
