naics_risk.csv: aggregate_risk_by_naics.do risks.dta
	stata -b do $<
risks.dta: compute_risk_index.do ../../clean/onet/risks.csv
	stata -b do $<