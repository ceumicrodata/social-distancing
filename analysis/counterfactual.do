clear all

do "industry_location_panel.do"
do "calculate-exposure.do"

/* 
Calibrate epsilon to gamma=1.04 in

Ciccone, Antonio, and Robert Hall. 1996. “Productivity and the Density of Economic Activity.” 
The American Economic Review 86 (1): 54–70.

page 62.

density^agglomeration = density^(epsilon * chi)
*/
scalar agglomeration = 0.04
generate LHS = agglomeration * ln(population_density)
generate RHS = (communication_share/100) * ln(population_density)

regress LHS RHS [aw=employment]
scalar epsilon = _b[RHS]
generate chi = communication_share/100
generate gamma = chi/(1-chi)

* Eq 4
generate contact = population_density^(epsilon*(1-chi))
* current number of contacts
summarize contact [aw=employment]
scalar current_contact = r(mean)

* target contact is half
scalar target_contact = current_contact * 0.5

* loop to find the cap
scalar cap = 10000
scalar average = current_contact 
generate counterfactual = .
while average > target_contact {
	quietly replace counterfactual = min(population_density, cap)^(epsilon*(1-chi))
	quietly summarize counterfactual [aw=employment]
	scalar average = r(mean)
	scalar cap = 0.95*cap
}

generate contact_ratio = counterfactual / contact
* Eq 6 from the paper
generate cost_ratio = chi*contact_ratio + (1-chi)*(contact_ratio)^(-gamma)
summarize cost_ratio [aw=employment]
