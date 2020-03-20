all: ../data/derived/industry-index.csv fig3.eps
fig3.eps: scatter-communication-infection.do ../data/derived/occupation/risks.dta
	stata -b do $<
../data/derived/industry-index.csv: create-index.do ../data/derived/crosswalk/industry.csv ../data/derived/occupation/naics_risk.csv ../data/derived/agglomeration/high_density_employment.csv ../data/clean/industry-employment/industry-employment.dta
	stata -b do $<
