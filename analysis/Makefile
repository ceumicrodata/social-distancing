all: ../data/derived/industry-index.dta fig3.eps fig4.eps
fig3.eps: scatter-communication-infection.do ../data/derived/occupation/risks.dta
	stata -b do $<
fig4.eps: risk-by-density.do ../data/derived/industry-index.dta ../data/clean/cbp/zip_code_business_patterns.dta
	stata -b do $<
../data/derived/industry-index.dta: create-index.do ../data/derived/crosswalk/industry.csv ../data/derived/occupation/naics_risk.csv ../data/derived/agglomeration/high_density_employment.csv ../data/clean/industry-employment/industry-employment.dta
	stata -b do $<
