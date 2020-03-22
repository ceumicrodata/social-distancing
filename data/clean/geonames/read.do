clear all
import delimited "../../raw/geonames/US.txt", varnames(nonames) delimiters(tab)

rename v2 zip
rename v10 latitude
rename v11 longitude

duplicates drop zip, force
/* drop coordinates outside continental USA bounding box
drop if latitude<24.9493
drop if latitude>49.5904
drop if longitude<-125.0011
drop if longitude>-66.9326
*/

keep zip lat lon
save "us-zip-codes.dta", replace
