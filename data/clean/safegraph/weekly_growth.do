clear all

local weeks 08 15
local variables raw_visitor_counts raw_visit_counts

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
generate naics = int(naics_code/1000)
keep if iso_country_code == "US"
drop iso_country_code
rename postal_code zip

* missing values
inspect naics zip
drop if missing(naics, zip)

collapse (sum) `variables', by(naics zip day)

* balance panel
reshape wide `variables', i(naics zip) j(day)
reshape long
* assume missing data means no visitors
mvencode `variables', mv(0) override

rename raw_visitor_counts visitors
rename raw_visit_counts visits

* there are many zeros, compute Davis-Haltiwanger growth rates
egen i = group(naics zip)
tsset i day
foreach X of var visitors visits {
	generate gr_`X' = (`X'-L7.`X')/(`X'+L7.`X')
	generate lagged_`X' = L7.`X'
}

* keep week of March 15
keep if day==15
keep naics zip gr_* lagged_*

save "visit-naics-zip.dta", replace
