.PHONY: all data
all: ../data/derived/industry-index.dta ../text/overleaf/fig3.eps ../text/overleaf/fig4.eps headcount.log
../text/overleaf/fig3.eps: scatter-communication-infection.do ../data/derived/occupation/risks.dta
	stata -b do $<
../text/overleaf/fig4.eps: risk-by-density.do ../data/derived/industry-index.dta ../data/clean/cbp/zip_code_business_patterns.dta
	stata -b do $<
../data/derived/industry-index.dta: create-index.do calculate-exposure.do industry_location_panel.do ../data/derived/crosswalk/industry.csv ../data/derived/occupation/naics_risk.csv ../data/derived/agglomeration/high_density_employment.csv ../data/clean/industry-employment/industry-employment.dta
	stata -b do $<
headcount.log: headcount.do ../data/derived/industry-index.dta
	stata -b do $<

# Derived data
data: ../data/derived/occupation/naics_risk.csv ../data/derived/agglomeration/high_density_employment.csv
../data/derived/occupation/naics_risk.csv:
	cd $(dir $@) && make
../data/derived/agglomeration/high_density_employment.csv:
	cd $(dir $@) && make
