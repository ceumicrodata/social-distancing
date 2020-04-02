import delimited "../../clean/dingel-neiman/teleworkable.csv", clear
rename soccode SOCCode
merge 1:1 SOCCode using "risks.dta", nogen

foreach X of var teamwork customer presence {
	tabulate `X' telework
	count if `X'==1 & telework==1
}
