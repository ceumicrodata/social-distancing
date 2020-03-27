clear all

do "industry_location_panel.do"
do "calculate-exposure.do"

/* 
Calibrate epsilon.

Ciccone, Antonio, and Robert Hall. 1996. “Productivity and the Density of Economic Activity.” 
The American Economic Review 86 (1): 54–70.

density^agglomeration = density^(epsilon * chi)
*/
scalar agglomeration = 0.06
generate LHS = agglomeration * ln(population_density)
generate RHS = (communication_share/100) * ln(population_density)

regress LHS RHS [aw=employment]
scalar epsilon = _b[RHS]

* Eq 5
generate cost_ratio = population_density^(epsilon*communication_share/100)
* Eq 4
generate contact_ratio = population_density^(epsilon*(1-communication_share/100))
* current number of contacts
summarize contact_ratio [aw=employment]
scalar current_contact = r(mean)

* target contact is ten percent lower
scalar target_contact = current_contact * 0.9

* loop to find the cap
scalar cap = 10000
scalar average = current_contact 
generate counterfactual = .
while average > target_contact {
	quietly replace counterfactual = min(population_density, cap)^(epsilon*(1-communication_share/100))
	quietly summarize counterfactual [aw=employment]
	scalar average = r(mean)
	scalar cap = 0.9*cap
}

generate cost_increase = (contact_ratio/counterfactual)^(communication_share/(100-communication_share))
summarize cost_increase [aw=employment]
