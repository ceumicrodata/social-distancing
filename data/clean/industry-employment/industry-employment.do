clear all
import delimited "../../derived/crosswalk/ces2industry.csv", varnames(1) clear case(preserve)
tempfile ces
save `ces', replace

import excel "../../raw/bls/industry-employment/industry.xlsx", cellrange(A7:D258) sheet("Table 2.7") firstrow clear

rename Nonagriculturewageandsalary CES_label
rename NA CES_industry
drop C
rename D employment

foreach X of var CES* {
	replace `X' = strtrim(`X')
	drop if missing(`X')
}
* Postal Service appears twice
duplicates drop CES_label CES_industry, force

destring employment, force replace
merge 1:1 CES_label CES_industry using `ces', nogen keep(match)


collapse (sum) employment, by(industry_code)
summarize employment, detail
display r(sum)

save "industry-employment.dta", replace
