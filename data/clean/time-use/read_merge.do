clear all

import delimited "../../raw/bls/atus/atuswgts_2018.dat", clear 
tempfile weights2018
save `weights2018'

import delimited "../../raw/bls/atus/atuswgts_2017.dat", clear
foreach i of varlist finlwg* {
rename `i'  x`i'
}
tempfile weights2017
save `weights2017'

import delimited "../../raw/bls/atus/lvwgts_1718.dat", clear 
tempfile weightslv
save `weightslv'

do "read_label_leave_module.do"
tempfile flexible
save `flexible'

do "read_label_atus_2017.do"
tempfile 2017
save `2017'

do "read_label_atus_2018.do"
append using `2017'

merge 1:1 tucaseid tulineno using `flexible', keep(3) nogenerate 
*rename _merge merge_flexible

*2018as ATUS weights
merge 1:1 tucaseid using `weights2018', keep(1 3) nogenerate

merge 1:1 tucaseid using `weights2017', keep(1 3) nogenerate

foreach i of varlist finlwg* {
	replace `i' = x`i' if missing(`i')
	capture drop x`i'
}

merge 1:1 tucaseid using `weightslv', keep(3) nogenerate

save "atus.dta", replace 
