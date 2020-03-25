clear all
use "../../clean/cbp/zip_code_business_patterns.dta"

collapse (firstnm) population population_density, by(zip)
sort population_density

generate CDF = sum(population)
summarize CDF
replace CDF = int(CDF / (1+r(max)) * 100)
 
collapse (min) population_density, by(CDF)
list
