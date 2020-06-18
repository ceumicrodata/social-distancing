import delimited "../../raw/bls/atus/atusresp_2017.dat", clear

keep tucaseid tulineno teio1cow teio1icd teio1ocd trdtind1 trdtocc1 trmjind1 trmjocc1 trmjocgr txio1cow txio1icd txio1ocd trlvmodr

generate year = 2017

label variable trlvmodr "Leave Module Respondent" 
label variable teio1cow "Edited: individual class of worker code (main job)" 
label variable teio1icd "Edited: industry code (main job)" 
label variable teio1ocd "Edited: occupation code (main job)" 
label variable trdtind1 "Detailed industry recode (main job)" 
label variable trdtocc1 "Detailed occupation recode (main job)" 
label variable trmjind1 "Major industry recode (main job)" 
label variable trmjocc1 "Major occupation recode (main job)" 
label variable trmjocgr "Major occupation category (main job)" 
label variable txio1cow "TEIO1COW: allocation flag" 
label variable txio1icd "TEIO1ICD: allocation flag" 
label variable txio1ocd "TEIO1OCD: allocation flag" 

label define labeltrlvmodr ///
	-1 "Blank" ///
	-2 "Don't Know" ///
	-3 "Refused" ///
	0 "Did not respond to Leave Module" ///
	1 "Responded to the Leave Module"

label define labeltrdtocc1 ///
	-1 "Blank" ///
	-2 "Don't Know" ///
	-3 "Refused" ///
	1 "Management occupations" ///
	2 "Business and financial operations occupations" ///
	3 "Computer and mathematical science occupations" ///
	4 "Architecture and engineering occupations" ///
	5 "Life, physical, and social science occupations" ///
	6 "Community and social service occupations" ///
	7 "Legal occupations" ///
	8 "Education, training, and library occupations" ///
	9 "Arts, design, entertainment, sports, and media occupations" ///
	10 "Healthcare practitioner and technical occupations" ///
	11 "Healthcare support occupations" ///
	12 "Protective service occupations" ///
	13 "Food preparation and serving related occupations" ///
	14 "Building and grounds cleaning and maintenance occupations" ///
	15 "Personal care and service occupations" ///
	16 "Sales and related occupations" ///
	17 "Office and administrative support occupations" ///
	18 "Farming, fishing, and forestry occupations" ///
	19 "Construction and extraction occupations" ///
	20 "Installation, maintenance, and repair occupations" ///
	21 "Production occupations" ///
	22 "Transportation and material moving occupations"
 
label define labelteio1cow ///
	-1 "Blank" ///
	-2 "Don't Know" ///
	-3 "Refused" ///
	1 "Government, federal" ///
	2 "Government, state" ///
	3 "Government, local" ///
	4 "Private, for profit" ///
	5 "Private, nonprofit" ///
	6 "Self-employed, incorporated" ///
	7 "Self-employed, unincorporated" ///
	8 "Without pay" 
 
label define labeltrmjind1 ///
	-1 "Blank" ///
	-2 "Don't Know" ///
	-3 "Refused" ///
	1 "Agriculture, forestry, fishing, and hunting" ///
	2 "Mining, quarrying, and oil and gas extraction" ///
	3 "Construction" ///
	4 "Manufacturing" ///
	5 "Wholesale and retail trade" ///
	6 "Transportation and utilities" ///
	7 "Information" ///
	8 "Financial activities" ///
	9 "Professional and business services" ///
	10 "Educational and health services" ///
	11 "Leisure and hospitality" ///
	12 "Other services" ///
	13 "Public administration"
 
label define labeltrmjocc1 ///
	-1 "Blank" ///
	-2 "Don't Know" ///
	-3 "Refused" ///
	1 "Management, business, and financial occupations" ///
	2 "Professional and related occupations" ///
	3 "Service occupations" ///
	4 "Sales and related occupations" ///
	5 "Office and administrative support occupations" ///
	6 "Farming, fishing, and forestry occupations" ///
	7 "Construction and extraction occupations" ///
	8 "Installation, maintenance, and repair occupations" ///
	9 "Production occupations" ///
	10 "Transportation and material moving occupations"
 
