clear all
import excel "../../raw/bls/employment-matrix/matrix.xlsx", cellrange(A1:G65535) sheet("Matrix") firstrow

* drop all summaries
keep if Occupationtype=="Line item" & Industrytype=="Line item"
rename Occupationcode SOCCode
rename Industrycode naics

keep SOCCode naics Employment
save "matrix.dta", replace
