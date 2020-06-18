#delimit ;
 
* Edit the import statement to reference the data file on your computer.;
 
import delimited
tucaseid
tulineno
tuyear
tumonth
teabsrsn
teern
teernh1o
teernh2
teernhro
teernhry
teernper
teernrt
teernuot
teernwkp
tehrftpt
tehrusl1
tehrusl2
tehruslt
teio1cow
teio1icd
teio1ocd
telayavl
telaylk
telfs
telkavl
telkm1
temjot
teret1
teschenr
teschft
teschlvl
tespempnot
tespuhrs
trchildnum
trdpftpt
trdtind1
trdtocc1
trernhly
trernupd
trernwa
trhernal
trhhchild
trholiday
trimind1
trlvmodr
trmjind1
trmjocc1
trmjocgr
trnhhchild
trnumhou
trohhchild
trspftpt
trsppres
trtalone
trtalone_wk
trtcc
trtccc
trtccc_wk
trtcctot
trtchild
trtcoc
trtec
trtfamily
trtfriend
trthh
trthhfamily
trtnochild
trtnohh
trto
trtohh
trtohhchild
trtonhh
trtonhhchild
trtsponly
trtspouse
trtunmpart
trwernal
tryhhchild
tthr
ttot
ttwk
tuabsot
tubus
tubus1
tubus2ot
tubusl1
tubusl2
tubusl3
tubusl4
tucc2
tucc4
tucc5b_ck
tucc5_ck
tucc9
tudiarydate
tudiaryday
tudis
tudis1
tudis2
tuecytd
tuelder
tuelfreq
tuelnum
tuern2
tuernh1c
tufinlwgt
tufwk
tuio1mfg
tuiodp1
tuiodp2
tuiodp3
tulay
tulay6m
tulayavr
tulaydt
tulk
tulkavr
tulkdk1
tulkdk2
tulkdk3
tulkdk4
tulkdk5
tulkdk6
tulkm2
tulkm3
tulkm4
tulkm5
tulkm6
tulkps1
tulkps2
tulkps3
tulkps4
tulkps5
tulkps6
turetot
tuspabs
tuspusft
tuspwk
txabsrsn
txern
txernh1o
txernh2
txernhro
txernhry
txernper
txernrt
txernuot
txernwkp
txhrftpt
txhrusl1
txhrusl2
txhruslt
txio1cow
txio1icd
txio1ocd
txlayavl
txlaylk
txlfs
txlkavl
txlkm1
txmjot
txret1
txschenr
txschft
txschlvl
txspempnot
txspuhrs
txtcc
txtcctot
txtcoc
txthh
txtnohh
txto
txtohh
txtonhh
 using c:\atusresp_2017.dat, stringcols(1) ;
 
