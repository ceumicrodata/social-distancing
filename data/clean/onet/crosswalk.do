clear all
import excel "../../raw/bls/crosswalk/crosswalk.xlsx", cellrange(A5:E1015) sheet("ONET to SOC crosswalk") firstrow

drop ONETSOC2019Title
rename ONETSOC2019Code Code
rename NationalEmploymentMatrixSOCO Description
rename SOCHybridCode SOCCode
* drop duplicates
egen _i = seq(), by(Code)
drop if _i==2
drop if Code=="13-1082.00" & SOCCode=="15-1299"

keep Code SOCCode Description
save "crosswalk.dta", replace
