clear all 
import delimited "ces.txt", delimiters(tab)

keep if year==2020 & period=="M02"
keep if regexm(series_id, "CES........01")
generate str ces_industry = substr(series_id, 4, 8)
keep ces_industry value
rename value employment
order ces_industry employment

export delimited "ces-2020-feb.csv", replace
