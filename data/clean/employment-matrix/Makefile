matrix.dta: employment-matrix.do naics_aggregation.dta ../../raw/bls/employment-matrix/matrix.xlsx
	stata -b do $<
naics_aggregation.dta: split_by_naics.do ../../raw/bls/crosswalk/occupation.xlsx
	stata -b do $<
