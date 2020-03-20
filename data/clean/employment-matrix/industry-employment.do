clear all
import excel "../../raw/bls/industry-employment/industry.xlsx", cellrange(A8:D258) sheet("Table 2.7") firstrow

rename B naics
drop C
rename D employment

replace naics = strtrim(naics)
destring employment, force replace

*drop if naics=="NA" | missing(naics)

* check which codes are aggregates
forval i = 2/3 {
	generate naics`i' = substr(naics, 1, `i')
	egen N`i' = sum(1), by(naics`i')
}
generate byte alone = cond(strlen(naics)==2, N2==1, N3==1)
generate byte duplicate = strlen(naics)<=3 & !alone

* drop transportation aggregate
drop if duplicate 
drop if inlist(naics, "31-33", "44, 45", "48, 492, 493", "532,533")
summarize employment, detail
di r(sum)