label define labeltrmjocgr ///
	-1 "Blank" ///
	-2 "Don't Know" ///
	-3 "Refused" ///
	1 "Management, professional, and related occupations" ///
	2 "Service occupations" ///
	3 "Sales and office occupations" ///
	4 "Farming, fishing, and forestry occupations" ///
	5 "Construction and maintenance occupations" ///
	6 "Production, transportation, and material moving occupations"

label define labeltxio1cow ///
	-1 "Blank" ///
	-2 "Don't Know" ///
	-3 "Refused" ///
	0 "Value - No Change" ///
	1 "Blank - No Change" ///
	2 "Don`t Know - No Change" ///
	3 "Refused - No Change" ///
	10 "Value To Value" ///
	11 "Blank To Value" ///
	12 "Don`t Know To Value" ///
	13 "Refused To Value" ///
	20 "Value To Longitudinal Value" ///
	21 "Blank To Longitudinal Value" ///
	22 "Don`t Know To Longitudinal Value" ///
	23 "Refused To Longitudinal Value" ///
	30 "Value To Allocated Value Long." ///
	31 "Blank To Allocated Value Long." ///
	32 "Don`t Know To Allocated Value Long." ///
	33 "Refused To Allocated Value Long." ///
	40 "Value To Allocated Value" ///
	41 "Blank To Allocated Value" ///
	42 "Don`t Know To Allocated Value" ///
	43 "Refused To Allocated Value" ///
	50 "Value To Blank" ///
	52 "Don`t Know To Blank" ///
	53 "Refused To Blank" 
 
label define labeltxio1icd ///
	-1 "Blank" ///
	-2 "Don't Know" ///
	-3 "Refused" ///
	0 "Value - No Change" ///
	1 "Blank - No Change" ///
	2 "Don`t Know - No Change" ///
	3 "Refused - No Change" ///
	10 "Value To Value" ///
	11 "Blank To Value" ///
	12 "Don`t Know To Value" ///
	13 "Refused To Value" ///
	20 "Value To Longitudinal Value" ///
	21 "Blank To Longitudinal Value" ///
	22 "Don`t Know To Longitudinal Value" ///
	23 "Refused To Longitudinal Value" ///
	30 "Value To Allocated Value Long." ///
	31 "Blank To Allocated Value Long." ///
	32 "Don`t Know To Allocated Value Long." ///
	33 "Refused To Allocated Value Long." ///
	40 "Value To Allocated Value" ///
	41 "Blank To Allocated Value" ///
	42 "Don`t Know To Allocated Value" ///
	43 "Refused To Allocated Value" ///
	50 "Value To Blank" ///
	52 "Don`t Know To Blank" ///
	53 "Refused To Blank"
 
label define labeltxio1ocd ///
	-1 "Blank" ///
	-2 "Don't Know" ///
	-3 "Refused" ///
	0 "Value - No Change" ///
	1 "Blank - No Change" ///
	2 "Don`t Know - No Change" ///
	3 "Refused - No Change" ///
	10 "Value To Value" ///
	11 "Blank To Value" ///
	12 "Don`t Know To Value" ///
	13 "Refused To Value" ///
	20 "Value To Longitudinal Value" ///
	21 "Blank To Longitudinal Value" ///
	22 "Don`t Know To Longitudinal Value" ///
	23 "Refused To Longitudinal Value" ///
	30 "Value To Allocated Value Long." ///
	31 "Blank To Allocated Value Long." ///
	32 "Don`t Know To Allocated Value Long." ///
	33 "Refused To Allocated Value Long." ///
	40 "Value To Allocated Value" ///
	41 "Blank To Allocated Value" ///
	42 "Don`t Know To Allocated Value" ///
	43 "Refused To Allocated Value" ///
	50 "Value To Blank" ///
	52 "Don`t Know To Blank" ///
	53 "Refused To Blank"
  
label values teio1cow   labelteio1cow 
label values trlvmodr   labeltrlvmodr 
label values trdtocc1   labeltrdtocc1 
label values trmjind1   labeltrmjind1 
label values trmjocc1   labeltrmjocc1 
label values trmjocgr   labeltrmjocgr
label values txio1cow   labeltxio1cow 
label values txio1icd   labeltxio1icd 
label values txio1ocd   labeltxio1ocd 
