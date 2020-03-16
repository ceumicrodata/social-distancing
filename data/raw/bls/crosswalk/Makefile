all: crosswalk.xlsx occupation.xlsx
crosswalk.xlsx:
	wget -O $@ -N https://www.bls.gov/emp/classifications-crosswalks/nem-onet-to-soc-crosswalk.xlsx
occupation.xlsx:
	wget -O $@ -N https://www.bls.gov/emp/ind-occ-matrix/occupation.xlsx