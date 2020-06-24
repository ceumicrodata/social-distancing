cd "C:\Users\Dell\Desktop\social-distance\data\derived\occupation"

******
*crosswalk
use "..\crosswalk\census2010_soc2010.dta", clear
keep census2010 soccode2010
duplicates drop
drop if   census2010=="" | soccode2010==""
destring (census2010), replace

sort census2010
tempfile crosswalk
save `crosswalk'

*****
*atus data
use "..\time-use\atus_working_at_home_occupationlevel.dta", clear 

rename teio1ocd census2010
merge 1:m census2010 using `crosswalk', keep(1 3) nogenerate
drop census2010
rename soccode2010 SOCCode
tempfile atus
save `atus'




clear
import delimited "../../clean/onet/risks.csv", case(preserve) varnames(1)

**************
*generating summery indexes: communication and infection measures
*************
local teamwork group consult coordinate team guide
local customer customers public care interpersonal consult
local presence move operate repair_elect repair_mechanic inspect


* face2face daily, more frequently than either email or memos
local teamwork_context ((face2face > 75)&(face2face > email)&(face2face > memo))
local customer_context ((face2face > 75)&(face2face > email)&(face2face > memo))
* share office or more dense
local presence_context (proximity > 25)

gen f2f_email = ((face2face > 75)&(face2face > email)&(face2face > memo))
label var f2f_email "((face2face > 75)&(face2face > email)&(face2face > memo))"
gen f2f = (face2face > 75)
label var f2f "(face2face > 75)"
gen prox = (proximity > 25)
label var prox "(proximity > 25)"

/*
* face2face daily
local teamwork_context (face2face > 75)
local customer_context (face2face > 75)
* share office or more dense
local presence_context (proximity > 25)
* email and memos daily on average
local remote_context (email+memo > 2 * 75)
*/


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
	gen `X'_interact_index = round(``X'_context' * (`X'))
	gen `X'_index = round((`X'))
}
label variable teamwork_index "Teamwork communication index [0,100] with context cutoff"
label variable customer_index "Customer communication index [0,100] with context cutoff"
label variable presence_index "Physical presence index [0,100] with context cutoff"

label variable teamwork_interact_index "Teamwork communication index [0,100] with context cutoff - interaction"
label variable customer_interact_index "Customer communication index [0,100] with context cutoff - interaction"
label variable presence_interact_index "Physical presence index [0,100] with context cutoff - interaction"

foreach X of var teamwork customer  presence {
	gen  `X'_interact = ``X'_context' * (`X' >= `cutoff')
	
	replace `X' = 0 if  (`X' < `cutoff')
	replace  `X' = 1  if  (`X' >= `cutoff')
}


label variable teamwork_interact "Teamwork communication (dummy) with context cutoff - interaction"
label variable customer_interact "Customer communication (dummy) with context cutoff - interaction"
label variable presence_interact "Physical presence (dummy) with context cutoff - interaction"
label variable customer_interact "Customer communication (dummy) version 2 with context cutoff - interaction"

label variable teamwork "Teamwork communication (dummy)"
label variable customer "Customer communication (dummy)"
label variable presence "Physical presence (dummy)"
label variable customer "Customer communication (dummy)"

label variable teamwork_index "Teamwork communication"
label variable customer_index "Customer communication"
label variable presence_index "Physical presence"
label variable customer_index "Customer communication"



label var f2f_email "((face2face > 75)&(face2face > email)&(face2face > memo))"
label var f2f "(face2face > 75)"
label var prox "(proximity > 25)"

keep SOCCode Description f2f_email f2f prox teamwork* customer* presence* 
drop customers
compress

sort SOCCode
merge 1:1 SOCCode using `atus'

/*NOTE
there are occupations that are only in ONet
and there are occupations that are only in ATUS
*/

save "risks.dta", replace
