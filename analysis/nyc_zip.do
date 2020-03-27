clear all
import delimited "../data/raw/census/cbp/zcta_county_rel_10.txt", case(preserve) varnames(1)

keep if (STATE==36) & inlist(COUNTY, 003, 047, 081, 061, 085)
rename ZCTA5 zip
keep zip

save "nyc_zip.dta", replace
