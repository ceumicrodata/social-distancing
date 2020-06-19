clear all
use "risks.dta", clear
generate occ_2digit = substr(SOCCode, 1, 2)

collapse (mean) teamwork_index customer_index presence_index, by(occ_2digit )

foreach x of varlist teamwork_index customer_index presence_index {
	replace `x' = round(`x')
}
destring(occ), replace

label define occ 11 "Management Occupations" 13 "Business and Financial Occupations" ///
15 "Computer and Mathematical Occupations" 17 "Architecture and Engineering Occupations" ///	
19	"Life, Physical, and Social Science Occupations" ///
21	"Community and Social Services Occupations" ///
23	"Legal Occupations" ///
25	"Education, Training, and Library Occupations" ///
27	"Arts, Design, Entertainment, Sports, and Media Occupations" ///
29	"Healthcare Practitioners and Technical Occupations" ///
31	"Healthcare Support Occupations" ///
33	"Protective Service Occupations" ///
35	"Food Preparation and Serving Related Occupations" ///
37	"Building and Grounds Cleaning and Maintenance Occupations" ///
39	"Personal Care and Service Occupations" ///
41	"Sales and Related Occupations" ///
43	"Office and Administrative Support Occupations" ///
45	"Farming, Fishing, and Forestry Occupations" ///
47	"Construction and Extraction Occupations" ///
49	"Installation, Maintenance, and Repair Occupations" ///
51	"Production Occupations" ///
53	"Transportation and Material Moving Occupations" ///
55	"Military Specific Occupations" 


export delimited "risks_2digit_occupation.csv", replace
label value occ occ
