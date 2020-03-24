generate teamwork_exposure = teamwork_share/100 * ln(employment_density)
generate customer_exposure = customer_share/100 * ln(population_density)
generate presence_exposure = presence_share/100 * ln(plant_size)

foreach X of var *_exposure {
	summarize `X'
	replace `X' = round(`X'/r(max)*100)
}

label variable teamwork_exposure "Social distancing effect on teamwork [0,100]"
label variable customer_exposure "Social distancing effect on customer contact [0,100]"
label variable presence_exposure "Social distancing effect on physical presence [0,100]"

