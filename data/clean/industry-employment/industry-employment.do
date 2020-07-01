clear all
import delimited "../../derived/crosswalk/ces2industry.csv", varnames(1) clear case(preserve)
tempfile ces
save `ces', replace

import delimited "../../raw/bls/industry-employment/ces-2020-may.csv", varnames(1) clear case(preserve)
merge 1:1 ces_industry using `ces', keep(match) nogen

replace growth = growth * employment
collapse (sum) employment growth, by(industry_code)
replace growth = growth / employment

summarize employment, detail
display r(sum)

save "industry-employment.dta", replace
