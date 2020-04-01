clear all

local weeks 08 15
local variables raw_visitor_counts raw_visit_counts

* read industry aggregator
import delimited "../../derived/crosswalk/naics2industry.csv", varnames(1) clear
tempfile naics2industry
save `naics2industry', replace

clear
tempfile patterns
save `patterns', replace emptyok
foreach week in `weeks' {
	import delimited "naics-zip-2020-03-`week'.csv", clear varnames(1)
	
	* first day of the week
	generate day = `week'

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

collapse (sum) `variables', by(industry_code zip day)

* balance panel
reshape wide `variables', i(industry_code zip) j(day)
reshape long
* assume missing data means no visitors
mvencode `variables', mv(0) override

rename raw_visitor_counts visitors
rename raw_visit_counts visits

* there are many zeros, compute Davis-Haltiwanger growth rates
egen i = group(industry_code zip)
tsset i day
foreach X of var visitors visits {
	generate gr_`X' = (`X'-L7.`X')/(`X'+L7.`X')
	generate lagged_`X' = L7.`X'
}

* keep week of March 15
keep if day==15
keep industry_code zip gr_* lagged_*

save "visit-naics-zip.dta", replace
