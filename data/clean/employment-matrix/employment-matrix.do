* crosswalk
clear all 
import delimited "../../derived/crosswalk/naics2industry.csv", varnames(1) clear
tempfile naics
save `naics', replace

clear all
import excel "../../raw/bls/employment-matrix/matrix.xlsx", cellrange(A1:G110576) sheet("Matrix") firstrow

* drop all summaries
keep if Occupationtype=="Line item" & Industrytype=="Line item"
drop if Industrycode=="TE1100"

clonevar naics_6d = Industrycode
replace naics_6d = subinstr(naics_6d, "A", "0",.)
replace naics_6d = subinstr(naics_6d, "A", "0",.)
replace  naics_6d = subinstr(naics_6d, "-", "0",.)
destring naics_6d, force replace

generate naics_3d = int(naics_6d/1000)
rename Occupationcode SOCCode

* aggregate by our sector definitions
merge m:1 naics_3d using `naics', keep(match) nogen
collapse (sum) Employment, by(industry_code SOCCode)

keep SOCCode industry_code Employment
save "matrix.dta", replace
