all: atusresp_2018.dat atusact_2018.dat atuswho_2018.dat
%_2018.dat: 
	wget -O temp.zip "https://www.bls.gov/tus/special.requests/$*-2018.zip"
	unzip temp.zip $@
	rm temp.zip
