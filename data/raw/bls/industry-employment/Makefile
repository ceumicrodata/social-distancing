industry.xlsx:
	wget -O $@ https://www.bls.gov/emp/industry-employment/industry.xlsx
ces-2020-apr.csv: filter.do ces.txt
	stata -b do $<
ces.txt:
	wget -O $@ https://download.bls.gov/pub/time.series/ce/ce.data.0.AllCESSeries
industry.txt:
	wget -O $@ https://download.bls.gov/pub/time.series/ce/ce.industry