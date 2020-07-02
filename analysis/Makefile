.PHONY: all data
all: counterfactual.log employment-growth.log ../data/derived/top-industries.csv ../data/derived/industry-index.dta ../text/fig3.eps headcount.log ../text/customer_atus_validation.eps ../text/teamwork_atus_validation.eps
../data/derived/top-industries.csv: toplist.do ../data/derived/industry-index.dta
	stata -b do $<
../text/fig3.eps: scatter_customers_teamwork_byoccupation.do ../data/derived/occupation/risks.dta
	stata -b do $<
../data/derived/industry-index.dta: create-index.do ../data/derived/crosswalk/industry.csv ../data/derived/occupation/naics_risk.csv ../data/derived/agglomeration/high_density_employment.csv ../data/clean/industry-employment/industry-employment.dta
	stata -b do $<
headcount.log: headcount.do ../data/derived/industry-index.dta
	stata -b do $<
employment-growth.log: employment-growth.do ../data/derived/industry_location_panel.dta 
	stata -b do $<
counterfactual.log: counterfactual.do ../data/derived/industry_location_panel.dta nyc_zip.dta
	stata -b do $<
nyc_zip.dta: nyc_zip.do ../data/raw/census/cbp/zcta_county_rel_10.txt
	stata -b do $<

../text/customer_atus_validation.eps: scatterplot_validation_customer_atus.do ../data/derived/occupation/risks.dta 
	stata -b do $<
../text/teamwork_atus_validation.eps: scatterplot_validation_teamwork_atus.do ../data/derived/occupation/risks.dta 
	stata -b do $<

# Derived data
data: ../data/derived/industry_location_panel.dta ../data/derived/occupation/naics_risk.csv ../data/derived/agglomeration/high_density_employment.csv
../data/derived/industry_location_panel.dta:
	cd $(dir $@) && make
../data/derived/occupation/naics_risk.csv:
	cd $(dir $@) && make
../data/derived/agglomeration/high_density_employment.csv:
	cd $(dir $@) && make
