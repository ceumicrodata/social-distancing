TABLES = atusresp atuswgts
all: $(foreach table,$(TABLES),$(table)_2017.dat $(table)_2018.dat) lvresp_1718.dat lvwgts_1718.dat 
%_2017.dat: 
	# in 2017, BLS was still use underscore in file name
	wget -O temp.zip "https://www.bls.gov/tus/special.requests/$*_2017.zip"
	unzip temp.zip $@
	rm temp.zip
%.dat: 
	wget -O temp.zip "https://www.bls.gov/tus/special.requests/$(subst _,-,$*).zip"
	unzip temp.zip $@
	rm temp.zip
