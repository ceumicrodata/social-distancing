clear all
import excel "../../raw/bls/employment-matrix/matrix.xlsx", cellrange(A1:G65535) sheet("Matrix") firstrow

* drop all summaries
keep if Occupationtype=="Line item" & Industrytype=="Line item"
drop if Industrycode=="TE1100"

rename Occupationcode SOCCode

joinby Industrycode using "naics_aggregation.dta", 
BRK
rename Industrycode naics

keep SOCCode naics Employment
save "matrix.dta", replace
