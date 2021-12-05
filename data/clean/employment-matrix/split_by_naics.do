clear all
import excel "../../raw/bls/crosswalk/occupation.xlsx", cellrange(B2:D436) sheet("Table 1.9") firstrow

keep if Industrytype=="Line item"
rename NationalEmploymentMatrix Industrycode
* deal with ranges
split NAICSCode, parse("-")
* second part is only the rightmost digits that are different
generate NAICS_end = substr(NAICSCode1, 1, strlen(NAICSCode1)-strlen(NAICSCode2)) + NAICSCode2
* roundabout way of calculating number of commas
generate number_comma = strlen(NAICSCode) - strlen(subinstr(NAICSCode, ",", "", .))
summarize number_comma
local I = r(max)
expand number_comma+1
egen i = seq(), by(Industrycode)

generate str stem = regexs(1) if regexm(NAICSCode,"([0-9]+)")
generate str code = ""
generate c = 2
forval i = 1/9 {
	replace code = substr(stem, 1, 3) + "`i'" if i==c & strpos(NAICSCode, ",`i'")
	replace c = c+1 if strpos(NAICSCode, ",`i'")
}
replace code = stem if i==1 & missing(code) & number_comma

* pad with zero
replace code = strofreal(real(code)*10^(6-strlen(code)))
sort NAICSCode i

rename NAICSCode1 NAICS_begin
replace NAICS_begin = code if !(code==".")
replace NAICS_end = NAICS_begin if number_comma

destring NAICS_begin NAICS_end, force replace
keep Industrycode NAICS_*

save "naics_aggregation.dta", replace
