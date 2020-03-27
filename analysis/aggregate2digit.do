generate naics_2d = int(industry_code/10)
replace naics_2d = 31 if (naics_2d>=31) & (naics<=33)
replace naics_2d = 44 if (naics_2d>=44) & (naics<=45)
replace naics_2d = 48 if (naics_2d>=48) & (naics<=49)
