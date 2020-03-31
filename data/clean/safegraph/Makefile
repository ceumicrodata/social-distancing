all: naics-zip-2020-03-08.csv naics-zip-2020-03-15.csv
naics-zip-%.csv: %-weekly-patterns.csv aggregate.do
	stata -b do aggregate $<
%-weekly-patterns.csv: %-weekly-patterns.csv.gz
	gunzip $<
%-weekly-patterns.csv.gz: %.timestamp
	aws s3 cp "s3://sg-c19-response/weekly-patterns/v1/main-file/$@" . --profile safegraph
	touch $@
	touch $<