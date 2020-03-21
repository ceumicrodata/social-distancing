generate social_distancing_exposure = (average_population_density / median_density) ^ (communication_share/100)
replace social_distancing_exposure = round(social_distancing_exposure*100)
label variable social_distancing_exposure "Combined index of social distancing exposure (manufacturing=100)"
