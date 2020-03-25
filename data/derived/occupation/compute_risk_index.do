clear
import delimited "../../clean/onet/risks.csv", case(preserve) varnames(1)

**************
*generating summery indexes: communication and infection measures
*************
local teamwork group consult coordinate team guide
local customer customers public care interpersonal consult
local presence move operate repair_elect repair_mechanic inspect

* explore correlations between components with a group
foreach G in teamwork customer presence {
	scalar corr_`G' = 0
	scalar N_`G' = 0
	local I: word count ``G''
	forval i = 2/`I' {
		local left: word `i' of ``G''
		local J = `i'-1
		forval j = 1/`J' {
			local right: word `j' of ``G''
			quietly correlate `left' `right'
			
			* cumulate average
			scalar N_`G' = N_`G' + 1
			scalar corr_`G' = ( (corr_`G' * (N_`G'-1)) + r(rho) ) / N_`G'
		}
	}
	display "Correlation within `G': " corr_`G'
}

* interaction for teamwork
egen teamwork = rowmean(`teamwork')
* customer communication
egen customer = rowmean(`customer')
* require physical presence in close proximity to others
egen presence = rowmean(`presence')

foreach X of var teamwork customer presence {
	replace `X' = round(`X')
}
label variable teamwork "Group communication index [0,100]"
label variable customer "Customer communication index [0,100]"
label variable presence "Physical presence index [0,100]"
* are these contacts face to face? This is a multiplier because if F2F=0, then none of the above is relevant
* Does this require proximity to others? Otherwise not subject to social distancing 
label variable face2face "Context: face-to-face [0,100]"
label variable proximity "Context: proximity to others [0,100]"

keep SOCCode Description teamwork customer presence face2face proximity
compress

save "risks.dta", replace
