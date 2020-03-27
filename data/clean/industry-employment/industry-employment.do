clear all
import delimited "../../derived/crosswalk/ces2industry.csv", varnames(1) clear case(preserve)
tempfile ces
save `ces', replace

import delimited "../../raw/bls/industry-employment/ces-2020-feb.csv", varnames(1) clear case(preserve)
merge 1:1 ces_industry using `ces', keep(match) nogen

collapse (sum) employment, by(industry_code)
summarize employment, detail
display r(sum)

save "industry-employment.dta", replace
