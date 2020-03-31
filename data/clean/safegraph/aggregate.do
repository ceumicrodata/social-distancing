clear all

confirm existence `1'
local week = substr("`1'", 1, 10)

import delimited "`1'", varnames(1) encoding("utf-8") case(preserve) clear

collapse (sum) raw_visit_counts raw_visitor_counts, by(postal_code naics_code iso_country_code)

export delimited "naics-zip-`week'.csv", replace
