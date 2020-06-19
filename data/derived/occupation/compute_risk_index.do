clear
import delimited "../../clean/onet/risks.csv", case(preserve) varnames(1)

**************
*generating summery indexes: communication and infection measures
*************
local teamwork group consult coordinate team guide
local customer customers public care interpersonal consult
local presence move operate repair_elect repair_mechanic inspect

* face2face daily
local teamwork_context (face2face > 75)
local customer_context (face2face > 75)
* share office or more dense
local presence_context (proximity > 25)
* email and memos daily on average
local remote_context (email+memo > 2 * 75)
* for tasks
local cutoff = 62.5

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
	gen `X'_index = round(``X'_context' * (`X'))
}
label variable teamwork_index "Teamwork communication index [0,100] with context cutoff"
label variable customer_index "Customer communication index [0,100] with context cutoff"
label variable presence_index "Physical presence index [0,100] with context cutoff"

foreach X of var teamwork customer presence {
	replace `X' = ``X'_context' * (`X' >= `cutoff')
}
generate remote = `remote_context'
label variable teamwork "Teamwork communication (dummy)"
label variable customer "Customer communication (dummy)"
label variable presence "Physical presence (dummy)"
label variable remote "Remote work (dummy)"

keep SOCCode Description teamwork customer presence remote teamwork_index* customer_index* presence_index*
compress

save "risks.dta", replace
