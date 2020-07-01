clear all 
import delimited "ces.txt", delimiters(tab)

keep if year==2020 & inlist(period, "M02", "M03", "M04", "M05")
keep if regexm(series_id, "CES........01")
generate str ces_industry = substr(series_id, 4, 8)

rename value employment
drop footnote_codes
reshape wide employment, i(ces_industry) j(period) string

generate growth = employmentM04/employmentM02 * 100 - 100
rename employmentM02 employment
order ces_industry employment
keep ces_industry employment growth

export delimited "ces-2020-apr.csv", replace
