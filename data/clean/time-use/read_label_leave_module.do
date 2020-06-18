import delimited "../../raw/bls/atus/lvresp_1718.dat", clear

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