label variable teabsrsn "Edited: what was the main reason you were absent from your job last week?";
label variable teern "Edited: total weekly earnings from overtime pay, tips, and commissions (2 implied decimals)";
label variable teernh1o "Edited: excluding overtime pay, tips, and commissions, what is your hourly rate of pay on your main job? (2 implied decimals)";
label variable teernh2 "Edited: excluding overtime pay, tips, and commissions, what is your hourly rate of pay on your main job? (2 implied decimals)";
label variable teernhro "Edited: how many hours do you usually work per week at this rate?";
label variable teernhry "Edited: hourly/non-hourly status";
label variable teernper "Edited: for your main job, what is the easiest way for you to report your total earnings before taxes or other deductions: hourl";
label variable teernrt "Edited: even though you told me it is easier to report your earnings another way, are you paid at an hourly rate on this job?";
label variable teernuot "Edited: do you usually receive overtime pay, tips, or commissions at your main job?";
label variable teernwkp "Edited: how many weeks a year do you get paid?";
label variable tehrftpt "Edited: do you usually work more than 35 hours per week at your job(s)/family business?";
label variable tehrusl1 "Edited: how many hours per week do you usually work at your main job?";
label variable tehrusl2 "Edited: how many hours per week do you usually work at your other job(s)?";
label variable tehruslt "Edited: total hours usually worked per week (sum of TEHRUSL1 and TEHRUSL2)";
label variable teio1cow "Edited: individual class of worker code (main job)";
label variable teio1icd "Edited: industry code (main job)";
label variable teio1ocd "Edited: occupation code (main job)";
label variable telayavl "Edited: could you have returned to work in the last seven days if you had been recalled?";
label variable telaylk "Edited: even though you expect to be called back to work, have you been looking for work during the last four weeks?";
label variable telfs "Edited: labor force status";
label variable telkavl "Edited: could you have started a job in the last seven days if one had been offered?";
label variable telkm1 "Edited: what are all of the things you have done to find work during the last 4 weeks? (first method)";
label variable temjot "Edited: in the last seven days did you have more than one job?";
label variable teret1 "Edited: do you currently want a job, either full or part time?";
label variable teschenr "Edited: are you enrolled in high school, college, or university?";
label variable teschft "Edited: are you enrolled as a full-time or part-time student?";
label variable teschlvl "Edited: would that be high school, college, or university?";
label variable tespempnot "Edited: employment status of spouse or unmarried partner";
label variable tespuhrs "Edited: usual hours of work of spouse or unmarried partner";
label variable trchildnum "Number of household children < 18";
label variable trdpftpt "Full time or part time employment status of respondent";
label variable trdtind1 "Detailed industry recode (main job)";
label variable trdtocc1 "Detailed occupation recode (main job)";
label variable trernhly "Hourly earnings at main job (2 implied decimals)";
label variable trernupd "Earnings update flag";
label variable trernwa "Weekly earnings at main job (2 implied decimals)";
label variable trhernal "TRERNHLY: allocation flag";
label variable trhhchild "Presence of household children < 18";
label variable trholiday "Flag to indicate if diary day was a holiday";
label variable trimind1 "Intermediate industry recode (main job)";
label variable trlvmodr "Leave Module Respondent";
label variable trmjind1 "Major industry recode (main job)";
label variable trmjocc1 "Major occupation recode (main job)";
label variable trmjocgr "Major occupation category (main job)";
label variable trnhhchild "Presence of own non-household child < 18";
label variable trnumhou "Number of people living in respondent's household";
label variable trohhchild "Presence of own household children < 18";
label variable trspftpt "Full time or part time employment status of spouse or unmarried partner";
label variable trsppres "Presence of the respondent's spouse or unmarried partner in the household";
label variable trtalone "Total nonwork-related time respondent spent alone (in minutes)";
label variable trtalone_wk "Total work- and nonwork-related time respondent spent alone (in minutes)";
label variable trtcc "Total time spent during diary day providing secondary childcare for household and own non-household children < 13";
label variable trtccc "Total nonwork-related time respondent spent with customers, clients, and coworkers (in minutes)";
label variable trtccc_wk "Total work- and nonwork-related time respondent spent with customers, clients, and coworkers (in minutes)";
label variable trtcctot "Total time spent during diary day providing secondary childcare for all children < 13";
label variable trtchild "Total time respondent spent with household or non-household children < 18";
label variable trtcoc "Total time spent during diary day providing secondary childcare for non-own, non-household children < 13";
label variable trtec "Total time spent providing eldercare (in minutes)";
label variable trtfamily "Total time respondent spent with family members";
label variable trtfriend "Total time respondent spent with friends";
label variable trthh "Total time spent during diary day providing secondary childcare for household children < 13";
label variable trthhfamily "Total time respondent spent with household family members";
label variable trtnochild "Total time respondent spent with non-own children < 18";
label variable trtnohh "Total time spent during diary day providing secondary childcare for non-own household children < 13";
label variable trto "Total time spent during diary day providing secondary childcare for own children < 13";
label variable trtohh "Total time spent during diary day providing secondary childcare for own household children < 13";
label variable trtohhchild "Total time respondent spent with own household children < 18";
label variable trtonhh "Total time spent during diary day providing secondary childcare for own non-household children < 13";
label variable trtonhhchild "Total time respondent spent with own non-household children < 18";
label variable trtsponly "Total time respondent spent with spouse only";
label variable trtspouse "Total time respondent spent with spouse (others may be present)";
label variable trtunmpart "Total time respondent spent with unmarried partner (others may be present)";
label variable trwernal "TRERNWA: allocation flag";
label variable tryhhchild "Age of youngest household child < 18";
label variable tthr "Hourly pay topcode flag";
label variable ttot "Overtime amount topcode flag";
label variable ttwk "Weekly earnings topcode flag";
label variable tuabsot "In the last seven days, did you have a job either full or part time?";
label variable tubus "Does anyone in the household own a business or a farm?";
label variable tubus1 "In the last seven days, did you do any unpaid work in the family business or farm?";
label variable tubus2ot "Do you receive payments or profits from the business?";
label variable tubusl1 "TULINENO of farm or business owner (first owner)";
label variable tubusl2 "TULINENO of farm or business owner (second owner)";
label variable tubusl3 "TULINENO of farm or business owner (third owner)";
label variable tubusl4 "TULINENO of farm or business owner (fourth owner)";
label variable tucaseid "ATUS Case ID (14-digit identifier)";
label variable tucc2 "Time first household child < 13 woke up";
label variable tucc4 "Time last household child < 13 went to bed";
label variable tucc5b_ck "Reason respondent did not report secondary childcare activities for non-own household children";
label variable tucc5_ck "Reason respondent did not report secondary childcare activities for own household children";
label variable tucc9 "Are the non-own, non-household children you cared for in TUCC8 related to you?";
label variable tudiarydate "Date of diary day (date about which the respondent was interviewed)";
label variable tudiaryday "Day of the week of diary day (day of the week about which the respondent was interviewed)";
label variable tudis "Last time we spoke to someone in this household you were reported to have a disability. Does your disability prevent you from do";
label variable tudis1 "Does your disability prevent you from accepting any kind of work during the next six months?";
label variable tudis2 "Do you have a disability that prevents you from accepting any kind of work during the next six months?";
label variable tuecytd "Did you provide any eldercare or assistance yesterday?";
label variable tuelder "Not including financial assistance or help you provided as part of your paid job, since the first of [REF_MONTH], have you provided any care of assistance for an adult who needed help because of a condition related to aging?";
label variable tuelfreq "How often did you provide this care?";
label variable tuelnum "Since the first of [REF_MONTH], how many people have you provided this care to?";
label variable tuern2 "Weekly overtime earnings (2 implied decimals)";
label variable tuernh1c "What is your hourly rate of pay on this job, excluding overtime pay, tips, or commissions? (2 implied decimals)";
label variable tufinlwgt "ATUS final weight";
label variable tufwk "In the last seven days did you do any work for pay or profit?";
label variable tuio1mfg "Is this business or organization mainly manufacturing, retail trade, wholesale trade, or something else? (main job)";
label variable tuiodp1 "Last time we spoke to someone in this household, you were reported to work for (employer's name). Do you still work for (employe";
label variable tuiodp2 "Have the usual activities and duties of your job changed since (month of CPS interview)? (main job)";
label variable tuiodp3 "Last time we spoke to someone in this household, you were reported as (occupation) and your usual duties were (activities). Is t";
label variable tulay "During the last seven days were you on layoff from your job?";
label variable tulay6m "Have you been given any indication that you will be recalled to work within the next 6 months?";
label variable tulayavr "Why could you not have started a job in the last week?";
label variable tulaydt "Has your employer given you a date to return to work? (to layoff job)";
label variable tulineno "ATUS person line number";
label variable tulk "Have you been doing anything to find work during the last four weeks?";
label variable tulkavr "Why could you not have started a job last week?";
label variable tulkdk1 "You said you have been trying to find work. How did you go about looking? (first method)";
label variable tulkdk2 "TULKDK1 text: (second method)";
label variable tulkdk3 "TULKDK1 text: (third method)";
label variable tulkdk4 "TULKDK1 text: (fourth method)";
label variable tulkdk5 "TULKDK1 text: (fifth method)";
label variable tulkdk6 "TULKDK1 text: (sixth method)";
label variable tulkm2 "What are all of the things you have done to find work during the last 4 weeks? (second method)";
label variable tulkm3 "TULKM2 text: (third method)";
label variable tulkm4 "TULKM2 text: (fourth method)";
label variable tulkm5 "TULKM2 text: (fifth method)";
label variable tulkm6 "TULKM2 text: (sixth method)";
label variable tulkps1 "Can you tell me more about what you did to search for work? (first method)";
label variable tulkps2 "TULKPS1 text: (second method)";
label variable tulkps3 "TULKPS1 text: (third method)";
label variable tulkps4 "TULKPS1 text: (fourth method)";
label variable tulkps5 "TULKPS1 text: (fifth method)";
label variable tulkps6 "TULKPS1 text: (sixth method)";
label variable tumonth "Month of diary day (month of day about which ATUS respondent was interviewed)";
label variable turetot "The last time we spoke to someone in this household you were reported to be retired. Are you still retired?";
label variable tuspabs "In the last seven days, did your spouse or unmarried partner have a job either full or part time?";
label variable tuspusft "Does your spouse or unmarried partner usually work 35 hours or more per week?";
label variable tuspwk "In the last seven days, did your spouse or unmarried partner do any work for pay or profit?";
label variable tuyear "Year of diary day (year of day about which respondent was interviewed)";
label variable txabsrsn "TEABSRSN: allocation flag";
label variable txern "TEERN: allocation flag";
label variable txernh1o "TEERNH1O: allocation flag";
label variable txernh2 "TEERNH2: allocation flag";
label variable txernhro "TEERNHRO: allocation flag";
label variable txernhry "TEERNHRY: allocation flag";
label variable txernper "TEERNPER: allocation flag";
label variable txernrt "TEERNRT: allocation flag";
label variable txernuot "TEERNUOT: allocation flag";
label variable txernwkp "TEERNWKP: allocation flag";
label variable txhrftpt "TEHRFTPT: allocation flag";
label variable txhrusl1 "TEHRUSL1: allocation flag";
label variable txhrusl2 "TEHRUSL2: allocation flag";
label variable txhruslt "TEHRUSLT: allocation flag";
label variable txio1cow "TEIO1COW: allocation flag";
label variable txio1icd "TEIO1ICD: allocation flag";
label variable txio1ocd "TEIO1OCD: allocation flag";
label variable txlayavl "TELAYAVL: allocation flag";
label variable txlaylk "TELAYLK: allocation flag";
label variable txlfs "TELFS: allocation flag";
label variable txlkavl "TELKAVL: allocation flag";
label variable txlkm1 "TELKM1: allocation flag";
label variable txmjot "TEMJOT: allocation flag";
label variable txret1 "TERET1: allocation flag";
label variable txschenr "TESCHENR: allocation flag";
label variable txschft "TESCHFT: allocation flag";
label variable txschlvl "TESCHLVL: allocation flag";
label variable txspempnot "TESPEMPNOT: allocation flag";
label variable txspuhrs "TESPUHRS: allocation flag";
label variable txtcc "TRTCC_LN and TRTCC: allocation flag";
label variable txtcctot "TRTCCTOT_LN and TRTCCTOT: allocation flag";
label variable txtcoc "TRTCOC_LN and TRTCOC: allocation flag";
label variable txthh "TRTHH_LN and TRTHH: allocation flag";
label variable txtnohh "TRTNOHH_LN and TRTNOHH: allocation flag";
label variable txto "TRTO_LN and TRTO: allocation flag";
label variable txtohh "TRTOHH_LN and TRTOHH: allocation flag";
label variable txtonhh "TRTONHH_LN and TRTONHH: allocation flag";
 
