clear all
* calculate urban density cutoff

* https://www.census.gov/library/publications/2012/dec/cph-2.html, Table 8
* For Metropolitan Areas only
scalar urban_population = 228004779
scalar urban_area = 91697.21 * (1.61)^2
scalar urban_density = urban_population / urban_area

scalar list

use "../data/derived/industry-index.dta", clear

* drop hospitals and clinics
drop if inlist(industry_code, 621, 622)

* cumulate employment
gsort -social_distancing_exposure
generate sum_employment = sum(employment)
* the 10 most exposed sectors employ
list sum_employment in 10

* most dense
gsort -average_population_density
list industry_label in 1/10

* urban and communicative
scalar cutoff = 1000
summarize communication_share if (average_population_density>=cutoff)

generate exposed = (average_population_density>=cutoff) & (communication_share>=25)
summarize employment if exposed==1, detail
display r(sum)

generate naics_2d = industry_code if industry_code<100
replace naics_2d = int(industry_code/10) if industry_code>=100

* employment-weighted average
foreach X of var *_share social {
	replace `X' = `X' * employment
	replace employment = . if missing(`X')
}
collapse (sum) employment (sum) communication_share infection_share social_distancing (firstnm) industry_label, by(naics_2d)
foreach X of var *_share social {
	replace `X' = `X' / employment
}
gsort -social_distancing_exposure
generate sum_employment = sum(employment)
list industry_label sum_employment in 1/5
