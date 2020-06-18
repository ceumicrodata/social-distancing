cd "C:\Users\Dell\Dropbox\social_distance\social-distancing-master\data\raw\bls\atus\"
clear all


import delimited atuswgts_2018.dat.dat, clear 
tempfile weights2018
save `weights2018'

import delimited atuswgts_2017.dat.dat, clear
foreach i of varlist finlwg* {
rename `i'  x`i'
}
tempfile weights2017
save `weights2017'

import delimited lvwgts_1718.dat, clear 
tempfile weightslv
save `weightslv'


import delimited lvresp_1718.dat.dat, clear
keep tucaseid tulineno lejf_1 lejf_11 lejf_12 lejf_13 lejf_14  lejf_15 lejf_1a lejf_2 lejf_3 lujf_10 ///
lxjf_1 lxjf_11 lxjf_12 lxjf_13 lxjf_14 lxjf_15 lxjf_1a lxjf_2 lxjf_3

label variable tucaseid "ATUS Case ID (14-digit identifier)"
label variable tulineno "ATUS person line number"
label variable lejf_1 "Edited: Do you have flexible work hours that allow you to vary or make changes in the times you begin and end work?"
label variable lejf_11 "Edited: Do you ever work at home?"
label variable lejf_12 "Edited: Are you paid for the hours that you work at home, or do you just take work home from the job?"
label variable lejf_13 "Edited: What is the main reason why you work at home?"
label variable lejf_14 "Edited: Are there days when you work only at home?"
label variable lejf_15 "Edited: How often do you work only at home?"
label variable lejf_1a "Edited: Can you change the time you begin and end work on a frequent basis, occasionally, or only rarely?"
label variable lejf_2 "Edited: Is your flexible work schedule part of a formal, written program or policy offered by your employer, or is it just an informal arrangement?"
label variable lejf_3 "Edited: Do you have any input into the hours you begin and end work or does your employer decide?"
label variable lujf_10 "As part of your (main) job, can you work at home?"



label variable lxjf_1 "LEJF_1: allocation flag"
label variable lxjf_11 "LEJF_11: allocation flag"
label variable lxjf_12 "LEJF_12: allocation flag"
label variable lxjf_13 "LEJF_13: allocation flag"
label variable lxjf_14 "LEJF_14: allocation flag"
label variable lxjf_15 "LEJF_15: allocation flag"
label variable lxjf_1a "LEJF_1A: allocation flag"
label variable lxjf_2 "LEJF_2: allocation flag"
label variable lxjf_3 "LEJF_3: allocation flag"



label define labellejf_1 ///
1 "Yes" ///
2 "No"

label define labellejf_11 ///
1 "Yes" ///
2 "No"

label define labellejf_12 ///
1 "Paid" ///
2 "Take work home" ///
3 "Both"

label define labellejf_13 ///
1 "Finish or catch up on work" ///
2 "Job requires working at home" ///
3 "Coordinate work schedule with personal or family needs" ///
4 "Reduce commuting time or expense" ///
5 "Personal preference" ///
6 "Weather" ///
7 "Other" ///

label define labellejf_14 ///
1 "Yes" ///
2 "No" ///


label define labellejf_15 ///
1 "5 or more days a week" ///
2 "3 to 4 days a week" /// 
3 "1 to 2 days a week" ///
4 "At least once a week" ///
5 "Once every 2 weeks" ///
6 "Once a month" ///
7 "Less than once a month"

label define labellejf_1a ///
1 "Frequent basis" ///
2 "Occasionally" ///
3 "Rarely"

label define labellejf_2 ///
1 "Formal program or policy" ///
2 "Informal arrangement"

label define labellejf_3 ///
1 "Worker has some input" ///
2 "Employer decides" ///
3 "Other"

label define labellujf_10 ///
1 "Yes" ///
2 "No"

label values lejf_1 labellejf_1
label values lejf_11 labellejf_11
label values lejf_12 labellejf_12
label values lejf_13 labellejf_13
label values lejf_14 labellejf_14
label values lejf_15 labellejf_15
label values lejf_1a labellejf_1a
label values lejf_2 labellejf_2
label values lejf_3 labellejf_3
label values lujf_10 labellujf_10

tempfile flexible
save `flexible'

import delimited atusresp_2017.dat, clear
gen year=2017

keep tucaseid tulineno teio1cow teio1icd teio1ocd trdtind1 trdtocc1 trmjind1 trmjocc1 trmjocgr txio1cow txio1icd txio1ocd trlvmodr

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



tempfile 2017
save `2017'

import delimited atusresp_2018.dat.txt, clear 
keep tucaseid tulineno teio1cow teio1icd teio1ocd trdtind1 trdtocc1 trmjind1 trmjocc1 trmjocgr txio1cow txio1icd txio1ocd trlvmodr

gen year=2018

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
-2 "Don't Know"  ///
-3 "Refused"  ///
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
 
label define labeltxio1ocd  ///
-1 "Blank" ///
-2 "Don't Know"  ///
-3 "Refused" ///
0 "Value - No Change" ///
1 "Blank - No Change" ///
2 "Don`t Know - No Change" ///
3 "Refused - No Change"  ///
10 "Value To Value"  ///
11 "Blank To Value"  ///
12 "Don`t Know To Value"  ///
13 "Refused To Value"  ///
20 "Value To Longitudinal Value"  ///
21 "Blank To Longitudinal Value"  ///
22 "Don`t Know To Longitudinal Value"  ///
23 "Refused To Longitudinal Value"  ///
30 "Value To Allocated Value Long."  ///
31 "Blank To Allocated Value Long."  ///
32 "Don`t Know To Allocated Value Long."  ///
33 "Refused To Allocated Value Long."  ///
40 "Value To Allocated Value"  ///
41 "Blank To Allocated Value"  ///
42 "Don`t Know To Allocated Value"  ///
43 "Refused To Allocated Value"  ///
50 "Value To Blank"  ///
52 "Don`t Know To Blank"  ///
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


append using `2017'

merge 1:1 tucaseid tulineno using `flexible', keep(3) nogenerate 
*rename _merge merge_flexible


*2018as ATUS weights
merge 1:1 tucaseid using `weights2018', keep(1 3) nogenerate

merge 1:1 tucaseid using `weights2017', keep(1 3) nogenerate

foreach i of varlist finlwg* {
replace `i' = x`i' if `i'==.
cap drop x`i'
}


merge 1:1 tucaseid using `weightslv', keep(3) nogenerate


save "C:\Users\Dell\Dropbox\social_distance\social-distancing-master\data\raw\bls\atus\atus.dta", replace 