label define labelteabsrsn
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "On layoff (temporary or indefinite)"
2 "Slack work/business conditions"
3 "Waiting for a new job to begin"
4 "Vacation/personal days"
5 "Own illness/injury/medical problems"
6 "Childcare problems"
7 "Other family/personal obligation"
8 "Maternity/paternity leave"
9 "Labor dispute"
10 "Weather affected job"
11 "School/training"
12 "Civic/military duty"
13 "Does not work in the business"
14 "Other"
;
label define labelteernhry
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Paid hourly"
2 "Not paid hourly"
;
label define labelteernper
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Hourly"
2 "Weekly"
3 "Bi-weekly"
4 "Twice monthly"
5 "Monthly"
6 "Annually"
7 "Other"
;
label define labelteernrt
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labelteernuot
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltehrftpt
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
3 "Hours vary"
;
label define labelteio1cow
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Government, federal"
2 "Government, state"
3 "Government, local"
4 "Private, for profit"
5 "Private, nonprofit"
6 "Self-employed, incorporated"
7 "Self-employed, unincorporated"
8 "Without pay"
;
label define labeltelayavl
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltelaylk
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltelfs
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Employed - at work"
2 "Employed - absent"
3 "Unemployed - on layoff"
4 "Unemployed - looking"
5 "Not in labor force"
;
label define labeltelkavl
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltelkm1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted employer directly/interview"
2 "Contacted public employment agency"
3 "Contacted private employment agency"
4 "Contacted friends or relatives"
5 "Contacted school/university employment center"
6 "Sent out resumes/filled out applications"
7 "Checked union/professional registers"
8 "Placed or answered ads"
9 "Other active"
10 "Looked at ads"
11 "Attended job training programs/courses"
12 "Nothing"
13 "Other passive"
;
label define labeltemjot
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labelteret1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes or maybe/it depends"
2 "No"
3 "Has a job"
;
label define labelteschenr
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labelteschft
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Full time"
2 "Part time"
;
label define labelteschlvl
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "High school"
2 "College or university"
;
label define labeltespempnot
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Employed"
2 "Not employed"
;
label define labeltrdpftpt
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Full time"
2 "Part time"
;
label define labeltrdtocc1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Management occupations"
2 "Business and financial operations occupations"
3 "Computer and mathematical science occupations"
4 "Architecture and engineering occupations"
5 "Life, physical, and social science occupations"
6 "Community and social service occupations"
7 "Legal occupations"
8 "Education, training, and library occupations"
9 "Arts, design, entertainment, sports, and media occupations"
10 "Healthcare practitioner and technical occupations"
11 "Healthcare support occupations"
12 "Protective service occupations"
13 "Food preparation and serving related occupations"
14 "Building and grounds cleaning and maintenance occupations"
15 "Personal care and service occupations"
16 "Sales and related occupations"
17 "Office and administrative support occupations"
18 "Farming, fishing, and forestry occupations"
19 "Construction and extraction occupations"
20 "Installation, maintenance, and repair occupations"
21 "Production occupations"
22 "Transportation and material moving occupations"
;
label define labeltrernupd
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Earnings carried forward from final CPS interview"
1 "Earnings updated in ATUS"
;
label define labeltrhernal
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "TRERNHLY does not contain allocated information"
1 "TRERNHLY contains allocated information"
;
label define labeltrhhchild
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltrholiday
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Diary day was not a holiday"
1 "Diary day was a holiday"
;
label define labeltrimind1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Agriculture, forestry, fishing, and hunting"
2 "Mining, quarrying, and oil and gas extraction"
3 "Construction"
4 "Manufacturing - durable goods"
5 "Manufacturing - non-durable goods"
6 "Wholesale trade"
7 "Retail trade"
8 "Transportation and warehousing"
9 "Utilities"
10 "Information"
11 "Finance and insurance"
12 "Real estate and rental and leasing"
13 "Professional and technical services"
14 "Management, administrative and waste management services"
15 "Educational services"
16 "Health care and social services"
17 "Arts, entertainment, and recreation"
18 "Accommodation and food services"
19 "Private households"
20 "Other services, except private households"
21 "Public administration"
;
label define labeltrlvmodr
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Did not respond to Leave Module"
1 "Responded to the Leave Module"
;
label define labeltrmjind1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Agriculture, forestry, fishing, and hunting"
2 "Mining, quarrying, and oil and gas extraction"
3 "Construction"
4 "Manufacturing"
5 "Wholesale and retail trade"
6 "Transportation and utilities"
7 "Information"
8 "Financial activities"
9 "Professional and business services"
10 "Educational and health services"
11 "Leisure and hospitality"
12 "Other services"
13 "Public administration"
;
label define labeltrmjocc1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Management, business, and financial occupations"
2 "Professional and related occupations"
3 "Service occupations"
4 "Sales and related occupations"
5 "Office and administrative support occupations"
6 "Farming, fishing, and forestry occupations"
7 "Construction and extraction occupations"
8 "Installation, maintenance, and repair occupations"
9 "Production occupations"
10 "Transportation and material moving occupations"
;
label define labeltrmjocgr
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Management, professional, and related occupations"
2 "Service occupations"
3 "Sales and office occupations"
4 "Farming, fishing, and forestry occupations"
5 "Construction and maintenance occupations"
6 "Production, transportation, and material moving occupations"
;
label define labeltrnhhchild
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltrohhchild
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltrspftpt
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Full time"
2 "Part time"
3 "Hours vary"
;
label define labeltrsppres
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Spouse present"
2 "Unmarried partner present"
3 "No spouse or unmarried partner present"
;
label define labeltrwernal
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "TRERNWA does not contain allocated information"
1 "TRERNWA contains allocated information"
;
label define labeltthr
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Not topcoded"
1 "Topcoded"
;
label define labelttot
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Not topcoded"
1 "Topcoded"
;
label define labelttwk
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Not topcoded"
1 "Topcoded"
;
label define labeltuabsot
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
3 "Retired"
4 "Disabled"
5 "Unable to work"
;
label define labeltubus
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltubus1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltubus2ot
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltucc5b_ck
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "No secondary childcare activities"
2 "Respondent didn't know"
3 "Respondent refused to answer"
4 "Child was away from home yesterday"
5 "Respondent was away from home yesterday"
;
label define labeltucc5_ck
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "No secondary childcare activities"
2 "Respondent didn`t know"
3 "Respondent refused to answer"
4 "Child was away from home yesterday"
5 "Respondent was away from home yesterday"
;
label define labeltucc9
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
3 "Some are, some are not"
;
label define labeltudiaryday
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Sunday"
2 "Monday"
3 "Tuesday"
4 "Wednesday"
5 "Thursday"
6 "Friday"
7 "Saturday"
;
label define labeltudis
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
3 "Did not have a disability last time"
;
label define labeltudis1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltudis2
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltuecytd
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltuelder
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltuelfreq
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Daily"
2 "Several times a week"
3 "About once a week"
4 "Several times a month"
5 "Once a month"
6 "One time"
7 "Other"
;
label define labeltufwk
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
3 "Retired"
4 "Disabled"
5 "Unable to work"
;
label define labeltuio1mfg
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Manufacturing"
2 "Retail trade"
3 "Wholesale trade"
4 "Something else"
;
label define labeltuiodp1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltuiodp2
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltuiodp3
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltulay
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
3 "Retired"
4 "Disabled"
5 "Unable to work"
;
label define labeltulay6m
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltulayavr
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Own temporary illness"
2 "Going to school"
3 "Other"
;
label define labeltulaydt
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltulk
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
3 "Retired"
4 "Disabled"
5 "Unable to work"
;
label define labeltulkavr
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Waiting for new job to begin"
2 "Own temporary illness"
3 "Going to school"
4 "Other"
;
label define labeltulkdk1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted employer directly/interview"
2 "Contacted public employment agency"
3 "Contacted private employment agency"
4 "Contacted friends or relatives"
5 "Contacted school/university employment center"
6 "Sent out resumes/filled out applications"
7 "Checked union/professional registers"
8 "Placed or answered ads"
9 "Other active"
10 "Looked at ads"
11 "Attended job training programs/courses"
12 "Nothing"
13 "Other passive"
;
label define labeltulkdk2
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted employer directly/interview"
2 "Contacted public employment agency"
3 "Contacted private employment agency"
4 "Contacted friends or relatives"
5 "Contacted school/university employment center"
6 "Sent out resumes/filled out applications"
7 "Checked union/professional registers"
8 "Placed or answered ads"
9 "Other active"
10 "Looked at ads"
11 "Attended job training programs/courses"
13 "Other passive"
97 "No additional job search activities"
;
label define labeltulkdk3
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted Employer Directly/Interview"
2 "Contacted Public Employment Agency"
3 "Contacted Private Employment Agency"
4 "Contacted Friends or Relatives"
5 "Contacted School/University Employment Center"
6 "Sent Out Resumes/Filled Out Applications"
7 "Check Union/Professional Registers"
8 "Placed or Answered Ads"
9 "Other Active"
10 "Looked at Ads"
11 "Attended Job Training Programs/Courses"
13 "Other Passive"
97 "No Additional Job Search Activities"
;
label define labeltulkdk4
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted Employer Directly/Interview"
2 "Contacted Public Employment Agency"
3 "Contacted Private Employment Agency"
4 "Contacted Friends or Relatives"
5 "Contacted School/University Employment Center"
6 "Sent Out Resumes/Filled Out Applications"
7 "Check Union/Professional Registers"
8 "Placed or Answered Ads"
9 "Other Active"
10 "Looked at Ads"
11 "Attended Job Training Programs/Courses"
13 "Other Passive"
97 "No Additional Job Search Activities"
;
label define labeltulkdk5
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted Employer Directly/Interview"
2 "Contacted Public Employment Agency"
3 "Contacted Private Employment Agency"
4 "Contacted Friends or Relatives"
5 "Contacted School/University Employment Center"
6 "Sent Out Resumes/Filled Out Applications"
7 "Check Union/Professional Registers"
8 "Placed or Answered Ads"
9 "Other Active"
10 "Looked at Ads"
11 "Attended Job Training Programs/Courses"
13 "Other Passive"
97 "No Additional Job Search Activities"
;
label define labeltulkdk6
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted Employer Directly/Interview"
2 "Contacted Public Employment Agency"
3 "Contacted Private Employment Agency"
4 "Contacted Friends or Relatives"
5 "Contacted School/University Employment Center"
6 "Sent Out Resumes/Filled Out Applications"
7 "Check Union/Professional Registers"
8 "Placed or Answered Ads"
9 "Other Active"
10 "Looked at Ads"
11 "Attended Job Training Programs/Courses"
13 "Other Passive"
97 "No Additional Job Search Activities"
;
label define labeltulkm2
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted employer directly/interview"
2 "Contacted public employment agency"
3 "Contacted private employment agency"
4 "Contacted friends or relatives"
5 "Contacted school/university employment center"
6 "Sent out resumes/filled out applications"
7 "Checked union/professional registers"
8 "Placed or answered ads"
9 "Other active"
10 "Looked at ads"
11 "Attended job training programs/courses"
13 "Other passive"
97 "No additional job search activities"
;
label define labeltulkm3
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted employer directly/interview"
2 "Contacted public employment agency"
3 "Contacted private employment agency"
4 "Contacted friends or relatives"
5 "Contacted school/university employment center"
6 "Sent out resumes/filled out applications"
7 "Check union/professional registers"
8 "Placed or answered ads"
9 "Other active"
10 "Looked at ads"
11 "Attended job training programs/courses"
13 "Other passive"
97 "No additional job search activities"
;
label define labeltulkm4
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted employer directly/interview"
2 "Contacted public employment agency"
3 "Contacted private employment agency"
4 "Contacted friends or relatives"
5 "Contacted school/university employment center"
6 "Sent out resumes/filled out applications"
7 "Check union/professional registers"
8 "Placed or answered ads"
9 "Other active"
10 "Looked at ads"
11 "Attended job training programs/courses"
13 "Other passive"
97 "No additional job search activities"
;
label define labeltulkm5
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted employer directly/interview"
2 "Contacted public employment agency"
3 "Contacted private employment agency"
4 "Contacted friends or relatives"
5 "Contacted school/university employment center"
6 "Sent out resumes/filled out applications"
7 "Check union/professional registers"
8 "Placed or answered ads"
9 "Other active"
10 "Looked at ads"
11 "Attended job training programs/courses"
13 "Other passive"
97 "No additional job search activities"
;
label define labeltulkm6
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted employer directly/interview"
2 "Contacted public employment agency"
3 "Contacted private employment agency"
4 "Contacted friends or relatives"
5 "Contacted school/university employment center"
6 "Sent out resumes/filled out applications"
7 "Check union/professional registers"
8 "Placed or answered ads"
9 "Other active"
10 "Looked at ads"
11 "Attended job training programs/courses"
13 "Other passive"
97 "No additional job search activities"
;
label define labeltulkps1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted employer directly/interview"
2 "Contacted public employment agency"
3 "Contacted private employment agency"
4 "Contacted friends or relatives"
5 "Contacted school/university employment center"
6 "Sent out resumes/filled out applications"
7 "Checked union/professional registers"
8 "Placed or answered ads"
9 "Other active"
10 "Looked at ads"
11 "Attended job training programs/courses"
12 "Nothing"
13 "Other passive"
97 "No more job search activities"
;
label define labeltulkps2
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted employer directly/interview"
2 "Contacted public employment agency"
3 "Contacted private employment agency"
4 "Contacted friends or relatives"
5 "Contacted school/university employment center"
6 "Sent out resumes/filled out applications"
7 "Checked union/professional registers"
8 "Placed or answered ads"
9 "Other active"
10 "Looked at ads"
11 "Attended job training programs/courses"
13 "Other passive"
97 "No additional job search activities"
;
label define labeltulkps3
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted Employer Directly/Interview"
2 "Contacted Public Employment Agency"
3 "Contacted Private Employment Agency"
4 "Contacted Friends or Relatives"
5 "Contacted School/University Employment Center"
6 "Sent Out Resumes/Filled Out Applications"
7 "Check Union/Professional Registers"
8 "Placed or Answered Ads"
9 "Other Active"
10 "Looked at Ads"
11 "Attended Job Training Programs/Courses"
13 "Other Passive"
97 "No Additional Job Search Activities"
;
label define labeltulkps4
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted Employer Directly/Interview"
2 "Contacted Public Employment Agency"
3 "Contacted Private Employment Agency"
4 "Contacted Friends or Relatives"
5 "Contacted School/University Employment Center"
6 "Sent Out Resumes/Filled Out Applications"
7 "Check Union/Professional Registers"
8 "Placed or Answered Ads"
9 "Other Active"
10 "Looked at Ads"
11 "Attended Job Training Programs/Courses"
13 "Other Passive"
97 "No Additional Job Search Activities"
;
label define labeltulkps5
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted Employer Directly/Interview"
2 "Contacted Public Employment Agency"
3 "Contacted Private Employment Agency"
4 "Contacted Friends or Relatives"
5 "Contacted School/University Employment Center"
6 "Sent Out Resumes/Filled Out Applications"
7 "Check Union/Professional Registers"
8 "Placed or Answered Ads"
9 "Other Active"
10 "Looked at Ads"
11 "Attended Job Training Programs/Courses"
13 "Other Passive"
97 "No Additional Job Search Activities"
;
label define labeltulkps6
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted Employer Directly/Interview"
2 "Contacted Public Employment Agency"
3 "Contacted Private Employment Agency"
4 "Contacted Friends or Relatives"
5 "Contacted School/University Employment Center"
6 "Sent Out Resumes/Filled Out Applications"
7 "Check Union/Professional Registers"
8 "Placed or Answered Ads"
9 "Other Active"
10 "Looked at Ads"
11 "Attended Job Training Programs/Courses"
13 "Other Passive"
97 "No Additional Job Search Activities"
;
label define labelturetot
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
3 "Was not retired last time"
;
label define labeltuspabs
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
3 "Retired"
4 "Disabled"
5 "Unable to work"
;
label define labeltuspusft
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
3 "Hours vary"
4 "No longer has a job"
;
label define labeltuspwk
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
3 "Retired"
4 "Disabled"
5 "Unable to work"
;
label define labeltxabsrsn
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxern
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxernh1o
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxernh2
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxernhro
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxernhry
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxernper
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxernrt
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxernuot
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxernwkp
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxhrftpt
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxhrusl1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxhrusl2
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxhruslt
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxio1cow
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxio1icd
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxio1ocd
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxlayavl
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxlaylk
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxlfs
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxlkavl
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxlkm1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxmjot
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxret1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value 0"
11 "Blank To Value 0"
12 "Don`t Know To Value"
13 "Refused To Value 0"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long"
31 "Blank To Allocated Value Long"
32 "Don`t  Know To Allocated Value Long"
33 "Refused To Allocated Value Long"
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxschenr
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxschft
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxschlvl
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxspempnot
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value 0"
11 "Blank To Value 0"
12 "Don`t Know To Value"
13 "Refused To Value 0"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long"
31 "Blank To Allocated Value Long"
32 "Don`t Know To Allocated Value Long"
33 "Refused To Allocated Value Long"
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxspuhrs
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value 0"
11 "Blank To Value 0"
12 "Don`t Know To Value"
13 "Refused To Value 0"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long"
31 "Blank To Allocated Value Long"
32 "Don`t  Know To Allocated Value Long"
33 "Refused To Allocated Value Long"
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxtcc
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "TRTCC_LN and TRTCC do not contain allocated data"
1 "TRTCC_LN and TRTCC contain allocated data"
;
label define labeltxtcctot
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "TRTCCTOT_LN and TRTCCTOT do not contain allocated data"
1 "TRTCCTOT_LN and TRTCCTOT contain allocated data"
;
label define labeltxtcoc
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "TRTCOC_LN and TRTCOC do not contain allocated data"
1 "TRTCOC_LN and TRTCOC contain allocated data"
;
label define labeltxthh
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "TRTHH_LN and TRTHH do not contain allocated data"
1 "TRTHH_LN and TRTHH contain allocated data"
;
label define labeltxtnohh
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "TRTNOHH_LN and TRTNOHH do not contain allocated data"
1 "TRTNOHH_LN and TRTNOHH contain allocated data"
;
label define labeltxto
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "TRTO_LN and TRTO do not contain allocated data"
1 "TRTO_LN and TRTO contain allocated data"
;
label define labeltxtohh
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "TRTOHH_LN and TRTOHH do not contain allocated data"
1 "TRTOHH_LN and TRTOHH contain allocated data"
;
label define labeltxtonhh
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "TRTONHH_LN and TRTONHH do not contain allocated data"
1 "TRTONHH_LN and TRTONHH contain allocated data"
;
 
