.PHONY: data
high_density_employment.csv: compute_urban_share.do ../../clean/cbp/zip_code_business_patterns.dta
	stata -b do $<

# Data cleaning
data: ../../clean/cbp/zip_code_business_patterns.dta
../../clean/cbp/zip_code_business_patterns.dta:	
	cd $(dir $@) && make
