.PHONY: data all
all: risks_2digit_occupation.csv naics_risk.csv compare_risk_telework.log
compare_risk_telework.log: compare_risk_telework.do ../../clean/dingel-neiman/teleworkable.csv risks.dta
	stata -b do $<
risks_2digit_occupation.csv: risks_2digit_occupation.do risks.dta
	stata -b do $<
naics_risk.csv: aggregate_risk_by_naics.do risks.dta ../../clean/employment-matrix/matrix.dta
	stata -b do $<
risks.dta: compute_risk_index.do ../../clean/onet/risks.csv
	stata -b do $<

# Data cleaning
data: ../../clean/onet/risks.csv ../../clean/employment-matrix/matrix.dta
../../clean/onet/risks.csv:
	cd $(dir $@) && make
../../clean/employment-matrix/matrix.dta:
	cd $(dir $@) && make