label values teabsrsn   labelteabsrsn;
label values teernhry   labelteernhry;
label values teernper   labelteernper;
label values teernrt   labelteernrt;
label values teernuot   labelteernuot;
label values tehrftpt   labeltehrftpt;
label values teio1cow   labelteio1cow;
label values telayavl   labeltelayavl;
label values telaylk   labeltelaylk;
label values telfs   labeltelfs;
label values telkavl   labeltelkavl;
label values telkm1   labeltelkm1;
label values temjot   labeltemjot;
label values teret1   labelteret1;
label values teschenr   labelteschenr;
label values teschft   labelteschft;
label values teschlvl   labelteschlvl;
label values tespempnot   labeltespempnot;
label values trdpftpt   labeltrdpftpt;
label values trdtocc1   labeltrdtocc1;
label values trernupd   labeltrernupd;
label values trhernal   labeltrhernal;
label values trhhchild   labeltrhhchild;
label values trholiday   labeltrholiday;
label values trimind1   labeltrimind1;
label values trlvmodr   labeltrlvmodr;
label values trmjind1   labeltrmjind1;
label values trmjocc1   labeltrmjocc1;
label values trmjocgr   labeltrmjocgr;
label values trnhhchild   labeltrnhhchild;
label values trohhchild   labeltrohhchild;
label values trspftpt   labeltrspftpt;
label values trsppres   labeltrsppres;
label values trwernal   labeltrwernal;
label values tthr   labeltthr;
label values ttot   labelttot;
label values ttwk   labelttwk;
label values tuabsot   labeltuabsot;
label values tubus   labeltubus;
label values tubus1   labeltubus1;
label values tubus2ot   labeltubus2ot;
label values tucc5b_ck   labeltucc5b_ck;
label values tucc5_ck   labeltucc5_ck;
label values tucc9   labeltucc9;
label values tudiaryday   labeltudiaryday;
label values tudis   labeltudis;
label values tudis1   labeltudis1;
label values tudis2   labeltudis2;
label values tuecytd labeltuecytd;
label values tuelder labeltuelder;
label values tuelfreq labeltuelfreq;
label values tufwk   labeltufwk;
label values tuio1mfg   labeltuio1mfg;
label values tuiodp1   labeltuiodp1;
label values tuiodp2   labeltuiodp2;
label values tuiodp3   labeltuiodp3;
label values tulay   labeltulay;
label values tulay6m   labeltulay6m;
label values tulayavr   labeltulayavr;
label values tulaydt   labeltulaydt;
label values tulk   labeltulk;
label values tulkavr   labeltulkavr;
label values tulkdk1   labeltulkdk1;
label values tulkdk2   labeltulkdk2;
label values tulkdk3   labeltulkdk3;
label values tulkdk4   labeltulkdk4;
label values tulkdk5   labeltulkdk5;
label values tulkdk6   labeltulkdk6;
label values tulkm2   labeltulkm2;
label values tulkm3   labeltulkm3;
label values tulkm4   labeltulkm4;
label values tulkm5   labeltulkm5;
label values tulkm6   labeltulkm6;
label values tulkps1   labeltulkps1;
label values tulkps2   labeltulkps2;
label values tulkps3   labeltulkps3;
label values tulkps4   labeltulkps4;
label values tulkps5   labeltulkps5;
label values tulkps6   labeltulkps6;
label values turetot   labelturetot;
label values tuspabs   labeltuspabs;
label values tuspusft   labeltuspusft;
label values tuspwk   labeltuspwk;
label values txabsrsn   labeltxabsrsn;
label values txern   labeltxern;
label values txernh1o   labeltxernh1o;
label values txernh2   labeltxernh2;
label values txernhro   labeltxernhro;
label values txernhry   labeltxernhry;
label values txernper   labeltxernper;
label values txernrt   labeltxernrt;
label values txernuot   labeltxernuot;
label values txernwkp   labeltxernwkp;
label values txhrftpt   labeltxhrftpt;
label values txhrusl1   labeltxhrusl1;
label values txhrusl2   labeltxhrusl2;
label values txhruslt   labeltxhruslt;
label values txio1cow   labeltxio1cow;
label values txio1icd   labeltxio1icd;
label values txio1ocd   labeltxio1ocd;
label values txlayavl   labeltxlayavl;
label values txlaylk   labeltxlaylk;
label values txlfs   labeltxlfs;
label values txlkavl   labeltxlkavl;
label values txlkm1   labeltxlkm1;
label values txmjot   labeltxmjot;
label values txret1   labeltxret1;
label values txschenr   labeltxschenr;
label values txschft   labeltxschft;
label values txschlvl   labeltxschlvl;
label values txspempnot   labeltxspempnot;
label values txspuhrs   labeltxspuhrs;
label values txtcc   labeltxtcc;
label values txtcctot   labeltxtcctot;
label values txtcoc   labeltxtcoc;
label values txthh   labeltxthh;
label values txtnohh   labeltxtnohh;
label values txto   labeltxto;
label values txtohh   labeltxtohh;
label values txtonhh   labeltxtonhh;
 
describe, short;
