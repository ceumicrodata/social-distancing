clear
import delimited "../../clean/onet/risks.csv", case(preserve) varnames(1)

**************
*generating summery indexes: communication and infection measures
*************

*communication 
*simple average
egen communication = rowmean(contact customers face2face group)
label variable communication "Communication index [0,100]"


*infection
egen infection = rowmean(infections proximity)
label variable infection "Infection risk index [0,100]"

foreach X of var communication infection {
	replace `X' = round(`X')
}

keep SOCCode Description communication infection
compress

save "risks.dta", replace
