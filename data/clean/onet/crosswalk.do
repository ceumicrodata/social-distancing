clear all
import excel "../../raw/bls/crosswalk/crosswalk.xlsx", cellrange(A5:E1096) sheet("ONET to SOC crosswalk") firstrow

drop ONETSOC2010Title
rename ONETSOC2010Code Code
rename NationalEmploymentMatrixSOCO Description
* drop duplicates
egen _i = seq(), by(Code)
drop if _i==2

keep Code SOCCode Description
save "crosswalk.dta", replace
