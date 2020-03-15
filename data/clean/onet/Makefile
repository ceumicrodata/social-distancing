RISKS = Physical_Proximity Exposed_to_Disease_or_Infections Exposed_to_Disease_or_Infections Face-to-Face_Discussions Deal_With_External_Customers Contact_With_Others

risks.csv: read_risks.do crosswalk.dta $(foreach risk,$(RISKS),../../raw/onet/$(risk).csv)
	stata -b do $<
crosswalk.dta: crosswalk.do ../../raw/bls/crosswalk/crosswalk.xlsx
	stata -b do $<
