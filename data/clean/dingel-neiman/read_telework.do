clear
import delimited "../../raw/dingel-neiman/occupations_workathome.csv"

rename onetsoccode Code

merge 1:1 Code using "../onet/crosswalk.dta", nogen keep(master match)
* official crosswalk missing for 1 occuopation
replace SOCCode = substr(Code, 1, 7) if missing(SOCCode)


* average with SOC occupation
collapse (mean) teleworkable, by(SOCCode Description)

*note: teleworkable was a 0 or 1, but due to the collapse now it can be other values as well. 

replace teleworkable=round(teleworkable)

order SOCCode Description

export delimited "teleworkable.csv", replace
