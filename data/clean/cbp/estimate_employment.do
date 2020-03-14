rename naics NAICS
reshape long n, i(NAICS zip) j(size) string
mvencode n, mv(0) override

* estimate number of plants that are left out for confidentiality reasons
tempvar missing total
egen `total' = sum(n), by(NAICS zip)
generate `missing' = est - `total'
assert `missing' >= 0

* typical plant size in larger ZIP code areas
tempvar share total_share
egen `share' = mean(cond(`missing'==0, n/`total', .)), by(NAICS size)
summarize `share', detail
egen `total_share' = sum(cond(`missing'>0 & (n==0), `share', .)), by(NAICS zip)
summarize `total_share', detail

generate n_ip = `missing' * `share' / `total_share' if (`missing' > 0)&(n==0)
summarize n_ip, detail
replace n = n_ip if (`missing' > 0)&(n==0)

* estimate employment as mid-point of bin
split size, parse("_")
destring size?, force replace
generate employment = 2.5 if size1==5 & missing(size2)
replace employment = 2000 if size1==1000 & missing(size2)
replace employment = (size1 + size2)/2 if missing(employment)

* number of people working at large plants
generate large_plant_employment = (size1>=100)*employment

* aggregate across bins
foreach X of var *employment {
	replace `X' = `X' * n
}
collapse (sum) n employment large_plant_employment, by(NAICS zip)
foreach X of var n employment large_plant_employment {
	replace `X' = round(`X')
}
rename n establishments
compress
rename NAICS naics
