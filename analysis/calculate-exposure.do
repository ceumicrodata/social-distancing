generate teamwork_exposure = teamwork_share/100 * ln(employment_density)
generate customer_exposure = customer_share/100 * ln(population_density)
generate presence_exposure = presence_share/100 * ln(plant_size)
generate overall_exposure  = affected_share/100 * ln(population_density)

foreach X of var *_exposure {
	summarize `X'
	replace `X' = round(`X'/r(max)*100)
}

label variable teamwork_exposure "Social distancing effect on teamwork (max=100)"
label variable customer_exposure "Social distancing effect on customer contact (max=100)"
label variable presence_exposure "Social distancing effect on physical presence (max=100)"
label variable overall_exposure "Social distancing exposure (max=100)"

